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
include bin/signal/CMakeFiles/signal.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/signal/CMakeFiles/signal.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/signal/CMakeFiles/signal.dir/progress.make

# Include the compile flags for this target's objects.
include bin/signal/CMakeFiles/signal.dir/flags.make

bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.o: bin/signal/CMakeFiles/signal.dir/flags.make
bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.o: ../src/signal/core_dumper.cpp
bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.o: bin/signal/CMakeFiles/signal.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.o"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.o -MF CMakeFiles/signal.dir/core_dumper.cpp.o.d -o CMakeFiles/signal.dir/core_dumper.cpp.o -c /home/lighthouse/tmp_project/server/src/signal/core_dumper.cpp

bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/signal.dir/core_dumper.cpp.i"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/signal/core_dumper.cpp > CMakeFiles/signal.dir/core_dumper.cpp.i

bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/signal.dir/core_dumper.cpp.s"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/signal/core_dumper.cpp -o CMakeFiles/signal.dir/core_dumper.cpp.s

bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.o: bin/signal/CMakeFiles/signal.dir/flags.make
bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.o: ../src/signal/ngx_signal.cxx
bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.o: bin/signal/CMakeFiles/signal.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.o -MF CMakeFiles/signal.dir/ngx_signal.cxx.o.d -o CMakeFiles/signal.dir/ngx_signal.cxx.o -c /home/lighthouse/tmp_project/server/src/signal/ngx_signal.cxx

bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/signal.dir/ngx_signal.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/signal/ngx_signal.cxx > CMakeFiles/signal.dir/ngx_signal.cxx.i

bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/signal.dir/ngx_signal.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/signal/ngx_signal.cxx -o CMakeFiles/signal.dir/ngx_signal.cxx.s

# Object files for target signal
signal_OBJECTS = \
"CMakeFiles/signal.dir/core_dumper.cpp.o" \
"CMakeFiles/signal.dir/ngx_signal.cxx.o"

# External object files for target signal
signal_EXTERNAL_OBJECTS =

../release/linux/Debug/libsignal.a: bin/signal/CMakeFiles/signal.dir/core_dumper.cpp.o
../release/linux/Debug/libsignal.a: bin/signal/CMakeFiles/signal.dir/ngx_signal.cxx.o
../release/linux/Debug/libsignal.a: bin/signal/CMakeFiles/signal.dir/build.make
../release/linux/Debug/libsignal.a: bin/signal/CMakeFiles/signal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../../release/linux/Debug/libsignal.a"
	cd /home/lighthouse/tmp_project/server/build/bin/signal && $(CMAKE_COMMAND) -P CMakeFiles/signal.dir/cmake_clean_target.cmake
	cd /home/lighthouse/tmp_project/server/build/bin/signal && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/signal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/signal/CMakeFiles/signal.dir/build: ../release/linux/Debug/libsignal.a
.PHONY : bin/signal/CMakeFiles/signal.dir/build

bin/signal/CMakeFiles/signal.dir/clean:
	cd /home/lighthouse/tmp_project/server/build/bin/signal && $(CMAKE_COMMAND) -P CMakeFiles/signal.dir/cmake_clean.cmake
.PHONY : bin/signal/CMakeFiles/signal.dir/clean

bin/signal/CMakeFiles/signal.dir/depend:
	cd /home/lighthouse/tmp_project/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/tmp_project/server /home/lighthouse/tmp_project/server/src/signal /home/lighthouse/tmp_project/server/build /home/lighthouse/tmp_project/server/build/bin/signal /home/lighthouse/tmp_project/server/build/bin/signal/CMakeFiles/signal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/signal/CMakeFiles/signal.dir/depend

