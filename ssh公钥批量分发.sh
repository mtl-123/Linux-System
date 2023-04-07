#!/bin/bash
# Author:
# 公钥分发脚本
# time: 2023-03-10

# 定义需要分发密钥的地址段
host_pre=10.0.0.
# 定义端口号
port=22
# 定义远程主机密码
password=vagrant

. /etc/init.d/functions
if [ ! -f ~/.ssh/id_rsa.pub ] ;then

ssh-keygen -f ~/.ssh/id_rsa -N ''|echo ''
fi

# 循环遍历
for ip in {100..105}
do
  echo  "===================== 主机 $host_pre$ip 开始分发公钥   ==================== "
  sshpass -p$password ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@$host_pre$ip -p $port "-o StrictHostKeyChecking=no" &>/dev/null
  if [ $? -eq 0 ] ; then
    action "主机 $host_pre$ip 分配" /bin/true
    echo ""
  else
    action "主机 $host_pre$ip 分配" /bin/false
    echo "==================== 主机 $host_pre$ip 已分发完公钥   ==================== "
    echo ""
  fi
done
