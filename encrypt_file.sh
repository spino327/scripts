#!/bin/bash

USAGE="USAGE: ./encrypt_file.sh <file> <password>"

if [ -z "$1" ]; then
    echo $USAGE
    exit -1
fi
if [ -z "$2" ]; then
    echo $USAGE
    exit -1
fi

FILE=$1
PASSWORD=$2

tar -cvzf - $FILE | openssl des3 -salt -k $PASSWORD | dd of=$FILE.tar.gz
