# Install script for directory: /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/libcore

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Runtime")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/binaries/libmitsuba-core.so")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-core.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sdk/include/mitsuba" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/mitsuba.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sdk/include/mitsuba/core" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/aabb.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/aabb_sse.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/appender.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/atomic.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/barray.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/bitmap.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/brent.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/bsphere.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/simplecache.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/chisquare.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/class.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/cobject.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/constants.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/cstream.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/formatter.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/frame.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/fresolver.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/fstream.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/fwd.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/half.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/kdtree.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/lock.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/logger.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/lrucache.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/matrix.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/matrix.inl"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/mempool.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/mmap.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/mstream.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/netobject.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/normal.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/object.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/octree.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/platform.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/plugin.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/pmf.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/point.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/properties.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/qmc.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/quad.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/quat.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/random.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/ray.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/ray_sse.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/ref.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/rfilter.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/sched.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/sched_remote.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/serialization.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/sfcurve.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/shvector.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/spectrum.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/spline.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/sse.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/ssemath.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/ssevector.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/sshstream.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/sstream.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/statistics.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/stl.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/stream.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/thread.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/timer.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/tls.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/transform.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/triangle.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/util.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/vector.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/version.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/vmf.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/warp.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/core/zstream.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")

