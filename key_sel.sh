#/bin/sh

C=$HOME/.config/sxhkd
B=$C/sxhkdrc.bak
O=` printf "%s\n%s\n%s" "nt" "rf" "kt" | dmenu -i -p "Keyboard Layout > " `

cpb() {
	cp $1 $B
}

case $O in
	nt) cpb $C/sxhkdrc ;;
	rf) cpb $C/sxhkdrc_rf ;;
	kt) cpb $C/sxhkdrc_ketchup ;;
esac

killall -e sxhkd
setsid sxhkd -c $B
keylayout.sh
