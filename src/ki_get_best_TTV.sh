#!/bin/bash
ORGAN=$1;
#
cat top-$ORGAN.csv \
| grep -a -e "nello" -e "orque" \
| awk '{ if($3 > 0 && $2 > 2000 && $2 < 5000) print $3"\t"$4; }' \
| head -n 1 \
| awk '{ print $1"\t"$2;}' \
| tr '_' '\t' \
| awk '{ print $1"\t"$2;}'
