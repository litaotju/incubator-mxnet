#! /bin/bash

# build the mxnext with TensorRT inside the dev docker
DOCKER_IMAGE=mxnet-dev-trt/trt-515-cu-100

nvidia-docker \
	run \
	--cap-add SYS_PTRACE  \
    --rm --shm-size=1024m \
	-v `pwd`:/work/mxnet \
	-v `pwd`/build:/work/build \
	-v  $HOME/.ccache:/work/ccache \
	-u `id -u`:`id -g`\
	-e CCACHE_MAXSIZE=10G \
	-e CCACHE_TEMPDIR=/tmp/ccache \
	-e CCACHE_DIR=/work/ccache \
	-e CCACHE_LOGFILE=/tmp/ccache.log \
	-ti $DOCKER_IMAGE \
    /work/mxnet/ci/docker/runtime_functions.litao.sh \
	build_ubuntu_gpu_tensorrt_debug
    #build_ubuntu_gpu_tensorrt
