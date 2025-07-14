file(REMOVE_RECURSE
  "doc/doxygen-html"
  "doc/doxygen.log"
  "doc/force_control_collection.doxytag"
  "CMakeFiles/release_package_xml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/release_package_xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
