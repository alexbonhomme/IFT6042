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
include src/integrators/CMakeFiles/irrcache.dir/depend.make

# Include the progress variables for this target.
include src/integrators/CMakeFiles/irrcache.dir/progress.make

# Include the compile flags for this target's objects.
include src/integrators/CMakeFiles/irrcache.dir/flags.make

src/integrators/irrcache_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
src/integrators/irrcache_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating irrcache_pch/./mitsuba_precompiled.hpp.gch"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/cmake -E make_directory /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/irrcache_pch/.
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  -fopenmp -O3 -DNDEBUG -DMTS_HAS_COLLADA=1 -DMTS_HAS_LIBPNG=1 -DMTS_HAS_LIBJPEG=1 -DMTS_HAS_OPENEXR=1 -DMTS_DEBUG -DSINGLE_PRECISION -DSPECTRUM_SAMPLES=3 -DMTS_SSE -DMTS_HAS_COHERENT_RT -I/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include -I/usr/include/eigen3 -I/usr/include/OpenEXR -fPIC -x c++-header -c -o /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/irrcache_pch/./mitsuba_precompiled.hpp.gch /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/data/pch/mitsuba_precompiled.hpp

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o: src/integrators/CMakeFiles/irrcache.dir/flags.make
src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o: ../src/integrators/misc/irrcache.cpp
src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o: src/integrators/irrcache_pch/./mitsuba_precompiled.hpp.gch
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -include "irrcache_pch/./mitsuba_precompiled.hpp" -o CMakeFiles/irrcache.dir/misc/irrcache.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/misc/irrcache.cpp

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/irrcache.dir/misc/irrcache.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "irrcache_pch/./mitsuba_precompiled.hpp" -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/misc/irrcache.cpp > CMakeFiles/irrcache.dir/misc/irrcache.cpp.i

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/irrcache.dir/misc/irrcache.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "irrcache_pch/./mitsuba_precompiled.hpp" -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/misc/irrcache.cpp -o CMakeFiles/irrcache.dir/misc/irrcache.cpp.s

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.requires:
.PHONY : src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.requires

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.provides: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.requires
	$(MAKE) -f src/integrators/CMakeFiles/irrcache.dir/build.make src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.provides.build
.PHONY : src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.provides

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.provides.build: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o: src/integrators/CMakeFiles/irrcache.dir/flags.make
src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o: ../src/integrators/misc/irrcache_proc.cpp
src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o: src/integrators/irrcache_pch/./mitsuba_precompiled.hpp.gch
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -include "irrcache_pch/./mitsuba_precompiled.hpp" -o CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/misc/irrcache_proc.cpp

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "irrcache_pch/./mitsuba_precompiled.hpp" -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/misc/irrcache_proc.cpp > CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.i

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -include "irrcache_pch/./mitsuba_precompiled.hpp" -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/misc/irrcache_proc.cpp -o CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.s

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.requires:
.PHONY : src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.requires

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.provides: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.requires
	$(MAKE) -f src/integrators/CMakeFiles/irrcache.dir/build.make src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.provides.build
.PHONY : src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.provides

src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.provides.build: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o

# Object files for target irrcache
irrcache_OBJECTS = \
"CMakeFiles/irrcache.dir/misc/irrcache.cpp.o" \
"CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o"

# External object files for target irrcache
irrcache_EXTERNAL_OBJECTS =

binaries/plugins/irrcache.so: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o
binaries/plugins/irrcache.so: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o
binaries/plugins/irrcache.so: src/integrators/CMakeFiles/irrcache.dir/build.make
binaries/plugins/irrcache.so: binaries/libmitsuba-core.so
binaries/plugins/irrcache.so: binaries/libmitsuba-render.so
binaries/plugins/irrcache.so: binaries/libmitsuba-core.so
binaries/plugins/irrcache.so: /usr/lib/lib/libz.so
binaries/plugins/irrcache.so: /usr/lib/libpng.so
binaries/plugins/irrcache.so: /usr/lib/lib/libz.so
binaries/plugins/irrcache.so: /usr/lib/libpng.so
binaries/plugins/irrcache.so: /usr/lib/libjpeg.so
binaries/plugins/irrcache.so: /usr/lib/libHalf.so
binaries/plugins/irrcache.so: /usr/lib/libIex.so
binaries/plugins/irrcache.so: /usr/lib/libImath.so
binaries/plugins/irrcache.so: /usr/lib/libIlmThread.so
binaries/plugins/irrcache.so: /usr/lib/libIlmImf.so
binaries/plugins/irrcache.so: /usr/lib/libboost_filesystem.so
binaries/plugins/irrcache.so: /usr/lib/libboost_system.so
binaries/plugins/irrcache.so: /usr/lib/libboost_thread.so
binaries/plugins/irrcache.so: /usr/lib/libIlmImf.so
binaries/plugins/irrcache.so: /usr/lib/libboost_filesystem.so
binaries/plugins/irrcache.so: /usr/lib/libboost_system.so
binaries/plugins/irrcache.so: /usr/lib/libboost_thread.so
binaries/plugins/irrcache.so: /usr/lib/libxerces-c.so
binaries/plugins/irrcache.so: src/integrators/CMakeFiles/irrcache.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/irrcache.so"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/irrcache.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/integrators/CMakeFiles/irrcache.dir/build: binaries/plugins/irrcache.so
.PHONY : src/integrators/CMakeFiles/irrcache.dir/build

src/integrators/CMakeFiles/irrcache.dir/requires: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache.cpp.o.requires
src/integrators/CMakeFiles/irrcache.dir/requires: src/integrators/CMakeFiles/irrcache.dir/misc/irrcache_proc.cpp.o.requires
.PHONY : src/integrators/CMakeFiles/irrcache.dir/requires

src/integrators/CMakeFiles/irrcache.dir/clean:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && $(CMAKE_COMMAND) -P CMakeFiles/irrcache.dir/cmake_clean.cmake
.PHONY : src/integrators/CMakeFiles/irrcache.dir/clean

src/integrators/CMakeFiles/irrcache.dir/depend: src/integrators/irrcache_pch/./mitsuba_precompiled.hpp.gch
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/CMakeFiles/irrcache.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/integrators/CMakeFiles/irrcache.dir/depend
