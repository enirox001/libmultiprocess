#include "init.h"

#include <init.capnp.h>
#include <init.capnp.proxy.h> // NOLINT(misc-include-cleaner) // IWYU pragma: keep

#include <charconv>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <iostream>
#include <kj/async.h>
#include <kj/common.h>
#include <kj/memory.h>
#include <map>
#include <memory>
#include <optional>
#include <mp/proxy-io.h>
#include <stdexcept>
#include <string>
#include <system_error>

namespace interfaces {
namespace {
class KvCacheImpl : public KvCache {
private:
  std::map<std::string, CachePayload> m_store;
  uint32_t m_hits{0};
  uint32_t m_misses{0};

public:
  bool setCache(const std::string& key, const CachePayload& payload) override
  {
    m_store[key] = payload;
    return true;
  }

  std::optional<CachePayload> getCache(const std::string& key) override
  {
    auto it = m_store.find(key);
    if (it != m_store.end()) {
      m_hits++;
      return it->second;
    }
    m_misses++;
    return std::nullopt;
  }

  CacheStats getStats() override
  {
    double hitRate = 0.0;
    uint32_t total_requests = m_hits + m_misses;
    if (total_requests > 0) {
      hitRate = static_cast<double>(m_hits) / total_requests;
    }

    uint64_t memoryBytes = 0;
    for (const auto& [key, payload] : m_store) {
      memoryBytes += key.capacity() + payload.value.capacity() + payload.tags.capacity() +
          sizeof(CachePayload);
    }

    return {static_cast<uint32_t>(m_store.size()), memoryBytes, hitRate};
  }
};

class InitImpl : public Init {
public:
  std::unique_ptr<KvCache> makeKvCache() override { return std::make_unique<KvCacheImpl>(); }
};
} // namespace

std::unique_ptr<KvCache> MakeKvCache()
{
  return std::make_unique<KvCacheImpl>();
}

std::unique_ptr<Init> MakeInit()
{
  return std::make_unique<InitImpl>();
}
} // namespace interfaces

static void LogPrint(mp::LogMessage log_data)
{
  if (log_data.level == mp::Log::Raise) throw std::runtime_error(log_data.message);
  std::ofstream("debug.log", std::ios_base::app) << log_data.message << std::endl;
}

int main(int argc, char* argv[])
{
  if (argc != 2) {
    std::cerr << "Usage: " << argv[0] << " <fd>\n";
    return 1;
  }

  int fd;
  if (std::from_chars(argv[1], argv[1] + strlen(argv[1]), fd).ec != std::errc{}) {
    std::cerr << argv[1] << " is not a number or is larger than an int\n";
    return 1;
  }

  mp::EventLoop loop("mpkvcache", LogPrint);
  std::unique_ptr<interfaces::Init> init = interfaces::MakeInit();
  mp::ServeStream<InitInterface>(loop, fd, *init);
  loop.loop();
  return 0;
}
