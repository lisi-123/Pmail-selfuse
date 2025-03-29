# Pmail部署方法（amd64）

<br>
<br>

## 1.检测系统构架

```bash
uname -m

```

显示 x86_64 继续看下一步

显示 aarch64 去看分支

https://github.com/lisi-123/Pmail-selfuse/tree/arm64

其他构架请前往Pmail官方寻找对应的包自行部署

Pmail项目地址 https://github.com/Jinnrry/PMail

<br>
<br>

## 2.拉取项目

```bash
apt-get update && apt install sudo -y && sudo apt install git -y && git clone https://github.com/lisi-123/Pmail-selfuse.git

```

<br>
<br>

## 3.运行

```bash
sudo chmod +x /root/Pmail-selfuse/start-pmail.sh && sudo /root/Pmail-selfuse/start-pmail.sh

```

运行之后，前往 http://你的ip：端口

如果使用了防火墙，需要开启对应端口

<img src="./cn.gif" alt="Editor" width="800px">



域名设置那里，web域名可以随意

SMTP域名建议使用主域名，否则后面可能填错

不建议使用“多域名设置”，容易出问题

如果没有使用80端口，ssl设置 只能选择“dns记录”自动获取证书

另外建议额外添加一个TXT记录

名称：_dmarc

内容：v=DMARC1; p=reject

可以强制拒收不合规邮件，从而提高邮件信誉

<br>
<br>

## 4.使用screen实现后台持续运行

目前，ssh断开连接就会导致Pmail停止运行

在Pmail停止运行的情况下，执行以下内容


```bash
sudo apt update && sudo apt install -y screen && sudo apt install cron -y && chmod +x /root/Pmail-selfuse/script.sh && (crontab -l 2>/dev/null; echo "* * * * * /root/Pmail-selfuse/script.sh") | sort -u | crontab -

```

Pmail会在执行后的一分钟内，在vps后台自启动，并持续运行

<br>
<br>

## 5.SMTP使用方法


#### 假设搭建的时候填写的内容如下

smtp域名： example.com

web域名： pmail.example.com

管理员： admin

密码： 123456


#### 那么当使用smtp服务时


SMTP服务器地址： smtp.example.com

SMTP服务端口： 465

SMTP加密方式： SSL

SMTP账号： admin@example.com

SMTP密码： 123456

发件地址： admin@example.com

<br>

如果不想使用注册时的管理员账号发邮件

可以在pmail界面添加一个新用户

SMTP账号和发件地址都是 新用户名@example.com

SMTP密码就是新用户的密码

<br>
<br>

## 6.注意事项

如果 Pmail 启动不了，有可能是vps自带的邮箱程序占用了25端口

```bash
sudo systemctl stop postfix
sudo systemctl stop exim
sudo systemctl stop sendmail
```

如果第四步的持续运行执行不了，可能是pmail进程有残留，导致后台运行失败

执行 pkill pmail 然后再去试试


相同的ip重新搭建邮局，需要把内容最长的那条txt记录删掉，然后重新解析，不然会出问题（具体原因不明）


<br>
<br>

## 7.删除Pmail

如果需要删除Pmail

```bash
sudo chmod +x /root/Pmail-selfuse/delete-pmail.sh && sudo /root/Pmail-selfuse/delete-pmail.sh

```


##### 其他使用方法，建议参考Pmail项目地址

https://github.com/Jinnrry/PMail/blob/master/README_CN.md




<br>

<br>









