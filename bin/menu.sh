#!/bin/bash
set -e
source /app/bin/env
cd /buildroot && make menuconfig && /app/bin/miniconfig ${KCONFIG_ALLCONFIG}
