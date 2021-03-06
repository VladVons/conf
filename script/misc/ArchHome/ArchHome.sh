#!/bin/bash
#--- VladVons@gmail.com


Backup()
{
  #zip -r home.zip . -x "*.7z" -x "*.deb"
  zip -x *.7z *.deb -r home.zip .
}


AddUsers()
{
  File="user.conf" 

  find . | grep $File | \
  while read i; do
    source $File
    source $i
    #User=`grep -i -oP 'user:\s?\K(\w+$)' $i`
    #Passw=`grep -i -oP 'passw:\s?\K(\w+$)' $i`

    echo "file:$i, user:$User, passw:$Passw"
    if [ "$User" -a "$Passw" ]; then
        HomeDir="/home/$User"
        mkdir -p $HomeDir

        useradd $User --home $HomeDir --shell /usr/sbin/nologin
        echo "$User:$Passw" | chpasswd
        chown -R $User:$User $HomeDir 
    fi
  done
}


AddUsers
#Backup