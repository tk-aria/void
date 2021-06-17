## CMakeLists.txt
## author: tk-aria

file(GLOB SOURCES
  ${PROJECT_SOURCE_DIR}/src/*.cpp
)

add_library(void ${SOURCES})
#target_link_libraries(void)
clang_format(void)
