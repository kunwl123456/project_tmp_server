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
include bin/net/CMakeFiles/net.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bin/net/CMakeFiles/net.dir/compiler_depend.make

# Include the progress variables for this target.
include bin/net/CMakeFiles/net.dir/progress.make

# Include the compile flags for this target's objects.
include bin/net/CMakeFiles/net.dir/flags.make

bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.o: ../src/net/ngx_c_socket.cxx
bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.o -MF CMakeFiles/net.dir/ngx_c_socket.cxx.o.d -o CMakeFiles/net.dir/ngx_c_socket.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_c_socket.cxx

bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_c_socket.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_c_socket.cxx > CMakeFiles/net.dir/ngx_c_socket.cxx.i

bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_c_socket.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_c_socket.cxx -o CMakeFiles/net.dir/ngx_c_socket.cxx.s

bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o: ../src/net/ngx_c_socket_accept.cxx
bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o -MF CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o.d -o CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_accept.cxx

bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_c_socket_accept.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_accept.cxx > CMakeFiles/net.dir/ngx_c_socket_accept.cxx.i

bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_c_socket_accept.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_accept.cxx -o CMakeFiles/net.dir/ngx_c_socket_accept.cxx.s

bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o: ../src/net/ngx_c_socket_conn.cxx
bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o -MF CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o.d -o CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_conn.cxx

bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_c_socket_conn.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_conn.cxx > CMakeFiles/net.dir/ngx_c_socket_conn.cxx.i

bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_c_socket_conn.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_conn.cxx -o CMakeFiles/net.dir/ngx_c_socket_conn.cxx.s

bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o: ../src/net/ngx_c_socket_inet.cxx
bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o -MF CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o.d -o CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_inet.cxx

bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_c_socket_inet.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_inet.cxx > CMakeFiles/net.dir/ngx_c_socket_inet.cxx.i

bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_c_socket_inet.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_inet.cxx -o CMakeFiles/net.dir/ngx_c_socket_inet.cxx.s

bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.o: ../src/net/ngx_c_socket_request.cxx
bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.o -MF CMakeFiles/net.dir/ngx_c_socket_request.cxx.o.d -o CMakeFiles/net.dir/ngx_c_socket_request.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_request.cxx

bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_c_socket_request.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_request.cxx > CMakeFiles/net.dir/ngx_c_socket_request.cxx.i

bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_c_socket_request.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_request.cxx -o CMakeFiles/net.dir/ngx_c_socket_request.cxx.s

bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.o: ../src/net/ngx_c_socket_time.cxx
bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.o -MF CMakeFiles/net.dir/ngx_c_socket_time.cxx.o.d -o CMakeFiles/net.dir/ngx_c_socket_time.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_time.cxx

bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_c_socket_time.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_time.cxx > CMakeFiles/net.dir/ngx_c_socket_time.cxx.i

bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_c_socket_time.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_c_socket_time.cxx -o CMakeFiles/net.dir/ngx_c_socket_time.cxx.s

bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.o: bin/net/CMakeFiles/net.dir/flags.make
bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.o: ../src/net/ngx_setproctitle.cxx
bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.o: bin/net/CMakeFiles/net.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.o"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.o -MF CMakeFiles/net.dir/ngx_setproctitle.cxx.o.d -o CMakeFiles/net.dir/ngx_setproctitle.cxx.o -c /home/lighthouse/tmp_project/server/src/net/ngx_setproctitle.cxx

bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/net.dir/ngx_setproctitle.cxx.i"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/tmp_project/server/src/net/ngx_setproctitle.cxx > CMakeFiles/net.dir/ngx_setproctitle.cxx.i

bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/net.dir/ngx_setproctitle.cxx.s"
	cd /home/lighthouse/tmp_project/server/build/bin/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/tmp_project/server/src/net/ngx_setproctitle.cxx -o CMakeFiles/net.dir/ngx_setproctitle.cxx.s

# Object files for target net
net_OBJECTS = \
"CMakeFiles/net.dir/ngx_c_socket.cxx.o" \
"CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o" \
"CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o" \
"CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o" \
"CMakeFiles/net.dir/ngx_c_socket_request.cxx.o" \
"CMakeFiles/net.dir/ngx_c_socket_time.cxx.o" \
"CMakeFiles/net.dir/ngx_setproctitle.cxx.o"

# External object files for target net
net_EXTERNAL_OBJECTS =

../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_c_socket.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_c_socket_accept.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_c_socket_conn.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_c_socket_inet.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_c_socket_request.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_c_socket_time.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/ngx_setproctitle.cxx.o
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/build.make
../release/linux/Debug/libnet.a: bin/net/CMakeFiles/net.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/tmp_project/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library ../../../release/linux/Debug/libnet.a"
	cd /home/lighthouse/tmp_project/server/build/bin/net && $(CMAKE_COMMAND) -P CMakeFiles/net.dir/cmake_clean_target.cmake
	cd /home/lighthouse/tmp_project/server/build/bin/net && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/net.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/net/CMakeFiles/net.dir/build: ../release/linux/Debug/libnet.a
.PHONY : bin/net/CMakeFiles/net.dir/build

bin/net/CMakeFiles/net.dir/clean:
	cd /home/lighthouse/tmp_project/server/build/bin/net && $(CMAKE_COMMAND) -P CMakeFiles/net.dir/cmake_clean.cmake
.PHONY : bin/net/CMakeFiles/net.dir/clean

bin/net/CMakeFiles/net.dir/depend:
	cd /home/lighthouse/tmp_project/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/tmp_project/server /home/lighthouse/tmp_project/server/src/net /home/lighthouse/tmp_project/server/build /home/lighthouse/tmp_project/server/build/bin/net /home/lighthouse/tmp_project/server/build/bin/net/CMakeFiles/net.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/net/CMakeFiles/net.dir/depend

