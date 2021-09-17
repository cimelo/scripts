#/bin/sh

C=$HOME/.config/sxhkd
B=$C/sxhkdrc.bak
O=` printf "%s\n%s" "nt" "rf" | dmenu -i -p "Keyboard Layout > " `

cpb() {
	cp $1 $B
}

case $O in
	nt) cpb $C/sxhkdrc_nt ;;
	rf) cpb $C/sxhkdrc_rf ;;
esac

killall -e sxhkd
setsid sxhkd -c $B
keylayout.sh
