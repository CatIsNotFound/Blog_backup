---
title: 从 0 开始学 Linux：熟悉 GNOME 桌面
date: 2024-05-03 23:59:02
updated: 2024-06-20 19:18:37
tags: ['Linux', 'Ubuntu', 'GNOME', '桌面环境', '新手向']
categories: '技术教程'
excerpt: '本教程主要针对于从未接触过 GNOME 的小白并将以最为简单的方式（通过图文形式）来快速熟悉 GNOME 桌面。'
thumbnail: /images/2024/0426/13.jpg
---

{% notel blue 'fa-solid fa-book' '前言' %}

在阅读此篇文章前，若你当前还未安装完 Linux 系统，请先阅读并执行此教程：[从 0 开始学 Linux - 安装 Ubuntu 24.04 LTS 系统](../../../04/从-0-开始学-Linux-安装-Ubuntu-24-04-LTS-系统/)。

本教程主要针对于从未接触过 GNOME 的小白并将以最为简单的方式（通过图文形式）来快速熟悉 GNOME 桌面。

![](/images/2024/0426/13.jpg)

{% endnotel %}

# 桌面布局

请根据如下图的标识一一对应。

![桌面](/images/2024/0503/1.jpg)

![快捷菜单](/images/2024/0503/3.jpg)

{% notel red 'fa-solid fa-circle-info' '注意' %}

**Ubuntu 下的默认桌面布局与其它发行版下的 GNOME 桌面布局有所差异。**



这里以 Fedora Workstation 40 为例。此桌面为原生 GNOME 桌面布局，即缺少了左侧的 Dock 栏、桌面图标、托盘图标，以及窗口默认的最小化、最大化（这些均需靠【优化】软件或 `gnome-shell` 插件来实现）

![](/images/2024/0503/2.jpg)

{% endnotel %}

# 桌面小技巧

以下是关于 GNOME 相关操作的小技巧，不包含所有。

## 有用的键盘快捷键

> 以下罗列了在 GNOME 桌面下部分有用的默认快捷键。后续部分还会继续补充。

<kbd><i class="fa-brands fa-windows"></i></kbd> 类

- <kbd><i class="fa-brands fa-windows"></i></kbd>：打开【概览】界面
-  <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>A</kbd>：打开【所有程序】界面
-  <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>S</kbd>：打开右上角处的【快捷菜单】
-  <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>D</kbd>：快速显示桌面，再按一次复原
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>L</kbd>：锁定屏幕
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Tab</kbd>：切换应用
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>`</kbd>：切换窗口（配合上一个快捷键操作）
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>←</kbd>：将窗口移动到左半屏，再按一次将恢复原位
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>→</kbd>：将窗口移动到右半屏，再按一次将恢复原位
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>↑</kbd>：将窗口最大化，再按一次将取消最大化

<kbd>Alt</kbd> 类：

- <kbd>Alt</kbd> + <kbd>Tab</kbd>：切换应用
- <kbd>Alt</kbd> + <kbd>`</kbd>：切换窗口（配合上一个快捷键操作）
- <kbd>Alt</kbd> + <kbd>Esc</kbd>：切换应用（比前两个快捷键更好用👍）
- <kbd>Alt</kbd> + <kbd>F2</kbd>：打开【运行】命令，快速运行一个命令

<kbd>Ctrl</kbd> 类：

- <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>：快速打开终端 



## Dock 栏（快捷栏）

### 利用快捷键启动应用

Ubuntu 桌面默认自带的任务栏，可直接利用 <kbd><i class="fa-brands fa-windows"></i></kbd> + 数字键以打开快捷栏中的所对应的应用程序。

每个应用图标左上角的以 ①②③ 表示对应的序号。
例如：打开 Firefox 浏览器，只需按下快捷键 <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>1</kbd> 即可

若你不确定某个应用位于快捷栏中的某个位置，只需按下快捷键 <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Q</kbd> 即可。如下图：

![在快捷栏中启动应用](/images/2024/0503/4.jpg)

### 固定应用到 Dock 栏（快捷栏）

#### 1. 通过右键菜单

你可以点击 Dock 栏（快捷栏）最下方的 Ubuntu 图标，或按下快捷键  <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>A</kbd> 打开所有应用程序，选择一个应用，鼠标右键，选择【固定到快捷栏】。同理，在 Dock 栏（快捷栏）中取消固定应用也是如此

![固定应用](/images/2024/0503/5.jpg)

#### 2. 通过鼠标拖拽

你可以从【所有程序】界面中，鼠标左键拖拽某个应用到 Dock 栏（快捷栏）中，也能固定到 Dock 栏（快捷栏）；

反之，从 Dock 栏（快捷栏）中的应用拖拽回【所有程序】中，就能解除固定。 

![固定应用程序](/images/2024/0503/1.gif)

![取消固定应用程序](/images/2024/0503/2.gif)

---

在桌面下，若需要对已打开的应用程序固定到 Dock 栏（快捷栏），只需拖拽到 Dock 栏（快捷栏）中；

反之，若需要取消固定快捷栏中的应用，只需拖拽到 Ubuntu 图标（或者九个点的图标）即可取消固定。（原生 GNOME 环境下也是如此）

![在桌面中固定](/images/2024/0503/3.gif)

![在桌面中解除固定](/images/2024/0503/4.gif)

## 窗口（Window）

### 左右分屏

与 Windows 的操作逻辑类似，将鼠标快速拖拽窗口到最左侧，是窗口变为左半屏，然后再选择应用将窗口变为右半屏。

![左右分屏](/images/2024/0503/6.gif)

{% note yellow 'fa-solid fa-solid fa-lightbulb' %}

提示：

在此处操作中，可以使用快捷键  <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>←</kbd> 或 <kbd> <i class="fa-brands fa-windows"></i></kbd> + <kbd>→</kbd> 来使窗口快速移动到左半屏或右半屏

{% endnote %}

### 上下分屏

与 Windows 的操作逻辑类似，这里不过多阐述，直接看动图就完事了 o(\*￣▽￣\*)o

![上下分屏](/images/2024/0503/7.gif)

## 工作区（Workspace）

工作区与 Windows 虚拟桌面类似，支持在不同的工作区中摆放窗口。下图为比较有用的操作：

### 创建、删除、切换工作区

不多描述，直接看图

![](/images/2024/0503/long1.gif)

![](/images/2024/0503/long2.gif)

![](/images/2024/0503/long3.gif)

![](/images/2024/0503/long4.gif)

![](/images/2024/0503/long5.gif)

![](/images/2024/0503/long6.gif)

下列为比较好用的快捷键（即上图中所提及到的操作）：

- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Fn</kbd> + <kbd>↑</kbd>：上一个工作区

- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Fn</kbd> + <kbd>↓</kbd>：下一个工作区

- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Fn</kbd> + <kbd>←</kbd>：第一个工作区

- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Fn</kbd> + <kbd>→</kbd>：最后一个工作区
- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Shift</kbd> + <kbd>Fn</kbd> + <kbd>←</kbd>：将窗口移动到上一个工作区

- <kbd><i class="fa-brands fa-windows"></i></kbd> + <kbd>Shift</kbd> + <kbd>Fn</kbd> + <kbd>→</kbd>：将窗口移动到下一个工作区

----

{% notel blue 'fa-solid fa-book' '写在最后' %}

以上是关于所有在 GNOME 桌面上比较有用的技巧。当然，如果还有比较实用的技巧，请在评论区补充 (\*^_^\*)

{% endnotel %}
