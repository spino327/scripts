#!/bin/bash

USAGE="./wget_website.sh URL <PARENT 1 or 0>. 
    URL=www.website.org/this/path/"

if [ -z "$1" ]; then
    echo $USAGE
    exit -1
fi

URL=$1
PARENT="--no-parent"
if [ "$2" == "1" ]; then
    PARENT=""         
fi

wget -r -p -U Mozilla $PARENT -erobots=off --random-wait $URL 
#-erobots=off 
#wget $BASE/$PT -r --html-extension --random-wait
#wget \
#    --recursive \
#    --no-clobber \
#    --page-requisites \
#    --html-extension \
#    --convert-links \
#    $PARENT \
#    $BASE$PT    
