#!/bin/sh

youtube-dl --geo-bypass -x --audio-format "mp3" --restrict-filenames -w -o '$HOME/Music/%(title)s.%(ext)s' $1
