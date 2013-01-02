# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build

# Include any dependencies generated for this target.
include src/samplers/CMakeFiles/halton.dir/depend.make

# Include the progress variables for this target.
include src/samplers/CMakeFiles/halton.dir/progress.make

# Include the compile flags for this target's objects.
include src/samplers/CMakeFiles/halton.dir/flags.make

src/samplers/halton_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
src/samplers/halton_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating halton_pch/./mitsuba_precompiled.hpp.gch"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/cmake -E make_directory /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers/halton_pch/.
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++  -fopenmp -O3 -DNDEBUG -DMTS_HAS_COLLADA=1 -DMTS_HAS_LIBPNG=1 -DMTS_HAS_LIBJPEG=1 -DMTS_HAS_OPENEXR=1 -DMTS_DEBUG -DSINGLE_PRECISION -DSPECTRUM_SAMPLES=3 -DMTS_SSE -DMTS_HAS_COHERENT_RT -I/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include -I/usr/include/eigen3 -I/usr/include/OpenEXR -fPIC -x c++-header -c -o /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers/halton_pch/./mitsuba_precompiled.hpp.gch /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/data/pch/mitsuba_precompiled.hpp

src/samplers/hammersley_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
src/samplers/hammersley_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating hammersley_pch/./mitsuba_precompiled.hpp.gch"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/cmake -E make_directory /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers/hammersley_pch/.
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++  -fopenmp -O3 -DNDEBUG -DMTS_HAS_COLLADA=1 -DMTS_HAS_LIBPNG=1 -DMTS_HAS_LIBJPEG=1 -DMTS_HAS_OPENEXR=1 -DMTS_DEBUG -DSINGLE_PRECISION -DSPECTRUM_SAMPLES=3 -DMTS_SSE -DMTS_HAS_COHERENT_RT -I/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include -I/usr/include/eigen3 -I/usr/include/OpenEXR -fPIC -x c++-header -c -o /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers/hammersley_pch/./mitsuba_precompiled.hpp.gch /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/data/pch/mitsuba_precompiled.hpp

src/samplers/CMakeFiles/halton.dir/halton.cpp.o: src/samplers/CMakeFiles/halton.dir/flags.make
src/samplers/CMakeFiles/halton.dir/halton.cpp.o: ../src/samplers/halton.cpp
src/samplers/CMakeFiles/halton.dir/halton.cpp.o: src/samplers/halton_pch/./mitsuba_precompiled.hpp.gch
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/samplers/CMakeFiles/halton.dir/halton.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -include "halton_pch/./mitsuba_precompiled.hpp" -o CMakeFiles/halton.dir/halton.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers/halton.cpp

src/samplers/CMakeFiles/halton.dir/halton.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/halton.dir/halton.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "halton_pch/./mitsuba_precompiled.hpp" -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers/halton.cpp > CMakeFiles/halton.dir/halton.cpp.i

src/samplers/CMakeFiles/halton.dir/halton.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/halton.dir/halton.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "halton_pch/./mitsuba_precompiled.hpp" -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers/halton.cpp -o CMakeFiles/halton.dir/halton.cpp.s

src/samplers/CMakeFiles/halton.dir/halton.cpp.o.requires:
.PHONY : src/samplers/CMakeFiles/halton.dir/halton.cpp.o.requires

src/samplers/CMakeFiles/halton.dir/halton.cpp.o.provides: src/samplers/CMakeFiles/halton.dir/halton.cpp.o.requires
	$(MAKE) -f src/samplers/CMakeFiles/halton.dir/build.make src/samplers/CMakeFiles/halton.dir/halton.cpp.o.provides.build
.PHONY : src/samplers/CMakeFiles/halton.dir/halton.cpp.o.provides

src/samplers/CMakeFiles/halton.dir/halton.cpp.o.provides.build: src/samplers/CMakeFiles/halton.dir/halton.cpp.o

src/samplers/CMakeFiles/halton.dir/faure.cpp.o: src/samplers/CMakeFiles/halton.dir/flags.make
src/samplers/CMakeFiles/halton.dir/faure.cpp.o: ../src/samplers/faure.cpp
src/samplers/CMakeFiles/halton.dir/faure.cpp.o: src/samplers/hammersley_pch/./mitsuba_precompiled.hpp.gch
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/samplers/CMakeFiles/halton.dir/faure.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -include "halton_pch/./mitsuba_precompiled.hpp" -o CMakeFiles/halton.dir/faure.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers/faure.cpp

src/samplers/CMakeFiles/halton.dir/faure.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/halton.dir/faure.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "halton_pch/./mitsuba_precompiled.hpp" -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers/faure.cpp > CMakeFiles/halton.dir/faure.cpp.i

src/samplers/CMakeFiles/halton.dir/faure.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/halton.dir/faure.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "halton_pch/./mitsuba_precompiled.hpp" -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers/faure.cpp -o CMakeFiles/halton.dir/faure.cpp.s

src/samplers/CMakeFiles/halton.dir/faure.cpp.o.requires:
.PHONY : src/samplers/CMakeFiles/halton.dir/faure.cpp.o.requires

src/samplers/CMakeFiles/halton.dir/faure.cpp.o.provides: src/samplers/CMakeFiles/halton.dir/faure.cpp.o.requires
	$(MAKE) -f src/samplers/CMakeFiles/halton.dir/build.make src/samplers/CMakeFiles/halton.dir/faure.cpp.o.provides.build
.PHONY : src/samplers/CMakeFiles/halton.dir/faure.cpp.o.provides

src/samplers/CMakeFiles/halton.dir/faure.cpp.o.provides.build: src/samplers/CMakeFiles/halton.dir/faure.cpp.o

# Object files for target halton
halton_OBJECTS = \
"CMakeFiles/halton.dir/halton.cpp.o" \
"CMakeFiles/halton.dir/faure.cpp.o"

# External object files for target halton
halton_EXTERNAL_OBJECTS =

binaries/plugins/halton.so: src/samplers/CMakeFiles/halton.dir/halton.cpp.o
binaries/plugins/halton.so: src/samplers/CMakeFiles/halton.dir/faure.cpp.o
binaries/plugins/halton.so: src/samplers/CMakeFiles/halton.dir/build.make
binaries/plugins/halton.so: binaries/libmitsuba-core.so
binaries/plugins/halton.so: binaries/libmitsuba-render.so
binaries/plugins/halton.so: binaries/libmitsuba-core.so
binaries/plugins/halton.so: /usr/lib/lib/libz.so
binaries/plugins/halton.so: /usr/lib/libpng.so
binaries/plugins/halton.so: /usr/lib/lib/libz.so
binaries/plugins/halton.so: /usr/lib/libpng.so
binaries/plugins/halton.so: /usr/lib/libjpeg.so
binaries/plugins/halton.so: /usr/lib/libHalf.so
binaries/plugins/halton.so: /usr/lib/libIex.so
binaries/plugins/halton.so: /usr/lib/libImath.so
binaries/plugins/halton.so: /usr/lib/libIlmThread.so
binaries/plugins/halton.so: /usr/lib/libIlmImf.so
binaries/plugins/halton.so: /usr/lib/libboost_filesystem.so
binaries/plugins/halton.so: /usr/lib/libboost_system.so
binaries/plugins/halton.so: /usr/lib/libboost_thread.so
binaries/plugins/halton.so: /usr/lib/libIlmImf.so
binaries/plugins/halton.so: /usr/lib/libboost_filesystem.so
binaries/plugins/halton.so: /usr/lib/libboost_system.so
binaries/plugins/halton.so: /usr/lib/libboost_thread.so
binaries/plugins/halton.so: /usr/lib/libxerces-c.so
binaries/plugins/halton.so: src/samplers/CMakeFiles/halton.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/halton.so"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/halton.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/samplers/CMakeFiles/halton.dir/build: binaries/plugins/halton.so
.PHONY : src/samplers/CMakeFiles/halton.dir/build

src/samplers/CMakeFiles/halton.dir/requires: src/samplers/CMakeFiles/halton.dir/halton.cpp.o.requires
src/samplers/CMakeFiles/halton.dir/requires: src/samplers/CMakeFiles/halton.dir/faure.cpp.o.requires
.PHONY : src/samplers/CMakeFiles/halton.dir/requires

src/samplers/CMakeFiles/halton.dir/clean:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers && $(CMAKE_COMMAND) -P CMakeFiles/halton.dir/cmake_clean.cmake
.PHONY : src/samplers/CMakeFiles/halton.dir/clean

src/samplers/CMakeFiles/halton.dir/depend: src/samplers/halton_pch/./mitsuba_precompiled.hpp.gch
src/samplers/CMakeFiles/halton.dir/depend: src/samplers/hammersley_pch/./mitsuba_precompiled.hpp.gch
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/samplers /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/samplers/CMakeFiles/halton.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/samplers/CMakeFiles/halton.dir/depend
