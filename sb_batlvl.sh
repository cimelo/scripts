#!/bin/sh

BATLVL=` cat /sys/class/power_supply/BAT1/capacity `
STAT=` cat /sys/class/power_supply/BAT1/status `
RED=`tput setaf 1`
YELLOW=`tput setaf 3`
NCOLOR=`tput sgr0`

case $STAT in
	Unknown) STAT='?' ;;
	Full) STAT='' ;;
	Charging) STAT='↑' ;;
	Discharging) STAT='↓' ;;
esac

if  [ $BATLVL -gt 50 ]; then
	MSG="${STAT}${BATLVL}%"
elif [ $BATLVL -le 50 ] && [ $BATLVL -gt 25 ]; then
	MSG="${STAT}${BATLVL}%"
else
	MSG="${STAT}${BATLVL}%"
fi

echo "${MSG}"
