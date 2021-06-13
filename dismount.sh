#!/bin/sh

RMDISK=` findmnt -r | awk ' /media|android/ {print $1}' | dmenu -p "Disk to dismount > " -i -l 10 `
fuser -Mmk $RMDISK
umount $RMDISK && notify-send -t 5000 "$RMDISK Unmounted!"

