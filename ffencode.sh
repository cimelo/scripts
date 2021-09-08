#!/usr/bin/sh

echo "Input"
read I
echo "Bitrate"
read B
echo "Output"
read O

ffmpeg -i $1 -c:v libvpx -c:a libvorbis -b:v $2 "$3"
