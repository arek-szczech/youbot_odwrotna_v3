# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^debug|optimized|general$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(youbot_arm_kinematics_moveit_CONFIG_INCLUDED)
  return()
endif()
set(youbot_arm_kinematics_moveit_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(youbot_arm_kinematics_moveit_SOURCE_PREFIX /home/arek/youbot_odwrotna_v3/src/youbot-manipulation-hydro/youbot_arm_kinematics_moveit)
  set(youbot_arm_kinematics_moveit_DEVEL_PREFIX /home/arek/youbot_odwrotna_v3/devel)
  set(youbot_arm_kinematics_moveit_INSTALL_PREFIX "")
  set(youbot_arm_kinematics_moveit_PREFIX ${youbot_arm_kinematics_moveit_DEVEL_PREFIX})
else()
  set(youbot_arm_kinematics_moveit_SOURCE_PREFIX "")
  set(youbot_arm_kinematics_moveit_DEVEL_PREFIX "")
  set(youbot_arm_kinematics_moveit_INSTALL_PREFIX /home/arek/youbot_odwrotna_v3/install)
  set(youbot_arm_kinematics_moveit_PREFIX ${youbot_arm_kinematics_moveit_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'youbot_arm_kinematics_moveit' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(youbot_arm_kinematics_moveit_FOUND_CATKIN_PROJECT TRUE)

if(NOT "" STREQUAL "")
  set(youbot_arm_kinematics_moveit_INCLUDE_DIRS "")
  set(_include_dirs "")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir}" STREQUAL "include")
      get_filename_component(include "${youbot_arm_kinematics_moveit_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'youbot_arm_kinematics_moveit' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'Sven Schneider <sven.schneider@h-brs.de>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'youbot_arm_kinematics_moveit' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/arek/youbot_odwrotna_v3/install/${idir}'.  Ask the maintainer 'Sven Schneider <sven.schneider@h-brs.de>' to fix it.")
    endif()
    _list_append_unique(youbot_arm_kinematics_moveit_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^debug|optimized|general$")
    list(APPEND youbot_arm_kinematics_moveit_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND youbot_arm_kinematics_moveit_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND youbot_arm_kinematics_moveit_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/arek/youbot_odwrotna_v3/install/lib;/opt/ros/hydro/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(youbot_arm_kinematics_moveit_LIBRARY_DIRS ${lib_path})
      list(APPEND youbot_arm_kinematics_moveit_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'youbot_arm_kinematics_moveit'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND youbot_arm_kinematics_moveit_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(youbot_arm_kinematics_moveit_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${youbot_arm_kinematics_moveit_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 youbot_arm_kinematics_moveit_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${youbot_arm_kinematics_moveit_dep}_FOUND)
      find_package(${youbot_arm_kinematics_moveit_dep} REQUIRED)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${youbot_arm_kinematics_moveit_dep} REQUIRED ${depend_list})
  endif()
  _list_append_unique(youbot_arm_kinematics_moveit_INCLUDE_DIRS ${${youbot_arm_kinematics_moveit_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(youbot_arm_kinematics_moveit_LIBRARIES ${youbot_arm_kinematics_moveit_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${youbot_arm_kinematics_moveit_dep}_LIBRARIES})
  _list_append_deduplicate(youbot_arm_kinematics_moveit_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(youbot_arm_kinematics_moveit_LIBRARIES ${youbot_arm_kinematics_moveit_LIBRARIES})

  _list_append_unique(youbot_arm_kinematics_moveit_LIBRARY_DIRS ${${youbot_arm_kinematics_moveit_dep}_LIBRARY_DIRS})
  list(APPEND youbot_arm_kinematics_moveit_EXPORTED_TARGETS ${${youbot_arm_kinematics_moveit_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${youbot_arm_kinematics_moveit_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
