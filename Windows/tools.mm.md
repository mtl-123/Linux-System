# Windows 系统工具推荐

[TOC]

---

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
