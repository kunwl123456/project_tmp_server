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
include bin/logic/CMakeFiles/logic.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/logic/CMakeFiles/logic.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/logic/CMakeFiles/logic.dir/progress.make

# Include the compile flags for this target's objects.
include bin/logic/CMakeFiles/logic.dir/flags.make

bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.o: bin/logic/CMakeFiles/logic.dir/flags.make
bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.o: ../src/logic/ngx_c_slogic.cxx
bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.o: bin/logic/CMakeFiles/logic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/logic && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.o -MF CMakeFiles/logic.dir/ngx_c_slogic.cxx.o.d -o CMakeFiles/logic.dir/ngx_c_slogic.cxx.o -c /home/lighthouse/tmp_project/server/src/logic/ngx_c_slogic.cxx

bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/logic.dir/ngx_c_slogic.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/logic && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/logic/ngx_c_slogic.cxx > CMakeFiles/logic.dir/ngx_c_slogic.cxx.i

bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/logic.dir/ngx_c_slogic.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/logic && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/logic/ngx_c_slogic.cxx -o CMakeFiles/logic.dir/ngx_c_slogic.cxx.s

# Object files for target logic
logic_OBJECTS = \
"CMakeFiles/logic.dir/ngx_c_slogic.cxx.o"

# External object files for target logic
logic_EXTERNAL_OBJECTS =

../release/linux/Debug/liblogic.a: bin/logic/CMakeFiles/logic.dir/ngx_c_slogic.cxx.o
../release/linux/Debug/liblogic.a: bin/logic/CMakeFiles/logic.dir/build.make
../release/linux/Debug/liblogic.a: bin/logic/CMakeFiles/logic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../release/linux/Debug/liblogic.a"
	cd /home/lighthouse/tmp_project/server/build/bin/logic && $(CMAKE_COMMAND) -P CMakeFiles/logic.dir/cmake_clean_target.cmake
	cd /home/lighthouse/tmp_project/server/build/bin/logic && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/logic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/logic/CMakeFiles/logic.dir/build: ../release/linux/Debug/liblogic.a
.PHONY : bin/logic/CMakeFiles/logic.dir/build

bin/logic/CMakeFiles/logic.dir/clean:
	cd /home/lighthouse/tmp_project/server/build/bin/logic && $(CMAKE_COMMAND) -P CMakeFiles/logic.dir/cmake_clean.cmake
.PHONY : bin/logic/CMakeFiles/logic.dir/clean

bin/logic/CMakeFiles/logic.dir/depend:
	cd /home/lighthouse/tmp_project/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/tmp_project/server /home/lighthouse/tmp_project/server/src/logic /home/lighthouse/tmp_project/server/build /home/lighthouse/tmp_project/server/build/bin/logic /home/lighthouse/tmp_project/server/build/bin/logic/CMakeFiles/logic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/logic/CMakeFiles/logic.dir/depend

