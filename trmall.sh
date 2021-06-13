#!/bin/sh

A=$1
while [ $A -lt 42 ]
do
	transmission-remote -t $A -r
	A=` expr $A + 1 `
done
