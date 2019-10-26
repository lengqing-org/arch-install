#! /bin/bash

echo '更新系统时间'
timedatectl set-ntp true

#分区&挂载
###

echo '编辑源'
cd /etc/pacman.d/
sed '1i Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch' mirrorlist >> lqmirl
mv lqmirl mirrorlist

echo '安装'
pacstrap /mnt base linux linux-firmware

echo '生成fstab'
genfstab -U /mnt >> /mnt/etc/fstab

echo '切换到新系统'
cd /mnt
wget -P /mnt/ https://raw.githubusercontent.com/lengqing-org/arch-install/master/arch-chroot.sh
chmod +x /mnt/arch-chroot.sh
arch-chroot /mnt /arch-chroot.sh
