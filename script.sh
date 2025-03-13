#!/bin/bash

# 检查是否有名为 pmail_session 的 screen 会话
if ! screen -list | grep -q "pmail_session"; then
    # 如果没有找到名为 pmail_session 的会话，清空所有的 screen 会话
    echo "No pmail_session found, clearing all screen sessions..."
    screen -wipe
    
    # 创建一个新的 screen 会话，名为 pmail_session，并在其中执行 ./pmail_linux_amd64 -p 80
    echo "Creating new screen session 'pmail_session' and starting the mail server..."
    screen -dmS pmail_session /root/Pmail-selfuse/pmail_linux_amd64 -p 80
else
    # 如果 pmail_session 会话存在，检查该会话中的 pmail_linux_amd64 进程是否在运行
    if ! screen -S pmail_session -X stuff $'pgrep -f "pmail_linux_amd64 -p 80"\n' | grep -q "[0-9]"; then
        # 如果没有找到该进程，重新在 pmail_session 会话中执行 ./pmail_linux_amd64 -p 80
        echo "No pmail_linux_amd64 process found in pmail_session, restarting the mail server..."
        screen -S pmail_session -X stuff $'/root/Pmail-selfuse/pmail_linux_amd64 -p 80\n'
    else
        echo "pmail_linux_amd64 is already running in pmail_session."
    fi
fi
