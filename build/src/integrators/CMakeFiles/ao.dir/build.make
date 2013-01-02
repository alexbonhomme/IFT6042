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
include src/integrators/CMakeFiles/ao.dir/depend.make

# Include the progress variables for this target.
include src/integrators/CMakeFiles/ao.dir/progress.make

# Include the compile flags for this target's objects.
include src/integrators/CMakeFiles/ao.dir/flags.make

src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o: src/integrators/CMakeFiles/ao.dir/flags.make
src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o: ../src/integrators/direct/ao.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ao.dir/direct/ao.cpp.o -c /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/direct/ao.cpp

src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ao.dir/direct/ao.cpp.i"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/direct/ao.cpp > CMakeFiles/ao.dir/direct/ao.cpp.i

src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ao.dir/direct/ao.cpp.s"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators/direct/ao.cpp -o CMakeFiles/ao.dir/direct/ao.cpp.s

src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.requires:
.PHONY : src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.requires

src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.provides: src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.requires
	$(MAKE) -f src/integrators/CMakeFiles/ao.dir/build.make src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.provides.build
.PHONY : src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.provides

src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.provides.build: src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o

# Object files for target ao
ao_OBJECTS = \
"CMakeFiles/ao.dir/direct/ao.cpp.o"

# External object files for target ao
ao_EXTERNAL_OBJECTS =

binaries/plugins/ao.so: src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o
binaries/plugins/ao.so: src/integrators/CMakeFiles/ao.dir/build.make
binaries/plugins/ao.so: binaries/libmitsuba-core.so
binaries/plugins/ao.so: binaries/libmitsuba-render.so
binaries/plugins/ao.so: binaries/libmitsuba-core.so
binaries/plugins/ao.so: /usr/lib/lib/libz.so
binaries/plugins/ao.so: /usr/lib/libpng.so
binaries/plugins/ao.so: /usr/lib/lib/libz.so
binaries/plugins/ao.so: /usr/lib/libpng.so
binaries/plugins/ao.so: /usr/lib/libjpeg.so
binaries/plugins/ao.so: /usr/lib/libHalf.so
binaries/plugins/ao.so: /usr/lib/libIex.so
binaries/plugins/ao.so: /usr/lib/libImath.so
binaries/plugins/ao.so: /usr/lib/libIlmThread.so
binaries/plugins/ao.so: /usr/lib/libIlmImf.so
binaries/plugins/ao.so: /usr/lib/libboost_filesystem.so
binaries/plugins/ao.so: /usr/lib/libboost_system.so
binaries/plugins/ao.so: /usr/lib/libboost_thread.so
binaries/plugins/ao.so: /usr/lib/libIlmImf.so
binaries/plugins/ao.so: /usr/lib/libboost_filesystem.so
binaries/plugins/ao.so: /usr/lib/libboost_system.so
binaries/plugins/ao.so: /usr/lib/libboost_thread.so
binaries/plugins/ao.so: /usr/lib/libxerces-c.so
binaries/plugins/ao.so: src/integrators/CMakeFiles/ao.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ../../binaries/plugins/ao.so"
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ao.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/integrators/CMakeFiles/ao.dir/build: binaries/plugins/ao.so
.PHONY : src/integrators/CMakeFiles/ao.dir/build

src/integrators/CMakeFiles/ao.dir/requires: src/integrators/CMakeFiles/ao.dir/direct/ao.cpp.o.requires
.PHONY : src/integrators/CMakeFiles/ao.dir/requires

src/integrators/CMakeFiles/ao.dir/clean:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators && $(CMAKE_COMMAND) -P CMakeFiles/ao.dir/cmake_clean.cmake
.PHONY : src/integrators/CMakeFiles/ao.dir/clean

src/integrators/CMakeFiles/ao.dir/depend:
	cd /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/src/integrators /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators /home/alex/Documents/Cours/M1/Synthese/Projet/mitsuba/build/src/integrators/CMakeFiles/ao.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/integrators/CMakeFiles/ao.dir/depend

