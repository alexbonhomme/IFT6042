# Install script for directory: /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/libbidir

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
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/binaries/libmitsuba-bidir.so")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libmitsuba-bidir.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/sdk/include/mitsuba/bidir" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/common.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/edge.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/geodist2.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/manifold.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mempool.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mut_bidir.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mut_caustic.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mut_lens.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mut_manifold.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mut_mchain.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/mutator.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/path.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/pathsampler.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/rsampler.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/util.h"
    "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include/mitsuba/bidir/vertex.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Developer")

