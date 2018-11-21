#!/bin/bash
set -e

echo "################################################################"
echo "####             Install Images Editor                      ####"
echo "################################################################"


yaourt -S digikam rapid-photo-downloader-bzr hugin darktable gimp pinta inkscape rawtherapee shutter evince  --noconfirm 
yaourt -S variety feh nitrogen--noconfirm --noconfirm 

echo "################################################################"
echo "##############  Images Editor installed      ###################"
echo "################################################################"
