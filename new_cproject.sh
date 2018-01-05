#!/bin/bash

USAGE="./new_cproject.sh path. Creates a new .ycm_extra_conf.py for YouCompleteMe C/C++ autocompletion."

if [ "$#" -lt "1" ]; then
    echo $USAGE
    exit -1
fi

echo "Creating ycm files..."
cp -v $HOME/opt/ycm_new_projects/ycm_extra_conf.py .ycm_extra_conf.py
chmod 700 .ycm_extra_conf.py
echo "Please modify .ycm_extra_conf.py by adding your preferred paths."
