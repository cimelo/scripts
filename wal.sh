#!/bin/sh 
rm -r $HOME/.cache/wal
WALL="$HOME/.cache/Wallpaper/wall.jpg"

convert "$1" -resize 1366x768! "$WALL" &&
monitor_selection.sh a
wal -i "$WALL" &&
cat ~/.cache/wal/colors.Xresources > ~/.Xresources &&
killall -HUP -q dwm
monitor_selection.sh d
