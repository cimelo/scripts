#!/usr/bin/sh

CF="$HOME/.config/torraut"
CFD="$CF/custom_folders"
[ -z $(ls $CF 2>/dev/null) ] && mkdir $CF && touch $CFD
CFD_VAL=$(cat $CFD)

DF=$( printf %s "$CFD_VAL" | dmenu -i -p "Download Folder > " -l 30 )
[ -z $DF ] && exit 1

# Sorts the folders file for better readability
sort $CFD -o $CFD

transmission-remote "$1" -n "$2" -w "$DF" -a "$3" 
