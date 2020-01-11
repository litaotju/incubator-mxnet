#! /bin/bash

# build the mxnext with TensorRT inside the dev docker
DOCKER_IMAGE=mxnet-dev-trt/trt-515-cu-100

nvidia-docker \
	run \
	--cap-add SYS_PTRACE  \
     --shm-size=500m \
	-v `pwd`:/work/mxnet \
	-v `pwd`/build:/work/build \
	-v  $HOME/.ccache:/work/ccache \
    -p 10022:22 \
	-u `id -u`:`id -g`\
	-e CCACHE_MAXSIZE=5G \
	-e CCACHE_TEMPDIR=/tmp/ccache \
	-e CCACHE_DIR=/work/ccache \
	-e CCACHE_LOGFILE=/tmp/ccache.log \
	-d $DOCKER_IMAGE /work/mxnet/sleep.sh
