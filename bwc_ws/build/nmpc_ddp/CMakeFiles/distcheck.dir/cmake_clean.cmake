file(REMOVE_RECURSE
  "doc/doxygen-html"
  "doc/doxygen.log"
  "doc/nmpc_ddp.doxytag"
  "CMakeFiles/distcheck"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/distcheck.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
