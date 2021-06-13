#!/bin/sh

awk ' { TEMP = $1/1000; print TEMP"°C"} ' /sys/class/thermal/thermal_zone0/temp
