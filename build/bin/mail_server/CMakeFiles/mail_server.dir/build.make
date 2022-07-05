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
include bin/mail_server/CMakeFiles/mail_server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/mail_server/CMakeFiles/mail_server.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/mail_server/CMakeFiles/mail_server.dir/progress.make

# Include the compile flags for this target's objects.
include bin/mail_server/CMakeFiles/mail_server.dir/flags.make

bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.o: bin/mail_server/CMakeFiles/mail_server.dir/flags.make
bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.o: ../src/mail_server/nginx.cxx
bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.o: bin/mail_server/CMakeFiles/mail_server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/mail_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.o -MF CMakeFiles/mail_server.dir/nginx.cxx.o.d -o CMakeFiles/mail_server.dir/nginx.cxx.o -c /home/lighthouse/tmp_project/server/src/mail_server/nginx.cxx

bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mail_server.dir/nginx.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/mail_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/mail_server/nginx.cxx > CMakeFiles/mail_server.dir/nginx.cxx.i

bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mail_server.dir/nginx.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/mail_server && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/mail_server/nginx.cxx -o CMakeFiles/mail_server.dir/nginx.cxx.s

# Object files for target mail_server
mail_server_OBJECTS = \
"CMakeFiles/mail_server.dir/nginx.cxx.o"

# External object files for target mail_server
mail_server_EXTERNAL_OBJECTS =

../release/linux/Debug/mail_server: bin/mail_server/CMakeFiles/mail_server.dir/nginx.cxx.o
../release/linux/Debug/mail_server: bin/mail_server/CMakeFiles/mail_server.dir/build.make
../release/linux/Debug/mail_server: ../release/linux/Debug/libconfig.a
../release/linux/Debug/mail_server: ../release/linux/Debug/libjson.a
../release/linux/Debug/mail_server: ../release/linux/Debug/liblog.a
../release/linux/Debug/mail_server: ../release/linux/Debug/liblogic.a
../release/linux/Debug/mail_server: ../release/linux/Debug/libmisc.a
../release/linux/Debug/mail_server: ../release/linux/Debug/libnet.a
../release/linux/Debug/mail_server: ../release/linux/Debug/libproc.a
../release/linux/Debug/mail_server: ../release/linux/Debug/libsignal.a
../release/linux/Debug/mail_server: ../release/linux/Debug/libserver_config.a
../release/linux/Debug/mail_server: bin/mail_server/CMakeFiles/mail_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../release/linux/Debug/mail_server"
	cd /home/lighthouse/tmp_project/server/build/bin/mail_server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mail_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/mail_server/CMakeFiles/mail_server.dir/build: ../release/linux/Debug/mail_server
.PHONY : bin/mail_server/CMakeFiles/mail_server.dir/build

bin/mail_server/CMakeFiles/mail_server.dir/clean:
	cd /home/lighthouse/tmp_project/server/build/bin/mail_server && $(CMAKE_COMMAND) -P CMakeFiles/mail_server.dir/cmake_clean.cmake
.PHONY : bin/mail_server/CMakeFiles/mail_server.dir/clean

bin/mail_server/CMakeFiles/mail_server.dir/depend:
	cd /home/lighthouse/tmp_project/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/tmp_project/server /home/lighthouse/tmp_project/server/src/mail_server /home/lighthouse/tmp_project/server/build /home/lighthouse/tmp_project/server/build/bin/mail_server /home/lighthouse/tmp_project/server/build/bin/mail_server/CMakeFiles/mail_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/mail_server/CMakeFiles/mail_server.dir/depend
