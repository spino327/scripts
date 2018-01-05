#!/bin/bash

USAGE="./new_brackets_ternproject.sh path. Creates a new .tern-project for Brackets' Tern plugin for javascript."

if [ "$#" -lt "1" ]; then
    echo $USAGE
    exit -1
fi

echo "Creating tern files..."
cp -v $HOME/opt/brackets_new_ternific/tern-project .tern-project
chmod 700 .tern-project
echo "Please modify .tern-project by adding your preferred paths."
