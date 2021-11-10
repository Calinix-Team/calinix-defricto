#!/bin/bash

#     _    ____  
#    / \  / ___|   Arghya Sarkar
#   / _ \ \___ \   https://github.com/arghyagod-coder
#  / ___ \ ___) |  https://github.com/Calinix-Team
# /_/   \_\____/   https://get.calinix.tech

#################################################
## Get the chaotic Repositories in your system ##
#################################################

echo "Fetching the latest Chaotic AUR Repositories"

echo "Fetching chaotic keys"
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

echo "Getting the latest chaotic mirrorlist"

pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
cp etc/pacman.d/chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist

echo "Adding chaotic-aur to pacman.conf"

echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

echo "The Calinix Repositories were added successfully to your system. \n\n Run pacman -Sy to update the repositories."