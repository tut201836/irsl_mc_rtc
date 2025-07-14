# Install script for directory: /bwc_ws/src/isri-aist/BaselineWalkingController/src/states

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/bwc_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so"
         RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE SHARED_LIBRARY FILES "/bwc_ws/devel/.private/baseline_walking_controller/lib/baseline_walking_controller/states/InitialState.so")
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so"
         OLD_RPATH "/bwc_ws/devel/.private/force_control_collection/lib:/bwc_ws/devel/.private/qp_solver_collection/lib:/bwc_ws/devel/.private/centroidal_control_collection/lib:/opt/ros/noetic/lib:/bwc_ws/devel/.private/baseline_walking_controller/lib:/mc_rtc_ws/install/lib:"
         NEW_RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/InitialState.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so"
         RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE SHARED_LIBRARY FILES "/bwc_ws/devel/.private/baseline_walking_controller/lib/baseline_walking_controller/states/ConfigWalkState.so")
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so"
         OLD_RPATH "/bwc_ws/devel/.private/force_control_collection/lib:/bwc_ws/devel/.private/qp_solver_collection/lib:/bwc_ws/devel/.private/centroidal_control_collection/lib:/opt/ros/noetic/lib:/bwc_ws/devel/.private/baseline_walking_controller/lib:/mc_rtc_ws/install/lib:"
         NEW_RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/ConfigWalkState.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so"
         RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE SHARED_LIBRARY FILES "/bwc_ws/devel/.private/baseline_walking_controller/lib/baseline_walking_controller/states/GuiWalkState.so")
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so"
         OLD_RPATH "/bwc_ws/devel/.private/force_control_collection/lib:/bwc_ws/devel/.private/qp_solver_collection/lib:/bwc_ws/devel/.private/centroidal_control_collection/lib:/opt/ros/noetic/lib:/bwc_ws/devel/.private/baseline_walking_controller/lib:/mc_rtc_ws/install/lib:"
         NEW_RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/GuiWalkState.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so"
         RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE SHARED_LIBRARY FILES "/bwc_ws/devel/.private/baseline_walking_controller/lib/baseline_walking_controller/states/RosWalkState.so")
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so"
         OLD_RPATH "/bwc_ws/devel/.private/force_control_collection/lib:/bwc_ws/devel/.private/qp_solver_collection/lib:/bwc_ws/devel/.private/centroidal_control_collection/lib:/opt/ros/noetic/lib:/bwc_ws/devel/.private/baseline_walking_controller/lib:/mc_rtc_ws/install/lib:"
         NEW_RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/RosWalkState.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so"
         RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE SHARED_LIBRARY FILES "/bwc_ws/devel/.private/baseline_walking_controller/lib/baseline_walking_controller/states/TeleopState.so")
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so"
         OLD_RPATH "/bwc_ws/devel/.private/force_control_collection/lib:/bwc_ws/devel/.private/qp_solver_collection/lib:/bwc_ws/devel/.private/centroidal_control_collection/lib:/opt/ros/noetic/lib:/bwc_ws/devel/.private/baseline_walking_controller/lib:/mc_rtc_ws/install/lib:"
         NEW_RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/TeleopState.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so"
         RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE SHARED_LIBRARY FILES "/bwc_ws/devel/.private/baseline_walking_controller/lib/baseline_walking_controller/states/FootstepPlannerState.so")
  if(EXISTS "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so"
         OLD_RPATH "/bwc_ws/devel/.private/force_control_collection/lib:/bwc_ws/devel/.private/qp_solver_collection/lib:/bwc_ws/devel/.private/centroidal_control_collection/lib:/opt/ros/noetic/lib:/bwc_ws/devel/.private/baseline_footstep_planner/lib:/bwc_ws/devel/.private/baseline_walking_controller/lib:/mc_rtc_ws/install/lib:"
         NEW_RPATH "/mc_rtc_ws/install/lib/mc_controller/fsm/states:/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/FootstepPlannerState.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/baseline_walking_controller" TYPE FILE FILES "/bwc_ws/build/baseline_walking_controller/generated/FootstepPlannerConfig.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states/data")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/mc_rtc_ws/install/lib/mc_controller/baseline_walking_controller/states" TYPE DIRECTORY FILES "/bwc_ws/src/isri-aist/BaselineWalkingController/src/states/data" FILES_MATCHING REGEX ".*(.json$|.yml$|.yaml$)")
endif()

