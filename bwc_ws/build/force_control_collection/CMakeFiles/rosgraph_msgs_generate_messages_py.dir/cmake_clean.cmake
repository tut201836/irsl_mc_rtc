file(REMOVE_RECURSE
  "doc/doxygen-html"
  "doc/doxygen.log"
  "doc/force_control_collection.doxytag"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/rosgraph_msgs_generate_messages_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
