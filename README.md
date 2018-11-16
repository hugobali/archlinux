# Install and configure Arch Linux and UEFI

## Pre-Installation
  
#### Copy ISO to USB

##### Linux

```bash
dd if=archlinux.iso of=/dev/sdX bs=16M && sync
```

##### Windows

* [Rufus](https://rufus.akeo.ie/) 

#### Keyboard layout

```bash
loadkeys es
```

List `/usr/share/kbd/keymaps/**/*.map.gz`

#### Verify the boot mode

```
# ls /sys/firmware/efi/efivars
```

#### Connect to the Internet

```bash
wifi-menu
dhcpcd wlp3s0
ping -c 3 www.google.com
```

#### Update the system clock

```bash
timedatectl set-ntp true
timedatectl status
```

#### Partition the disks

```bash
> $ lsblk                                                                                                                                                                                  
NAME               MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                  8:0    0 931.5G  0 disk 
└─sda1               8:1    0 931.5G  0 part /home
sr0                 11:0    1  1024M  0 rom  
nvme0n1            259:0    0 238.5G  0 disk 
├─nvme0n1p1        259:1    0   300M  0 part /boot/efi
├─nvme0n1p2        259:2    0   300M  0 part /boot
└─nvme0n1p3        259:3    0 237.9G  0 part 
  ├─vglinux-lvswap 254:0    0     8G  0 lvm  [SWAP]
  └─vglinux-lvroot 254:1    0    60G  0 lvm  /
```

| Partition | Type | Size | Description |
| ---- | ---- |  ---- | ---- |
| nvme0n1p1 | EFI System (ef00)  | 300 MB | EFI |
| nvme0n1p2 | Boot 				 | 300 MB | Boot |
| nvme0n1p3 | Linux LVM (8e00) 	 | 230 GB | LVM Partition |
| sda1 		| Linux Home		 | 1 TB   | Home Disk |



##### Create LVM

```bash
pvcreate /dev/nvme0n1p3
pvdisplay 
vgcreate vglinux /dev/nvme0n1p3
vgdisplay
lvcreate -n lvroot -L 40G vglinux
lvcreate -n lvswap -L 8G vglinux
lvdisplay
```

##### Format Partitions


```bash
mkfs.fat -F32 /dev/nvme0n1p1		# EFI
mkfs.ext4	/dev/nvme0n1p2			# Boot
mkswap /dev/mapper/vglinux-lvswap
mkfs.ext4 /dev/mapper/vglinux-lvroot
mkfs.ext4 /dev/sda1
```

##### Mount Partitions

```bash
mount /dev/mapper/vglinux-lvroot /mnt  # /mnt for install the system
swapon /dev/mapper/vglinux-lvswap
mkdir -p /mnt/boot/efi
mkdir -p /mnt/home
mount /dev/nvme0n1p2 /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot/efi
mount /dev/sda1   /mnt/home
lsblk
```


## Installation

#### Faster Mirrors

```bash
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
rankmirrors -n 20 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
```

#### Install Base system

```bash
pacstrap /mnt base base-devel
```

#### Create /etc/fstab

```bash
genfstab -pU /mnt >> /mnt/etc/fstab
```
`/tmp`  on ramdisk

```conf
tmpfs	/tmp	tmpfs	defaults,noatime,mode=1777	0	0
```

#### New System

```bash
arch-chroot /mnt /bin/bash
```

#### Configure time zone and clock

```bash
ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime
hwclock --systohc
```

#### Set Locale

```bash
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo LANG=es_CO.UTF-8 >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf
echo LC_ALL=C >> /etc/locale.conf
```

#### Hostname

```bash
echo nombre_maquina > /etc/hostname
```

#### Networking

```bash
wifi-menu
```

#### Install Initial Pkgs

```
pacman -S zsh vim git efibootmgr dialog wpa_supplicant
```

#### Initramfs

Edit `/etc/mkinitcpio.conf`  and add `lvm2` between block and filesystems

```conf
HOOKS="base udev ... block lvm2 filesystems"
```

Rebuild initramfs image

```
mkinitcpio -p linux
```

#### Boot Loader

```
bootctl install
```

Create file `/boot/loader/entries/arch.conf`

```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root= /dev/mapper/vglinux-lvroot rw
```

Update default file `/boot/loader/loader.conf`

```
timeout 2
default arch
```

#### Password

```bash
passwd
```

#### Exit chroot

```
# exit
```

#### Unmount partitions

```
# umount -R /mnt
# swapoff -a
```

#### Restart machine

```bash
reboot
```


## Post-Installation


#### Create user, install and configure SUDO

```bash
useradd -m -g users -G wheel -s /bin/bash USER
```

```
pacman -S sudo
```

Run `visudo` to edit `/etc/sudoers` file

```
## Same thing without a password
%wheel ALL=(ALL) NOPASSWD: ALL
```

#### Enable options in `/etc/pacman.conf`

```bash
sed -i 's/#Color/Color/g' /etc/pacman.conf
```

Enable multilib repository

```bash
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
```

Enable yaourt repository

```bash
echo "" >> /etc/pacman.conf
echo "## Enable Repository for yaourt" >> /etc/pacman.conf
echo "[archlinuxfr]" >> /etc/pacman.conf\
echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/x86_64" >> /etc/pacman.conf
```

Install yaourt

```
pacman -Sy yaourt
```

## References

* [Guía Linux Arch](https://wiki.archlinux.org/index.php/Installation_Guide)
* https://github.com/dmazine/arch-linux-install

