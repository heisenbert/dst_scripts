#!/bin/bash
#just some variables
path_for_dst=/opt/dst
path_for_inst=/opt/dst/exec
daemon_name=dst
steam_runscript=dst.txt
dst_id=343050
adduser $daemon_name --disabled-password --home $path_for_dst
mkdir -p $path_for_dst
mkdir -p $path_for_inst
cd $path_for_dst
#wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
#tar -xvzf steamcmd_linux.tar.gz
#rm steamcmd_linux.tar.gz
#steam runscript generation
echo "login anonymous" > $steam_runscript
echo "force_install_dir $path_for_inst" >> $steam_runscript
echo "app_update $dst_id validate" >> $steam_runscript
echo "quit" >> $steam_runscript
#./steamcmd.sh +runscript $steam_runscript
#
echo "before launching anything, some things have to be installed"
echo "do you want to let this script do it, or yourself"
#todo wirklich abfragen und ggf pruefen was fur ein sys das gerade is
#sudo dpkg --add-architecture i386 # If running a 64bit OS
#sudo apt-get update
sudo apt-get install lib32gcc1    # If running a 64bit OS
sudo apt-get install lib32stdc++6 # If running a 64bit OS
#sudo apt-get install libgcc1      # If running a 32bit OS
sudo apt-get install libcurl4-gnutls-dev:i386
mkdir dst_lib && cd dst_lib
wget https://github.com/dgibbs64/linuxgameservers/raw/master/Insurgency/dependencies/libc.so.6
wget https://github.com/dgibbs64/linuxgameservers/raw/master/Insurgency/dependencies/libpthread.so.0
wget https://github.com/dgibbs64/linuxgameservers/raw/master/Insurgency/dependencies/librt.so.1
cd ..
