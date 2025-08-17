#!/bin/bash

# 确保程序有执行权限
chmod +x /root/Pmail-selfuse/pmail_linux_amd64

# 复制 service 文件到 systemd
cp /root/Pmail-selfuse/pmail.service /etc/systemd/system/pmail.service

# 重新加载 systemd
systemctl daemon-reload

# 启动服务
systemctl start pmail

# 设置开机自启
systemctl enable pmail

# 查看运行状态
systemctl status pmail --no-pager -l
