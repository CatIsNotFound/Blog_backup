---
title: '系统体验：虚拟机安装 Android x86 系统'
date: 2024-06-15 16:32:59
updated: 2024-06-20 11:13:44
tags: ['系统体验', 'Android', '新手向']
categories: 系统体验
excerpt: 本文主要介绍了 Android x86 系统的安装、使用、体验等。
thumbnail: /images/2024/0620/cover.webp
---

# 前言

本文主要介绍了 Android x86 系统的安装、使用、体验等。如果你对 Android x86 系统感兴趣，可以参考下面的内容。(\*^_^\*)

{% notel regular 'fa-solid fa-book' 'Android x86 项目简介' %}

<img src="https://imagekit.androidphoria.com/wp-content/uploads/Android-x86-llega-a-9-Pie.jpg" alt="Android x86" width="500" />

这是一个将 Android 开源项目移植到 x86 平台的项目，以前称为“支持 android x86 的补丁托管”。 最初的计划是托管来自开源社区的 android x86 支持的不同补丁。在我们创建项目几个月后，我们发现我们可以做的不仅仅是托管补丁。因此，我们决定创建代码库 在不同的 x86 平台上提供支持，并设置 Git 服务器来托管它。

{% endnotel %}

在阅读此文前，如果你是需要在自己的电脑上体验原生版本的 Android 系统，那么 Android x86 系统是一个备选方案。

但是如果你需要获得更好的性能，那么你可以来试试体验 Bliss OS（基于 Android x86 系统的改良版）。

关于 Bliss OS，你可以访问官方网站：https://blissos.org/


# 下载 Android x86 系统

你可以通过以下途径来下载 Android x86 系统，具体取决于你的网络环境：

官方途径：

{% btn regular ::官方下载 ::https://www.android-x86.org/releases.html ::fas fa-download %}

其它的官方途径：
{% btn regular ::SourceForge 下载 ::https://sourceforge.net/projects/android-x86/files/ ::fas fa-download %}

{% btn regular ::FossHub 下载 ::https://www.fosshub.com/Android-x86.html ::fas fa-download %}

如果以上两种下载链接都无法下载，请直接以下按钮以进行下载：

{% note danger 'fa-solid fa-circle-info' %}
**注意：**

此版本仅提供 Android 9.0 r2 镜像（到 2024 年 6 月 15 日为止为最新版本镜像），其它版本还需自行在外网上寻找。

下载链接已奉献上：

<br><br>

{% btn regular ::Android x86 9.0 r2 镜像 ::https://www.filehorse.com/download-android-x86-32/ ::fa-brands fa-android %}

{% endnote %}

# 安装 Android x86 系统

下载完 Android x86 系统镜像后，你可以使用 Rufus 等工具将其刻录到 U 盘中，然后使用 U 盘启动进入安装程序。本文不在此基础上展开。

这里本文仅以 VMware 虚拟机的形式安装 Android x86 系统，具体步骤如下：

## 第一步：创建虚拟机

这里不过多阐述，这里直接按照提示设置个 2GB 内存，32GB 硬盘的虚拟机就可以了。（当然可以更改其它配置）

需要注意的是，在设置客户机操作系统时，选择 linux → 其他 Linux 5.x 内核 64 位

![](/images/2024/0614/0.jpg)

## 第二步：安装系统到本地硬盘

启动虚拟机后，出现如下图所示，请选择【Installlation - Install Android-×86 to hard disk】。

![](/images/2024/0614/1.jpg)

在如下图的提示中，通过方向键 `↑`、`↓`，选择 `Create/Modify partitions`，即创建一个分区。

![](/images/2024/0614/2.jpg)

在此步选择 `No`，进入 cfdisk 工具。

![](/images/2024/0614/3.jpg)

在如下图操作中，请使用方向键 `↑`、`↓`、`←`、`→` 以及 `Enter` 键，按照如下顺序依次设置：

**注意：这是针对虚拟机的分区设置**

1. 选择 `New`，创建一个新分区；
1. 选择 `Primary`，设置为主分区，空间大小可使用默认；**（注意：1 GB = 1024 MB）**
1. 选择 `Bootable`，设置为启动分区，此时 `Flags` 一列会显示 `Boot` 字样； 
1. 选择 `Write`，确认分区设置；
1. 选择 `Quit`，退出 cfdisk 工具。

如下图为分区设置完成后的样子。

![](/images/2024/0614/4.jpg)


在分区设置完成后，请直接选择【sda1】分区以进行格式化分区。

![](/images/2024/0614/5.jpg)

在如下两张图中，首先先选择 `ext4` 文件系统，然后再选择 `Yes`，确认格式化。

![](/images/2024/0614/6.jpg)

![](/images/2024/0614/7.jpg)

等待格式化完成后即可。

弹出如下图所示的提示时，选择 `Yes`；

![](/images/2024/0614/8.jpg)

在如下图的问题中，继续选择 `Yes`，此步将会在 `/system` 分区中安装 Grub 引导程序。

![](/images/2024/0614/9.jpg)

等待安装完成后，选择 【Reboot】 重启虚拟机。

![](/images/2024/0614/10.jpg)

## 第三步：配置启动项

当系统初次进入 Grub 程序时，请先选择第二项以进入 Debug 模式。

![](/images/2024/0614/11.jpg)

等待进入 Debug 模式后，请多次按下 `Enter` 键，这将会换行出现 `:/android # ` 的提示符。请输入如下命令以编辑菜单项。

```bash
vi /mnt/grub/menu.lst
```

![](/images/2024/0614/12.jpg)

在编辑器中，找到如下图所示的标注，并在此处添加 `nomodeset` 参数。

最后，请依次按下 `Esc`，并输入 `:wq` 最后再按下 `Enter` 键即可。

![](/images/2024/0614/13.jpg)

退出编辑器后，请直接按下键盘快捷键 `Ctrl` + `Alt` + `Delete` 键，以直接重启。

**需要注意的是**：在 VMware 虚拟机中，**你需要按下 `Ctrl` + `Alt` + `Insert` 键**才能避免在 Windows 中弹出安全选项。

## 第四步：完成初次配置

当系统重启后，在 grub 启动菜单上选择第一项以启动 Android x86 系统。

![](/images/2024/0614/11.jpg)

等待启动，就会出现如下图：

![](/images/2024/0614/14.jpg)

然后，根据如下图进行初次配置：

![](/images/2024/0614/15.jpg)

{% notel red 'fa-solid fa-circle-info' '注意' %}

配置 Wifi 界面时，请先跳过此步。否则 Google 将会自动检查更新。**（在国内的网络环境下，这一步非常容易耗时）**

![](/images/2024/0614/16.jpg)

{% endnotel %}

{% notel yellow 'fa-solid fa-lightbulb' '如何连接网络？' %}
在 Android x86 系统中，默认情况下是没有网络连接的，你需要手动转到【设置】→ 【WLAN】，并连接即可。

![](/images/2024/0614/17.jpg)

如上图所示，若你使用的是 VMware 虚拟机，仅需连接虚拟 WIFI 即可上网。

{% endnotel %}

# 桌面展示

在 Android x86 系统中，提供了两种主屏幕页面展示，一个是适用于平板电脑或手机的 🏠 <i>QuickStep</i>，另一个则是适合电脑 PC 的任务栏。

![](/images/2024/0614/18.jpg)

![](/images/2024/0614/19.jpg)

# 键盘快捷键

在 Android x86 系统中，有一些常用的快捷键，如下：

- <i class="fa-brands fa-windows"></i> `Win`：⚪ 回到桌面

- <i class="fa-brands fa-windows"></i> `Win` + `Backspace` ：◀ 返回到上一页

- ⬜ 切换应用：

    - `Alt` + `Tab`：切换应用窗口

    - `Alt` + `Shift` + `Tab`：反向切换引用

    - 💡**Tips：**先按下 `Alt` + `Tab` 快捷键选择一个应用窗口，松开 `Tab` 键并保持 `Alt` 键不放，最后再按住 `Backspace` 键，即可关闭当前应用窗口。

- `Ctrl` + `Alt` + `Delete`：弹出电源选项，其中还包含【屏幕截图】功能
    
在虚拟机中，你需要按下 `Ctrl` + `Alt` + `Insert` 键，以避免在 Windows 中弹出安全选项。

# 体验感受

Android x86 系统的体验与原生版本的 Android 系统差别不大，但由于**系统是运行在虚拟机中，所以性能上有所损失**。

对于喜欢折腾的人来说，Android x86 系统是一个不错的选择。

