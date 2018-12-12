#!/bin/bash

## install all config files

install_package (){
    local PACKAGE=$1
    if [ -d $PACKAGE ]
    then
        local COMMAND="stow --no-folding ${PACKAGE}"
        echo "${COMMAND}"
        $(${COMMAND})
    else
        echo "${PACKAGE} : no such file or directory"
    fi
}


if [ $# -eq 0 ]
then
    PACKAGES=$(find . -mindepth 1 -maxdepth 1 -type d -print | sed s,./,,g)
else
    PACKAGES="$@"
fi

for PACKAGE in $PACKAGES
do
    install_package $PACKAGE
done
