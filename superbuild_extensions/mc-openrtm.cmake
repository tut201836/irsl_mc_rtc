# set(mc_openrtm_DEPENDS mc_rtc choreonoid)
# if(TARGET hrp5p-iob)
#   list(APPEND mc_openrtm_DEPENDS hrp5p-iob)
# endif()

AddProject(mc_openrtm
  GITHUB jrl-umi3218/mc_openrtm
  GIT_TAG origin/master
  DEPENDS ${mc_openrtm_DEPENDS}
  APT_PACKAGES jvrc-choreonoid
)

AddProject(mc_udp
  GITHUB jrl-umi3218/mc_udp
  GIT_TAG origin/master
  DEPENDS mc_rtc
  APT_PACKAGES libmc-udp-dev python-mc-udp python3-mc-udp mc-udp-openrtm mc-udp-control
)

# AddProject(hrp-choreonoid
#   DRCUTIL_PRIVATE hrp-choreonoid
#   GIT_TAG origin/master
#   DEPENDS mc_openrtm mc_udp
# )
