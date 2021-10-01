#!/bin/sh

umount_disk() {
	RMDISK=` findmnt -r | awk ' /media|android/ {print $1}' | dmenu -p "Disk to dismount > " -i -l 10 `
	fuser -Mmk $RMDISK
	umount $RMDISK && notify-send -t 5000 "$RMDISK Unmounted!"
}

mount_android() {
	aft-mtp-mount $HOME/mnt/android && notify-send -t 5000 "Android Mounted!"
}

case $1 {
	m) mount_android ;;
	u) umount_disk ;;
}
