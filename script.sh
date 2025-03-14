#!/bin/bash

# 检查是否已有 pmail_linux_amd64 进程
if ! pgrep -f "pmail_linux_amd64 -p 80" > /dev/null; then
    echo "Restarting mail server..."

    # 终止旧的 screen 会话（如果存在）
    screen -S pmail_session -X quit

    # 终止旧进程，确保干净启动
    pkill -f "pmail_linux_amd64 -p 80"
    sleep 1

    # 启动新的 screen 会话
    screen -dmS pmail_session /root/Pmail-selfuse/pmail_linux_amd64 -p 80
else
    echo "pmail_linux_amd64 is already running."
fi
