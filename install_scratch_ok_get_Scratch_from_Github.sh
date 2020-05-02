#!/bin/bash
cd ~
sudo apt-get update
mkdir ~/Scratch
cd ~/Scratch
wget "https://github.com/WISEPLAT/Scratch-3.9-on-Linux/blob/master/Scratch%20Desktop%20Setup%203.9.0.exe"
sudo apt-get install -y p7zip-full
7z x Scratch\ Desktop\ Setup\ 3.9.0.exe
cd \$PLUGINSDIR
7z x app-64.7z
cd resources
file app.asar electron.asar static/
cd ~
sudo apt install -y npm
npm install electron --save-dev
ls ~/node_modules/electron/dist
cd ~/Scratch
cp -r ~/node_modules/electron/dist scratch-desktop
cd scratch-desktop
cp -r ~/Scratch/\$PLUGINSDIR/resources/{app.asar,static} resources/
sudo ln -s electron scratch-desktop
cd ~
sudo sh -c "echo '[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=$PWD/Scratch/scratch-desktop/scratch-desktop
Icon=$PWD/Scratch/\$PLUGINSDIR/resources/static/assets/b7853f557e4426412e64bb3da6531a99.svg
Terminal=false
Name=Scratch
Comment= Programming system and content development tool
Categories=Application;Education;Development;ComputerScience;
MimeType=application/x-scratch-project
' > /usr/share/applications/scratch.desktop"
cd ~/Scratch/scratch-desktop
./scratch-desktop
