#!/bin/bash

#     _    ____  
#    / \  / ___|   Arghya Sarkar
#   / _ \ \___ \   https://github.com/arghyagod-coder
#  / ___ \ ___) |  https://github.com/Calinix-Team
# /_/   \_\____/   https://get.calinix.tech

#################################################
## Get the Calinix Repositories in your system ##
#################################################

echo "Editing Pacman.conf"

echo "[calinix]
SigLevel = Optional TrustedOnly
Server = https://get.calinix.tech/calinix_repo/\$arch" >> /etc/pacman.conf

echo "The Calinix Repositories were added successfully to your system. \n\n Run pacman -Sy to update the repositories."