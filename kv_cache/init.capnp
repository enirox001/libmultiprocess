# Copyright (c) The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

@0xdce22293f7be0453;

using Cxx = import "/capnp/c++.capnp";
using Proxy = import "/mp/proxy.capnp";
using KvCache = import "kv_cache.capnp";

$Proxy.include("init.h");
$Proxy.include("kv_cache.h");
$Proxy.includeTypes("types.h");

interface InitInterface $Proxy.wrap("interfaces::Init") {
    construct @0 (threadMap: Proxy.ThreadMap) -> (threadMap :Proxy.ThreadMap);
    makeKvCache @1 (context :Proxy.Context) -> (result : KvCache.KvCache);
}
