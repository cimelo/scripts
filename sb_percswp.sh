#!/bin/sh

free -h | awk '/^Swap/ { $P_SWP = int( $3*0.1/$2 ); print $P_SWP }' | sed 's/$/\%/'
