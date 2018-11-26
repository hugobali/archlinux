#!/bin/bash
set -e

echo "################################################################"
echo "####             Install Utilities and Apps                 ####"
echo "################################################################"

sudo pacman -S dconf-editor dmidecode hardinfo hddtemp hexchat htop lm_sensors \
lsb-release mlocate net-tools sysstat vnstat wget conky curl colordiff ntfs-3g util-linux --noconfirm --needed 
yaourt -S gnome-disk-utility meld filezilla bleachbit gnome-font-viewer gnome-screenshot \
gnome-system-monitor brasero asunder vorbis-tools screen teamviewer keepassx2 backintime anydesk --noconfirm
# Icons
yaourt -S pop-icon-theme-git  la-capitaine-icon-theme  flat-remix-gnome-git papirus-icon-theme-git shadow-icon-theme --noconfirm
# Shell ZSH
yaourt -S zsh  zsh-completions antigen-git --noconfirm
# TouchScreen
yaourt -S xinput_calibrator touchegg-gce-git --noconfirm
# Android
yaourt -S gvfs-mtp  gvfs-gphoto2 libmtp android-file-transfer --noconfirm 
# Disk Tools
yaourt udftools gpart udftools gparted --noconfirm


echo "################################################################"
echo "##########  Install Utilities and Apps installed   #############"
echo "################################################################"
