#!/usr/bin/env bash

USAGE="repeat.sh <repetition> <apps> <args...>"

if [ "$#" -lt "2" ]; then
    echo $USAGE
    exit -1
fi

REP=$1
APP=$2
ARGS=()
ith=1
for arg in ${@:3}; do
    ARGS[$[ith++]]=$arg
done

for i in `seq $REP`; do
    $APP ${ARGS[@]}
done

