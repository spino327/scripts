#!/bin/bash

# $1 = latex file
USAGE="./app <latex input file>"
TEXBIN=/Library/TeX/texbin

if [ -z "$1" ]; then
    echo $USAGE
    exit -1
fi

clear;
"$TEXBIN/pdflatex" -synctex=1 -interaction=nonstopmode $1
