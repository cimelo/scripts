#!/bin/sh

fn() {
	xrandr | awk ' /\yconnected\y/ { print $1 }'
}

for line in ` fn `
do
	echo "$line"
done
