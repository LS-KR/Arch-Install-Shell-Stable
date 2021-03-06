
echo "n
p
1
2048
1310720
n
p
2
1312768

w" | fdisk /dev/sda

mkfs.vfat /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt

pacman -Syy
pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr dosfstools vim git wget curl openssh networkmanager network-manager-applet dhcpcd intel-ucode os-prober xf86-video-intel xf86-video-ati xf86-video-vmware xf86-video-vesa 
genfstab -U /mnt >> /mnt/etc/fstab

echo "en_US.UTF-8 UTF-8" >> /mnt/etc/locale.gen
echo "LANG=en_US.UTF-8" >> /mnt/etc/locale.conf

echo "ArchLinux" > /mnt/etc/hostname
echo "127.0.0.1 localhost" >> /mnt/etc/hosts
echo "::1 localhost" >> /mnt/etc/hosts
echo "127.0.1.1 ArchLinux.localdomain ArchLinux" >> /mnt/etc/hosts

echo "
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

bash locale-gen" | arch-chroot /mnt
echo "passwd
root
root" | arch-chroot /mnt

dmesg | grep -q 'EFI v'
if [ $? -eq 0 ]; then
    mount -t vfat /dev/sda1 /mnt/boot
    echo "grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub_uefi" | arch-chroot /mnt
else
    echo "grub-install /dev/sda" | arch-chroot /mnt
fi
echo "grub-mkconfig -o /boot/grub/grub.cfg" | arch-chroot /mnt

echo "Done!"
echo "Your Password is \"root\"."
echo "Umounting..."
umount -R /mnt
echo "Now You Can Reboot Your System."