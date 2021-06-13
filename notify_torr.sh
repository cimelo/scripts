#!/bin/sh

echo "$TR_TORRENT_NAME" >> ~/ftorr
notify-send -t 5000 $TR_TORRENT_NAME Finished!
