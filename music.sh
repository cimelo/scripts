#!/bin/sh

MF=$HOME/Music

#Choice
C=` printf "%s\n%s\n" "Playlists" "Custom" "All" | dmenu -i -p "Choice > " -l 10 `

case $C in
	Playlists) C=` ls -d $MF/* | dmenu -p "Music > " -l 10 -i ` && mpv --shuffle "$C" --input-ipc-server=/tmp/mpvsocket --no-terminal --no-video ;;
	Custom) C=` ls -d $MF/*/* | dmenu -p "Custom Music Folder > " -i -l 30 ` && mpv --shuffle "$C" --input-ipc-server=/tmp/mpvsocket --no-terminal --no-video ;;
	All) mpv --shuffle "$MF" --input-ipc-server=/tmp/mpvsocket --no-terminal --no-video ;;
esac
