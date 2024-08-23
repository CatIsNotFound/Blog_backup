---
title: '系统体验：Pop_OS! 全新 Cosmic 桌面环境测试体验'
tags:
  - 系统体验
  - Pop_OS!
  - Cosmic
  - Linux
  - 桌面环境
categories: 系统体验
excerpt: 本文主要介绍 Cosmic 桌面环境的安装、使用以及体验。
thumbnail: /images/2024/0815/cover.jpg
date: 2024-08-15 16:57:19
updated: 2024-08-15 16:57:19
sticky: 998
---


# 前言

很久没有写关于系统体验的文章了，这次体验的 Linux 发行版是 Pop_OS! 24.04，其主要默认的桌面环境为 Cosmic。

Cosmic 是 System76 团队开发的全新的桌面环境，其目的是构建一个自定义的操作界面。以下为引用：

![](/images/2024/0815/cover.jpg)

> *We aim to liberate the computer with a new desktop environment powerful enough to build custom OS experiences — for users, developers, and makers of any device with a screen.*
> 
> 我们的目标是通过一个足够强大的新桌面环境来解放计算机，为任何带屏幕的设备的用户、开发人员和制造商构建自定义操作系统体验。

# 安装

## Step 1: 下载镜像

现如今，Cosmic 桌面环境正处于测试阶段（使用过程中会有 Bug）。我们可以通过官网下载其安装镜像，下载链接在正下方：

* [System76 - Linux Laptops, Desktops, and Servers](https://system76.com/cosmic)

点击上文提到的链接，进入官网，下拉找到 *Try COSMIC Epoch 1 (alpha 1) on the Pop!_OS 24.04 LTS alpha.* 一行，根据自己的 CPU 或显卡配置，按需下载 ISO 镜像即可。

**注意：国内下载速度缓慢，建议使用第三方下载工具下载镜像。**

## Step 2: 刻录系统

提示：如果你尝试使用虚拟机安装（如：VMware、Virtualbox、Qemu 等），请忽略此步并创建虚拟机即可。

需要注意的是，若使用虚拟机过程中无法正常进入桌面，请尝试**开启 3D 图形加速**，或提高其运行内存 **（建议： ≥ 4GB）**。

这里推荐以下软件：

- [Ventoy](https://www.ventoy.net/cn/download.html) ：一个多系统启动 U 盘的解决方案。可利用此工具来快速启动多个已有的 ISO 镜像文件

- [Rufus](https://rufus.ie/zh/)：一款轻松创建 USB 启动盘的工具

- [balenaEtcher](https://etcher.balena.io/)：一款更为简单的烧录软件

下载安装后，仅需插入 U 盘，然后选择需要烧录的 ISO 镜像，等待几分钟即可。这里不过多赘述。

# 体验

经过两三个小时的使用体验，可以发现 Cosmic 桌面有以下个人认为比较不错的亮点：

## 桌面与登录界面

整体外观样式与前一桌面环境（GNOME）有所不同，如下图：

![](/images/2024/0815/1.png)
![](/images/2024/0815/2.png)

## 平铺窗口

首先，最为实用的功能，就是 Cosmic 自带的**平铺窗口管理**。

### 1. 开启平铺窗口

只需要在顶部栏的右方点击窗口按钮，并开启平铺窗口即可。当然你还可以直接设置新工作区默认使用的窗口模式。如下图操作：

![](/images/2024/0815/w1.gif)

### 2. 窗口快速开启或关闭

你可以在下方 Dock 栏处使用鼠标中键疯狂点击 [Cosmic 终端]，也可以按下快捷键 <kbd>Super</kbd> + <kbd>Q</kbd> 快速关闭所有窗口。

![](/images/2024/0815/w2.gif)

### 3. 窗口拖拽

在窗口移动方面，你可以直接使用鼠标拖拽窗口与窗口之间的大小，同时还可以拖拽窗口到其它位置。

![](/images/2024/0815/w3.gif)

不仅如此，多个窗口可以组成 [堆叠窗口]，只需要将鼠标点击任意窗口并拖拽至其它窗口上，便能堆叠窗口（也就是**多标签页窗口**）。

![](/images/2024/0815/w4.gif)

## Launcher 启动器

Cosmic 桌面环境提供了一种叫做 [Cosmic Launcher] 的功能，可以快速启动常用文件、搜索文件、计算器、网页搜索等功能。默认设置下，直接按下 <kbd>Super</kbd> + <kbd>/</kbd> 键（即 <kbd>Windows</kbd> + <kbd>/</kbd> 键）以呼出搜索栏。如下图：

![](/images/2024/0815/l.gif)

**使用方法：**

1. 直接在搜索栏上输入应用程序名称

1. 在搜索栏输入：`~` 或者 `/`，可直接按文件路径打开所需文件。

1. 在搜索栏输入：`run <command>` / `t:<command>` 可直接打开终端并执行命令

1. 在搜索栏输入：`:<command>` 可直接在后台执行命令

1. 网页搜索
    - `bing <keyword>` 可直接使用 bing 搜索
    - `ddk <keyword>` 可直接使用 DuckDuckGo 搜索
    - `google <keyword>` 可直接使用 Google 搜索

1. 在搜索栏输入算式，会自动计算

1. 更多功能，请直接在搜索栏中输入 `?` 查看所有可用选项。

## 实用快捷键

关于窗口与工作区管理，你还可以使用以下比较实用的快捷键，这对于日常使用来说非常有用。

注意：以下的 <kbd>Super</kbd> 键为 <kbd>Windows</kbd> 键。

- 管理窗口/工作区
  
  - <kbd>Super</kbd> + 任意方向键：选择窗口（激活窗口焦点）
  
  - <kbd>Super</kbd> + <kbd>Alt</kbd> + 任意方向键：切换工作区
  
  - <kbd>Super</kbd> + <kbd>Tab</kbd> 或 <kbd>Alt</kbd> + <kbd>Tab</kbd>：切换窗口
  
  - <kbd>Super</kbd> + <kbd>Q</kbd>：关闭当前窗口
  
  - <kbd>Super</kbd> + <kbd>M</kbd>：最大化当前窗口

- 移动窗口
  
  - <kbd>Super</kbd> + <kbd>Shift</kbd> + 任意方向键：移动窗口
  
  - <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + 任意方向键：将窗口移动到其它工作区

- 其它快捷键
  
  - <kbd>Super</kbd> + <kbd>Esc</kbd>：锁屏
  
  - <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Delete</kbd>：注销会话
  
  - <kbd>Super</kbd> + <kbd>F</kbd>：打开文件管理器
  
  - <kbd>Super</kbd> + <kbd>B</kbd>：打开默认浏览器
  
  - <kbd>Super</kbd> + <kbd>T</kbd>：打开终端
  
  - <kbd>Super</kbd> + <kbd>A</kbd>：打开应用程序菜单

# 不足之处 & 已发现的 Bugs

正如前文所提到，Cosmic 桌面环境目前处于测试阶段，很容易能从中发现 Bug 以及不足之处。总结起来有以下几点：

- **设置页面不完善**：缺少 [账户]、[蓝牙]、[网络]、[声音]、[区域与语言] 等基本页面；

- **工作区存在 Bug**：
  
  - 当拥有两个以上的工作区且打开不同的窗口时，点击 [工作区] 菜单，会出现缩略图闪烁等问题；
  - 多个窗口同时在同一工作区内时，窗口只横向排列，导致部分窗口无法直接拖拽至其它工作区。

![](/images/2024/0815/e.gif)

- **关于 Launcher 启动器**：

  - 首先在使用网页搜索时，不支持国内的搜索引擎（如：`baidu`, `sogou`）。在搜索栏下只能使用 `bing` 搜索。
  - 搜索文件时，部分未知文件不能直接打开。
  - 输入 `?` 查看帮助时，显示仍为英文。

- **输入法无法使用**：尝试使用过 ibus、fcitx5 等输入法引擎，不能直接安装并使用。不知怎么解决？

- **软件商店无法使用**：在安装完 Cosmic 桌面环境后，打开的软件商店是完全空白的，无法显示任何内容。

![](/images/2024/0815/5.png)

- **自带软件语言显示错误**：系统已设置为 `zh_CN.UTF-8` 语言布局（简体中文），但显示如：Cosmic Text Editor、Cosmic Files等软件时显示繁体中文。如下截图：

![](/images/2024/0815/6.png)

最后，希望开发团队能尽力出正式版。(\*^_^\*)