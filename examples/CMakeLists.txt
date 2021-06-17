## CMakeLists.txt
## author: tk-aria

##
## demo
##

file(GLOB DEMO_SRC
    ${PROJECT_SOURCE_DIR}/examples/demo/*.cpp
)

add_executable(demo ${DEMO_SRC})
target_link_libraries(demo void)
clang_format(demo)
