#!/bin/sh

amixer sset 50%
sed -i 's/,3/,0/' ~/.asoundrc
