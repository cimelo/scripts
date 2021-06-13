#!/bin/sh

df -h --output / | awk ' /\// { print $10 } '
