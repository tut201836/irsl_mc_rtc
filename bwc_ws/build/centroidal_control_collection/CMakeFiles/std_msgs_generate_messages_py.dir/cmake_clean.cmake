file(REMOVE_RECURSE
  "doc/centroidal_control_collection.doxytag"
  "doc/doxygen-html"
  "doc/doxygen.log"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/std_msgs_generate_messages_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
