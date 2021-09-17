#!/usr/bin/sh

echo "Input order: input file; video bitrate; output file"

ffmpeg -i $1 -c:v libvpx -c:a libvorbis -b:v $2 "$3"
