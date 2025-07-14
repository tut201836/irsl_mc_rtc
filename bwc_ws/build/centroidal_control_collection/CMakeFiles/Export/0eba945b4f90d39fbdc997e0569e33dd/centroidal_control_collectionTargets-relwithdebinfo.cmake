#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "centroidal_control_collection::CCC" for configuration "RelWithDebInfo"
set_property(TARGET centroidal_control_collection::CCC APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(centroidal_control_collection::CCC PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libCCC.so.0.2.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libCCC.so.0"
  )

list(APPEND _cmake_import_check_targets centroidal_control_collection::CCC )
list(APPEND _cmake_import_check_files_for_centroidal_control_collection::CCC "${_IMPORT_PREFIX}/lib/libCCC.so.0.2.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
