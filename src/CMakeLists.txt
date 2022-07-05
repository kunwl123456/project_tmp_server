# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.21)



# 设置release版本还是debug版本
if(${CMAKE_BUILD_TYPE} MATCHES "Release")
    message(STATUS "Release版本")
    set(BuildType "Release")
    SET(CMAKE_C_FLAGS "$ENV{CFLAGS} -DNODEBUG -O3 -Wall")
    SET(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -DNODEBUG -O3 -Wall")
    MESSAGE(STATUS "CXXFLAGS: " ${CMAKE_CXX_FLAGS})
    MESSAGE(STATUS "CFLAGS: " ${CMAKE_C_FLAGS})
else()
    # CMAKE_BUILD_TYPE 不带参数就是debug版本
    set(BuildType "Debug")
    message(STATUS "Debug版本")
    SET(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -Wall  -O0 -g")
 #   SET(CMAKE_C_FILAGS "-O0 -g")
    SET(CMAKE_C_FLAGS "$ENV{CFLAGS} -O0 -g")
    MESSAGE(STATUS "CXXFLAGS: " ${CMAKE_CXX_FLAGS})
    MESSAGE(STATUS "CFLAGS: " ${CMAKE_C_FILAGS})
endif()



#设置生成的so动态库最后输出的路径
#设置bin和lib库目录
SET(RELEASE_DIR ${PROJECT_SOURCE_DIR}/release)
#设置bin和lib库目录
# debug和release版本目录不一样
SET(LIBRARY_OUTPUT_PATH ${RELEASE_DIR}/linux/${BuildType})
SET(EXECUTABLE_OUTPUT_PATH ${RELEASE_DIR}/linux/${BuildType})
add_compile_options(-fPIC)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 添加头文件路径
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/_include")
# 添加 dir1 子目录
#add_subdirectory(_include)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/config")
add_subdirectory(config)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/db")
add_subdirectory(db)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/json")
add_subdirectory(json)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/log")
add_subdirectory(log)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/logic")
add_subdirectory(logic)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/misc")
add_subdirectory(misc)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/net")
add_subdirectory(net)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/proc")
add_subdirectory(proc)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/signal")
add_subdirectory(signal)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/server_config")
add_subdirectory(server_config)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/vm")
add_subdirectory(vm)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/base_lib")
add_subdirectory(base_lib)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/game_server")
add_subdirectory(game_server)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/gate_server")
add_subdirectory(gate_server)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/dbc_server")
add_subdirectory(dbc_server)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/db_manager")
add_subdirectory(db_manager)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/mail_server")
add_subdirectory(mail_server)

include_directories(
    ${BASE_DIR}/3rd
    ${BASE_DIR}/3rd/mysql/include/
    ${BASE_DIR}/3rd/hiredis/include/
)

link_directories(
    ${BASE_DIR}/3rd/mysql/lib
    ${BASE_DIR}/3rd/hiredis/lib
)

