R=$(printf "%s\n%s" "Remote" "Local" | dmenu -p "Download Type > " -i)

case $R in
	Remote)torrent_handler.sh "192.168.0.175:9091" "ianm:DyFUj6SwrQiDI8G" "$1" ;;
	Local)torrent_handler.sh "" "" "$1" ;;
esac
