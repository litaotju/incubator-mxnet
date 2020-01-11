#! /bin/bash

rm -rf build
mkdir -p build && cd build
cmake -G"Unix Makefiles" \
    -DUSE_CUDA=ON \
    -DUSE_MKL_IF_AVAILABLE=ON \
    -DUSE_TENSORRT=ON \
    -DCMAKE_CUDA_COMPILER_LAUNCHER=ccache \
    -DCMAKE_C_COMPILER_LAUNCHER=ccache \
    -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
    -DCMAKE_BUILD_TYPE=Release \
    ..

make -j4
 
