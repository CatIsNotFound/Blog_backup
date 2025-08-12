---
title: Debian 13（Trixie）全面体验：新特性、安装与升级指南
tags:
  - 系统体验
  - Linux
  - Debian
  - GNOME
  - KDE
  - 桌面环境
categories: 系统体验
excerpt: >-
  2025 年 8 月 9 日，Debian 13 正式发布，这是目前最新的通用操作系统。本文将介绍 Debian 13
  的特性、安装步骤以及注意事项。
thumbnail: /images/2025/08/Debian_13_Server-2025-08-11-21-48-17.png
date: 2025-08-11 23:48:26
---

> 这次体验的 Linux 发行版系统主要以本周末最新发布的 Debian 13 展开。
> 
> 通过本文的内容，你可以快速从系统的最新特性、安装步骤、简单的桌面体验等方面展开。希望这篇文章能有所帮助！

-------

# 最新特性

Debian 13（代号 Trixie）带来了许多显著的新特性和改进，涵盖了架构支持、安全功能、桌面环境、软件更新等多个方面。

## 主要更新内容

- **官方支持 riscv64[^2] 架构**：首次官方支持 `riscv64` 架构，用户可在 64 位 RISC-V[^1] 硬件上运行 Debian 13 并享受其所有功能。

- **增强安全防护**：在 `amd64` 和 `arm64` 架构上增加安全特性，抵御 ROP[^3] 和 COP/JOP[^4] 攻击，硬件支持时自动启用。

- **支持 HTTP 启动**：Debian 安装程序和 Live 镜像在支持的 UEFI 和 U-Boot 固件上可使用 `HTTP Boot` 启动。

- **改进手册页翻译**：manpages-10n 项目贡献了许多改进和新的手册页翻译，如罗马尼亚语和波兰语翻译得到显著增强。

- **增加拼写检查支持**：基于 Qt WebEngine 的浏览器支持使用 `hunspe11` 数据进行拼写检查。

- **64 位 time_t ABI 过渡**：除 `i386` 外，所有架构使用 64 位 time_t ABI，部分 32 位架构库的 ABI 有变化。

- **推进可复现构建**：Debian 贡献者在确保软件包构建结果可复现方面取得显著进展，可使用相关工具查看状态。

- **升级 curl 功能**：`curl` CLI 和 `libcurl` 支持 HTTP/3，curl 软件包还提供了 `wcurl` 下载工具。

- **支持 BDIC[^5] 二进制字典**：首次提供 `.bdic` 二进制字典，基于 Qt WebEngine 的浏览器可利用其进行拼写检查。

- **更新大量软件包**：新增超 14116 个软件包，总数超 69830 个；多数软件包更新，超 44326 个；超 8844 个软件包因各种原因被删除 。包含多种桌面环境和生产力应用升级，以及众多常见软件包版本更新。

## 包更新对比

下表为各个桌面环境的版本对比：

| 桌面环境         | Debian 13 | Debian 12 |
| ------------ | --------- | --------- |
| GNOME        | 48        | 43        |
| KDE (Plasma) | 6.3.6     | 5.27.5    |
| Xfce         | 4.20      | 4.18      |
| LXDE         | 13        | 11        |
| LXQt         | 33        | 31        |
| Mate         | 1.26.2    | 1.26.0    |

下表为 Debian 12 与 Debian 13 的部分流行软件包对比：

| 软件包                                                 | 在 12 （bookworm） 中的版本      | 在 13 （trixie） 中的版本                |
| --------------------------------------------------- | ------------------------- | --------------------------------- |
| Apache                                              | 2.4.62                    | 2.4.64                            |
| Bash                                                | 5.2.15                    | 5.2.37                            |
| BIND DNS 服务器                                        | 9.18                      | 9.20                              |
| Cryptsetup                                          | 2.6                       | 2.7                               |
| curl/libcurl                                        | 7.88.1                    | 8.14.1                            |
| Emacs                                               | 28.2                      | 30.1                              |
| Exim (default email server)                         | 4.96                      | 4.98                              |
| GCC, the GNU Compiler Collection (default compiler) | 12.2                      | 14.2                              |
| GIMP                                                | 2.10.34                   | 3.0.4                             |
| GnuPG                                               | 2.2.40                    | 2.4.7                             |
| Inkscape                                            | 1.2.2                     | 1.4                               |
| GNU C 运行库                                           | 2.36                      | 2.41                              |
| Linux kernel                                        | 6.1 系列                    | 6.12 series                       |
| LLVM/Clang 工具链                                      | 13.0.1 和 14.0（默认）和 15.0.6 | 19 (default), 17 and 18 available |
| MariaDB                                             | 10.11                     | 11.8                              |
| Nginx                                               | 1.22                      | 1.26                              |
| OpenJDK                                             | 17                        | 21                                |
| OpenLDAP                                            | 2.5.13                    | 2.6.10                            |
| OpenSSH                                             | 9.2p1                     | 10.0p1                            |
| OpenSSL                                             | 3.0                       | 3.5                               |
| Perl                                                | 5.36                      | 5.40                              |
| PHP                                                 | 8.2                       | 8.4                               |
| Postfix                                             | 3.7                       | 3.10                              |
| PostgreSQL                                          | 15                        | 17                                |
| Python 3                                            | 3.11                      | 3.13                              |
| Rustc                                               | 1.63                      | 1.85                              |
| Samba                                               | 4.17                      | 4.22                              |
| Systemd                                             | 252                       | 257                               |
| Vim                                                 | 9.0                       | 9.1                               |

## 升级到 Debian 13

此文针对于早期版本的 Debian，若 Debian 版本早于 13 之前，可以直接通过修改软件源的方法并执行检查更新的方式以实现升级。具体步骤如下：

第一步：**备份重要数据**

在进行任何系统升级之前，务必备份重要数据，以防升级过程中出现问题。

第二步：更改软件源

```bash
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
```

第三步：更新软件源并升级

```bash
sudo apt update
sudo apt full-upgrade
```

第四步：更新阶段

在出现如下图时，请按 <kbd>Q</kbd> 键。

![](/images/2025/08/image_S2xQK.png)

出现如下提示弹窗时，选择 [Yes] 以重新启动服务。

![](/images/2025/08/image_CeXju.png)

更新过程中，可能会出现配置文件是否更新的情况（比如 `sshd_config` 文件），这里请选择第二项保持原有配置文件即可。

![](/images/2025/08/image_v7Yk2.png)

第五步：清理工作

```bash
sudo apt autoremove -y
sudo apt autoclean
```

第六步：检查版本

通过执行以下命令即可查看：

```bash
cat /etc/os-release
```

出现如下提示信息，表示更新完成。

```ini
PRETTY_NAME="Debian GNU/Linux 13 (trixie)"
NAME="Debian GNU/Linux"
VERSION_ID="13"
VERSION="13 (trixie)"
VERSION_CODENAME=trixie
DEBIAN_VERSION_FULL=13.0
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

# 下载安装

## 下载

你可以直接通过[官方网站](https://www.debian.org/distrib/)下载到最新的 Debian 13。如下图：

![](/images/2025/08/Snipaste_2025-08-11_22-14-18.jpeg)

**需要注意：如果需要将系统安装到物理机上，建议直接下载离线安装镜像（如上图中黄色框内的下载链接）或者 Live 现场版安装镜像（如 Gnome、KDE、Xfce 版本的 Live 镜像），以避免出现找不到无线网卡而引发的网络问题。**

## 安装

观前提示：这里本文以 VMWare 虚拟机为例，简要以图文的方式展开。

{% notel blue 'fa-solid fa-lightbulb' '提示' %}

你可以通过本站的下列链接进行获取 VMware 17 版本：

{% btn center::百度网盘下载::https://pan.baidu.com/s/1657rN6s6_bQTyYeLTS-grg?pwd=jd5g::fas fa-link %}

{% btn center::夸克网盘下载::https://pan.quark.cn/s/e8159ecd2736::fas fa-link %}

新建 VMware 部分，请点击参阅文章【新建虚拟机】一节。

{% btn center regular::从 0 开始学 Linux：安装 Ubuntu 24.04 LTS 系统 - 新建虚拟机::/2024/04/从-0-开始学-Linux-安装-Ubuntu-24-04-LTS-系统/#新建虚拟机::fas fa-link %}

{% endnotel %}

### 第一步：启动虚拟机

BIOS 下启动：选择第一项

![](/images/2025/08/Debian_13_Server-2025-08-11-17-36-30.png)

UEFI 下启动：选择第一项

![](/images/2025/08/Debian_13_Server-2025-08-11-17-43-05.png)

### 第二步：选择语言区域。

![](/images/2025/08/Debian_13_Server-2025-08-11-17-44-16.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-44-33.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-44-46.png)

### 第三步：创建主机、用户

![](/images/2025/08/Debian_13_Server-2025-08-11-17-47-01.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-47-23.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-47-49.png)

{% notel yellow 'fa-solid fa-lightbulb' '提示' %}

关于设置 Root 密码步骤，可以直接不设置密码（即空密码）并跳过下一步。

如果作为主力机或普通的台式机而言，**Root 不是必需选项**。

{% endnotel %}

![](/images/2025/08/Debian_13_Server-2025-08-11-17-48-06.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-48-26.png)

### 第四步：磁盘分区

![](/images/2025/08/Debian_13_Server-2025-08-11-17-49-39.png)

{% notel yellow 'fa-solid fa-lightbulb' '注意' %}

关于虚拟机，你可以直接按照向导完整地将整个磁盘格式化并安装此系统。

而对于双系统而言，**强烈建议选择 【手动】 选项自行分区。**

针对分区方案，你可以按照如下表格进行参考：

**注：针对于双系统，挂载点 `/boot/efi` 普遍不用分区，通过观察分区表的大小（通常启动分区小于 512 MB），可直接找到此分区，只需直接将此分区手动挂载为 `/boot/efi` 分区便可。**  

分区方案 1：同一分区

| 挂载点         | 大小       | 文件系统  | 说明        |
|:----------- |:-------- |:----- |:--------- |
| `/boot/efi` | 512 MB   | FAT32 | UEFI 启动分区 |
| `swap`      | 2 ~ 4 GB | swap  | 交换分区      |
| `/`         | 剩余空间     | ext4  | 根分区       |

分区方案 2：将 `/home` 单独分区（其中的 `/` 和 `/home` 的大小需自行分配）

| 挂载点         | 大小         | 文件系统  | 说明        |
|:----------- |:---------- |:----- |:--------- |
| `/boot/efi` | 512 MB     | FAT32 | UEFI 启动分区 |
| `swap`      | 2 ~ 4 GB   | swap  | 交换分区      |
| `/`         | 24 ~ 64 GB | ext4  | 根分区       |
| `/home`     | 剩余空间       | ext4  | 用户数据      |

{% endnotel %}

完成分区后，需手动确认。如下图：

![](/images/2025/08/Debian_13_Server-2025-08-11-17-51-42.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-51-55.png)

### 第五步：配置软件包

在此步中，选择【否】以忽略此步。

![](/images/2025/08/Debian_13_Server-2025-08-11-17-53-02.png)

{% notel yellow 'fa-solid fa-lightbulb' '提示' %}

如果使用的安装镜像为离线安装镜像，则会出现如下图提示。

针对于离线安装的需求（即不能上网的情况），可直接选择【否】，安装程序会自动选择物理介质（而非使用在线远程网络镜像站点下载）。*这么做可加快安装速度而非依赖自身的网络速度所影响。*

![](/images/2025/08/Debian_13-2025-08-11-22-47-36.png)

本文将以在线配置网络镜像站点的方式安装系统。

{% endnotel %}

这里按照自己的地理区域，选择最快的网络站点下载即可。

![](/images/2025/08/Debian_13_Server-2025-08-11-17-53-10.png)

此步骤中，可以选择任一镜像源，本文就以清华镜像站点作为软件源。

![](/images/2025/08/Debian_13_Server-2025-08-11-17-53-26.png)

此步什么都不填写，跳过即可。

![](/images/2025/08/Debian_13_Server-2025-08-11-17-53-35.png)

![](/images/2025/08/Debian_13_Server-2025-08-11-17-54-07.png)

此步骤中可以选择安装自己喜欢的桌面环境以及 SSH、Web 等服务。这里根据自己的需求进行选择即可。

![](/images/2025/08/Debian_13_Server-2025-08-11-17-54-28.png)

此步骤选择【是】以安装 Grub 启动引导器。

![](/images/2025/08/Debian_13-2025-08-11-22-14-34.png)

此步骤选择第二项以选择安装 Grub 引导。

**注：双系统下，可能为 `/dev/nvme...`，请选择此项并将其安装即可。** 

![](/images/2025/08/Debian_13-2025-08-11-22-14-44.png)

等待安装完成，弹出如下图，重启即可完成。

![](/images/2025/08/Debian_13-2025-08-11-22-15-23.png)

重启后，便会进入桌面，下图为 GNOME 桌面环境。

![](/images/2025/08/Debian_13_Server-2025-08-11-21-48-17.png)

--------

# 参考内容与注释

- [Debian 13 的新变化 — release-notes 文档](https://www.debian.org/releases/testing/release-notes/whats-new.zh_CN.html)

- [Debian -- Debian “trixie” 发行信息](https://www.debian.org/releases/trixie/)

- [RISC-V - 维基百科，自由的百科全书](https://zh.wikipedia.org/wiki/RISC-V)

- [面向回报的编程 - 维基百科 --- Return-oriented programming - Wikipedia](https://en.wikipedia.org/wiki/Return-oriented_programming)

- [BDIC File Extension - What is it? How to open a BDIC file?](https://filext.com/file-extension/BDIC)

[^1]: **RISC-V**（英语发音为“risk-five”）是一个基于[精简指令集](https://zh.wikipedia.org/wiki/精简指令集)（RISC）原则的[开源](https://zh.wikipedia.org/wiki/开源标准)[指令集架构](https://zh.wikipedia.org/wiki/指令集架構)（ISA），简易解释为与[开源软件](https://zh.wikipedia.org/wiki/開源軟體)运动相对应的一种“[开源硬件](https://zh.wikipedia.org/wiki/開源硬體)”。[维基百科]
**riscv64** 架构的硬件目前主要以嵌入式、物联网、边缘计算等场景为主，依托开源特性和灵活性在低成本、低功耗设备中快速普及。 
**面向返回的编程** （**ROP**） 是一种[计算机安全漏洞利用](https://en.wikipedia.org/wiki/Computer_security_exploit)技术，允许攻击者在存在安全防御的情况下执行代码。原理：攻击者利用程序中现有的代码片段（gadgets），这些片段通常以返回指令（ret）结束。通过操纵程序的控制流，攻击者将这些 gadgets 链接在一起，构造出恶意的指令序列，从而实现任意代码执行。[维基百科]
COP 是利用涉及函数调用的现有代码序列构建恶意指令序列；JOP 则是利用跳转指令（如条件跳转或无条件跳转）来改变程序执行流程。它们与 ROP 类似，都是通过控制程序的控制流来达到恶意目的。
BDIC（Binary Dictionary）二进制字典是一种专门用于提高浏览器拼写检查效率的文件格式，由谷歌开发，主要应用于基于 Chromium 开源项目的浏览器。
