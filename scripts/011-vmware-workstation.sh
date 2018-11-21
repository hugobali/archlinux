#!/bin/bash
set -e

echo "################################################################"
echo "####             Install Vmware Workstation                 ####"
echo "################################################################"


echo "" >> /etc/pacman.conf
echo "## Enable Repository for Vmware Workstation" >> /etc/pacman.conf
echo "[bpiotrowski]" >> /etc/pacman.conf
echo "Server = https://pkgbuild.com/~bpiotrowski/repo" >> /etc/pacman.conf

yaourt -S vmware-workstation linux-headers --noconfirm


echo "################################################################"
echo "##############  Vmware Workstation installed   ################"
echo "################################################################"
