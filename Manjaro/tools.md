[flatpak 包管理器 ](https://wiki.archlinux.org/title/Flatpak_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

[fcitx5 安装 ](https://pikakolendo.hatenablog.com/entry/2021/02/08/linux_mint_20.1%EF%BC%88%E5%9F%BA%E4%BA%8EUbuntu_20.04_LTS%EF%BC%89%E5%AE%89%E8%A3%85%E6%AD%A3%E5%BC%8F%E7%89%88fcitx5%EF%BC%88flatpak%EF%BC%89)

[warpinator:跨局域网共享文件](https://blog.csdn.net/weixin_39584405/article/details/111620613)


# 升级软件包
`pacman -Syu `

# 安装包

`pacman -S gnome`

# 安装debtap（转换deb工具）

```bash
sudo pacman -S  yay
yay -S debtap
# 更新debtap数据库
debtap -u
# 转换deb包
debtap -q 安装包.deb
# 执行安装
yay -U 安装包.pkg.tar.xz
```
```
$ sudo pacman -S xdg-user-dirs-gtk
$ export LANG=en_US
$ xdg-user-dirs-gtk-update
$ #然后会有个窗口提示语言更改，更新名称即可
$ export LANG=zh_CN.UTF-8
$ #然后重启电脑如果提示语言更改，保留旧的名称即可
```

# 安装Fcitx5 输入法

[Fcitx5配置文档](https://www.modb.pro/db/113512)
>如果安装Fcitx5之前你的系统已经安装了fcitx4输入法，请先卸载fcitx4，否则直接跳过该步骤，执行安装命令。

> 卸载命令如下：
`sudo pacman -Rs $(pacman -Qsq fcitx)`
>解释：$(pacman -Qsq fcitx) 通过 pacman 命令查找所有fcitx相关软件包。
>安装命令如下：

`sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki kcm-fcitx5 fcitx5-pinyin-zhwiki fcitx5-im `

>中默认包含了 fcitx5，fcitx5-configtool，fcitx5-gtk，fcitx5-qt。
fcitx5:新一代的fcitx输入法框架
fcitx5-configtool：fcitx5 配置工具
fcitx5-qt：对 Qt 程序的支持
fcitx5-gtk：对 GTK 程序的支持
fcitx5-chinese-addons 包含了大量中文输入方式：拼音、双拼、五笔拼音、自然码、仓颉等
kcm-fcitx5：KDE桌面环境支持
fcitx5-pinyin-zhwiki: 根据中文维基百科创建的词库，适用于拼音输入法

# 配置Fcitx5   
> 如果要在应用程序中使用Fcitx5输入法，需要设置以下的环境变量。打开或创建文件 `~/.pam_environment`，在其编辑内容如下：

```bash
# 更改英文目录
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
INPUT_METHOD  DEFAULT=fcitx
SDL_IM_MODULE DEFAULT=fcitx
```

> **最后那行 SDL_IM_MODULE 是为了让一些使用特定版本 SDL2 库的游戏，比如 Dota2 能正常使用输入法。**下一步将Fcitx5配置成开机自动启动模式，执行以下命令即可：

`sudo cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/`

```bash
sudo pacman-mirrors -i -c China -m rank
sudo pacman-mirrors -g
sudo pacman -Syyu
sudo pacman -S archlinuxcn-keyring
sudo pacman -S antergos-keyring

sudo pacman -S yay
sudo yay -S google-chrome
yay -S gitkraken
yay -S aria2
yay -S uget
yay -S p7zip file-roller unrar
yay -S typora
yay -S visual-studio-code-bin
yay -S foxitreader

截图工具： `flatpak install Flameshot`

微信安装: `wget -O- https://deepin-wine.i-m.dev/setup.sh | sh`
```
## 安装向日葵
```bash
yay -Sy sunloginclient
systemctl start runsunloginclient.service
systemctl enable runsunloginclient.service
```
#  安装微信
```bash
sudo snap install electronic-wechat
	
sudo snap remove electronic-wechat
```
