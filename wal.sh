#!/bin/sh 

wal -c
WALL="$HOME/.cache/Wallpaper/wall"

convert "$1" -resize 1366x768! "$WALL"
wal -q -i "$WALL"
monitor_selection.sh a
cat ~/.cache/wal/colors.Xresources > ~/.Xresources
killall -HUP -q dwm
monitor_selection.sh d
