#!/bin/sh

[ -z ` pgrep zeal ` ] && setsid zeal & disown
CMD=` print "" | dmenu -p "Zeal Checkup > " ` && zeal $CMD
