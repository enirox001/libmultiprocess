#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Libmultiprocess::mpgen" for configuration ""
set_property(TARGET Libmultiprocess::mpgen APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(Libmultiprocess::mpgen PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/bin/mpgen"
  )

list(APPEND _cmake_import_check_targets Libmultiprocess::mpgen )
list(APPEND _cmake_import_check_files_for_Libmultiprocess::mpgen "${_IMPORT_PREFIX}/bin/mpgen" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
