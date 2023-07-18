#!/usr/bin/env bash

USER="$1"
BACKGROUND="$2"
LOCKSCREEN="$3"
#BACKGROUND="https://filebin.net/kndcvsje2oss6kqu/05-upscaled-scale-2_00x__1_.png"
#LOCKSCREEN="https://filebin.net/kndcvsje2oss6kqu/turtle.png"

function setBackground(
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
    var allDesktops = desktops();
    print (allDesktops);
    for (i=0;i<allDesktops.length;i++) {{
        d = allDesktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                     "org.kde.image",
                                     "General");
        d.writeConfig("Image", "file:///home/'"$USER"'/backlock/$(basename "$BACKGROUND")")
    }}
'
)


sudo apt install kde-plasma-desktop
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.github.iwalton3.jellyfin-media-player
flatpak install -y flathub com.nordpass.NordPass
flatpak install -y flathub com.github.debauchee.barrier
cd ~$USER/
mkdir backlock
cd backlock
wget $LOCKSCREEN
wget $BACKGROUND
setBackground
usermod -aG sudo $USER
shutdown -r 0
