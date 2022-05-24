# Linux-System

# 获取网卡ip地址：

```bash
ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
```

Linux命令网络配置工具network-manager非常方便，默认没有安装

# ubuntu安装方法#

`sudo apt-get install network-manager`

# arch、manjaro 安装方法

- manjaro 没有networkmanager 安装源 需要使用其他工具包安装方法如下：

- manjaro 安装snap包管理工具

[snap](https://snapcraft.io/install/network-manager/manjaro)

```bash
启用Snapd。
Snapd可以从Manjaro的添加/删除软件应用程序(Pamac)安装，该应用程序可以在启动菜单中找到。
从应用程序中搜索Snapd，选择结果，然后单击应用。
或者，也可以从命令行安装Snapd： 

`sudo pacman -S snapd`

一旦安装，管理主snap通信套接字的systemd单元需要启用:

`sudo systemctl enable --now snapd.socket`

要启用经典的snap支持，输入以下命令在/var/lib/snap /snap和/snap之间创建一个符号链接:

`sudo ln -s /var/lib/snapd/snap /snap`

退出并重新登录，或者重新启动系统，以确保snap的路径被正确更新。

安装网络管理者
要安装网络管理器，只需使用以下命令:

`sudo snap install network-manager`

```

# 用法

# 配置静态ip地址

`nmcli connection modify < your network name > ipv4.addresses 192.168.100.69/24 ipv4.gateway 192.168.100.1 ipv4.dns 10.80.36.6 ipv4.method manual`

# 载入配置文件

`sudo nmcli connection reload`

# 设置为自动启动网卡(ONBOOT=yes)

`sudo nmcli connection modify eno1 connection.autoconnect yes`

# 设置为DHCP自动获取IP地址

`sudo nmcli connection modify eth0 ipv4.method auto`

# 查看所有网络信息

`sudo nmcli device show`
