---
title: 从 0 开始学 Linux - 利用 WSL 安装 Ubuntu 24.04 LTS
tags: Linux 学习
categories: 技术教程
excerpt: 利用 Windows Subsystem for Linux (WSL) 安装 Ubuntu 24.04 LTS 系统。
author: CatIsNotFound
date: 2024-06-04 21:09:00
thumbnail:
---


本节内容将主要讲解如何在 Windows 系统上安装 Ubuntu 24.04 LTS 系统。在开始此教程前，如果你是 Linux 新手（Linux 菜鸟）或者初学者，那么这个教程将会大大节省折腾的空间。



# 安装 / 配置 WSL

{% notel yellow fa-exclamation '注意' %}

WSL 2 支持 Windows 11、Windows 10 版本 2004 及更高版本（内部版本 19041 及更高版本）

请在下载安装前，通过 <kbd><i class="fa-brands fa-windows"></i></kbd> + `R` 打开【运行】窗口，并执行 `winver` 查看操作系统内部版本号。

<img src="/images/0605/1.jpg" alt="查看操作系统内部版本号" style="zoom:60%;" />

{% endnotel %}


你需要安装 Windows Subsystem for Linux (WSL)  和对应的 Linux 发行版。这里就以安装 WSL 和 Ubuntu 24.04 LTS 为例。首先，请直接点击下方按钮以直接安装如下软件。

{% btn regular::WSL 下载安装::https://apps.microsoft.com/detail/9p9tqf7mrm4r?hl=zh-cn&gl=CN ::fa-brands fa-microsoft %}

{% btn regular::Ubuntu 24.04 LTS 下载安装::https://apps.microsoft.com/detail/9nz3klhxdjp5?hl=zh-cn&gl=CN ::fa-brands fa-linux %}

当你完成如上安装之后，接下来，请直接按下 <kbd><i class="fa-brands fa-windows"></i></kbd> + `X` 组合键，进入 Powershell，并输入以下命令，这将会安装 WSL 自选组件。

```powershell
wsl.exe --install --no-distribution
```

安装完成后，请直接重启自己的电脑。之后，你就可以直接在开始菜单中找到并启动 Ubuntu 24.04 LTS ，等待几分钟的安装。

安装完成之后，你将会在终端上看到类似如下的提示，请按照提示设置一个新的用户和新的密码即可完成。

```
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username:   输入你的用户名
New password:              设置密码，此处输入的密码是隐藏的
Retype new password:       再次设置密码，同上
passwd: password updated successfully
Installation successful!
```

