#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Libmultiprocess::multiprocess" for configuration ""
set_property(TARGET Libmultiprocess::multiprocess APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(Libmultiprocess::multiprocess PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib64/libmultiprocess.a"
  )

list(APPEND _cmake_import_check_targets Libmultiprocess::multiprocess )
list(APPEND _cmake_import_check_files_for_Libmultiprocess::multiprocess "${_IMPORT_PREFIX}/lib64/libmultiprocess.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
