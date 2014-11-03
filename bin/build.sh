#!/bin/bash
source /app/bin/env
cd /buildroot && make allnoconfig
source /app/bin/env # we need to source it second time

sleep 3 # For whatever reason this script doesn't work inside docker without `sleep`
make "$@"
echo "DONE!!! The resulting image is in output/images/"
echo "Use following to create docker container"
echo "  docker import - myimage < output/images/rootfs.tar"
