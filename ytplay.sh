#!/bin/sh	

OP=` dmenu -p "op(a or v):" `
case $OP in
	"a") st mpv --no-video ` xclip -selection c -o `;;
	"v") mpv --fs ` xclip -selection c -o `;;
esac

