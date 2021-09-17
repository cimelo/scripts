#!/bin/sh

cd $1
F=$(fzf -q "$3")

cdf() {
	TYPE=$( stat $F | awk '/Size/ {print $8}' )
	if [ $TYPE = "directory" ]; then
		cd $F
	else
		cd $(dirname $F)
	fi
}

case $2 in
	d) cdf ;;
	f) nvim $F ;;
	l) ls $F ;;
esac
