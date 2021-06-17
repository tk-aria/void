## CMakeLists.txt
## author: tk-aria

# for debug.
set(CMAKE_VERBOSE_MAKEFILE 1)
cmake_minimum_required(VERSION 3.2)

project(CMake CXX)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/bin/cmake)
#set(CMAKE_CXX_CLANG_TIDY "clang-tidy;--fix;-p;./build;-header-filter=/workspaces/naudio/include")
include(ClangFormat)

add_definitions(-std=c++14)
#set(CMAKE_CXX_FLAGS "-02 -Wall")
#if (CMAKE_VERSION VERSION_LESS 3.4)
set(CMAKE_USE_RELATIVE_PATHS ON)
#endif()
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(INCLUDE_DIR
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_SOURCE_DIR}/external
)
include_directories(${INCLUDE_DIR})

add_subdirectory(external)
add_subdirectory(src)
if (NOT DEFINED WITHOUT_SANDBOX)
    add_subdirectory(sandbox)
endif()
