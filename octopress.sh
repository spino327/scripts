#!/bin/bash

USAGE="USAGE: octopress.sh <title> <dir>. Assuming that you are located in the path where _post folder exists."

if [ "$#" -lt "1" ]; then
    echo $USAGE
    exit -1
fi

TITLE=$1
FOLDER=$2

echo Creating md with title \'$TITLE\' at ./_posts/$FOLDER
if [ -n "$FOLDER" ]; then
    bundle exec octopress new post "$TITLE" --dir $FOLDER
else
    bundle exec octopress new post "$TITLE"
fi
