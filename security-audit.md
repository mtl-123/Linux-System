# Linux 安全审计工具

## Lynis

[Lynis](https://mp.weixin.qq.com/s/ToBF9SgcFr-njrwS5fT6wQ)

```bash
mkdir /usr/local/lynis
cd /usr/local/lynis/
wget https://downloads.cisofy.com/lynis/lynis-3.0.0.tar.gz
tar xvf lynis-3.0.0.tar.gz 
cd lynis
# 开始审计并查找漏洞
# 执行本地安全扫描，所以使用audit system参数来扫描整个系统。运行下面的命令来启动对整个系统的审计：
./lynis audit system
# 或者
./lynis audit system --wait 
# --wait选项：等待用户按回车键显示下一节的报告。

# 有时我们不想扫描或审计整个系统的应用程序或服务，所以我们可以按类别审计自定义应用程序。我们可以先列出所有的组，然后选择需要审计或扫描的组。
./lynis show groups
```
