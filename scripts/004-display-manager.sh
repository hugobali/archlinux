#!/bin/bash
set -e

echo "################################################################"
echo "####             Install diplay manager lightdm             ####"
echo "################################################################"

sudo pacman -S lightdm lightdm-gtk-greeter-settings lightdm-gtk-greeter --needed --noconfirm
yaourt -S xorg-xbacklight xf86-video-intel libgnomeui xscreensaver-arch-logo --noconfirm

echo "################################################################"
echo "###################   lightdm installed   ######################"
echo "################################################################"
