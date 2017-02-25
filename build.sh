#!/bin/bash

set -ex

CONTAINER_IMAGE=${CONTAINER_IMAGE:-ubonchi}
CONTAINER_NAME=${CONTAINER_NAME-$RANDOM-}

MD5_URL=http://cdimage.ubuntu.com/ubuntu-base/releases/16.04/release/MD5SUMS
ROOTFS_URL=http://cdimage.ubuntu.com/ubuntu-base/releases/16.04/release/ubuntu-base-16.04-core-armhf.tar.gz

QEMU_STATIC_URL=${QEMU_STATIC_URL:-http://kaplan2539.gitlab.io/baumeister/qemu-arm-static.tar.gz}

wget -c $MD5_URL
wget -c $ROOTFS_URL
wget -c $QEMU_STATIC_URL

docker build -t "${CONTAINER_IMAGE}" . 
CONTAINER_NAME=$(docker create "${CONTAINER_IMAGE}" /bin/bash)
docker export ${CONTAINER_NAME} |gzip >ubonchi_rootfs.tar.gz
docker rm ${CONTAINER_NAME}
