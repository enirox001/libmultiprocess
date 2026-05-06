// Copyright (c) The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KVCACHE_TYPES_H
#define KVCACHE_TYPES_H

#include <mp/proxy.h>
#include <mp/proxy-types.h>
#include <kv_cache.capnp.proxy-types.h>

// IWYU pragma: begin_exports
#include <mp/type-context.h>
#include <mp/type-decay.h>
#include <mp/type-interface.h>
#include <mp/type-number.h>
#include <mp/type-optional.h>
#include <mp/type-string.h>
#include <mp/type-threadmap.h>
#include <mp/type-struct.h>
#include <mp/type-vector.h>
// IWYU pragma: end_exports

#include <cstdint>
#include <string>
#include <vector>
#include <kv_cache.h>
// IWYU pragma: end_exports

namespace interfaces {
  struct CachePayload; // IWYU pragma: export
  struct CacheStats; // IWYU pragma: export
}

#endif // KCACHE_TYPES_H
