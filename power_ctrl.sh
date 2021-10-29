#!/bin/sh

svs() { 
	BL=$HOME/.cache/lastsession/backlight
	xbacklight 1> $BL
}

CMD=` printf "Sleep\nShutdown\nReboot" | dmenu `

case $CMD in
	Shutdown) svs && shutdown now;;
	Reboot) svs && reboot;;
	Sleep) slock $(echo mem | sudo tee /sys/power/state) ;;
esac
