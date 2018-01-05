#!/usr/bin/env bash

USAGE="java_debug.sh <arg1>...<argn>"

if [ "$#" -lt 1 ]; then
  echo $USAGE
  exit -1
fi

echo "*********************************************************"

java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=9000 $@
