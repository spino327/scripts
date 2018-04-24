#!/usr/bin/env bash

function USAGE() {
  echo "$0 <sync_option> <remote_machine> <local_folder> <remote_folder> <list_files>"
  echo -e "\tto: sends data to remote."
  echo -e "\tfrom: gets data from remote."
  echo -e "\tremote_machine: user@host."
  echo -e "\tlocal_foder: folder where the files are located."
  echo -e "\tremote_foder: remote folder where the files are located."
  echo -e "\tlist_files: list of files to transfer defined by extra arguments."
  echo "If the variables \$RHOST, \$LFOLDER, \$RFOLDER, \$LFILES are set then the script don't require the arguments."
  exit -1
}

NOPTIONS=5
OPTION=$1
if [ $# -lt 1 -o "$OPTION" != "to" -a "$OPTION" != "from" ]; then
  USAGE
fi
# Remote HOST
if [ $# -ge $NOPTIONS ]; then
  RHOST=$2
  LFOLDER=$3
  RFOLDER=$4
  ARGS=( $@ )
  LFILES="${ARGS[@]:4}"
elif [ -z "$RHOST" -o -z "$LFOLDER" -o -z "$RFOLDER" -o "${#LFILES[@]}" -lt "1" ]; then
  USAGE
fi

function from() {
  for file in $LFILES; do
    CMD="rsync -avziu $DELETE --progress -e ssh $RHOST:$RFOLDER/$file $LFOLDER"
    echo $CMD
    $CMD
  done
}

function to() {
  for file in $LFILES; do
    # echo rsync -avziu $DELETE --progress -e ssh $LOCAL_FOLDER/$file sergiop@$REMOTE:$REMOTE_FOLDER
    CMD="rsync -avziu $DELETE --progress -e ssh $LFOLDER/$file $RHOST:$RFOLDER"
    echo $CMD
    $CMD
  done
}

echo "RHOST=$RHOST, LFOLDER=$LFOLDER, RFOLDER=$RFOLDER, FILES=\"${LFILES[@]}\""

echo "Synchronizing $OPTION remote..."
$OPTION
