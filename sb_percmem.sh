#!/bin/sh

free | awk '/^Mem/ { $P_MEM = int( ($3+$5)*100/$2 ); print $P_MEM"%" }'
