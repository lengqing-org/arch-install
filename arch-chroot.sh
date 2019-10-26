#! /bin/bash

echo '设置时区'
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

echo '调整硬件时间'
hwclock --systohc

echo '本地化'
cd /etc
sed '1i zh_CN.UTF-8 UTF-8' locale.gen >> lqlcl
mv lqlcl locale.gen
sed '1i zh_TW.UTF-8 UTF-8' locale.gen >> lqlcl
mv lqlcl locale.gen
locale-gen
echo 'LANG=C' > /etc/locale.conf

echo '设置主机名'
echo 'arch' > /etc/hostname
echo '127.0.1.1 arch.localdomain arch' > /etc/hosts
sed '1i ::1 localhost.localdomain localhost' /etc/hosts >> /etc/lqhsts
mv /etc/lqhsts /etc/hosts
sed '1i 127.0.0.1 localhost.localdomain localhost' /etc/hosts >> /etc/lqhsts
mv /etc/lqhsts /etc/hosts

#echo #Intel安装ucode
###

echo '安装grub引导'
pacman -S os-prober grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --removable
grub-mkconfig -o /boot/grub/grub.cfg

echo '看一下啥电脑'
pacman -S screenfetch  --noconfirm
screenfetch

echo '安装完成,请输入root密码'
passwd root

echo '回到Live CD'
exit

