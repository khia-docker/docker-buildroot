#!/bin/bash
set -e
source /app/bin/env
cd /buildroot && make allnoconfig

# Update access time to trigger build
touch \
  /buildroot/output/build/buildroot-config/auto.conf \
  /buildroot/output/build/buildroot-config/autoconf.h \
  /buildroot/output/build/buildroot-config/tristate.config

sleep 3 # For whatever reason this script doesn't work inside docker without `sleep`
make "$@"
echo "DONE!!! The resulting image is in output/images/"
echo "Use following to create docker container"
echo "  docker import - myimage < output/images/rootfs.tar"
