#!/usr/bin/sh

C=$(printf "%s\n%s" "History" "Search" | dmenu )

case $C in
	History) ani-cli -DH ;;
	Search) ani-cli -D ;;
esac
