# Find all dependencies
find_package(PkgConfig REQUIRED)
find_package(Eigen3 REQUIRED)
if (NOT TARGET Eigen3::Eigen)
	add_library(Eigen3::Eigen INTERFACE IMPORTED)
	set_property(TARGET Eigen3::Eigen APPEND PROPERTY
		INTERFACE_INCLUDE_DIRECTORIES ${EIGEN3_INCLUDE_DIR})
endif ()

find_package(base-logging)
find_package(Boost REQUIRED COMPONENTS thread graph unit_test_framework serialization)

if (NOT base-logging_FOUND)
  pkg_check_modules(base-logging REQUIRED IMPORTED_TARGET base-logging)
  add_library(jsoncpp_lib ALIAS PkgConfig::base-logging)
endif()

#TODO SISL
