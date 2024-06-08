---
title: 从 0 开始学 Linux：Bash Shell 快速入门
tags:
  - 脚本
  - Linux 学习
categories: 技术教程
date: 2024-06-08 21:10:00
excerpt: 本教程将帮助 Linux 新手或菜鸟通过使用 Bash 命令行使用一些基本命令以及基本脚本编写。
thumbnail:
---

# 写在最前

本教程将帮助 Linux 新手或菜鸟通过使用 Bash 命令行使用一些基本命令以及基本脚本编写。

{% notel blue 'fa-solid fa-book' '准备之前' %}

在阅读本文教程之前，如果还未安装 Linux 环境，请先在下方按钮中选择任一方式以进行安装：

{% btn center large ::从 0 开始学 Linux - 安装 Ubuntu 24.04 LTS 系统::/2024/04/26/从-0-开始学-Linux-安装-Ubuntu-24-04-LTS-系统 :: fa-solid fa-link %}

{% btn center large ::WSL：一个适用于 Windows 的 Linux 子系统::/2024/06/06/WSL：一个适用于-Windows-的-Linux-子系统:: fa-solid fa-link %}

{% endnotel %}

# Bash 命令行快速基础

## 管理软件包

你可以利用命令行实现安装、卸载、更新软件包等操作。

不同的 Linux 发行版，所对应的包管理器有所不同。请根据自己所用的发行版系统进行对号入座。

具体操作方式如下：

### 安装软件包

{% tabs install %}
<!-- tab Debian / Ubuntu -->

```bash
sudo apt install <PACKAGE> [-y]
```

其中的 `-y` 执行后无需确认并直接开始安装

<!-- endtab -->

<!-- tab Fedora / Redhat -->

针对 Redhat 8.0 及以上的版本，请直接执行 `dnf`；Redhat 8.0 以下的版本，请执行 `yum`。

```bash
sudo dnf install <PACKAGE> [-y]
```

```bash
sudo yum install <PACKAGE> [-y]
```

<!-- endtab -->

<!-- tab Arch / Manjaro -->

```bash
sudo pacman -S <PACKAGE> [--noconfirm]
```

其中的 `--noconfirm` 执行后无需确认并直接开始安装

<!-- endtab -->

{% endtabs %}

### 卸载软件包

{% tabs remove %}
<!-- tab Debian / Ubuntu -->

```bash
sudo apt purge <PACKAGE> [-y]
```

其中的 `-y` 执行后无需确认并直接开始安装

<!-- endtab -->

<!-- tab Fedora / Redhat -->

针对 Redhat 8.0 及以上的版本，请直接执行 `dnf`；Redhat 8.0 以下的版本，请执行 `yum`。

```bash
sudo dnf remove <PACKAGE> [-y]
```

```bash
sudo yum remove <PACKAGE> [-y]
```

<!-- endtab -->

<!-- tab Arch / Manjaro -->

```bash
sudo pacman -R <PACKAGE> [--noconfirm]
```

其中的 `--noconfirm` 执行后无需确认并直接开始安装

<!-- endtab -->

{% endtabs %}

### 更新 / 升级软件包

{% tabs update %}
<!-- tab Debian / Ubuntu -->

```bash
sudo apt update && sudo apt upgrade [-y]
```

其中的 `-y` 执行后无需确认并直接开始安装

<!-- endtab -->

<!-- tab Fedora / Redhat -->

针对 Redhat 8.0 及以上的版本，请直接执行 `dnf`；Redhat 8.0 以下的版本，请执行 `yum`。

```bash
sudo dnf update [-y]
```

```bash
sudo yum update [-y]
```

<!-- endtab -->

<!-- tab Arch / Manjaro -->

```bash
sudo pacman -Syu [--noconfirm]
```

其中的 `--noconfirm` 执行后无需确认并直接开始安装

<!-- endtab -->

{% endtabs %}