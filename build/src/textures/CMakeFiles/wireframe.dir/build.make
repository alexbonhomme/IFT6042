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
include src/textures/CMakeFiles/wireframe.dir/depend.make

# Include the progress variables for this target.
include src/textures/CMakeFiles/wireframe.dir/progress.make

# Include the compile flags for this target's objects.
include src/textures/CMakeFiles/wireframe.dir/flags.make

src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o: src/textures/CMakeFiles/wireframe.dir/flags.make
src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o: ../src/textures/wireframe.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/wireframe.dir/wireframe.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures/wireframe.cpp

src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wireframe.dir/wireframe.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures/wireframe.cpp > CMakeFiles/wireframe.dir/wireframe.cpp.i

src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wireframe.dir/wireframe.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures/wireframe.cpp -o CMakeFiles/wireframe.dir/wireframe.cpp.s

src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.requires:
.PHONY : src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.requires

src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.provides: src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.requires
	$(MAKE) -f src/textures/CMakeFiles/wireframe.dir/build.make src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.provides.build
.PHONY : src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.provides

src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.provides.build: src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o

# Object files for target wireframe
wireframe_OBJECTS = \
"CMakeFiles/wireframe.dir/wireframe.cpp.o"

# External object files for target wireframe
wireframe_EXTERNAL_OBJECTS =

binaries/plugins/wireframe.so: src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o
binaries/plugins/wireframe.so: src/textures/CMakeFiles/wireframe.dir/build.make
binaries/plugins/wireframe.so: binaries/libmitsuba-core.so
binaries/plugins/wireframe.so: binaries/libmitsuba-render.so
binaries/plugins/wireframe.so: binaries/libmitsuba-core.so
binaries/plugins/wireframe.so: /usr/lib/lib/libz.so
binaries/plugins/wireframe.so: /usr/lib/libpng.so
binaries/plugins/wireframe.so: /usr/lib/lib/libz.so
binaries/plugins/wireframe.so: /usr/lib/libpng.so
binaries/plugins/wireframe.so: /usr/lib/libjpeg.so
binaries/plugins/wireframe.so: /usr/lib/libHalf.so
binaries/plugins/wireframe.so: /usr/lib/libIex.so
binaries/plugins/wireframe.so: /usr/lib/libImath.so
binaries/plugins/wireframe.so: /usr/lib/libIlmThread.so
binaries/plugins/wireframe.so: /usr/lib/libIlmImf.so
binaries/plugins/wireframe.so: /usr/lib/libboost_filesystem.so
binaries/plugins/wireframe.so: /usr/lib/libboost_system.so
binaries/plugins/wireframe.so: /usr/lib/libboost_thread.so
binaries/plugins/wireframe.so: /usr/lib/libIlmImf.so
binaries/plugins/wireframe.so: /usr/lib/libboost_filesystem.so
binaries/plugins/wireframe.so: /usr/lib/libboost_system.so
binaries/plugins/wireframe.so: /usr/lib/libboost_thread.so
binaries/plugins/wireframe.so: /usr/lib/libxerces-c.so
binaries/plugins/wireframe.so: src/textures/CMakeFiles/wireframe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/wireframe.so"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wireframe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/textures/CMakeFiles/wireframe.dir/build: binaries/plugins/wireframe.so
.PHONY : src/textures/CMakeFiles/wireframe.dir/build

src/textures/CMakeFiles/wireframe.dir/requires: src/textures/CMakeFiles/wireframe.dir/wireframe.cpp.o.requires
.PHONY : src/textures/CMakeFiles/wireframe.dir/requires

src/textures/CMakeFiles/wireframe.dir/clean:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures && $(CMAKE_COMMAND) -P CMakeFiles/wireframe.dir/cmake_clean.cmake
.PHONY : src/textures/CMakeFiles/wireframe.dir/clean

src/textures/CMakeFiles/wireframe.dir/depend:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/textures /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/textures/CMakeFiles/wireframe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/textures/CMakeFiles/wireframe.dir/depend
