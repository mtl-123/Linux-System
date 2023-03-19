# ubuntu系统软件版本降级方法
- 原来kubelet版本为1.25.1降级为1.18.5
  - --allow-downgrades为降级的参数   
`sudo apt-get install --allow-downgrades  kubelet=1.18.5-00`

# 解决重启系统后终端字体白色和无法自动补全问题
```bash
打开 vim ~/.bashrc

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
. /etc/bash_completion
fi
```

# 把网页链接创建成桌面图标程序的方法如下

```bash
vim YouTube.desktop
#添加如下内容
[Desktop Entry]
Version=1.0
Name=YouTube
Comment=Access YouTube search engine
Exec=/usr/bin/google-chrome -url https://youtube.com/
Icon=/home/m/YouTube.png
Terminal=false
Type=Application
Categories=Internet;

```


# 制作离线deb安装包

- 查看依赖：

`apt-cache depends XXX`

-下载 deb 依赖包

` apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances --no-pre-depends XXX | grep -v i386 | grep "^\w")
`

-  使用dpkg命令进行离线安装：

`dpkg -i *.deb`


# ubuntu 21.04 apt软件源地址

```bash
cat > /etc/apt/sources.list << EOF
deb http://old-releases.ubuntu.com/ubuntu/ hirsute main restricted
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-updates main restricted
deb http://old-releases.ubuntu.com/ubuntu/ hirsute universe
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-updates universe
deb http://old-releases.ubuntu.com/ubuntu/ hirsute multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-updates multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-backports main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu hirsute-security main restricted
deb http://old-releases.ubuntu.com/ubuntu hirsute-security universe
deb http://old-releases.ubuntu.com/ubuntu hirsute-security multiverse
EOF
sudo apt update 
```



# 常用工具
[Linux命令安装方式查询：](https://command-not-found.com/)

[Linux命令使用方法：](https://wangchujiang.com/linux-command/)
## 软件包管理工具

[apt-get 命令的使用：](https://ipcmen.com/apt-get)

[snap仓库](https://snapcraft.io/)

`sudo snap install snap-store`

[snap 命令的使用：](https://ipcmen.com/snap)

# Centos8 包管理工具
[dnf 命令的使用：](https://wangchujiang.com/linux-command/c/dnf.html)

[dnf 命令的使用：](https://www.jianshu.com/p/2cdf7b362311)


```bash
sudo apt-get install \
deepin-terminal \
remmina \
aria2 \
vlc-bin \
openssh-server \
flameshot \
p7zip-full \
okular \ 
lrzsz \ -y

```

```bash
sudo add-apt-repository ppa:noobslab/deepin-sc
sudo apt-get update
sudo apt-get install  -y dbeaver 
```

## 解决终端字体、目录白色问题
```bash
vim ~/.bashrc 

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
   alias dir='dir --color=auto'
   alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

```
# 查看linux系统详细版本号 推荐工具

`sudo apt install -y screenfetch`
# Shell 历史记录工具 Atuin
[Atuin文档](https://github.com/ellie/atuin/blob/main/docs/zh-CN/README.md)
```bash
# 不要以root身份运行，如果需要的话，会要求root。
bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)

curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

echo '[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh' >> ~/.bashrc
echo 'eval "$(atuin init bash)"' >> ~/.bashrc
# 使用示例
# 搜索昨天下午3点之后记录的所有成功的 `make` 命令
atuin search --exit 0 --after "yesterday 3pm" make
```
