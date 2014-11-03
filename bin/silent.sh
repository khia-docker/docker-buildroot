#!/bin/bash
set -e
source /app/bin/env
cd /buildroot && miniconfig make
