#!/bin/bash
#cd buildroot && make KCONFIG_ALLCONFIG=overlay/include/mini.config miniconfig && make
export BR2_ROOTFS_OVERLAY="/app/rootfs ${BR2_ROOTFS_OVERLAY}"
export BR2_ROOTFS_POST_BUILD_SCRIPT="/app/bin/repack ${BR2_ROOTFS_POST_BUILD_SCRIPT}"
touch \
  /buildroot/output/build/buildroot-config/auto.conf \
  /buildroot/output/build/buildroot-config/autoconf.h \
  /buildroot/output/build/buildroot-config/tristate.config
cd /buildroot && miniconfig make
