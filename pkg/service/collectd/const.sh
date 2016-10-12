#!/bin/bash

source $DIR_ADMIN/conf/script/const.sh

cApp="collectd"

cPkgName="$cApp"
cPkgAlso="collectd-utils rrdtool hddtemp liboping0 lm-sensors"

cProcess="$cApp"
cService="$gDirD/$cApp"
cPort="25826"
cLog1=$gFileSysLog
