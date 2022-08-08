cmake_minimum_required(VERSION 3.23)

project(cpp)
set(CMAKE_CXX_STANDARD 20)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(cpp main.cpp)
target_link_libraries(testConan ${CONAN_LIBS})
