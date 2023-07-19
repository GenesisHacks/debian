
option="$1"
bgPath="$2"


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
        d.writeConfig("Image", "file:///"'$bgPath'")
    }}
'
)

setBackground

if [$option  "-h" ] ; then
echo "Usage: ./setbg.sh -s [filepath]"
exit 0
fi
if [$option  "-s" ] ; then 
setBackground
exit 0
fi
