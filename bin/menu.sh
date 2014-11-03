#!/bin/bash
set -e
export BR2_ROOTFS_OVERLAY="/app/rootfs ${BR2_ROOTFS_OVERLAY}"
cd /buildroot && make menuconfig && /app/bin/miniconfig ${KCONFIG_ALLCONFIG}
