#!/bin/sh

latex() {
	CF="../cpl"
	FN="${1%.*}"
	
	pdflatex -output-directory $CF $1 &&
		biber --input-directory $CF --output-directory $CF $FN &&
		pdflatex -output-directory $CF $1 &&
		pdflatex -output-directory $CF $1 &&
		[ -z ` pidof -x tabbed 2>/dev/null ` ] && setsid zat.sh $CF/main.pdf
}

c() {
	CFILES=` find . -name "*.c" `
	O="${1%.*}.o"
	gcc -o $O $CFILES 2>./out

	case $2 in
		c) nvim out ;;
		r) ./$0
	esac
}

cpp() {
	CPPFILES=` find . -name "*.cpp" `
	O="${1%.*}.o"
	g++ -o %O $CPPFILES 2>./out

	case $2 in
		c) nvim out ;;
		r) ./$0
	esac
}

rust() {
	case $2 in
		c) cargo check ;;
		r) cargo run ;;
	esac
}

EXT=${1##*.}

case $EXT in
	c) c $1 $2 $EXT;;
	cpp) cpp $1 $2 $EXT;;
	tex) latex $1 $2 $EXT;;
	py) python $1 $2 $EXT;;
	rs) rust $1 $2 $EXT;;
esac
