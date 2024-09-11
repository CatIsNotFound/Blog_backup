---
title: 从 0 开始学 Linux - 安装 Ubuntu 24.04 LTS 系统
date: 2024-04-26 23:59:00
updated: 2024-06-20 19:18:37
tags: ['Linux', 'Ubuntu', '桌面环境', 'GNOME']
categories: '技术教程'
excerpt: '本篇文章适合刚接触 Linux 的零基础小白，本教程将以零基础小白的视角来简要介绍如何快速安装 Ubuntu 系统。'
thumbnail: /images/2024/0426/13.jpg
---

{% notel regular 'fa-solid fa-book' '前言' %}

本篇文章适合刚接触 Linux 的零基础小白，本教程将以零基础小白的视角来简要介绍如何快速安装 Ubuntu 系统。

![](/images/2024/0426/13.jpg)

{% endnotel %}

# 环境安装

根据不同的方式来安装相对应的环境，作为 0 基础的 Linux 入门新手，你可以根据 ⭐ 级别来参考并选择相对应的安装方式。

## 虚拟机环境 （⭐⭐⭐⭐⭐）

### 特点

- 安全：虚拟机与真实的物理机完全隔离；
- 便利：只需要一个安装镜像（通常以 `*.iso` 格式的文件）即可安装；
- 即用即停：使用虚拟机时可直接暂停或恢复虚拟机。可以减少开启虚拟机的等待时间

### 安装方式

请根据如下表所给的虚拟机软件中选择其中一个进行下载安装。

|                             软件                             | 可用的平台          |
| :----------------------------------------------------------: | ------------------- |
| <img src="https://www.vmware.com/favicon.ico" style="zoom:75%;" /> [VMWare Workstation](https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html) | Windows、Linux      |
| ![](https://www.virtualbox.org/favicon.ico) [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) | Windows、Mac、Linux |
| <img src="https://www.vmware.com/favicon.ico" style="zoom:75%;" /> [VMWare Fusion](https://www.vmware.com/products/fusion/fusion-evaluation.html) | Mac                 |
| <img src="https://www.parallels.com/static/pl/typo3conf/ext/prls_theme/Resources/Public/theme/res/img/favicon/favicon.png" style="zoom: 33%;" /> [Parallels Desktop](https://www.parallels.com/products/desktop/) | Mac                 |
| ![](https://www.qemu.org/assets/favicons/favicon-32x32.png) [QEMU](https://www.qemu.org/download/) | Windows、Mac、Linux |
| <img src="https://learn.microsoft.com/favicon.ico" style="zoom:25%;" /> [Hyper-V](https://learn.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/about/) | Windows             |

Windows 用户建议选择 VMware Workstation；

Linux 用户建议选择 Oracle VM VirtualBox；

Mac 用户建议选择 Parallels Desktop。

## Windows Subsystem Linux（WSL）（⭐⭐⭐⭐）

### 特点

- 运行于 Windows 系统上。
- 安装非常简单，仅需安装发行版即可实现即开即用
- 仅运行于终端中，不会占用过大的存储空间

### 安装方式

你可以直接[点击此处下载 WSL](https://apps.microsoft.com/store/detail/windows-subsystem-for-linux/9P9TQF7MRM4R)，打开网页后将会自动跳转到 Microsoft Store 中，只需点击下载安装即可

关于相关的 WSL 教程，请直接点击下方按钮以跳转至此文章。

{% btn center large::WSL：一个适用于 Windows 的 Linux 子系统::/2024/06/06/WSL：一个适用于-Windows-的-Linux-子系统/::fas fa-link %}

## 实机安装（双系统安装）（⭐⭐⭐）

### 特点

- 完全安装在真机环境上，体验原汁原味的系统
- 上手难度较大，不利于新手操作
- 安装前需要提前为新安装的 Linux 系统进行分区，配置较为麻烦，同时需要依靠 U 盘进行安装

### 安装方式

- 若选择此方式，作者建议使用如下工具将镜像文件安装到 U 盘中：
  
  <img src="https://www.ventoy.net/favicon.ico"  />
  
  [Ventoy](https://www.ventoy.net/cn/download.html) ：一个多系统启动 U 盘的解决方案。可利用此工具来快速启动多个已有的 ISO 镜像文件
  
  <img src="https://rufus.ie/favicon.ico"  />
  
  [Rufus](https://rufus.ie/zh/)：一款轻松创建 USB 启动盘的工具
  
  ![](https://etcher.balena.io/images/2024/favicon.png)
  
  [balenaEtcher](https://etcher.balena.io/)：一款更为简单的烧录软件
- 使用方式均为一样，仅需使用对应工具将需要存放的 ISO 镜像文件烧录即可。

## 适用于安卓设备的软件 —— Termux（⭐⭐）

{% note  fa-circle-exclamation %}

**注意：**本篇中此方法不会具体展开介绍

{% endnote %}

### 特点

- 支持在 Android 手机上运行虚拟 Linux 系统
- 相对适合没有电脑的情况下使用
- 仅需安装 Termux 即可得到虚拟的 Linux 环境

### 安装方式

- [Release v0.118.0 · termux/termux-app (github.com)](https://github.com/termux/termux-app/releases/tag/v0.118.0)

  由于大多数手机为 ARM 架构，因此建议[选择 ARM 版本](https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk)

# 安装 Linux 系统

## 下载镜像

在写这篇文章之前，若你已经下载并安装完环境后，接下来只需要在对应的 Linux 发行版中下载镜像即可。（通常为 `*.iso` 格式的镜像文件）

<img src="https://assets.ubuntu.com/v1/8114528b-picto-ubuntu-orange.png"  />

这里将使用全球较为流行的 [Ubuntu 24.04 LTS](https://releases.ubuntu.com/24.04/ubuntu-24.04-desktop-amd64.iso) 镜像来安装 Linux。

{% notel green fa-circle-info 下载提示 %}

若下载速度缓慢，这里已提供如下镜像站，可以加快下载速度：

- [清华源下载](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/24.04/ubuntu-24.04-desktop-amd64.iso)
- [南阳理工学院镜像站](https://mirror.nyist.edu.cn/ubuntu-releases/24.04/ubuntu-24.04-desktop-amd64.iso)
- [北京交通大学镜像站](https://mirror.bjtu.edu.cn/ubuntu-releases/24.04/ubuntu-24.04-desktop-amd64.iso)
- [西安交通大学镜像站](https://mirrors.xjtu.edu.cn/ubuntu-releases/24.04/ubuntu-24.04-desktop-amd64.iso)

请直接点击上方链接或者复制下载链接，即可开始下载镜像

{% endnotel %}

## 新建虚拟机

这里以 VMware Workstation 17 为例，

首先，在主页上点击【创建虚拟机】；接下来，就按照下面的图一步一步创建即可(\*^_^\*)（这非常简单）

![](/images/2024/0426/1.jpg)

![](/images/2024/0426/2.jpg)

![](/images/2024/0426/3.jpg)

![](/images/2024/0426/4.jpg)

![](/images/2024/0426/5.jpg)

![](/images/2024/0426/6.jpg)

![](/images/2024/0426/7.jpg)

![](/images/2024/0426/8.jpg)

完成上述创建后，直接按照如下图提示，开启虚拟机即可

![](/images/2024/0426/9.jpg)

## 安装 Ubuntu 系统

一般情况下，在安装 Ubuntu 系统时，将会启动 Grub 引导，此时选择第一项【Try or Install Ubuntu】，等待启动 Ubuntu。

![](/images/2024/0426/10.jpg)

等待完成后，后面仅需按照图中的提示做好初次配置即可开始安装 Ubuntu 系统。虚拟机下仅需设置好用户和密码即可。其余操作仅需点【下一步】即可

![](/images/2024/0426/11.gif)

若安装完成后，选择重启时将会出现如下图，此时仅需按下回车键即可完成

![](/images/2024/0426/12.jpg)

> **※ 补充内容：安装 VMware Tools 工具**
>
> 现如今，在 Ubuntu 及其它 Debian 系发行版下，可直接打开终端，并安装 `open-vm-tools` 工具包即可，具体命令如下：
>
> ```shell
> sudo apt install open-vm-tools -y
> ```
>
> 完成安装后，将系统注销重新登录之后即可生效

## 检查 Ubuntu 版本

按照如下图的操作，查看 Ubuntu 版本号即可

![](/images/2024/0426/14.gif)

🎉 至此，安装 Linux 系统已经完成！😉



{% notel blue 'fa-solid fa-lightbulb' '跳转提示' %}

🎉 你已完成了整个 Linux 的安装，若你对 Linux 系统不是非常熟悉，建议阅读以下文章：

{% btn center regular::从 0 开始学 Linux：熟悉 GNOME 桌面::/2024/05/03/从-0-开始学-Linux-熟悉-GNOME-桌面/::fas fa-link %}

{% btn center regular::从 0 开始学 Linux：Bash Shell 快速入门::/2024/06/09/从-0-开始学-Linux-Bash-Shell-快速入门/::fas fa-link %}

{% endnotel %}
