# Pmail搭建方法（自用）

1.检测系统构架

```bash
uname -m

```

显示 x86_64 或 amd64 表示 64 位 x86 架构

其他请前往Pmail官方寻找对应的包自行部署

Pmail项目地址 https://github.com/Jinnrry/PMail

<br>

2.拉取项目

```bash
git clone https://github.com/lisi-123/Pmail-selfuse.git

```

<br>

3.运行

```bash
chmod +x /root/Pmail-selfuse/plugins/telegram_push_linux_amd64

chmod +x /root/Pmail-selfuse/pmail_linux_amd64

cd Pmail-selfuse

./pmail_linux_amd64 -p 80

```

运行之后，前往 http://你的ip 

根据提示填写就行


域名设置那里，web域名可以随意，但是SMTP域名建议使用主域名，否则后面可能填错

<br>

4.使用screen实现持续运行

```bash
sudo apt update

sudo apt install screen

chmod +x /root/Pmail-selfuse/script.sh

CRON_JOB='* * * * * /root/Pmail-selfuse/script.sh'

(crontab -l 2>/dev/null; echo "$CRON_JOB") | sort -u | crontab -

```

<br>



具体使用文档参考Pmail项目地址

https://github.com/Jinnrry/PMail/blob/master/README_CN.md




<br>

<br>









