#!/bin/sh

case $1 in
	quit) echo ' { "command": ["quit"] } ' | socat - /tmp/mpvsocket &>/dev/null ;;
	next) echo ' { "command": ["playlist-next"] } ' | socat - /tmp/mpvsocket &>/dev/null ;;
	prev) echo ' { "command": ["playlist-prev"] } ' | socat - /tmp/mpvsocket &>/dev/null ;;
	pause) echo ' { "command": ["keypress", "p"] } ' | socat - /tmp/mpvsocket &>/dev/null ;;
esac
