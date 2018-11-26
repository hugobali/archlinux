#!/bin/bash
set -e

echo "################################################################"
echo "####             Install FileManager                        ####"
echo "################################################################"

# spacefm
yaourt -S udevil pmount curlftpfs jmtpfs gphotofs ifuse spacefm --noconfirm
# Thunar
yaourt -S thunar tumbler ffmpegthumbnailer raw-thumbnailer thunar-archive-plugin
yaourt -S xarchiver zip unzip unrar p7zip

echo "################################################################"
echo "################   FileManager installed   #####################"
echo "################################################################"
