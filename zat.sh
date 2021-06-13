#!/bin/sh

setsid tabbed -c zathura $1 -e &>/dev/null &
