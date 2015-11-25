project(floorServer)
cmake_minimum_required(VERSION 2.8)
aux_source_directory(. SRC_LIST)
add_executable(${PROJECT_NAME} ${SRC_LIST})


#enable C++11 support:
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -Wextra -fcx-limited-range ${CMAKE_CXX_FLAGS}")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${floorServer_SOURCE_DIR}/cmake")
find_package(Boost 1.36 REQUIRED COMPONENTS thread date_time program_options regex filesystem system)
include_directories(${Boost_INCLUDE_DIRS})
list(APPEND LIBS ${Boost_LIBRARIES})

#let the system search the libs for us
foreach(lib ${OUR_LIBS} SDL2 Cppnetlib Crypto Ssl)
	find_package(${lib} REQUIRED)
	message(STATUS "${lib} includes: ${${lib}_INCLUDE_DIRS}")
	include_directories(${${lib}_INCLUDE_DIRS})
	list(APPEND LIBS ${${lib}_LIBRARIES})
	add_definitions(${${lib}_DEFINITIONS})
endforeach(lib)

#link against those libs
target_link_libraries(floorServer ${LIBS})
