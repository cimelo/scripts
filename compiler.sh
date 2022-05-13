#!/bin/sh

# compilees the documents on cpl that includes biber archive, tex then generates the pdf archive with name $FN and runs the openned instance of tabbed with zathura in it 
latex() {
	CF="../cpl"
	FN="${1%.*}"
	
	pdflatex -shell-escape -output-directory $CF main.tex &&
	pdflatex -shell-escape -output-directory $CF main.tex &&
	pdflatex -shell-escape -output-directory $CF main.tex
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
