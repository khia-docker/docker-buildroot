#!/bin/bash
export BR2_ROOTFS_OVERLAY="/app/rootfs ${BR2_ROOTFS_OVERLAY}"
export BR2_ROOTFS_POST_BUILD_SCRIPT="/app/bin/dockerize ${BR2_ROOTFS_POST_BUILD_SCRIPT}"
env
cd /buildroot && make allnoconfig
touch \
  /buildroot/output/build/buildroot-config/auto.conf \
  /buildroot/output/build/buildroot-config/autoconf.h \
  /buildroot/output/build/buildroot-config/tristate.config
sleep 3 # For whatever reason this script doesn't work inside docker without `sleep`
make "$@"
echo "DONE!!! The resulting image is in output/images/"
echo "Use following to create docker container"
echo "  docker import - myimage < output/images/rootfs.tar"
