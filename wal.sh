#!/bin/sh 

wal -c
WALL="$HOME/.cache/Wallpaper/wall"

monitor_selection.sh a
convert "$1" -resize 1366x768! "$WALL"
wal -q -i "$WALL"
cat ~/.cache/wal/colors.Xresources > ~/.Xresources
killall -HUP -q dwm
monitor_selection.sh d
