# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "first_project: 1 messages, 1 services")

set(MSG_I_FLAGS "-Ifirst_project:/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Irosgraph_msgs:/opt/ros/noetic/share/rosgraph_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(first_project_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" NAME_WE)
add_custom_target(_first_project_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "first_project" "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" ""
)

get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" NAME_WE)
add_custom_target(_first_project_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "first_project" "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_project
)

### Generating Services
_generate_srv_cpp(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_project
)

### Generating Module File
_generate_module_cpp(first_project
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_project
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(first_project_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(first_project_generate_messages first_project_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" NAME_WE)
add_dependencies(first_project_generate_messages_cpp _first_project_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" NAME_WE)
add_dependencies(first_project_generate_messages_cpp _first_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_project_gencpp)
add_dependencies(first_project_gencpp first_project_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_project_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_project
)

### Generating Services
_generate_srv_eus(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_project
)

### Generating Module File
_generate_module_eus(first_project
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_project
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(first_project_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(first_project_generate_messages first_project_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" NAME_WE)
add_dependencies(first_project_generate_messages_eus _first_project_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" NAME_WE)
add_dependencies(first_project_generate_messages_eus _first_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_project_geneus)
add_dependencies(first_project_geneus first_project_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_project_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_project
)

### Generating Services
_generate_srv_lisp(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_project
)

### Generating Module File
_generate_module_lisp(first_project
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_project
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(first_project_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(first_project_generate_messages first_project_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" NAME_WE)
add_dependencies(first_project_generate_messages_lisp _first_project_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" NAME_WE)
add_dependencies(first_project_generate_messages_lisp _first_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_project_genlisp)
add_dependencies(first_project_genlisp first_project_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_project_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_project
)

### Generating Services
_generate_srv_nodejs(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_project
)

### Generating Module File
_generate_module_nodejs(first_project
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_project
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(first_project_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(first_project_generate_messages first_project_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" NAME_WE)
add_dependencies(first_project_generate_messages_nodejs _first_project_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" NAME_WE)
add_dependencies(first_project_generate_messages_nodejs _first_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_project_gennodejs)
add_dependencies(first_project_gennodejs first_project_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_project_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_project
)

### Generating Services
_generate_srv_py(first_project
  "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_project
)

### Generating Module File
_generate_module_py(first_project
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_project
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(first_project_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(first_project_generate_messages first_project_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/msg/Odom.msg" NAME_WE)
add_dependencies(first_project_generate_messages_py _first_project_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/stinky/Documents/polimi-ros-project1/catkin_sw/src/first_project/srv/Reset_odom.srv" NAME_WE)
add_dependencies(first_project_generate_messages_py _first_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_project_genpy)
add_dependencies(first_project_genpy first_project_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_project_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_project
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(first_project_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(first_project_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(first_project_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET rosgraph_msgs_generate_messages_cpp)
  add_dependencies(first_project_generate_messages_cpp rosgraph_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_project
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(first_project_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(first_project_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(first_project_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET rosgraph_msgs_generate_messages_eus)
  add_dependencies(first_project_generate_messages_eus rosgraph_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_project
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(first_project_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(first_project_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(first_project_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET rosgraph_msgs_generate_messages_lisp)
  add_dependencies(first_project_generate_messages_lisp rosgraph_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_project
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(first_project_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(first_project_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(first_project_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET rosgraph_msgs_generate_messages_nodejs)
  add_dependencies(first_project_generate_messages_nodejs rosgraph_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_project)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_project\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_project
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(first_project_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(first_project_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(first_project_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET rosgraph_msgs_generate_messages_py)
  add_dependencies(first_project_generate_messages_py rosgraph_msgs_generate_messages_py)
endif()
