#!/bin/sh

C=` printf "%s\n%s\n%s" "YT" "History" "Link" | dmenu -p "Video Source > " -i `

case $C in
	YT) st ytfzf -tfl ;;
	History) st ytfzf -Hfl ;; 
	Link) mpv --no-terminal --fs ` xclip -selection c -o ` ;;
esac
