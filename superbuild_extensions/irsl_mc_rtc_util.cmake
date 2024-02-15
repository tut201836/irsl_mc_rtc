option(INTERNAL_MACHINE "Building on robot machine" ${INTERNAL_MACHINE_DEFAULT})
if(NOT INTERNAL_MACHINE)
  option(WITH_DRCUTIL_PRIVATE_HRPSYS_COMPONENTS "Build hrpsys private components" ON)
else()
  set(WITH_DRCUTIL_PRIVATE_HRPSYS_COMPONENTS ON CACHE INTERNAL "" FORCE)
endif()

include(openrtm-aist.cmake)

set(STAMP_FILE "${CMAKE_CURRENT_BINARY_DIR}/omniorb-cfg.stamp")
add_custom_command(
  OUTPUT "${STAMP_FILE}"
  COMMAND sudo sed -i -e "s/giopMaxMsgSize = 2097152/giopMaxMsgSize = 2147483648/" /etc/omniORB.cfg
  COMMAND "${CMAKE_COMMAND}" -E touch "${STAMP_FILE}"
  COMMENT "Set omniORB giopMaxMsgSize"
)
add_custom_target(configure-omniorb DEPENDS "${STAMP_FILE}")

set(openhrp3_cmake_args -DCOMPILE_JAVA_STUFF=OFF -DBUILD_GOOGLE_TEST=OFF -DOPENRTM_DIR=${CMAKE_INSTALL_PREFIX})
if(INTERNAL_MACHINE)
  list(APPEND openhrp3_cmake_args -DCOMPILE_PYTHON_STUFF=OFF)
else()
  list(APPEND openhrp3_cmake_args -DCOMPILE_PYTHON_STUFF=ON)
endif()

AddProject(openhrp3
  SUBFOLDER openhrp
  GITHUB fkanehiro/openhrp3
  GIT_TAG origin/master
  CMAKE_ARGS ${openhrp3_cmake_args}
  SKIP_TEST
  DEPENDS openrtm-aist-python
  APT_PACKAGES openhrp
)
add_dependencies(openhrp3 configure-omniorb)

set(hrpsys-base_cmake_args -DCOMPILE_JAVA_STUFF=OFF -DBUILD_KALMAN_FILTER=OFF -DBUILD_STABILIZER=OFF -DENABLE_DOXYGEN=OFF -DUSE_HRPSYSEXT=OFF -DOPENRTM_DIR=${CMAKE_INSTALL_PREFIX})
if(INTERNAL_MACHINE)
  list(APPEND hrpsys-base_cmake_args -DINSTALL_HRPIO=OFF)
else()
  list(APPEND hrpsys-base_cmake_args -DINSTALL_HRPIO=ON)
endif()
if(DEFINED ROBOT_IOB_VERSION)
  list(APPEND hrpsys-base_cmake_args -DROBOT_IOB_VERSION=${ROBOT_IOB_VERSION})
endif()

AddProject(hrpsys-base
  SUBFOLDER openhrp
  GITHUB fkanehiro/hrpsys-base
  GIT_TAG origin/master
  CMAKE_ARGS ${hrpsys-base_cmake_args}
  SKIP_TEST
  DEPENDS openhrp3
  APT_PACKAGES hrpsys-base
)

# set(robot_DEPENDS)

# set(override_install_prefix)
# if(USE_MC_RTC_APT_MIRROR)
#   set(override_install_prefix INSTALL_PREFIX /usr)
# endif()

# if(WITH_HRP2)
#   AddProject(HRP2KAI
#     SUBFOLDER openhrp
#     DRCUTIL_PRIVATE hrp2kai
#     GIT_TAG origin/master
#     SKIP_TEST
#     DEPENDS hrpsys-base
#     ${override_install_prefix}
#   )
#   set(HRP2_EXTRA_ARGS)
#   set(KNOWN_HRP2 hrp2001c hrp2012c)
#   if("${HOSTNAME}" IN_LIST KNOWN_HRP2)
#     set(HRP2_EXTRA_ARGS -DINTERNAL_MACHINE=ON)
#   endif()
#   AddProject(HRP2
#     SUBFOLDER openhrp
#     DRCUTIL_PRIVATE hrp2
#     GIT_TAG origin/master
#     CMAKE_ARGS -DROBOT_NAME=HRP2KAI ${HRP2_EXTRA_ARGS}
#     SKIP_TEST
#     DEPENDS hrpsys-base HRP2KAI
#     ${override_install_prefix}
#   )
#   list(APPEND robot_DEPENDS HRP2)
# endif()

# if(WITH_HRP4CR)
#   AddProject(HRP4CR
#     SUBFOLDER openhrp
#     GITHUB_PRIVATE isri-aist/hrp4cr
#     GIT_TAG origin/master
#     SKIP_TEST
#     DEPENDS hrpsys-base
#     ${override_install_prefix}
#   )
#   list(APPEND robot_DEPENDS HRP4CR)
# endif()

# if(WITH_HRP5)
#   AddProject(HRP5P
#     SUBFOLDER openhrp
#     GITHUB_PRIVATE isri-aist/hrp5p
#     GIT_TAG origin/master
#     SKIP_TEST
#     DEPENDS hrpsys-base
#     ${override_install_prefix}
#   )
#   list(APPEND robot_DEPENDS HRP5P)
# endif()

# if(WITH_DRCUTIL_PRIVATE_HRPSYS_COMPONENTS)
#   include(drcutil-private.cmake)
# endif()

# if("${HOSTNAME}" STREQUAL hrp5p01c)
#   AddProject(hrp5p-iob
#     GITHUB_PRIVATE isri-aist/hrp5p-iob
#     GIT_TAG origin/master
#     DEPENDS hrpsys-base
#   )
# elseif("${HOSTNAME}" STREQUAL hrp4001c)
#   AptInstall(ros-${ROS_DISTRO}-serial)

#   AddProject(futaba_RS405CB
#     GITHUB isri-aist/futaba_RS405CB
#     GIT_TAG origin/master
#   )

#   AddProject(hrp5p-iob
#     GITHUB_PRIVATE isri-aist/hrp5p-iob
#     GIT_TAG origin/HRP4CR
#     CMAKE_ARGS -DROBOT_NAME=HRP4CR
#     DEPENDS futaba_RS405CB hrpsys-base mc_rtc
#   )
# elseif("${HOSTNAME}" STREQUAL rhps1c)
#   AddProject(DynamixelSDK-cpp
#     GITHUB_PRIVATE isri-aist/DynamixelSDK-cpp
#     GIT_TAG origin/main
#   )
#   AddProject(hrp5p-iob
#     GITHUB_PRIVATE isri-aist/hrp5p-iob
#     GIT_TAG origin/RHPS1
#     CMAKE_ARGS -DROBOT_NAME=RHPS1
#     DEPENDS DynamixelSDK-cpp hrpsys-base
#   )
#   AddProjectPlugin(rhps1-iob hrp5p-iob
#     GITHUB_PRIVATE isri-aist/rhps1-iob
#     GIT_TAG origin/main
#     SUBFOLDER iob
#     LINK_NAME RHPS1
#   )
# endif()
