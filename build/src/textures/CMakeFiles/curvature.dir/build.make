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
include src/textures/CMakeFiles/curvature.dir/depend.make

# Include the progress variables for this target.
include src/textures/CMakeFiles/curvature.dir/progress.make

# Include the compile flags for this target's objects.
include src/textures/CMakeFiles/curvature.dir/flags.make

src/textures/CMakeFiles/curvature.dir/curvature.cpp.o: src/textures/CMakeFiles/curvature.dir/flags.make
src/textures/CMakeFiles/curvature.dir/curvature.cpp.o: ../src/textures/curvature.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/textures/CMakeFiles/curvature.dir/curvature.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/curvature.dir/curvature.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures/curvature.cpp

src/textures/CMakeFiles/curvature.dir/curvature.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/curvature.dir/curvature.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures/curvature.cpp > CMakeFiles/curvature.dir/curvature.cpp.i

src/textures/CMakeFiles/curvature.dir/curvature.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/curvature.dir/curvature.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures/curvature.cpp -o CMakeFiles/curvature.dir/curvature.cpp.s

src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.requires:
.PHONY : src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.requires

src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.provides: src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.requires
	$(MAKE) -f src/textures/CMakeFiles/curvature.dir/build.make src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.provides.build
.PHONY : src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.provides

src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.provides.build: src/textures/CMakeFiles/curvature.dir/curvature.cpp.o

# Object files for target curvature
curvature_OBJECTS = \
"CMakeFiles/curvature.dir/curvature.cpp.o"

# External object files for target curvature
curvature_EXTERNAL_OBJECTS =

binaries/plugins/curvature.so: src/textures/CMakeFiles/curvature.dir/curvature.cpp.o
binaries/plugins/curvature.so: src/textures/CMakeFiles/curvature.dir/build.make
binaries/plugins/curvature.so: binaries/libmitsuba-core.so
binaries/plugins/curvature.so: binaries/libmitsuba-render.so
binaries/plugins/curvature.so: binaries/libmitsuba-core.so
binaries/plugins/curvature.so: /usr/lib/lib/libz.so
binaries/plugins/curvature.so: /usr/lib/libpng.so
binaries/plugins/curvature.so: /usr/lib/lib/libz.so
binaries/plugins/curvature.so: /usr/lib/libpng.so
binaries/plugins/curvature.so: /usr/lib/libjpeg.so
binaries/plugins/curvature.so: /usr/lib/libHalf.so
binaries/plugins/curvature.so: /usr/lib/libIex.so
binaries/plugins/curvature.so: /usr/lib/libImath.so
binaries/plugins/curvature.so: /usr/lib/libIlmThread.so
binaries/plugins/curvature.so: /usr/lib/libIlmImf.so
binaries/plugins/curvature.so: /usr/lib/libboost_filesystem.so
binaries/plugins/curvature.so: /usr/lib/libboost_system.so
binaries/plugins/curvature.so: /usr/lib/libboost_thread.so
binaries/plugins/curvature.so: /usr/lib/libIlmImf.so
binaries/plugins/curvature.so: /usr/lib/libboost_filesystem.so
binaries/plugins/curvature.so: /usr/lib/libboost_system.so
binaries/plugins/curvature.so: /usr/lib/libboost_thread.so
binaries/plugins/curvature.so: /usr/lib/libxerces-c.so
binaries/plugins/curvature.so: src/textures/CMakeFiles/curvature.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/curvature.so"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/curvature.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/textures/CMakeFiles/curvature.dir/build: binaries/plugins/curvature.so
.PHONY : src/textures/CMakeFiles/curvature.dir/build

src/textures/CMakeFiles/curvature.dir/requires: src/textures/CMakeFiles/curvature.dir/curvature.cpp.o.requires
.PHONY : src/textures/CMakeFiles/curvature.dir/requires

src/textures/CMakeFiles/curvature.dir/clean:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && $(CMAKE_COMMAND) -P CMakeFiles/curvature.dir/cmake_clean.cmake
.PHONY : src/textures/CMakeFiles/curvature.dir/clean

src/textures/CMakeFiles/curvature.dir/depend:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures/CMakeFiles/curvature.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/textures/CMakeFiles/curvature.dir/depend
