#!/bin/bash
wget -O Whiskers.image https://raw.githubusercontent.com/NoMod-Programming/Whiskers/master/Build/Whiskers.image
mv Whiskers.image /usr/share/scratch/Whiskers.image
cp /usr/bin/scratch /usr/bin/whiskers
sed -i 's#IMAGE=.*#IMAGE="/usr/share/scratch/Whiskers.image"#' /usr/bin/whiskers
echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=nuwhiskers
Icon=scratch
Terminal=false
Name=Whiskers
Comment=Programming system and content development tool
Categories=APplication;Education;Development;
MimeType=application/x-scratch-project" > /home/${USER}/Desktop/whiskers.desktop
chmod a+x /home/${USER}/Desktop/whiskers.desktop
