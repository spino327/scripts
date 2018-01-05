#!/bin/bash

USAGE="USAGE: ./decrypt_file.sh <file> <password>"

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

dd if=$FILE | openssl des3 -d -k $PASSWORD | tar -xvzf -

