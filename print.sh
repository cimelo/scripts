#!/bin/sh

S=$( printf "%s\n%s" "Selection" "Fullscreen" | dmenu -p "Screen capture choice : " -i )
IMG=$( printf "" | dmenu -p "Printscreen file name: " )

case $S in
	Fullscreen) scrot -q 100 -e mv $f ~/Pictures/Screenshots/${IMG}.png ;;
	Selection) scrot -q 100 -s -e mv $f ~/Pictures/Screenshots/${IMG}.png ;;
esac
