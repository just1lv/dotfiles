#!/bin/bash

## install all config files

uninstall_package (){
    local PACKAGE=$1
    if [ -d $PACKAGE ]
    then
        local COMMAND="stow --no-folding -D ${PACKAGE}"
        echo "${COMMAND}"
        $(${COMMAND})
    else
        echo "${PACKAGE} : no such file or directory"
    fi
}


if [ $# -eq 0 ]
then
    PACKAGES=$(find . -mindepth 1 -maxdepth 1 -type d -print | sed s,./,,g | grep -v '.git')
else
    PACKAGES="$@"
fi

for PACKAGE in $PACKAGES
do
    uninstall_package $PACKAGE
done
