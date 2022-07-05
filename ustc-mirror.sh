
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
rm -rf /etc/pacman.d/mirrorlist
echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist.backup >> /etc/pacman.d/mirrorlist
rm -rf /etc/pacman.d/mirrorlist.backup
pacman -Syy