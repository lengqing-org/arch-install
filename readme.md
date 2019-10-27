# Arch Linux 安装脚本

我自己的 Arch Linux 安装脚本，不承担任何责任，不接受任何指责。

**此脚本目前仅适用于UEFI引导，并且在启动环境预先联网，需要联网使用。**

**使用前需要自行分区并将根分区挂载至/mnt目录，建立/mnt/boot目录并将EFI系统分区挂载到此目录。**

**脚本很不完善，但能放出来肯定能用，起码经历了Vmware Workstation下虚拟机里的测试。**

**脚本测试视频[https://www.bilibili.com/video/av73558292](https://www.bilibili.com/video/av73558292)**

### 用法

在Arch Linux Live CD中联网并挂载分区之后使用下面的命令开始安装

```shell
wget https://raw.githubusercontent.com/lengqing-org/arch-install/master/arch-install.sh
chmod +x arch-install.sh
./arch-install.sh
```
或者使用下面的一行命令
```shell
sh -c "$(wget https://raw.githubusercontent.com/lengqing-org/arch-install/master/arch-install.sh -O -)"
```

### 注

脚本内提示使用中文，tty不能正确显示中文的话可以使用能显示的ssh运行，例如使用Windows运行ssh

arch源的网络可能会出现问题，如果发生问题，要重新格式化根分区和EFI分区，再次运行脚本，否则直接重新运行脚本会再次出错中断

挂载分区出错也有可能会出现问题

脚本有可能会因为连接GitHub的网络问题而卡在下载chroot阶段脚本上，可以耐心等待一会儿

安装完成后会回到Live CD，可以自行配置，也可以直接使用reboot重启

