#!/bin/sh

IMG=` printf "" | dmenu -p "Printscreen file name: " ` && scrot -q 100 -e mv $f ~/Pictures/Screenshots/${IMG}.png
