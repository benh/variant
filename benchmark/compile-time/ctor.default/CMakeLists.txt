# MPark.Variant
#
# Copyright Michael Park, 2015-2017
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

eggs_add_dataset(
  eggs.ctor.default
  eggs.cpp.erb
  "(1..10).step(3).to_a + (25..500).step(25).to_a")

mpark_add_dataset(
  mpark.ctor.default
  mpark.cpp.erb
  "(1..10).step(3).to_a + (25..500).step(25).to_a")

# Add a new chart
metabench_add_chart(
  benchmark.ctor.default
  ALL
  DATASETS eggs.ctor.default mpark.ctor.default
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/ctor.default.html
)
