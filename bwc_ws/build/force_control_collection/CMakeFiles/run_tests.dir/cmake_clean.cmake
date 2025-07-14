file(REMOVE_RECURSE
  "doc/doxygen-html"
  "doc/doxygen.log"
  "doc/force_control_collection.doxytag"
  "CMakeFiles/run_tests"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/run_tests.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
