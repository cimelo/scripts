#!/usr/bin/sh

CF="$HOME/.config/torraut"
CFD="$CF/custom_folders"
[ -z $(ls $CF 2>/dev/null) ] && mkdir $CF && touch $CFD
CFD_VAL=$(cat $CFD)

DF=$( printf %s "$CFD_VAL" | dmenu -i -p "Download Folder > " -l 30 )
[ -z $DF ] && exit 1

HDF="$HOME/$DF"
[ -z $(ls $HDF 2>/dev/null) ] && mkdir -p $HDF
[ -z $(grep -e $DF $CFD) ] && echo $DF >> $CFD && sort $CFD -o $CFD

transmission-remote -ep -w "$HDF" -a "$1" && notify-send "Torrent Added!"
