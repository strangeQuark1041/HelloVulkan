cmake_minimum_required(VERSION 3.16) # At least CMake-3.16 is required
project(VulkanHelloWorld CXX) # Create Project

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Get deps using Conan
execute_process(
    COMMAND conan install . -b missing -if build
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_QUIET
)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake) # include Conan
conan_basic_setup() # setup Conan

add_executable(main src/main.cpp) # create an example executable

target_link_libraries(main ${CONAN_LIBS})
target_link_libraries(main /usr/lib/libvulkan.so)

# GCC requires libTBB for std::execution
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    find_package(TBB REQUIRED)
    target_link_libraries(main TBB::tbb)
endif()

# set compilation warnings and flags
include(compiler_warnings)
set_project_warnings()
message(STATUS "Compiler options: ${WARNINGS}")
add_compile_options(${WARNINGS})

# enable running the example with ctest
include(CTest)
enable_testing()
add_test(NAME main COMMAND main)
