// Copyright (c) The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KVCACHE_INIT_H
#define KVCACHE_INIT_H

#include "kv_cache.h"
#include <memory>

namespace interfaces {
class Init {
public:
  virtual std::unique_ptr<KvCache> makeKvCache() { return nullptr; }
};
} // namespace interfaces

#endif // KVCACHE_INIT_H
