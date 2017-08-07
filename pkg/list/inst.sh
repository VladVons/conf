#!/bin/bash

_PkgCheck()
# ------------------------
{
  aPackage="$1";

  ##dpkg -l | awk '{ print $2, $3 }' | sort | grep -w -m 1 "$aPackage"
  dpkg -l $aPackage 2>&1 | grep ii | awk '{ print $3 }'
  #cat $gFileDpkgFast | grep -w -m 1 "$aPackage"
}



FileListInstall()
# install packages listed in file
# ------------------------
{
  aFile="$1";

  if [ -r $aFile ]; then
    declare -a Files=$(cat $aFile | grep "^[^\#]")

    for File in ${Files[@]}; do
      Installed=$(_PkgCheck $File)
      if [ ! "$Installed" ]; then
        echo $File
        apt-get install -y $File
      fi
    done
  else
    Log "Error! Can't read file: $aFile"
  fi
}

FileListInstall xubuntu.lst