# yum 离线包制作方法
> 背景： 一般客户现场都是离线环境无法连接外网，故需要制作离线安装软件rpm包，顺带要解决安装软件时所需要的依赖库
> yumdownloader和repotrack都是 yum-utils的一部分，所以在开始使用这些工具之前安装这个 rpm
## 安装yum-utils工具
- CentOS 7安装
[yum-utils RPM包下载](https://centos.pkgs.org/7/lux/yum-utils-1.1.31-46.el7.lux.noarch.rpm.html)
- 下载二进制包即可
`wget http://repo.iotti.biz/CentOS/7/noarch/yum-utils-1.1.31-46.el7.lux.noarch.rpm `
- 强制安装
rpm -ivh yum-utils-1.1.31-46.el7.lux.noarch.rpm  --nodeps   --force
> 参数解释：
> --nodeps: 安装时不检查依赖关系   
> --force: 强制安装
 
![image](https://user-images.githubusercontent.com/65467296/170030950-4aaa71f3-7762-44d4-bac0-810414b1817d.png)

> 解决方法有两种：
- 方法一：使用repotrack进行全量下载
## 

```bash
yum install yum-utils
repotrack glibc
# 参数说明：
    repotrack # 下载命令
    glibc     # 下载软件
```

- 方法二：
```bash
yumdownloader  --downloadonly --downloaddir=. glibc --resolve
# 参数说明：
    yumdownloader   # 下载命令
    --downloadonly  # 下载所有依赖库参数
    --downloaddir=/home/user/package # 下载依赖包的存储路径这个路径可以自定义
    glibc           # 需要下载的软件
    --resolve       # 解决依赖关系
```
