file(REMOVE_RECURSE
  "doc/baseline_footstep_planner.doxytag"
  "doc/doxygen-html"
  "doc/doxygen.log"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/baseline_footstep_planner_gencpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
