#ifndef KV_CACHE_H
#define KV_CACHE_H

#include <cstdint>
#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace interfaces {
  struct CachePayload {
    std::string value;
    uint64_t timestamp;
    bool isEncrypted;
    std::vector<uint8_t> tags;
  };

  struct CacheStats {
    uint32_t totalKeys;
    uint64_t memoryBytes;
    double hitRate;
  };

  class KvCache {
    public:
      virtual ~KvCache() = default;

      virtual bool setCache(const std::string& key, const CachePayload& payload) = 0;

      virtual std::optional<CachePayload> getCache(const std::string& key) = 0;

      virtual CacheStats getStats() = 0;
  };

  std::unique_ptr<KvCache> MakeKvCache();
}

#endif // !KV_CACHE_H
