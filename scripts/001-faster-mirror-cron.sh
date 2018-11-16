#!/bin/bash
set -e

# reflector search fastest mirror around the world

echo "################################################################"
echo "####             Installing reflector                        ###"
echo "################################################################"

sudo pacman -S --noconfirm --needed reflector

echo "################################################################"
echo "####   Finding fastest servers be patient for the world      ###"
echo "################################################################"

sudo reflector --latest 100 --fastest 50 --age 24 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new \
&& sudo rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d

echo "################################################################"
echo "####   	Copy cron to daily folder                          ###"
echo "################################################################"

sudo cp files/mirrorlist /etc/cron.daily

echo "################################################################"
echo "####      List fastest server saved                          ###"
echo "################################################################"

cat /etc/pacman.d/mirrorlist
