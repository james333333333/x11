#!/bin/sh

setup-xorg-base

apk add build-base libx11-dev libxft-dev libxinerama-dev linux-headers ncurses
apk add font-noto xclip maim brightnessctl pulseaudio pulseaudio-utils 
# apk add util-linux tmux setxkbmap xrandr redshift texlive nmap xev
# apk add firefox emacs-x11 zathura zathura-pdf-mupdf anki qbittorrent

mkdir -p /etc/X11/xorg.conf.d
mv 40-libinput.conf /etc/X11/xorg.conf.d/

mkdir /usr/local/src
mv *patch /usr/local/src
cd /usr/local/src

git clone --depth=1 https://git.suckless.org/dwm
mv dwmpatch dwm/
cd dwm
patch -i dwmpatch
make install
cd ..

git clone --depth=1 https://git.suckless.org/st
mv stpatch st/
cd st
patch -i stpatch
make install
cd ..

git clone --depth=1 https://git.suckless.org/slstatus
mv slstatuspatch slstatus/
cd slstatus
patch -i slstatuspatch
make install
cd ..

git clone --depth=1 https://git.suckless.org/dmenu
cd dmenu
make install
cd ..
