#!/bin/bash

# 赋予可执行权限
chmod +x /root/Pmail-selfuse/pmail_linux_amd64
cd /root/Pmail-selfuse

# 让用户输入端口号
read -p "请输入端口号 (默认 80): " PORT
PORT=${PORT:-80}  # 如果用户没有输入端口号，则使用80作为默认值

# 修改 delete-pmail.sh 和 script.sh 中的端口号
sed -i "s/pmail_linux_amd64 -p [0-9]\+/pmail_linux_amd64 -p $PORT/g" delete-pmail.sh
sed -i "s/pmail_linux_amd64 -p [0-9]\+/pmail_linux_amd64 -p $PORT/g" script.sh

# 运行程序
./pmail_linux_amd64 -p "$PORT"
