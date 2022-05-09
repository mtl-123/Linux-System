# Linux-System

Linux命令网络配置工具network-manager非常方便，默认没有安装
ubuntu安装方法
apt-get install network-manager
# arch、manjaro 安装方法
manjaro 没有networkmanager 安装源 需要使用其他工具包安装方法如下：
```bash
Enable snapd
Snapd can be installed from Manjaro’s Add/Remove Software application (Pamac), found in the launch menu. From the application, search for snapd, select the result, and click Apply.

Alternatively, snapd can be installed from the command line:

sudo pacman -S snapd
Once installed, the systemd unit that manages the main snap communication socket needs to be enabled:

sudo systemctl enable --now snapd.socket
To enable classic snap support, enter the following to create a symbolic link between /var/lib/snapd/snap and /snap:

sudo ln -s /var/lib/snapd/snap /snap
Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.

Install network-manager
To install network-manager, simply use the following command:

sudo snap install network-manager
```
sudo pacman -S networkmanager
# 用法
# 配置静态ip地址

nmcli connection modify < your network name > ipv4.addresses 192.168.100.69/24 ipv4.gateway 192.168.100.1 ipv4.dns 10.80.36.6 ipv4.method manual

# 载入配置文件
sudo nmcli connection reload

# 设置为自动启动网卡(ONBOOT=yes)
sudo nmcli connection modify eno1 connection.autoconnect yes
# 设置为DHCP自动获取IP地址
sudo nmcli connection modify eth0 ipv4.method auto

