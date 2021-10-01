#!/bin/sh

MF=$HOME/Music

#Choice
C=` printf "%s\n%s\n%s\n%s" "Playlists" "Custom" "All" | dmenu -i -p "Choice > " -l 10 `

case $C in
	Playlists) C=` ls -d $MF/* | dmenu -p "Music > " -l 10 -i ` ;;
	Custom) C=` ls -d $MF/*/* | dmenu -p "Custom Music Folder > " -i -l 30 `;;
	All) C=$MF ;;
esac

mpv --shuffle "$C" --input-ipc-server=/tmp/mpvsocket --no-terminal --no-video 
