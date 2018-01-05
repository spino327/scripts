# Script to use the airport commandline utility by apple

USAGE="airport.sh <args>. if no args then -s by default (scan)."
ARGS=""

if [ "$#" -eq "0" ]; then
  echo $USAGE
  ARGS=-s
else
  ARGS="$@"
fi

/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport $ARGS
