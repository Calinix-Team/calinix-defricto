#!/bin/bash

#     _    ____  
#    / \  / ___|   Arghya Sarkar
#   / _ \ \___ \   https://github.com/arghyagod-coder
#  / ___ \ ___) |  https://github.com/Calinix-Team
# /_/   \_\____/   https://get.calinix.tech

echo "#####################################################"
echo '##    Installing Photoshop CC in Arch with WINE    ##'
echo "## Remember this installs Photoshop CC and not CS6 ##"
echo "#####################################################"
echo ""
echo "############################################
# This script uses project of Gictorbit to #
#  install Photoshop CC V19 on Arch Linux  #
############################################"

echo "#####################"
echo "## Getting Ready.. ##"
echo "#####################"

sudo pacman -Sy
sudo pacman -S base-devel git wget

echo "#################################################"
echo "Enabling Multilib repositories"
echo "#################################################"

sudo echo "[multilib]
Include = /etc/pacman.d/mirrorlist">>/etc/pacman.conf

echo "#################################################"
echo "Installing WINE and dependencies"
echo "#################################################"

sudo pacman -S --needed icoutils libwbclient libxslt lib32-mpg123 p11-kit lib32-p11-kit samba wine winetricks wine-mono wine_gecko --noconfirm

echo "#################################################"
echo "Cloning Git Repository"
echo "#################################################"

git clone https://github.com/Gictorbit/photoshopCClinux
cd photoshopCClinux/

echo "##################################################"
echo "Executing the Setup Script"
echo "Make sure to read the messages from the execution"
echo "##################################################"

chmod +x setup.sh
./setup.sh

echo "#################################################"
echo "Finished Installing"
echo "#################################################"
