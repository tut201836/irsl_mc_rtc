file(REMOVE_RECURSE
  "doc/doxygen-html"
  "doc/doxygen.log"
  "doc/trajectory_collection.doxytag"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/roscpp_generate_messages_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
