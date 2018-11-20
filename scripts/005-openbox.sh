#!/bin/bash
set -e

echo "################################################################"
echo "####             Install openbox                            ####"
echo "################################################################"

yaourt -S openbox obmenu-generator obconf oblogout obmenu openbox-themes --noconfirm
yaourt -S notify-osd lxappearance-obconf lxinput lxrandr --noconfirm  

echo "################################################################"
echo "###################   openbox installed   ######################"
echo "################################################################"
