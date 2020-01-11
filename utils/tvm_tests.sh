#! /bin/bash

cd /work/mxnet/tests/python/unittest/
LD_LIBRARY_PATH=../../../build/:../../../lib/:../../../build/3rdparty/tvm/:/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/lib
MXNET_LIBRARY_PATH=/work/mxnet/build/libmxnet.so
PYTHONPATH=../../../python/:$PYTHONPATH
python3 -m nose -m test_tvm
