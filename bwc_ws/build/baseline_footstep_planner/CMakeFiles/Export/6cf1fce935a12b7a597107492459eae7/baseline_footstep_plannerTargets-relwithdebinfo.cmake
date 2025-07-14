#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "baseline_footstep_planner::BaselineFootstepPlanner" for configuration "RelWithDebInfo"
set_property(TARGET baseline_footstep_planner::BaselineFootstepPlanner APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(baseline_footstep_planner::BaselineFootstepPlanner PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libBaselineFootstepPlanner.so.0.1.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libBaselineFootstepPlanner.so.0"
  )

list(APPEND _cmake_import_check_targets baseline_footstep_planner::BaselineFootstepPlanner )
list(APPEND _cmake_import_check_files_for_baseline_footstep_planner::BaselineFootstepPlanner "${_IMPORT_PREFIX}/lib/libBaselineFootstepPlanner.so.0.1.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
