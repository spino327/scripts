#!/bin/bash

# $1 = latex file
USAGE="./app <latex file name without extension>"
TEXBIN=/Library/TeX/texbin

if [ -z "$1" ]; then
    echo $USAGE
    exit -1
fi

clear;
"$TEXBIN/bibtex" $1.aux
"$TEXBIN/makeindex" $1.idx
