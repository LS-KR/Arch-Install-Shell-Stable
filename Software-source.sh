
echo "[archlinuxcn]" >> /etc/pacman.conf
echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
echo "" >> /etc/pacman.conf

#echo "[Clansty]" >> /etc/pacman.conf
#echo "SigLevel = Never" >> /etc/pacman.conf
#echo "Server = https://repo.lwqwq.com/archlinux/\$arch" >> /etc/pacman.conf
#echo "Server = https://pacman.ltd/archlinux/\$arch" >> /etc/pacman.conf
#echo "Server = https://repo.clansty.com/archlinux/\$arch" >> /etc/pacman.conf
#echo "" >> /etc/pacman.conf

pacman -Syy
pacman -S --noconfirm archlinuxcn-keyring
