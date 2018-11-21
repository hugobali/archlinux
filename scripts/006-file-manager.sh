#!/bin/bash
set -e

echo "################################################################"
echo "####             Install FileManager                        ####"
echo "################################################################"

yaourt -S udevil pmount curlftpfs jmtpfs gphotofs ifuse spacefm --noconfirm
yaourt -S xarchiver zip unzip unrar p7zip

echo "################################################################"
echo "################   FileManager installed   #####################"
echo "################################################################"
