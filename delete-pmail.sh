#!/bin/bash

# 检查是否以 root 权限运行
if [ "$EUID" -ne 0 ]; then
  echo "请以 root 用户运行此脚本。"
  exit 1
fi

# 删除定时任务
echo "删除定时任务..."
crontab -l | grep -v '/root/Pmail-selfuse/script.sh' | crontab -

# 终止相关进程
echo "终止 pmail 进程..."
pkill -f "pmail_linux_amd64 -p 80"

# 删除目录 /root/Pmail-selfuse
echo "删除目录 /root/Pmail-selfuse..."
rm -rf /root/Pmail-selfuse

# 完成
echo "操作完成。"
