# Install script for directory: /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/librender

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
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/binaries/libmitsuba-render.so")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-render.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sdk/include/mitsuba/render" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/bsdf.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/common.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/emitter.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/film.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/fwd.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/gatherproc.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/gkdtree.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/imageblock.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/imageproc.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/integrator.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/irrcache.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/medium.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/mipmap.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/noise.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/particleproc.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/phase.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/photon.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/photonmap.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/range.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/records.inl"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/rectwu.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/renderjob.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/renderproc.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/renderqueue.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/sahkdtree2.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/sahkdtree3.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/sampler.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/scene.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/scenehandler.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/sensor.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/shader.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/shape.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/skdtree.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/spiral.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/subsurface.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/testcase.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/texture.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/track.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/triaccel.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/triaccel_sse.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/trimesh.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/util.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/volume.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/render/vpl.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")

