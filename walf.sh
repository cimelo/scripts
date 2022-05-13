#!/bin/sh

WF="$HOME/Pictures/Wallpapers"

custom() {
	C=` ls -d $WF/* | dmenu -i -p "Wallpaper Folder: " -l 10 `
	
	sxiv -fts f "$C"
}

random() {
	STR=$(
		for f in $WF/*
		do
			find "$f" -regex '.*[jpg\|png]' | shuf | head -n 30
		done
	)

	echo "$STR" | sxiv -fts f -
}

CW=` printf "%s\n%s" "RANDOM" "CUSTOM" | dmenu -p "Wallpaper Selection Type > " -i`
case $CW in
	RANDOM) random ;;
	CUSTOM) custom ;;
esac

