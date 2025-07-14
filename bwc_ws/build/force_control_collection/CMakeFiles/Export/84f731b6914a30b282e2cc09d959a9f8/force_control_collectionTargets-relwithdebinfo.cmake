#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "force_control_collection::ForceColl" for configuration "RelWithDebInfo"
set_property(TARGET force_control_collection::ForceColl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(force_control_collection::ForceColl PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libForceColl.so.0.2.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libForceColl.so.0"
  )

list(APPEND _cmake_import_check_targets force_control_collection::ForceColl )
list(APPEND _cmake_import_check_files_for_force_control_collection::ForceColl "${_IMPORT_PREFIX}/lib/libForceColl.so.0.2.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
