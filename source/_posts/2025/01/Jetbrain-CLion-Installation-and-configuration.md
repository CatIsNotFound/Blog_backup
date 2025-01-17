---
title: "[超详细] CLion 安装与配置"
date: 2025-01-16 16:04:37
tags:
  - C_and_Cpp
  - Windows
  - Jetbrain
  - CLion
categories:
  - 技术教程
excerpt: 此教程可帮助新手小白快速搭建编程环境，以及正常运行程序
thumbnail: /images/2025/01/clion_loading.png
sticky: 999
---
# 简介

为了照顾好刚入门 C/C++ 语言的新手小白，此文将详细介绍如何在自己的电脑上搭建自己的编程环境。

# 下载安装 IDE

{% notel regular 'fa-solid fa-book' 'IDE 简介' %}

集成开发环境（IDE，Integrated Development Environment ）是用于提供程序开发环境的应用程序，一般包括代码编辑器、编译器、调试器和图形用户界面等工具。集成了代码编写功能、分析功能、编译功能、调试功能等一体化的开发软件服务套。

{% endnotel %}

不同的 IDE 有不同的配置工具，这里就以 Jetbrain 系列中的 CLion 作为参考：

## Jetbrain CLion

大多数大学本科生，在上 C 语言程序设计时，都会下载一个软件：Dev-C++，其内置了 GCC、G++ 编译器，其体量小、速度快的特点，获得了许多大学老师默认的首选（当然有些学校可能不是用这个软件，而是使用 Visual C++ 6.0）。

但是，对于 Dev-C++ 来说，它的界面过于古旧，没有更加智能的自动补全功能，也没有较为好用的调试功能，这里就推荐一个更好用的 IDE 工具 (￣▽￣)" —— CLion。

这是出自 Jetbrain 系列里的 IDE 工具集，内置了所需的编译器、调试器以及构建工具等。

关于安装方法，Jetbrain 官方提供了两种安装方法：

### 一、利用 Toolbox App 安装【推荐】

- [JetBrains Toolbox App：轻松管理您的工具](https://www.jetbrains.com.cn/toolbox-app/)

这是 Jetbrain 系列内置的工具安装器，它可以安装所有 Jetbrain 系列的软件。你只需要利用 Toolbox，找到 Clion 并一键下载即可。

当然，若你之前已经安装过，你可以直接点击更新即可。

![Toolbox App](/images/2025/01/toolbox_app.png)

#### 安装位置修改方法（先看这点）

这里需要注意的一点：默认情况下，Jetbrain Toolbox App 下安装工具的路径位于 C 盘的用户数据目录下。为了解决 Windows 下 C 盘的占用空间问题，这里操作如下：

首先，打开 Toolbox App 主页面，点击右上角的<i class="fa-solid fa-gear"></i>  小齿轮图标，选择 ”设置“，如下图：

![](/images/2025/01/toolbox_a_click.png)

找到如下图中标注的部分，将其更改文件夹即可。

![](/images/2025/01/toolbox_settings.png)

需要注意的点：就像上图标注的提示那样，请先做好上述的设置，以便过度占用磁盘空间。

### 二、直接下载安装包

- [CLion：JetBrains 出品的 C 和 C++ 跨平台 IDE](https://www.jetbrains.com.cn/clion/promo/?utm_source=bing&utm_medium=cpc&utm_campaign=cn-bing-br-clion-ex-pc&utm_content=clion-pure&utm_term=clion&msclkid=88035d2533e81edc0b703aadf1e4658c)

这是许多人都会做的步骤，这里不再赘述。**注意记得修改安装路径！**

---

~~关于破解 CLion，请直接点击下方的链接，以直接下载破解脚本即可。对应说明文档已内置！~~
~~下载链接：[传送门](https://catisnotfound.lanzouq.com/i6CdN2l3s51g)~~

----

# 测试运行 C/C++ 语言程序

根据不同的 IDE 工具，有不同的操作步骤。为了方便新手小白快速测试能否成功执行 C/C++ 语言程序。请根据自己的需求一步步进行测试即可。这里同样以 CLion 为例：

首先打开 `CLion`，或者直接在终端下执行 `clion64`。

进入后按照如下图指示，进行操作：

![CLion 创建项目 1](/images/2025/01/clion_create_project.png)

![Clion 创建项目 2](/images/2025/01/clion_create_c.png)

按照上述操作创建项目后，会弹出如下窗口，这里建议选择默认捆绑安装的 MinGW 编译器。按照如下图指示配置即可。

![Clion 工具链](/images/2025/01/clion_toolchain.png)

等待加载完成后，直接执行绿色小三角 <i class="fa-solid fa-play" style="color: rgb(0, 245, 0);"></i> 图标，当终端窗口下出现 `Hello world!` 时，即可完成运行。

![](/images/2025/01/clion_run.png)

# 常见问题

## 1. IDE 如何切换到简体中文

根据如下图进行操作：

![](/images/2025/01/clion_chinese.png)

## 2. Windows 下运行程序时遇到中文出现乱码

### 问题描述

给定一个示例代码，如下：

```C
#include <stdio.h>  
  
int main(void) {  
    printf("你好，世界！\n");  
    return 0;  
}
```

运行结果如下：

```
浣犲ソ锛屼笘鐣岋紒
```

### 解决方法

如下图所示，先点击进入设置（快捷键：<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd>）。

![](/images/2025/01/clion_click_settings.png)

按照如下图指示操作：

![](/images/2025/01/clion_encoding.png)

完成设置后，还需对 `main.c` 文件进行编码转换操作：

![](/images/2025/01/clion_change_2_gbk.png)

## 3. IDE 出现卡顿或显示异常现象

通常情况下，Jetbrain 系列下的所有 IDE 软件都是基于 Java 语言所编写。为了确保能使 IDE 能够流畅运行，可以通过修改内存大小以实现。

具体操作如下图：

![](/images/2025/01/clion_change_mem.png)

需要注意的一点：调整内存时，请根据自己的电脑运行内存配置以适当增加内存。（单位换算：1GB = 1024MB）

设置完成后，重启 IDE 即可生效。