#!/usr/bin/sh

ffmpeg -i $1 -c:v libvpx -c:a libvorbis -b:v $2 "$3"
