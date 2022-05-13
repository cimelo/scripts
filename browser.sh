#!/usr/bin/sh

B=$( printf "%s\n%s" "Brave" "Firefox" | dmenu -i -p "Browser" )

case $B in
	Firefox) firefox ;;
	Brave) brave ;;
esac
