
if [ `id -u` = "0" ]; then
    echo ""
else
    echo "You must be root to run this script."
    exit 1
fi

echo "Please choose the desktop you want install:"
echo "1. KDE"
echo "2. xfce"
echo "3. Gnome"
echo "4. mate"
echo "5. Budgie"

read -p "Please input your choice(1-5, default=1): " desktop

if [ "$desktop" = "" ]; then
    desktop = "1"
fi

if [ "$desktop" != "1" -a "$desktop" != "2" -a "$desktop" != "3" -a "$desktop" != "4" -a "$desktop" != "5" ]; then
    echo "Error: Please input 1, 2, 3, 4, 5"
    exit 1
fi

echo "Did you installed xorg? (y/n)"
read xg

if [ "$xg" = "" ]; then
    xg = "y"
fi

if [ "$xg" != "y" -a "$xg" != "n" ]; then
    echo "Error: Please input y or n"
    exit 1
fi

if [ "$xg" = "n" ]; then
    pacman -S xorg xorg-xinit xorg-server xterm
fi

if [ "$desktop" = "1" ]; then
    pacman -S plasma kde-applications sddm
elif
    [ "$desktop" = "2" ]; then
    pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
elif
    [ "$desktop" = "3" ]; then
    pacman -S gnome gnome-extra gdm
elif
    [ "$desktop" = "4" ]; then
    pacman -S mate mate-extra lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
elif
    [ "$desktop" = "5" ]; then
    pacman -S budgie-desktop lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
fi

echo "Did you want to start the desktop now? (y/n)"
read isstart

if [ "$isstart" = "" ]; then
    isstart = "y"
fi

if [ "$isstart" != "y" -a "$isstart" != "n" ]; then
    isstart = "n"
fi

if [ "$isstart" = "y" ]; then
    if [ "$desktop" = "1" ]; then
        systemctl enable sddm
        systemctl start sddm
    elif
        [ "$desktop" = "2" ]; then
        systemctl enable lightdm
        systemctl start lightdm
    elif
        [ "$desktop" = "3" ]; then
        systemctl enable gdm
        systemctl start gdm
    elif
        [ "$desktop" = "4" ]; then
        systemctl enable lightdm
        systemctl start lightdm
    elif
        [ "$desktop" = "5" ]; then
        systemctl enable lightdm
        systemctl start lightdm
    fi
fi
