# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lighthouse/tmp_project/server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lighthouse/tmp_project/server/build

# Include any dependencies generated for this target.
include bin/game_server/CMakeFiles/game_server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/game_server/CMakeFiles/game_server.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/game_server/CMakeFiles/game_server.dir/progress.make

# Include the compile flags for this target's objects.
include bin/game_server/CMakeFiles/game_server.dir/flags.make

bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.o: bin/game_server/CMakeFiles/game_server.dir/flags.make
bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.o: ../src/game_server/main/nginx.cxx
bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.o: bin/game_server/CMakeFiles/game_server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/game_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.o -MF CMakeFiles/game_server.dir/main/nginx.cxx.o.d -o CMakeFiles/game_server.dir/main/nginx.cxx.o -c /home/lighthouse/tmp_project/server/src/game_server/main/nginx.cxx

bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/game_server.dir/main/nginx.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/game_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/game_server/main/nginx.cxx > CMakeFiles/game_server.dir/main/nginx.cxx.i

bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/game_server.dir/main/nginx.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/game_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/game_server/main/nginx.cxx -o CMakeFiles/game_server.dir/main/nginx.cxx.s

# Object files for target game_server
game_server_OBJECTS = \
"CMakeFiles/game_server.dir/main/nginx.cxx.o"

# External object files for target game_server
game_server_EXTERNAL_OBJECTS =

../release/linux/Debug/game_server: bin/game_server/CMakeFiles/game_server.dir/main/nginx.cxx.o
../release/linux/Debug/game_server: bin/game_server/CMakeFiles/game_server.dir/build.make
../release/linux/Debug/game_server: ../release/linux/Debug/libconfig.a
../release/linux/Debug/game_server: ../release/linux/Debug/libjson.a
../release/linux/Debug/game_server: ../release/linux/Debug/liblog.a
../release/linux/Debug/game_server: ../release/linux/Debug/liblogic.a
../release/linux/Debug/game_server: ../release/linux/Debug/libmisc.a
../release/linux/Debug/game_server: ../release/linux/Debug/libnet.a
../release/linux/Debug/game_server: ../release/linux/Debug/libproc.a
../release/linux/Debug/game_server: ../release/linux/Debug/libsignal.a
../release/linux/Debug/game_server: ../release/linux/Debug/libserver_config.a
../release/linux/Debug/game_server: bin/game_server/CMakeFiles/game_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../release/linux/Debug/game_server"
	cd /home/lighthouse/tmp_project/server/build/bin/game_server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/game_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/game_server/CMakeFiles/game_server.dir/build: ../release/linux/Debug/game_server
.PHONY : bin/game_server/CMakeFiles/game_server.dir/build

bin/game_server/CMakeFiles/game_server.dir/clean:
	cd /home/lighthouse/tmp_project/server/build/bin/game_server && $(CMAKE_COMMAND) -P CMakeFiles/game_server.dir/cmake_clean.cmake
.PHONY : bin/game_server/CMakeFiles/game_server.dir/clean

bin/game_server/CMakeFiles/game_server.dir/depend:
	cd /home/lighthouse/tmp_project/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/tmp_project/server /home/lighthouse/tmp_project/server/src/game_server /home/lighthouse/tmp_project/server/build /home/lighthouse/tmp_project/server/build/bin/game_server /home/lighthouse/tmp_project/server/build/bin/game_server/CMakeFiles/game_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/game_server/CMakeFiles/game_server.dir/depend

