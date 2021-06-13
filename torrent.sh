#!/bin/sh

mkdir -p $HOME/.config/torraut
TADIR=$HOME/.config/torraut
touch $TADIR/custom_folders
CF=$TADIR/custom_folders

pgrep -x transmission-da &>/dev/null || transmission-daemon

DIR=` cat $CF | dmenu -i -p "Folder > " -l 10 || printf "" `
[ -z $DIR ] && exit 1

grep ${DIR}$ $CF || echo "$DIR" >> $CF
DIR=` echo "$HOME/$DIR" `
mkdir -p $DIR
sort $CF -o $CF

transmission-remote -ep -D -w $DIR -a $1 && notify-send -t 5000 "Torr Started!"
