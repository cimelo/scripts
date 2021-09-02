#!/bin/sh

ANPD=$HOME/.cache/anp
CFD=$HOME/.cache/anp/flist

mkdir -p $ANPD
touch $CFD

VF=` ls -d $HOME/Videos/* | dmenu -i -p "Video Type >" -l 10 `
[ -z $VF ] || V=` ls -d $VF/* | dmenu -i -p "Video >" -l 10 `
mpv --save-position-on-quit --fs --no-terminal "$V"
