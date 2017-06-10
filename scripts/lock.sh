#!/bin/sh
if grep -q 0 /sys/class/power_supply/AC/online; then
  $(dirname $0)/lock_laptop.sh
else
  $(dirname $0)/lock_desktop.sh
fi
