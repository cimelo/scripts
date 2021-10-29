#!/bin/sh

C=` printf "%s\n%s\n%s\n%s" "FreeTube" "YT" "History" "Link" | \
	dmenu -p "Video Source > " -i `

case $C in
	FreeTube) freetube ;;
	YT) st ytfzf -qtfl ;;
	History) st ytfzf -Hfl ;; 
	Link) mpv --no-terminal --fs ` xclip -selection c -o ` ;;
esac
