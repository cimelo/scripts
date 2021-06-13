#!/bin/sh

CF="../cpl"
FN="${1%.*}"

pdflatex -output-directory $CF $1 &&
	biber --input-directory $CF --output-directory $CF $FN &&
	pdflatex -output-directory $CF $1 &&
	pdflatex -output-directory $CF $1 &&
	[ -z ` pidof -x tabbed 2>/dev/null ` ] && setsid zat.sh $CF/main.pdf
