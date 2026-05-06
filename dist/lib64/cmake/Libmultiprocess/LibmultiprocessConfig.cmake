
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

# CMake find_package compatible package file, for downstream CMake projects
#
# Based on https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html#adding-components

set(_Libmultiprocess_supported_components Bin Lib)

# If no components specified, include all components.
list(LENGTH ${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS ${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS_len)
if(${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS_len EQUAL 0)
  set(${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS ${_Libmultiprocess_supported_components})
endif()

if ("Bin" IN_LIST ${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS)
  include("${CMAKE_CURRENT_LIST_DIR}/TargetCapnpSources.cmake")
endif()

if ("Lib" IN_LIST ${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS)
  # Setting FOUND_LIBATOMIC is needed on Debian & Ubuntu systems to work around bug in
  # their capnproto packages. See compat_find.cmake for a more complete explanation.
  set(FOUND_LIBATOMIC TRUE)
  include(CMakeFindDependencyMacro)
  find_dependency(CapnProto)
endif()

foreach(_comp ${${CMAKE_FIND_PACKAGE_NAME}_FIND_COMPONENTS})
  if (NOT _comp IN_LIST _Libmultiprocess_supported_components)
    set(${CMAKE_FIND_PACKAGE_NAME}_FOUND False)
    set(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE "Unsupported component: ${_comp}")
  endif()
  include("${CMAKE_CURRENT_LIST_DIR}/${_comp}Targets.cmake")
endforeach()
