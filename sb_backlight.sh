#!/bin/sh

xbacklight | awk '{ printf "%d%", $1 } '
