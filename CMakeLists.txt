
# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.21)

# 项目名字angle
PROJECT(angle)

# 向当前工程添加存在源文件的目录，指定中间二进制和目标二进制存放的位置
ADD_SUBDIRECTORY(src bin)
SET(RELEASE_DIR ${PROJECT_SOURCE_DIR}/release)
#INSTALL(FILES COPYRIGHT README DESTINATION share/doc/cmake/angle)
INSTALL(DIRECTORY doc/ DESTINATION /home/lighthouse/tmp_project/server/doc/cmake/angle)