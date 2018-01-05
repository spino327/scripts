#!/bin/bash

USAGE="./diff_vim.sh <folder_a> <folder_b> <filename> [1 for horizontal, 0 ow]. Returns the diff between two files of same name in different folders."

if [ "$#" -lt "3" ]; then
    echo "USAGE: "$USAGE
    exit -1
fi

FOLDER_A=$1
FOLDER_B=$2
FILE=$3
HORIZONTAL=0
if [ "$#" -eq "4" ]; then
    HORIZONTAL=$4
fi

if [ "$HORIZONTAL" -eq "1" ]; then
    vimdiff -o $FOLDER_A/$FILE $FOLDER_B/$FILE
else
    vimdiff $FOLDER_A/$FILE $FOLDER_B/$FILE
fi
