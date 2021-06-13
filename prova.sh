#!/bin/sh

ANDROID=$HOME/mnt/android
CARD=` ls $ANDROID 2>/dev/null `

[ -z $CARD ] && aft-mtp-mount $ANDROID 
sxiv -ft "$ANDROID/${CARD}/DCIM/Camera"
