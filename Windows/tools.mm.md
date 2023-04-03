# Windows 系统工具推荐

[TOC]

---
## Windows 10专业版激活密钥

一、手动激活方式
- 系统激活设置-> 更换产品密钥->输入密钥

`2X7P3-NGJTH-Q9TJF-8XDP9-T83GT` 永久激活

- 查看是否永久激活
- win+r 运行框中输入  "slmgr.vbs -xpr" 回车

![image](https://user-images.githubusercontent.com/65467296/184781520-2e797c8f-ea57-4fd9-81c7-feb497bd5749.png)

二、脚本激活方式

slmgr.vbs/upk
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX 
slmgr /skms kms8.msguides.com
slmgr /ato 

## office 2016 专业增强版本key

`XNTT9-CWMM3-RM2YM-D7KB2-JB6DV`

激活步骤
1、安装office套件后
使用搜索工具找到Office16文件夹位置

![image](https://user-images.githubusercontent.com/65467296/185039819-cab5f56f-7168-4b91-aca9-9eec78a41e3e.png)

使用管理员命令行进入office16文件夹下并执行一下命令
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99
cscript ospp.vbs /sethst:kms.03k.org
cscript ospp.vbs /act
cscript ospp.vbs /dstatus
[参考文档](https://www.cnblogs.com/zenghongfei/p/13595797.html)

- 解压缩工具：[7-zip](https://www.7-zip.org/)
- ImageGlass: [ImageGlass](https://github.com/d2phap/ImageGlass)
- utools: [utools](https://www.u.tools/)
- Everything: [Everything](https://www.voidtools.com/)
- Wox: [Wox](http://www.wox.one/)
- 程序卸载工具: [geek](https://geekuninstaller.com/)
- 火绒：[火绒](https://www.huorong.cn/)
- quicker：[quicker](http://getquicker.net/)
- VLC: [VLC](https://github.com/videolan/vlc)
- Neat: [Neat](https://github.com/thoughtbot/neat)
- IDM：[IDM]()
- Clover:[Clover](https://clover.en.softonic.com/)
- QucikLook：[QucikLook]()
- Notepads: [Notepads](https://github.com/0x7c13/Notepads/releases)
- CCleaner Free: [CCleaner Free]()
- cmder[cmder](https://cmder.net/)
- 截图工具：[Snipaste](https://www.snipaste.com/)
- 牛片网:[牛片网](https://www.6pian.cn/)
- 文件快速整理工具: [DropIt](http://www.dropitproject.com/)
- 文件检索工具: [AnyTXT Searcher](https://anytxt.net/)
- 文件分享工具:[Wormhole](https://wormhole.app/)
- 图标快速生成工具: [ChartCube](https://chartcube.alipay.com/)
- B站视频下载工具：[BBDown](https://github.com/nilaoda/BBDown)
- B站图形化视频下载工具：[B23Downloader](https://github.com/vooidzero/B23Downloader)
- [桌面整理独立版](https://webcdn.m.qq.com/DeskGo/DeskGo_3_2_1445_127_lite.exe)
# VPN
- shadowsocksr
```bash
cat >> docker-compose.yml <<'EOF'
version: '2'
services:
  ssr:
    image: breakwa11/shadowsocksr
    container_name: ssr
    environment:
      - SERVER_ADDR=0.0.0.0
      - SERVER_PORT=8388
      - PASSWORD=gcssr123./
      - METHOD=aes-256-cfb
      - OBFS=tls1.2_ticket_auth
      - PROTOCOL=auth_sha1_v4
    ports:
      - "8388:8388"
EOF
```
- ipsec-server-vpn

```bash
cat >>docker-compose.yml <<'EOF'
version: '2'
services:
  vpn:
    image: hwdsl2/ipsec-vpn-server
    restart: always
    env_file:
      - ./vpn.env
    ports:
      - "500:500/udp"
      - "4500:4500/udp"
    privileged: true
    hostname: ipsec-vpn-server
    container_name: ipsec-vpn-server
    volumes:
      - /lib/modules:/lib/modules:ro
EOF 
```
```bash
cat >> vpn.env  <<'EOF'
```bash 
VPN_IPSEC_PSK=Im2018@sight
VPN_USER=smore
VPN_PASSWORD=smartmore
EOF
```
# Windows 命令行安装工具
- 国内安装源
`iwr -useb https://gitee.com/glsnames/scoop-installer/raw/master/bin/install.ps1 | iex`

## Windows office 激活工具
[云萌](https://cmwtat.cloudmoe.com/cn.html)
## 磁盘分析工具
WizTree
## 自动关机工具
autooff
我的ABC软件工具箱
Windows 超级管理工具
Quicker

## 命令清楚系统垃圾

[cleanmgr](https://www.hdd-tool.com/zh-TW/windows-11/disk-cleanup-on-c-drive.html)

##  windows 命令查看WiFi密码方法
- 中间的 "360-5G" 是要查询的WiFi名称 
- 打开系统的cmd窗口输入一下命令即可
 wlan show profile name = "360-5G" key=clear
