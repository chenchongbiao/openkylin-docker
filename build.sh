#!/bin/bash

set -e -u -x

CODENAME=$1
ARCH=$2
VERSION="v1.1.0"

OWNER=chenchongbiao
ROOTFS=openkylin-rootfs-${ARCH}.tar.gz
ROOTFS_URL=https://github.com/LinuxKernelBuilder/openkylin-rootfs/releases/download/${VERSION}/${ROOTFS}

curl -OLS $ROOTFS_URL

docker buildx build --platform linux/${ARCH} --build-arg ROOTFS=$ROOTFS -t ${OWNER}/openkylin:${CODENAME}-${ARCH} .