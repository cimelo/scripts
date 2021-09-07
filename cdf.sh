#!/bin/sh

cd $1
F=` fzf -q "$3" `
case $2 in
	d) cd $F ;;
	f) nvim $F ;;
	l) ls $F ;;
esac
