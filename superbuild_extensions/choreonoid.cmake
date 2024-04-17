set(CUSTOMIZERS "")

# if(WITH_HRP2)
#   set(CUSTOMIZERS ${SOURCE_DESTINATION}/openhrp/HRP2/customizer/HRP2Customizer$<SEMICOLON>${CUSTOMIZERS})
# endif()

# if(WITH_HRP4CR)
#   set(CUSTOMIZERS ${SOURCE_DESTINATION}/openhrp/HRP4CR/customizer/HRP4CRCustomizer$<SEMICOLON>${CUSTOMIZERS})
# endif()

# if(WITH_HRP5)
#   set(CUSTOMIZERS ${SOURCE_DESTINATION}/openhrp/HRP5P/customizer/HRP5PCustomizer$<SEMICOLON>${CUSTOMIZERS})
# endif()

# if(TARGET hrpsys-private)
#   set(choreonoid_DEPENDS hrpsys-private hrpsys-state-observation ${robot_DEPENDS})
# else()
set(choreonoid_DEPENDS hrpsys-base ${robot_DEPENDS})
# endif()

if(WITH_CHOREONOID_ROS)
  set(CUSTOMIZER_OPTIONS -DBODY_CUSTOMIZERS="${CUSTOMIZERS}")
  set(CMAKE_EXTRA_ARGS -DCHOREONOID_PLUGIN_LINK_USE_KEYWORD:BOOL=OFF)
else()
  set(CUSTOMIZER_OPTIONS -DBODY_CUSTOMIZERS=${CUSTOMIZERS})
  set(CMAKE_EXTRA_ARGS -DCHOREONOID_PLUGIN_LINK_USE_KEYWORD:BOOL=ON)
endif()
set(choreonoid_cmake_args
  -DCMAKE_BUILD_TYPE=$<CONFIG>
  ${CUSTOMIZER_OPTIONS}
  -DCMAKE_CXX_STANDARD=17
  -DENABLE_CORBA=ON
  -DBUILD_CORBA_PLUGIN=ON
  -DBUILD_OPENRTM_PLUGIN=ON
  -DUSE_BUILTIN_CAMERA_IMAGE_IDL=ON
  -DBUILD_PCL_PLUGIN=ON
  -DBUILD_OPENHRP_PLUGIN=ON
  -DBUILD_GRXUI_PLUGIN=ON
  -DBUILD_DRC_USER_INTERFACE_PLUGIN=ON
  -DROBOT_HOSTNAME="$ENV{ROBOT_HOSTNAME}"
  -DBUILD_ASSIMP_PLUGIN=OFF
  -DUSE_PYBIND11=ON
  -DUSE_PYTHON3=OFF
  -DBUILD_BALANCER_PLUGIN=OFF
  -DENABLE_PYTHON=ON
  -DBUILD_PYTHON_SIM_SCRIPT_PLUGIN=OFF
  -DBUILD_BOOST_PYTHON_MODULES=OFF
  -DUSE_EXTERNAL_PYBIND11=ON
  -DBUILD_PYTHON_PLUGIN=ON
  -DBUILD_PYTHON_SIM_SCRIPT_PLUGIN=ON
  -DBUILD_HRPSYS31_PLUGIN=ON
  -DBUILD_ROBOT_ACCESS_PLUGIN=ON
  ${CMAKE_EXTRA_ARGS}
)

if(WITH_CHOREONOID_ROS)
  CreateCatkinWorkspace(ID cnoid_ws DIR ana/catkin_ws_cnoid CATKIN_BUILD CATKIN_BUILD_ARGS ${choreonoid_cmake_args})

  AddCatkinProject(choreonoid_ros
    # When the pull request https://github.com/choreonoid/choreonoid_ros/pull/4 is merged, it will be replaced with this repository.
    # GITHUB choreonoid/choreonoid_ros
    GITHUB arntanguy/choreonoid_ros
    GIT_TAG origin/master
    WORKSPACE cnoid_ws
  )

  AddCatkinProject(choreonoid
    # When the pull request https://github.com/choreonoid/choreonoid/pull/25 is merged, it will be replaced with this repository.
    # GITHUB choreonoid/choreonoid
    GITHUB arntanguy/choreonoid-1
    GIT_TAG origin/master
    WORKSPACE cnoid_ws
    DEPENDS ${choreonoid_DEPENDS}
  )
else()
  if(NOT USE_MC_RTC_APT_MIRROR)
    AddProject(pybind11
      GITHUB pybind/pybind11
      GIT_TAG v2.9.2
      CMAKE_ARGS -DPYBIND11_INSTALL=ON -DPYBIND11_TEST=OFF
    )
    list(APPEND choreonoid_DEPENDS pybind11)
  endif()

  AddProject(choreonoid
    GITHUB choreonoid/choreonoid
    GIT_TAG origin/master
    CMAKE_ARGS -DUSE_BUNDLED_PYBIND11=OFF ${choreonoid_cmake_args}
    DEPENDS ${choreonoid_DEPENDS}
    APT_PACKAGES choreonoid libcnoid-dev
  )
endif()

if(USE_MC_RTC_APT_MIRROR AND NOT WITH_CHOREONOID_ROS)
  return()
endif()

AddProjectPlugin(choreonoid-openrtm choreonoid
  # When the pull request https://github.com/OpenRTM/choreonoid-openrtm/pull/12 is merged, it will be replaced with this repository.
  # GITHUB OpenRTM/choreonoid-openrtm
  GITHUB orikuma/choreonoid-openrtm
  GIT_TAG origin/topic/link-boost-program-options
  SUBFOLDER ext
)

AddProjectPlugin(openhrp-plugin choreonoid
  GITHUB isri-aist/openhrp-plugin
  GIT_TAG origin/master
  SUBFOLDER ext
)

AddProjectPlugin(grxui-plugin choreonoid
  GITHUB isri-aist/grxui-plugin
  GIT_TAG origin/master
  SUBFOLDER ext
)

AddProjectPlugin(robot-access-plugin choreonoid
  GITHUB choreonoid/robot-access-plugin
  GIT_TAG origin/master
  SUBFOLDER ext
)