#!/bin/bash

#     _    ____  
#    / \  / ___|   Arghya Sarkar
#   / _ \ \___ \   https://github.com/arghyagod-coder
#  / ___ \ ___) |  https://github.com/Calinix-Team
# /_/   \_\____/   https://get.calinix.tech

echo "#################################################"
echo '## Installing MS Office 2010 in Arch with WINE ##'
echo "## Remember this installs MSO10 and not latest ##"
echo "#################################################"

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

echo "#######################"
echo "Installing Yay"
echo "#######################"

git clone https://aur.archlinux.org/yay-bin.git
cd yay
makepkg -si

echo "#######################"
echo "Installing MS Fonts"
echo "#######################"

yay -S --noedit --noconfirm ttf-ms-fonts wine-mono

case $(uname -r) in

    "x86_64")
        echo "#################################################"
        echo "Installing dependencies for 64-bit machines"
        echo "#################################################"
        yay -S --noedit --noconfirm lib32-libwbclient lib32-mpg123 lib32-libxslt

esac


sudo pacman -S libxml2

echo "#################################################"
echo "Exporting WINE prefix to /etc/profile"
echo "#################################################"

sudo echo -e 'export WINEPREFIX="~/.msOffice"\nexport WINEARCH="win32"'>>/etc/profile

echo "
 #######################################################################################
 ##                               Configuring WINE                                    ##
 ##################################### | IMPORTANT | ###################################
 ##                         Wine Configuration Panel will now Open                    ##
 ## Click the Libraries tab of the config window, select riched20 and click Add.      ##
 ##      You may also need to add msxml3, msxml6 and gdiplus libraries too.           ##
 ##                          Then Click Apply, then click OK.                         ##
 #######################################################################################"

winecfg

echo "#################################################"
echo "Fetching MS Office 2010 Package"
echo "#################################################"

mkdir -p ms2010
cd ms2010
wget -O office.exe http://files.prowebmanagement.net/support/Office2010ProPlus/Office_Professional_Plus_2010_W32_English_X16-32250.exe
wine office.exe
