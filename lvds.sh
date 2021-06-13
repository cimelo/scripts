#!/bin/sh

xrandr --output LVDS1 --auto --primary && xrandr --output HDMI1 --off && xrandr --output VGA1 --off && xrandr --output DP1 --off && sed -i '/s/,3/,0/' ~/.asoundrc
