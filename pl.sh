#!/usr/bin/sh

D=$HOME/texdefaults
mkdir -p cpl main
cp -r $D/images $D/main.tex $D/title_ufpe.tex main
cd main
nvim -p *tex
