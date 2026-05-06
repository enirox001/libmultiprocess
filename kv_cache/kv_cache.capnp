@0xf0a3ba9a51b65162;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("kvcache::capnp");

using Proxy = import "/mp/proxy.capnp";

$Proxy.include("kv_cache.h");
$Proxy.includeTypes("types.h");

struct CachePayload $Proxy.wrap("interfaces::CachePayload") {
  value @0 : Text;
  timestamp @1 : UInt64;
  isEncrypted @2 : Bool;
  tags @3 : List(UInt8);
}

struct CacheStats $Proxy.wrap("interfaces::CacheStats") {
  totalKeys @0 : UInt32;
  memoryBytes @1 : UInt64;
  hitRate @2 : Float64;
}

interface KvCache $Proxy.wrap("interfaces::KvCache") {
  setCache @0 (context: Proxy.Context, key: Text, payload: CachePayload) -> (result: Bool);
  getCache @1 (context: Proxy.Context, key: Text) -> (result: CachePayload, hasResult: Bool);
  getStats @2 (context: Proxy.Context) -> (result: CacheStats);
}
