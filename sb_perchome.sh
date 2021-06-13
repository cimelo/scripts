#!/bin/sh

df -h | awk ' /home/ { print $5 } '
