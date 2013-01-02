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

# Utility rule file for bdpt_pch.

# Include the progress variables for this target.
include src/integrators/CMakeFiles/bdpt_pch.dir/progress.make

src/integrators/CMakeFiles/bdpt_pch: src/integrators/bdpt_pch/./mitsuba_precompiled.hpp.gch

src/integrators/bdpt_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
src/integrators/bdpt_pch/./mitsuba_precompiled.hpp.gch: ../data/pch/mitsuba_precompiled.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating bdpt_pch/./mitsuba_precompiled.hpp.gch"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/cmake -E make_directory /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/bdpt_pch/.
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  -fopenmp -O3 -DNDEBUG -DMTS_HAS_COLLADA=1 -DMTS_HAS_LIBPNG=1 -DMTS_HAS_LIBJPEG=1 -DMTS_HAS_OPENEXR=1 -DMTS_DEBUG -DSINGLE_PRECISION -DSPECTRUM_SAMPLES=3 -DMTS_SSE -DMTS_HAS_COHERENT_RT -I/home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/include -I/usr/include/eigen3 -I/usr/include/OpenEXR -fPIC -x c++-header -c -o /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/bdpt_pch/./mitsuba_precompiled.hpp.gch /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/data/pch/mitsuba_precompiled.hpp

bdpt_pch: src/integrators/CMakeFiles/bdpt_pch
bdpt_pch: src/integrators/bdpt_pch/./mitsuba_precompiled.hpp.gch
bdpt_pch: src/integrators/CMakeFiles/bdpt_pch.dir/build.make
.PHONY : bdpt_pch

# Rule to build all files generated by this target.
src/integrators/CMakeFiles/bdpt_pch.dir/build: bdpt_pch
.PHONY : src/integrators/CMakeFiles/bdpt_pch.dir/build

src/integrators/CMakeFiles/bdpt_pch.dir/clean:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && $(CMAKE_COMMAND) -P CMakeFiles/bdpt_pch.dir/cmake_clean.cmake
.PHONY : src/integrators/CMakeFiles/bdpt_pch.dir/clean

src/integrators/CMakeFiles/bdpt_pch.dir/depend:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/CMakeFiles/bdpt_pch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/integrators/CMakeFiles/bdpt_pch.dir/depend

