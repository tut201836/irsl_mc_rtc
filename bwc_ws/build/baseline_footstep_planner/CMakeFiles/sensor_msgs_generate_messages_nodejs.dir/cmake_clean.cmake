file(REMOVE_RECURSE
  "doc/baseline_footstep_planner.doxytag"
  "doc/doxygen-html"
  "doc/doxygen.log"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/sensor_msgs_generate_messages_nodejs.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
