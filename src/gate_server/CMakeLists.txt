#cmake_minimum_required (VERSION 2.21)
#PROJECT(angle)
# 设置release版本还是debug版本
if(${CMAKE_BUILD_TYPE} MATCHES "Release")
    message(STATUS "Release版本")
    set(BuildType "Release")
    MESSAGE(STATUS "CXXFLAGS: " ${CMAKE_CXX_FLAGS})
    MESSAGE(STATUS "CFLAGS: " ${CMAKE_C_FLAGS})
else()
    set(BuildType "Debug")
    message(STATUS "Debug版本")
    MESSAGE(STATUS "CXXFLAGS: " ${CMAKE_CXX_FLAGS})
    MESSAGE(STATUS "CFLAGS: " ${CMAKE_C_FLAGS})
#SET(CMAKE_C_FILAGS "-O0 -g")
endif()

#设置lib库目录
set(RELEASE_DIR ${PROJECT_SOURCE_DIR}/release)
# debug和release版本目录不一样
#设置生成的so动态库最后输出的路径
SET(LIBRARY_OUTPUT_PATH ${RELEASE_DIR}/linux/${BuildType})
add_compile_options(-fPIC)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)


# 指定生成目标
add_executable(gate_server nginx.cxx)
# 添加链接库
target_link_libraries(gate_server  config json log logic misc net proc signal pthread server_config hiredis)
# 将执行文件安装到bin目录
INSTALL(TARGETS gate_server RUNTIME DESTINATION bin)