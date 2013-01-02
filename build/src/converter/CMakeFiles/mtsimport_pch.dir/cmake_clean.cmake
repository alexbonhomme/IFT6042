FILE(REMOVE_RECURSE
  "CMakeFiles/mtsimport_pch"
  "mtsimport_pch/./mitsuba_precompiled.hpp.gch"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/mtsimport_pch.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
