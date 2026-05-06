include(${PROJECT_SOURCE_DIR}/cmake/TargetCapnpSources.cmake)

add_executable(mpkvcache
    kv_cache.cpp
)

target_capnp_sources(mpkvcache ${CMAKE_CURRENT_SOURCE_DIR}
    init.capnp
    kv_cache.capnp
)

target_include_directories(mpkvcache PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(mpkvcache PRIVATE Threads::Threads)
