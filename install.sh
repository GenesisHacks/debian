#!/usr/bin/env bash

OPTION="$1"
USER="$2"
#BACKGROUND="$3"
#LOCKSCREEN="$4"
BACKGROUND="https://filebin.net/kndcvsje2oss6kqu/05-upscaled-scale-2_00x__1_.png"
LOCKSCREEN="https://filebin.net/kndcvsje2oss6kqu/turtle.png"

if [$OPTION = "-h"]
echo "Usage: ./install -r username backgroundURL lockscreenURL"
exit 0
fi

if [$OPTION = "-r"]
apt-get -y install kde-plasma-desktop
apt-get -y install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.github.iwalton3.jellyfin-media-player
flatpak install -y flathub com.nordpass.NordPass
cd /home/$USER/
mkdir backlock
cd backlock
wget $LOCKSCREEN
wget $BACKGROUND
cd /home/$USER/
wget "https://raw.githubusercontent.com/GenesisHacks/debian/main/bg.sh"
#setBackground
usermod -aG sudo $USER
shutdown -r 0
fi
