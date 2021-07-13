#/bin/sh

C=$HOME/.config/sxhkd
O=` printf "%s\n%s" "nt" "rf" | dmenu -i -p "Keyboard > " `

case $O in
	nt) O=$C/sxhkdrc_nt ;;
	rf) O=$C/sxhkdrc_rf ;;
esac

killall -q sxhkd
sxhkd -c $O
