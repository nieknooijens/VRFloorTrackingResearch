# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/niek/Projects/VRFloorTrackingResearch/FloorServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/niek/Projects/VRFloorTrackingResearch/FloorServer/build

# Include any dependencies generated for this target.
include CMakeFiles/floorServer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/floorServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/floorServer.dir/flags.make

CMakeFiles/floorServer.dir/main.cpp.o: CMakeFiles/floorServer.dir/flags.make
CMakeFiles/floorServer.dir/main.cpp.o: ../main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/niek/Projects/VRFloorTrackingResearch/FloorServer/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/floorServer.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/floorServer.dir/main.cpp.o -c /home/niek/Projects/VRFloorTrackingResearch/FloorServer/main.cpp

CMakeFiles/floorServer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/floorServer.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/niek/Projects/VRFloorTrackingResearch/FloorServer/main.cpp > CMakeFiles/floorServer.dir/main.cpp.i

CMakeFiles/floorServer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/floorServer.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/niek/Projects/VRFloorTrackingResearch/FloorServer/main.cpp -o CMakeFiles/floorServer.dir/main.cpp.s

CMakeFiles/floorServer.dir/main.cpp.o.requires:
.PHONY : CMakeFiles/floorServer.dir/main.cpp.o.requires

CMakeFiles/floorServer.dir/main.cpp.o.provides: CMakeFiles/floorServer.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/floorServer.dir/build.make CMakeFiles/floorServer.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/floorServer.dir/main.cpp.o.provides

CMakeFiles/floorServer.dir/main.cpp.o.provides.build: CMakeFiles/floorServer.dir/main.cpp.o

# Object files for target floorServer
floorServer_OBJECTS = \
"CMakeFiles/floorServer.dir/main.cpp.o"

# External object files for target floorServer
floorServer_EXTERNAL_OBJECTS =

floorServer: CMakeFiles/floorServer.dir/main.cpp.o
floorServer: CMakeFiles/floorServer.dir/build.make
floorServer: /usr/lib/x86_64-linux-gnu/libboost_thread.so
floorServer: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
floorServer: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
floorServer: /usr/lib/x86_64-linux-gnu/libboost_regex.so
floorServer: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
floorServer: /usr/lib/x86_64-linux-gnu/libboost_system.so
floorServer: /usr/lib/x86_64-linux-gnu/libpthread.so
floorServer: /usr/lib/x86_64-linux-gnu/libSDL2main.a
floorServer: /usr/lib/x86_64-linux-gnu/libSDL2.so
floorServer: /usr/lib/x86_64-linux-gnu/libcrypto.so
floorServer: /usr/lib/x86_64-linux-gnu/libssl.so
floorServer: /usr/lib/x86_64-linux-gnu/libcrypto.so
floorServer: /usr/lib/x86_64-linux-gnu/libssl.so
floorServer: CMakeFiles/floorServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable floorServer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/floorServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/floorServer.dir/build: floorServer
.PHONY : CMakeFiles/floorServer.dir/build

CMakeFiles/floorServer.dir/requires: CMakeFiles/floorServer.dir/main.cpp.o.requires
.PHONY : CMakeFiles/floorServer.dir/requires

CMakeFiles/floorServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/floorServer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/floorServer.dir/clean

CMakeFiles/floorServer.dir/depend:
	cd /home/niek/Projects/VRFloorTrackingResearch/FloorServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/niek/Projects/VRFloorTrackingResearch/FloorServer /home/niek/Projects/VRFloorTrackingResearch/FloorServer /home/niek/Projects/VRFloorTrackingResearch/FloorServer/build /home/niek/Projects/VRFloorTrackingResearch/FloorServer/build /home/niek/Projects/VRFloorTrackingResearch/FloorServer/build/CMakeFiles/floorServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/floorServer.dir/depend

