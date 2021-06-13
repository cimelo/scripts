#!/bin/sh

TMP=` ls /tmp/back* 2>/dev/null `
[ -z $TMP ] || B=` cat $TMP ` && VAL=` echo "$B $1" | bc `
[ ` xbacklight ` = 0.000000 ] && xbacklight =$VAL || xbacklight $1
