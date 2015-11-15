#!/bin/sh
set -e  # 异常时退出脚本
set -x  # 打印执行语句
# 首先备份/etc/yum.repos.d/CentOS-Base.repo
if [ -e "/etc/yum.repos.d/CentOS-Base.repo" ]; then
  mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
fi
# 进入yum源配置文件所在文件夹
cd /etc/yum.repos.d/
# 下载163的yum源配置文件，放入/etc/yum.repos.d/(操作前请做好相应备份)
wget http://mirrors.163.com/.help/CentOS7-Base-163.repo
# 运行yum makecache生成缓存
yum makecache
# 更新系统
yum -y update
