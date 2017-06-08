# MPark.Variant
#
# Copyright Michael Park, 2015-2017
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.md or copy at http://boost.org/LICENSE_1_0.txt)

function(mpark_add_dataset dataset path_to_template range)
  metabench_add_dataset(${dataset} ${path_to_template} ${range})
  target_link_libraries(${dataset} mpark_variant)
endfunction()
