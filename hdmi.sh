#!/bin/sh

STATE=` xrandr | awk ' /HDMI1/ { print $2 }' `
[ $STATE = connected ] && xrandr --output HDMI1 --auto --primary && xrandr --output LVDS1 --off && xrandr --output VGA1 --off && xrandr --output DP1 --off && sed -i 's/,0/,3/' ~/.asoundrc
