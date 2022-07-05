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
include bin/log/CMakeFiles/log.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/log/CMakeFiles/log.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/log/CMakeFiles/log.dir/progress.make

# Include the compile flags for this target's objects.
include bin/log/CMakeFiles/log.dir/flags.make

bin/log/CMakeFiles/log.dir/ngx_log.cxx.o: bin/log/CMakeFiles/log.dir/flags.make
bin/log/CMakeFiles/log.dir/ngx_log.cxx.o: ../src/log/ngx_log.cxx
bin/log/CMakeFiles/log.dir/ngx_log.cxx.o: bin/log/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/log/CMakeFiles/log.dir/ngx_log.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/log && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/log/CMakeFiles/log.dir/ngx_log.cxx.o -MF CMakeFiles/log.dir/ngx_log.cxx.o.d -o CMakeFiles/log.dir/ngx_log.cxx.o -c /home/lighthouse/tmp_project/server/src/log/ngx_log.cxx

bin/log/CMakeFiles/log.dir/ngx_log.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/ngx_log.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/log && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/log/ngx_log.cxx > CMakeFiles/log.dir/ngx_log.cxx.i

bin/log/CMakeFiles/log.dir/ngx_log.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/ngx_log.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/log && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/log/ngx_log.cxx -o CMakeFiles/log.dir/ngx_log.cxx.s

bin/log/CMakeFiles/log.dir/ngx_printf.cxx.o: bin/log/CMakeFiles/log.dir/flags.make
bin/log/CMakeFiles/log.dir/ngx_printf.cxx.o: ../src/log/ngx_printf.cxx
bin/log/CMakeFiles/log.dir/ngx_printf.cxx.o: bin/log/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object bin/log/CMakeFiles/log.dir/ngx_printf.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/log && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/log/CMakeFiles/log.dir/ngx_printf.cxx.o -MF CMakeFiles/log.dir/ngx_printf.cxx.o.d -o CMakeFiles/log.dir/ngx_printf.cxx.o -c /home/lighthouse/tmp_project/server/src/log/ngx_printf.cxx

bin/log/CMakeFiles/log.dir/ngx_printf.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/ngx_printf.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/log && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/log/ngx_printf.cxx > CMakeFiles/log.dir/ngx_printf.cxx.i

bin/log/CMakeFiles/log.dir/ngx_printf.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/ngx_printf.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/log && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/log/ngx_printf.cxx -o CMakeFiles/log.dir/ngx_printf.cxx.s

# Object files for target log
log_OBJECTS = \
"CMakeFiles/log.dir/ngx_log.cxx.o" \
"CMakeFiles/log.dir/ngx_printf.cxx.o"

# External object files for target log
log_EXTERNAL_OBJECTS =

../release/linux/Debug/liblog.a: bin/log/CMakeFiles/log.dir/ngx_log.cxx.o
../release/linux/Debug/liblog.a: bin/log/CMakeFiles/log.dir/ngx_printf.cxx.o
../release/linux/Debug/liblog.a: bin/log/CMakeFiles/log.dir/build.make
../release/linux/Debug/liblog.a: bin/log/CMakeFiles/log.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../../release/linux/Debug/liblog.a"
	cd /home/lighthouse/tmp_project/server/build/bin/log && $(CMAKE_COMMAND) -P CMakeFiles/log.dir/cmake_clean_target.cmake
	cd /home/lighthouse/tmp_project/server/build/bin/log && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/log.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/log/CMakeFiles/log.dir/build: ../release/linux/Debug/liblog.a
.PHONY : bin/log/CMakeFiles/log.dir/build

bin/log/CMakeFiles/log.dir/clean:
	cd /home/lighthouse/tmp_project/server/build/bin/log && $(CMAKE_COMMAND) -P CMakeFiles/log.dir/cmake_clean.cmake
.PHONY : bin/log/CMakeFiles/log.dir/clean

bin/log/CMakeFiles/log.dir/depend:
	cd /home/lighthouse/tmp_project/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/tmp_project/server /home/lighthouse/tmp_project/server/src/log /home/lighthouse/tmp_project/server/build /home/lighthouse/tmp_project/server/build/bin/log /home/lighthouse/tmp_project/server/build/bin/log/CMakeFiles/log.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/log/CMakeFiles/log.dir/depend

