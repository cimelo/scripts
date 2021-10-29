#!/bin/sh

sed -i 's/,3/,0/' ~/.asoundrc 

connected() {
	xrandr | awk -v DISPLAY=$1 ' $0 ~ DISPLAY {print $2} '
}

conn_list() {
	xrandr | awk ' /\yconnected\y/ { print $1 }'
}

turn_on_only() {
	xrandr --output "$1" --auto --primary
	for display in $(conn_list)
	do
		[ $display != "$1" ] && xrandr --output $display --off;
	done
}

auto_dual() {
	HDMI=$(connected HDMI1)
	VGA=$(connected VGA1)

	[ $HDMI = "connected" ] && dual HDMI1 || \
	[ $VGA = "connected" ] && dual VGA1
}

hdmi() {
	[ ` connected HDMI1 ` = "connected" ] && turn_on_only HDMI1
	sed -i 's/,0/,3/' ~/.asoundrc 
}

lvds() { 
	turn_on_only LVDS1
}

vga() {
	[ ` connected VGA1 ` = "connected" ] && turn_on_only VGA1
}

dual() {
	xrandr --output LVDS1 --auto --primary && xrandr --output $1 --auto --right-of LVDS1
}

x() {
	echo "$( xrandr | awk ' /\yconnected\y/ {print $1} ' | dmenu -i -p '$1' )"
}

custom() {
	P=$(x "Primary display: ")
	R=$(x "Right display: ")
	L=$(x "Left display: ")
	[ -n $P ] && xrandr --output $P --auto --primary || (lvds && exit 1) 
	[ -n $R ] && xrandr --output $R --auto --right-of $P || (lvds && exit 1) 
	[ -n $L ] && xrandr --output $L --auto --left-of $P || (lvds && exit 1) 
}

manual() {
	OP=` printf "%s\n%s\n%s\n%s\n%s" "ONBOARD" "VGA" "HDMI" "DUAL_VGA" "CUSTOM" | dmenu -i -p "Display option: " `
	
	case $OP in
		ONBOARD) lvds ;;
		HDMI) hdmi ;;
		VGA) vga ;;
		CUSTOM) custom ;;
		DUAL_VGA) dual VGA1 ;;
	esac
}

case $1 in
	a) lvds ;;
	m) manual ;;
	d) auto_dual ;;
esac
