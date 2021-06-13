#!/bin/sh

{ head -n1 /proc/stat;sleep 1;head -n1 /proc/stat; } | awk '/^cpu /{u=$2-u;s=$4-s;i=$5-i;w=$6-w}END{printf "%d%", int(0.5+100*(u+s+w)/(u+s+i+w))}'
# awk ' { P_USAGE = int( $1*100/4 ); print P_USAGE"%" } ' /proc/loadavg
