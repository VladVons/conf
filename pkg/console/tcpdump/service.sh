#!/bin/bash
#--- VladVons@gmail.com

source ./const.sh
source $DIR_ADMIN/conf/script/service.sh


# ------------------------
clear
case $1 in
    Install)	$1 $2 $3 $4 ;;
    *)		Test ;;
esac
