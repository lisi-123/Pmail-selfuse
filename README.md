# Pmail搭建方法（自用）

<br>
<br>

### 1.检测系统构架

```bash
uname -m

```

显示 x86_64 或 amd64 表示 64 位 x86 架构

其他请前往Pmail官方寻找对应的包自行部署

Pmail项目地址 https://github.com/Jinnrry/PMail

<br>
<br>

### 2.拉取项目

```bash
apt-get update && apt install sudo -y && sudo apt install git -y && git clone https://github.com/lisi-123/Pmail-selfuse.git

```

<br>
<br>

### 3.运行

```bash
chmod +x /root/Pmail-selfuse/pmail_linux_amd64 && cd /root/Pmail-selfuse && ./pmail_linux_amd64 -p 80

```

运行之后，前往 http://你的ip 

<img src="./cn.gif" alt="Editor" width="800px">

根据提示填写就行


域名设置那里，web域名可以随意，但是SMTP域名建议使用主域名，否则后面可能填错

<br>
<br>

### 4.使用screen实现持续运行

ssh中断会导致Pmail停止运行

在Pmail停止运行的情况下，执行以下内容


```bash
sudo apt update && sudo apt install -y screen && chmod +x /root/Pmail-selfuse/script.sh && (crontab -l 2>/dev/null; echo "* * * * * /root/Pmail-selfuse/script.sh") | sort -u | crontab -

```

Pmail会在执行后的一分钟内自动启动

<br>
<br>

### 5.SMTP使用方法

<br>

#### 假设搭建的时候填写的内容如下

&nbsp&nbsp smtp域名： example.com

&nbsp&nbsp web域名： pmail.example.com

&nbsp&nbsp 管理员： admin

&nbsp&nbsp 密码： 123456

<br>

#### 当使用smtp服务时


&nbsp&nbsp SMTP服务器地址： smtp.example.com

&nbsp&nbsp SMTP服务端口： 465

&nbsp&nbsp SMTP加密方式： SSL

&nbsp&nbsp SMTP账号： admin@example.com

&nbsp&nbsp SMTP密码： 123456

&nbsp&nbsp 发件地址： admin@example.com

<br>

#### 其他使用方法，参考Pmail项目地址

https://github.com/Jinnrry/PMail/blob/master/README_CN.md




<br>

<br>









