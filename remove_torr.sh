#!/usr/bin/sh

R=$(tt -l | awk '/n\/a/ {print $1}') && R=$(echo -n $R | sed 's/\s/,/g')
transmission-remote -t $R -rad
