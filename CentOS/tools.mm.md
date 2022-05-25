# yum 离线包制作方法
> 背景： 生产环境由于安全原因处于断网状态，故需要制作离线软件rpm包，顺带要解决安装软件时所有需要的依赖库
> 推荐两个工具 **yumdownloader** 和**repotrack**都是 yum-utils的一部分，所以在制作之前需要安装这个工具。

[制作离线库资料](https://www.golinuxcloud.com/download-rpm-package-and-all-dependencies-centos/)

## 查询需要安装的软件依赖关系

- 在线查询需安装的软件所有依赖包

`yum deplist nvidia-docker2`

`rpm -qR nvidia-docker2 `

## 安装yum-utils工具

- CentOS 7安装

[yum-utils RPM包下载](https://centos.pkgs.org/7/lux/yum-utils-1.1.31-46.el7.lux.noarch.rpm.html)
- 下载二进制包即可

`wget http://repo.iotti.biz/CentOS/7/noarch/yum-utils-1.1.31-46.el7.lux.noarch.rpm `

- 强制安装
`rpm -ivh yum-utils-1.1.31-46.el7.lux.noarch.rpm  --nodeps   --force`

> 参数解释：
+ --nodeps: 安装时不检查依赖关系   --force: 强制安装
![image](https://user-images.githubusercontent.com/65467296/170030950-4aaa71f3-7762-44d4-bac0-810414b1817d.png)

> 解决方法有两种：
- 方法一：使用repotrack进行全量下载

```bash
repotrack nvidia-docker2

# 参数说明：
    + repotrack # 下载的命令
    + glibc     # 需下载的软件
# 下载的所有离线软件包目录下使用下面命令遍历安装
for i in `ls`;do rpm -Uvh $i --nodeps   --force;done
```

- 方法二：
```bash
# 使用方法一
yumdownloader --destdir=./ --assumeyes --resolve nvidia-docker2
# 使用方法二
yumdownloader  --downloadonly --downloaddir=. nvidia-docker2 --resolve
# 参数说明：
    + yumdownloader   # 下载命令
    + --downloadonly  # 下载所有依赖库参数
    + --downloaddir=. # 依赖包的存储路径这个路径可以自定义
    + glibc           # 需要下载的软件
    + --resolve       # 下载依赖的rpm包
# 使用 localinstall 命令自动安装处理依赖关系（貌似无法自动解决依赖关系）
`yum localinstall *.rpm -y`
```
