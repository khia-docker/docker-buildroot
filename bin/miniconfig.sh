#!/bin/bash
set -e
if [ ! -f .config ]; then
  echo ".config doesn't exist please run 'make menuconfig'"
  exit 1
fi

mv .config .config.bkp
cat .config.bkp | grep -v "#" | sort > .new.config

make allnoconfig && cat .config | grep -v "#" | sort > .all.config

comm -3 .all.config .new.config | sed -e '/^$/d' -e 's/^[ \t]*//' > ${1}
mv .config.bkp .config
rm .new.config
