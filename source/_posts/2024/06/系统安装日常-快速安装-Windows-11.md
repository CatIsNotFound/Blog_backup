---
title: '系统安装日常：简单快速安装 Windows 11/10'
date: 2024-06-22 14:08:24
tags: ['Windows', '系统安装']
categories: 技术教程
excerpt: 本文简要介绍了如何快速安装 Windows 系统，以及遇到的问题解决方法。
thumbnail: https://news-cdn.softpedia.com/images/news2/microsoft-releases-new-windows-11-teaser-confirming-leaked-wallpapers-are-real-533302-2.jpg
---

{% notel regular 'fa-solid fa-book' '前言' %}

本文主要面向小白，若对于没有安装系统经验，那么本文将能够帮助您快速安装 Windows 11。

![](https://news-cdn.softpedia.com/images/news2/microsoft-releases-new-windows-11-teaser-confirming-leaked-wallpapers-are-real-533302-2.jpg)

{% endnotel %}

# 准备工作

## 检查硬件配置

在开始安装之前，请先根据官网上的配置要求作好准备。以下是从官网上获取到的最低硬件配置要求。

> 💻 **硬件要求**
> 
> - 处理器：1 千兆赫 (GHz) 或更快，在 兼容的 64 位处理器 或芯片上的系统上 (SoC) 。
> - 内存：4 GB (GB) 或更大。
> - 磁盘：64 GB 或更大的可用磁盘空间。
> - 显卡：与 DirectX 12 或更高版本兼容，具有 WDDM 2.0 驱动程序。
> - 系统固件：UEFI，支持安全启动。
> - TPM：受信任的平台模块 (TPM) 版本 2.0。
> - 显示：高清 (720p) 显示器，9 英寸或更大监视器，每个颜色通道 8 位。


{% notel yellow 'fa-solid fa-lightbulb' 'TPM 2.0 检查方法' %}

请确保你当前的主机或笔记本电脑支持 TPM 2.0 协议。若你不确定你的电脑是否能够安装 Windows 11，你可以通过以下两种方式以验证是否支持 TPM 2.0：



**方法一：设备管理器**

1. 请先按下 <i class="fa-brands fa-windows"></i> Windows + X 组合键，在菜单中选择 [设备管理器]。
1. 在如下图所示中，请直接双击展开 [安全设备] 即可查看

![](/images/2024/0622/0.2.jpg)



**方法二：TPM 管理**

1. 请先按下 <i class="fa-brands fa-windows"></i> Windows + R 组合键，弹出 [运行] 窗口，输入 `tpm.msc` 并点击 [确定]。
1. 在如下图所示中，可以直接查看。

![](/images/2024/0622/0.1.jpg)

{% endnotel %}

## 安装 Windows 镜像

网络上存在各种版本的镜像，这里推荐一个访问微软官方镜像，请直接点击下方按钮以直达官方下载链接：

{% btn center large::微软官方下载 Windows 11::https://www.microsoft.com/zh-cn/software-download/windows11::fas fa-link %}

{% btn center large::微软官方下载 Windows 10::https://www.microsoft.com/zh-cn/software-download/windows10::fas fa-link %}

![](/images/2024/0622/0.3.jpg)

## 写入镜像到 U 盘

如果你需要将下载好的系统镜像安装到其它电脑上，那么建议您使用 U 盘作为安装介质。

要求：请将镜像写入 U 盘（至少 16 GB），并确保 U 盘格式为 NTFS（推荐） 或 exFAT。

以下是推荐使用的轻便版本的软件：

- [Rufus](https://rufus.ie/)：适用于 Windows、macOS、Linux 的开源 U 盘启动器。
- [Balena Etcher](https://www.balena.io/etcher/)：适用于 Windows、macOS、Linux 的开源镜像写入工具。
- [Ventoy](https://www.ventoy.net/cn/download.html) ：一个多系统启动 U 盘的解决方案。可利用此工具来快速启动多个已有的 ISO 镜像文件

# 安装 Windows 11

以下是关于安装 Windows 11 的详细步骤：

## U 盘启动

假如你的电脑上已经安装好 Windows 10 或 Windows 8 等早期版本的系统，那么你可以直接打开[系统设置]，依次选择：[更新和安全]→[恢复]→[高级启动]→[立即重新启动]

![](/images/2024/0622/0.4.jpg)

接下来，请按照如下图指示进行选择：

![](/images/2024/0622/0.5.jpg)

![](/images/2024/0622/0.6.jpg)

等待电脑重启后，即可以 U 盘启动进入 Windows 11 安装程序。

## 安装过程

这里以安装 Windows 11 23H2 版本为例，其他版本的 Windows 11 或 Windows 10 系统的安装过程大致相同。

请按照如下一组图的指引以完成整个安装：

![](/images/2024/0622/1.png)

![](/images/2024/0622/2.png)

![](/images/2024/0622/3.png)

![](/images/2024/0622/4.png)

![](/images/2024/0622/5.png)

![](/images/2024/0622/6.png)

![](/images/2024/0622/7.png)

![](/images/2024/0622/8.png)

**注意：选择系统盘时，系统盘的容量大小必须大于或等于 52 GB 才能安装。**

![](/images/2024/0622/9.png)

![](/images/2024/0622/10.png)

![](/images/2024/0622/11.png)

![](/images/2024/0622/12.png)

![](/images/2024/0622/13.png)

当完成重启后，你将会进入初次设置（如下图），请按照提示进行设置。

![](/images/2024/0622/14.png)

{% notel green 'fa-solid fa-info-circle' '如何跳过联网设置？' %}

在安装 Windows 11 系统时，会**强制要求需要联网并登录或注册微软账户**才能继续。因此，为了跳过联网步骤，你可以按照如下图的方式进行设置。

**注意：若跳过联网步骤，系统将会跳过联网激活步骤。**

以下是关于如何跳过联网的步骤：

1. 首先按下 <kbd>Shift</kbd> + <kbd>F10</kbd> 组合键，打开 [命令提示符] 窗口。
1. 在当前窗口下输入 `oobe\bypassnro` 并回车，系统将会重启。
![](/images/2024/0622/16.png)
1. 重启后，请再次走一遍初始设置。此时，当走到如下图时，请选择 [我没有 Internet 连接] 选项，即可跳过联网部分
![](/images/2024/0622/17.png)
1. 最后，请按照图中的提示继续设置即可。
![](/images/2024/0622/18.png)

![](/images/2024/0622/19.png)

![](/images/2024/0622/20.png)

![](/images/2024/0622/21.png)

![](/images/2024/0622/22.png)

![](/images/2024/0622/23.png)

{% endnotel %}

当做好以上设置后，将会进入到安装阶段。

![](/images/2024/0622/24.png)

等待安装完成后，若出现如下图，请选择 [下一步] 按钮；

![](/images/2024/0622/25.png)

至此，所有的安装过程已全部完成。

![](/images/2024/0622/26.png)

# 写在最后

以上是所有关于安装 Windows 11 的所有内容，若在安装过程中遇到问题，请不要犹豫，可以先查看官方文档，或者在 [Windows 11 官方论坛](https://answers.microsoft.com/zh-hans/windows/forum/all/windows-11) 进行提问。

{% notel green 'fa-solid fa-book' '参考链接' %}
- [Windows 11 系统要求](https://learn.microsoft.com/zh-cn/windows/whats-new/windows-11-requirements)
- [如何检查电脑是否支持 TPM 2.0](https://pcedu.pconline.com.cn/1684/16847709.html)
- [Windows 11 如何跳过联网激活](https://answer.baidu.com/answer/land?params=XkDfTj0H%2F4487c7dG2QLYpU5NESz0QNO6ddPFfMJ6P%2FwR1uOX7mU3NI0m763jrzhgef3bNkrytpFvVmQqK2Zlwy0MU5NIZnnY72p0iGfhFMloCaZOCERINfeMk2PAkERn4fckNYDJgs8BDDLCDYX7BaKVqXD1ZJ5%2FyyFHs6ERkrRrCjaqnlxSkYklT%2FIox2higDdYATW1ddwnTO%2BfZWSlg%3D%3D&from=dqa&lid=9bec2042003d7e52&word=windows11%E8%B7%B3%E8%BF%87%E8%81%94%E7%BD%91%E6%BF%80%E6%B4%BB)
{% endnotel %}