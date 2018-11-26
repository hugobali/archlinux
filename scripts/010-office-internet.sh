#!/bin/bash
set -e

echo "################################################################"
echo "####             Install Office and Internet                ####"
echo "################################################################"

yaourt -S wps-office wps-office-extension-spanish-dictionary calibre ttf-ms-fonts --noconfirm
yaourt -S firefox opera google-chrome vivaldi tor-browser deluge --noconfirm
yaourt -S texlive-core texlive-most texstudio --noconfirm
yaourt -S emacs geany atom sublime-text-dev http-parser ctags --noconfirm
yaourt -S telegram-desktop-bin skypeforlinux-stable-bin messengerfordesktop-bin whatsapp-web-desktop  --noconfirm
yaourt -S snx ansible spice-gtk  virt-viewer libvncserver freerdp remmina remmina-plugin-rdesktop remmina-plugin-ultravnc --noconfirm

echo "################################################################"
echo "##############  Office and Internet installed   ################"
echo "################################################################"
