# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/stinky/Documents/polimi-ros-project1/catkin_sw/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/stinky/Documents/polimi-ros-project1/catkin_sw/build

# Include any dependencies generated for this target.
include first_project/CMakeFiles/odometry_node.dir/depend.make

# Include the progress variables for this target.
include first_project/CMakeFiles/odometry_node.dir/progress.make

# Include the compile flags for this target's objects.
include first_project/CMakeFiles/odometry_node.dir/flags.make

first_project/CMakeFiles/odometry_node.dir/src/main.cpp.o: first_project/CMakeFiles/odometry_node.dir/flags.make
first_project/CMakeFiles/odometry_node.dir/src/main.cpp.o: /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/stinky/Documents/polimi-ros-project1/catkin_sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object first_project/CMakeFiles/odometry_node.dir/src/main.cpp.o"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/odometry_node.dir/src/main.cpp.o -c /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/main.cpp

first_project/CMakeFiles/odometry_node.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/odometry_node.dir/src/main.cpp.i"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/main.cpp > CMakeFiles/odometry_node.dir/src/main.cpp.i

first_project/CMakeFiles/odometry_node.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/odometry_node.dir/src/main.cpp.s"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/main.cpp -o CMakeFiles/odometry_node.dir/src/main.cpp.s

first_project/CMakeFiles/odometry_node.dir/src/odometry_node.cpp.o: first_project/CMakeFiles/odometry_node.dir/flags.make
first_project/CMakeFiles/odometry_node.dir/src/odometry_node.cpp.o: /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/odometry_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/stinky/Documents/polimi-ros-project1/catkin_sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object first_project/CMakeFiles/odometry_node.dir/src/odometry_node.cpp.o"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/odometry_node.dir/src/odometry_node.cpp.o -c /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/odometry_node.cpp

first_project/CMakeFiles/odometry_node.dir/src/odometry_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/odometry_node.dir/src/odometry_node.cpp.i"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/odometry_node.cpp > CMakeFiles/odometry_node.dir/src/odometry_node.cpp.i

first_project/CMakeFiles/odometry_node.dir/src/odometry_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/odometry_node.dir/src/odometry_node.cpp.s"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/src/odometry_node.cpp -o CMakeFiles/odometry_node.dir/src/odometry_node.cpp.s

# Object files for target odometry_node
odometry_node_OBJECTS = \
"CMakeFiles/odometry_node.dir/src/main.cpp.o" \
"CMakeFiles/odometry_node.dir/src/odometry_node.cpp.o"

# External object files for target odometry_node
odometry_node_EXTERNAL_OBJECTS =

/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: first_project/CMakeFiles/odometry_node.dir/src/main.cpp.o
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: first_project/CMakeFiles/odometry_node.dir/src/odometry_node.cpp.o
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: first_project/CMakeFiles/odometry_node.dir/build.make
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librosbag.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librosbag_storage.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libclass_loader.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libdl.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libroslib.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librospack.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libroslz4.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/liblz4.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libtopic_tools.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libtf.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libtf2_ros.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libactionlib.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libmessage_filters.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libroscpp.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libtf2.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librosconsole.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/librostime.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /opt/ros/noetic/lib/libcpp_common.so
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node: first_project/CMakeFiles/odometry_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/stinky/Documents/polimi-ros-project1/catkin_sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable /home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node"
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/odometry_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
first_project/CMakeFiles/odometry_node.dir/build: /home/stinky/Documents/polimi-ros-project1/catkin_sw/devel/lib/first_project/odometry_node

.PHONY : first_project/CMakeFiles/odometry_node.dir/build

first_project/CMakeFiles/odometry_node.dir/clean:
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project && $(CMAKE_COMMAND) -P CMakeFiles/odometry_node.dir/cmake_clean.cmake
.PHONY : first_project/CMakeFiles/odometry_node.dir/clean

first_project/CMakeFiles/odometry_node.dir/depend:
	cd /home/stinky/Documents/polimi-ros-project1/catkin_sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/stinky/Documents/polimi-ros-project1/catkin_sw/src /home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project /home/stinky/Documents/polimi-ros-project1/catkin_sw/build /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project /home/stinky/Documents/polimi-ros-project1/catkin_sw/build/first_project/CMakeFiles/odometry_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : first_project/CMakeFiles/odometry_node.dir/depend

