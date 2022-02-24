#!/bin/sh

P=$HOME/.cache/playlists

save() {
	T=" $(printf "" | dmenu -p 'Playlist Name: ') "
	L=" $(xclip -o) "
	L="${L} - ${T}"
	echo "$L" >> $P
}

copy() {
	L="$( cat $P | dmenu -p 'Which one: ' -i -l 30 | awk '{print $1}' )"
	echo "$L" | xclip -selection c
}

C=` printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s"\
	"FreeTube" "Anime" "Lbry" "YT" "History" "Link" "Fisioterapia" "Save" "Copy" | \
	dmenu -p "Video Source > " -i -l 30`

case $C in
	FreeTube) freetube ;;
	Anime) ani.sh ;;
	Lbry) lbry ;;
	YT) st ytfzf -qtfl ;;
	History) st ytfzf -Hfl ;; 
	Link) mpv --no-terminal --fs ` xclip -selection c -o ` ;;
	Fisioterapia) mpv --no-terminal --fs $HOME/Videos/fisioterapia/exercises.mp4 ;;
	Save) save ;;
	Copy) copy ;;
esac
