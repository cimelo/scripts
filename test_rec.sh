#!/bin/sh

[ $1 -ne 10 ] && echo "$1" && C=$(expr $1 + 1 ) && ~/test_rec $C
