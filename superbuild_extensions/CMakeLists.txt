execute_process(COMMAND lsb_release -sc OUTPUT_VARIABLE DISTRO OUTPUT_STRIP_TRAILING_WHITESPACE)
iF("${DISTRO}" STREQUAL "bionic")
  set(PYTHON2DEV_PKG python-dev)
else()
  set(PYTHON2DEV_PKG python2-dev)
endif()

option(WITH_CHOREONOID "Build choreonoid" ON)

option(WITH_GITE_MIRROR "Use LIRMM's GitLab instance for private packages" OFF)
if(WITH_GITE_MIRROR)
  AddGitSource(DRCUTIL_PRIVATE "git@gite.lirmm.fr:choreonoid-hrp-installation/")
else()
  AddGitSource(DRCUTIL_PRIVATE "git@github.com:isri-aist/")
endif()

# Get the hostname
cmake_host_system_information(RESULT HOSTNAME QUERY HOSTNAME)
set(KNOWN_ROBOTS_WITH_IOB_V2
  hrp2001c
  hrp2012c
  hrp4001c
  hrp5p01c
  rhps1c
)
set(KNOWN_ROBOTS
  ${KNOWN_ROBOTS_WITH_IOB_V2}
)
if("${HOSTNAME}" IN_LIST KNOWN_ROBOTS)
  message("-- Building on known robot (${HOSTNAME}) INTERNAL_MACHINE defaults to ON")
  set(INTERNAL_MACHINE_DEFAULT ON)
else()
  set(INTERNAL_MACHINE_DEFAULT OFF)
endif()
if("${HOSTNAME}" IN_LIST KNOWN_ROBOTS_WITH_IOB_V2)
  message("-- Building on known robot (${HOSTNAME}) ROBOT_IOB_VERSION is set to 2")
  set(ROBOT_IOB_VERSION 2 CACHE STRING "Robot IOB version")
endif()

# Extra APT dependencies
set(drcutil_APT_DEPENDENCIES
  autoconf
  f2c
  libtool-bin
  libsdl-dev
  libglew-dev
  libopencv-dev
  libqhull-dev
  libyaml-dev
  libncurses5-dev
  libzbar-dev
  freeglut3-dev
  libxmu-dev
  libglpk-dev
  libpcl-dev
  libproj-dev
  libusb-1.0-0-dev
  libusb-dev
  libzip-dev
  doxygen
  libqt5x11extras5-dev
  libxfixes-dev
  libomniorb4-dev
  python-omniorb
  omniorb-nameserver
  omniidl
  omniidl-python
  libqt5svg5-dev
  python-yaml
  python-tk
  libfmt-dev
  gettext
  libcollada-dom-dev
  ${PYTHON2DEV_PKG}
  python3-dev
  libzip-dev
)

if (WITH_CHOREONOID)
  option(WITH_CHOREONOID_ROS "Build choreonoid_ros support" OFF)
  if(WITH_CHOREONOID_ROS AND NOT WITH_ROS_SUPPORT)
    message(FATAL_ERROR "Enabling choreonoid_ros requires mc_rtc ROS support as well")
  endif()
  if(WITH_CHOREONOID_ROS)
    list(APPEND drcutil_APT_DEPENDENCIES
      ros-${ROS_DISTRO}-controller-manager
      ros-${ROS_DISTRO}-hardware-interface
      ros-${ROS_DISTRO}-joint-limits-interface
      ros-${ROS_DISTRO}-transmission-interface
    )
  endif()  
endif()

AptInstall(${drcutil_APT_DEPENDENCIES})

include(irsl_mc_rtc_util.cmake)

if (WITH_CHOREONOID)
  include(choreonoid.cmake)
  include(mc-openrtm.cmake)
endif()
