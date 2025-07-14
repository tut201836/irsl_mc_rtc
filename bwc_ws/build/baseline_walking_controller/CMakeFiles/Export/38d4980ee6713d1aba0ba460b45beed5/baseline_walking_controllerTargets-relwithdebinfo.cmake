#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "baseline_walking_controller::BaselineWalkingController" for configuration "RelWithDebInfo"
set_property(TARGET baseline_walking_controller::BaselineWalkingController APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(baseline_walking_controller::BaselineWalkingController PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "/mc_rtc_ws/install/lib/libBaselineWalkingController.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libBaselineWalkingController.so"
  )

list(APPEND _cmake_import_check_targets baseline_walking_controller::BaselineWalkingController )
list(APPEND _cmake_import_check_files_for_baseline_walking_controller::BaselineWalkingController "/mc_rtc_ws/install/lib/libBaselineWalkingController.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
