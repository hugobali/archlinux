#!/bin/bash
set -e

echo "################################################################"
echo "####                 Install Games                          ####"
echo "################################################################"

yaourt -S nexuiz chromium-bsu snes9x-gtk xf86-input-joystick qjoypad  --noconfirm
yaourt -S zsnes crack-attack nexuiz chromium-bsu  playonlinux gbrainy --noconfirm

echo "################################################################"
echo "##############       Games installed           #################"
echo "################################################################"
