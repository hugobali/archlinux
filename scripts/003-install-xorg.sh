#!/bin/bash
set -e

echo "################################################################"
echo "####             Install xorg and nvidia                    ####"
echo "################################################################"

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm --noconfirm --needed
sudo pacman -S xf86-video-nouveau --noconfirm --needed

echo "################################################################"
echo "###################    xorg installed     ######################"
echo "################################################################"
