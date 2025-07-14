# Copyright (C) 2010 Olivier Stasse, JRL, CNRS, 2010
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# This files comes from the CMake FAQ: http://www.cmake.org/Wiki/CMake_FAQ
IF(NOT EXISTS "/bwc_ws/build/baseline_walking_controller/install_manifest.txt")
  RETURN()
ENDIF(NOT EXISTS "/bwc_ws/build/baseline_walking_controller/install_manifest.txt")

MESSAGE(STATUS "catkin path: /bwc_ws/install/.catkin")
IF(EXISTS "/bwc_ws/install/.catkin")
  MESSAGE(STATUS "Try to remove /bwc_ws/install/.catkin")
  EXECUTE_PROCESS(
      COMMAND /usr/bin/cmake -E remove "/bwc_ws/install/.catkin"
      RESULT_VARIABLE rm_resval
      OUTPUT_VARIABLE rm_out
      ERROR_VARIABLE rm_err
       )
ENDIF(EXISTS "/bwc_ws/install/.catkin")

IF(EXISTS "/install_manifest.txt")
  return()
ENDIF()
FILE(READ "/bwc_ws/build/baseline_walking_controller/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
LIST(REMOVE_ITEM files "")
LIST(REVERSE files)
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  IF(EXISTS "$ENV{DESTDIR}${file}")
    EXECUTE_PROCESS(
      COMMAND /usr/bin/cmake -E remove "$ENV{DESTDIR}${file}"
      RESULT_VARIABLE rm_resval
      OUTPUT_VARIABLE rm_out
      )
    IF(NOT ${rm_resval} STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    ENDIF(NOT ${rm_resval} STREQUAL 0)

    # remove .pyc if need be
    IF(file MATCHES ".py$")
      SET(pycfile "${file}c")
      IF(EXISTS "$ENV{DESTDIR}${pycfile}")
        MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${pycfile}\"")
        EXECUTE_PROCESS(
          COMMAND /usr/bin/cmake -E remove "$ENV{DESTDIR}${pycfile}"
          RESULT_VARIABLE rm_resval
          OUTPUT_VARIABLE rm_out
          )
        IF(NOT ${rm_resval} STREQUAL 0)
          MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${pycfile}\"")
        ENDIF(NOT ${rm_resval} STREQUAL 0)
      ENDIF(EXISTS "$ENV{DESTDIR}${pycfile}")
    ENDIF(file MATCHES ".py$")

  ELSE(EXISTS "$ENV{DESTDIR}${file}")
    MESSAGE(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")

    # If file is a broken symbolic link, EXISTS returns false.
    # Workaround this bug by attempting to remove the file anyway.
    EXECUTE_PROCESS(
      COMMAND /usr/bin/cmake -E remove "$ENV{DESTDIR}${file}"
      RESULT_VARIABLE rm_resval
      OUTPUT_VARIABLE rm_out
      ERROR_QUIET
      )
  ENDIF(EXISTS "$ENV{DESTDIR}${file}")
ENDFOREACH(file)
EXECUTE_PROCESS(
  COMMAND "/usr/bin/cmake" -E remove "/bwc_ws/build/baseline_walking_controller/install_manifest.txt"
  RESULT_VARIABLE rm_resval
  OUTPUT_VARIABLE rm_out
  ERROR_QUIET
  )
