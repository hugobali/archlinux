#!/bin/bash
set -e

echo "################################################################"
echo "####             Install Codecs and Audio Apps              ####"
echo "################################################################"

sudo pacman -S exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 \
libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav dvd+rw-tools dvdauthor dvgrab --noconfirm
yaourt -S banshee vlc picard puddletag clementine openshot quodlibet playerctl gtkpod soundconverter gst-plugins-ugly notify-osd --noconfirm
yaourt -S pulseaudio-bluetooth alsa alsa-plugins bluez bluez-utils blueman --noconfirm


echo "################################################################"
echo "###########  Codecs and Audio Apps installed   #################"
echo "################################################################"
