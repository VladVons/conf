#!/bin/bash

source $DIR_ADMIN/conf/script/const.sh

cApp="postgresql"

cPkgName="$cApp"
cPkgAlso="$cApp-contrib $cApp-client"

cProcess="$cApp"
cService="$gDirD/$cApp"
cPort="5432"
cLog1="/var/log/$cApp/$cApp-9.4-main.log"
