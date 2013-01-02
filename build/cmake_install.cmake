# Install script for directory: /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba

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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/data/schema/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/data/ior/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/data/microfacet/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/libcore/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/librender/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/libhw/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/libbidir/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/libpython/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/mitsuba/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/converter/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/mtsgui/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/utils/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/bsdfs/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/phase/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/shapes/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/rfilters/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/films/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/sensors/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/emitters/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/medium/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/volume/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/subsurface/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/tests/cmake_install.cmake")
  INCLUDE("/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/data/cmake/packaging/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
