#!/bin/sh

WF="$HOME/Pictures/Wallpapers"

custom() {
	C=` ls -d $WF/* | dmenu -i -p "Wallpaper Folder: " -l 10 `
	
	case $C in
		"${WF}/Anime") STR=$(ls -d ${WF}/Anime/*/ | dmenu -i -p "Wallpaper Folder: "-i -l 30);;
		*) STR="$C";;
	esac
}

random() {
	STR=`
	for f in $WF/*
	do
		find "$f" -regex '.*[jpg\|png]' | shuf | head -n 30
	done `
}

CW=` printf "%s\n%s" "RANDOM" "CUSTOM" | dmenu -p "Wallpaper Selection Type > " -i`
case $CW in
	RANDOM) random ;;
	CUSTOM) custom ;;
esac

echo "$STR" | sxiv -fats f -
