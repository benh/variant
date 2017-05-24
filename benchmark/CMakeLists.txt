# MPark.Variant
#
# Copyright Michael Park, 2015-2017
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 3.6.3)

include(dependencies/eggs.cmake)
include(dependencies/mpark.cmake)

# Option.
set(MPARK_VARIANT_INCLUDE_BENCHMARKS "" CACHE STRING
    "Semicolon-separated list of benchmarks to build. \
     Possible values are `compile-time`, and `runtime`.")

# Benchmark.
list(REMOVE_DUPLICATES MPARK_VARIANT_INCLUDE_BENCHMARKS)

list(FIND MPARK_VARIANT_INCLUDE_BENCHMARKS "compile-time" MPARK_VARIANT_INDEX)
if(NOT MPARK_VARIANT_INDEX EQUAL -1)
  set(MPARK_VARIANT_INCLUDE_COMPILE_TIME_BENCHMARKS ON)
  list(REMOVE_AT MPARK_VARIANT_INCLUDE_BENCHMARKS MPARK_VARIANT_INDEX)
endif()

list(FIND MPARK_VARIANT_INCLUDE_BENCHMARKS "runtime" MPARK_VARIANT_INDEX)
if(NOT MPARK_VARIANT_INDEX EQUAL -1)
  set(MPARK_VARIANT_INCLUDE_RUNTIME_BENCHMARKS ON)
  list(REMOVE_AT MPARK_VARIANT_INCLUDE_BENCHMARKS MPARK_VARIANT_INDEX)
endif()

list(LENGTH MPARK_VARIANT_INCLUDE_BENCHMARKS MPARK_VARIANT_LENGTH)
if(MPARK_VARIANT_LENGTH GREATER 0)
  message(FATAL_ERROR
    "The following values in `MPARK_VARIANT_INCLUDE_BENCHMARKS` are not one of "
    "the possible values, `compile-time`, and `runtime`: ${MPARK_VARIANT_INCLUDE_BENCHMARKS}")
endif()

if(${MPARK_VARIANT_INCLUDE_COMPILE_TIME_BENCHMARKS})
  add_subdirectory(compile-time)
endif()

# if(${MPARK_VARIANT_INCLUDE_RUNTIME_BENCHMARKS})
#   add_subdirectory(runtime)
# endif()
