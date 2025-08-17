# Pmail部署方法（amd64）

<br>
<br>

首先需要一台支持25端口的vps

<br>

## 1.检测系统构架

```bash
uname -m

```

显示 x86_64 继续看下一步

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

运行之后，前往 http://你的ip：80

如果使用了防火墙，需要开启80端口

<img src="./cn.gif" alt="Editor" width="800px">



域名设置中：

+ web域名可以随意，但是 **SMTP域名** 建议如图使用 **主域名** ！！！！！

  &nbsp;&nbsp;&nbsp;否则后面很可能填错！！！！
  
  &nbsp;&nbsp;&nbsp;如果能真正理解该怎么解析，当我没说，爱用几级域名都行

+ 不建议使用“多域名设置”，容易出问题

+ 另外建议额外添加一个TXT记录

  &nbsp;&nbsp;&nbsp;名称：_dmarc

  &nbsp;&nbsp;&nbsp;内容：v=DMARC1; p=reject

  &nbsp;&nbsp;&nbsp;这条TXT记录可以强制拒收不合规邮件，从而提高邮件信誉

<br>
<br>


## 4.SMTP使用方法


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

## 5.注意事项

+ 如果 Pmail 启动不了，有可能是vps自带的邮箱程序占用了25端口

```bash
sudo systemctl stop postfix
sudo systemctl stop exim
sudo systemctl stop sendmail
```

<br>

+ 成功搭建邮局后，可以去这里检测邮局还有哪些问题

  &nbsp;&nbsp;&nbsp; https://www.mail-tester.com/?lang=zh

  &nbsp;&nbsp;&nbsp; 实测8分以上，基本上就可以进邮箱了。只要不滥发邮件，就不会进垃圾箱

<br>

+ 相同域名每次重新搭建邮局，都需要把内容最长的那条TXT记录删掉

  &nbsp;&nbsp;&nbsp;然后重新解析，不然会出现 **DKIM签名无效** 的问题（具体原因不明）


<br>
<br>


##### 其他使用方法，建议参考Pmail项目地址

https://github.com/Jinnrry/PMail/blob/master/README_CN.md




<br>

<br>









