---
title: WSL：一个适用于 Windows 的 Linux 子系统
date: 2024-06-06 17:03:20
tags: ['Windows 软件', 'Linux 学习']
categories: ['技术教程']
excerpt: 本节内容将主要讲 WSL 的优势、配置方法及使用技巧。
thumbnail: /images/0606/R-C.jpg
sticky: 997
---

{% notel regular 'fa-solid fa-book' 'WSL 简介' %}
适用于 Linux 的 Windows 子系统 (WSL) 是 Windows 的一项功能，可用于在 Windows 计算机上运行 Linux 环境，而无需单独的虚拟机或双引导。 WSL 旨在为希望同时使用 Windows 和 Linux 的开发人员提供无缝高效的体验。
{% endnotel %}

# WSL 适合谁？

- Linux 新手、Linux 初学者
- 需要大量命令行操作
- 需要 Linux 开发、Linux 运维等……

# WSL 的优势

在 Windows 系统下，WSL 是以容器的形式存在，你可以使用它能完成以下几件：

- 安装/运行各种发行版 Linux：不管你是 Debian 系、Arch 系、Redhat 系，你可以通过 Microsoft Store 上下载你需要的 Linux 发行版。
- 管理多个 WSL：这就意味着，你可以不单单只安装一个 Linux 发行版，还可以安装多个。
- 独立存储：你可以将文件独立存储于 Linux 文件系统中。
- 在 Windows 上调用 Linux 应用程序：在最新的 WSL 2 中，你可以直接在开始菜单中独立运行已安装的 Linux 应用程序。

# 安装 WSL

{% notel yellow fa-exclamation '注意' %}

WSL 2 支持 Windows 11、Windows 10 版本 2004 及更高版本（内部版本 19041 及更高版本）

请在下载安装前，通过 <kbd><i class="fa-brands fa-windows"></i></kbd> + `R` 打开【运行】窗口，并执行 `winver` 查看操作系统内部版本号。

<img src="/images/0606/1.jpg" alt="查看操作系统内部版本号" style="width: 50%">

{% endnotel %}

你需要安装 Windows Subsystem for Linux (WSL) 和对应的 Linux 发行版。这里就以安装 WSL 和 Ubuntu 24.04 LTS 为例。首先，请直接点击下方按钮以直接安装如下软件。

{% btn regular::WSL 下载安装::https://apps.microsoft.com/detail/9p9tqf7mrm4r?hl=zh-cn&gl=CN ::fa-brands fa-microsoft %}

{% btn regular::Ubuntu 24.04 LTS 下载安装::https://apps.microsoft.com/detail/9nz3klhxdjp5?hl=zh-cn&gl=CN ::fa-brands fa-linux %}

当你完成如上安装之后，接下来，请直接按下 <kbd><i class="fa-brands fa-windows"></i></kbd> + `X` 组合键，进入 Powershell，并输入以下命令，这将会安装 WSL 自选组件。

```powershell
    wsl.exe --install --no-distribution
```

安装完成后，请直接重启自己的电脑。

之后，你就可以直接在开始菜单中找到并启动 Ubuntu 24.04 LTS ，等待几分钟的安装。

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

{% notel yellow fa-exclamation '注意' %}
当你完成如上安装操作后，如果你忘记了自己设置的密码，可以通过以下方法：

打开 Powershell，并以 `root` 用户身份运行，命令如下：

```powershell
    wsl -u root
```

> 若需要指定一个发行版，请直接执行：`wsl -d <发行版名称> -u root`

然后再在终端中输入以下命令，即可重置密码。

```bash
passwd <用户名>
```

其中的 `<用户名>` 即为你设置的用户名。

{% endnotel %}

# WSL 使用方法与技巧

## 命令行操作

WSL 支持在 Powershell 下进行管理。以下仅介绍几条较有用且常用的 WSL 命令：

**（1）如何安装 Linux 发行版**

```powershell
wsl --install -d <发行版名称>
```

其中，`<发行版名称>` 即为你要安装的 Linux 发行版名称，例如，若要安装 Ubuntu 24.04 LTS，则执行如下命令：

```powershell
wsl --install -d Ubuntu-24.04
```

**（2）查看所有当前可用的 Linux 发行版**

```powershell
wsl --list --online
```

或者，使用 `wsl -l -o` 代替。

**（3）列出所有 Linux 发行版的运行状态**

```powershell
wsl --list --verbose
```

或者，使用 `wsl -l -v` 代替。

**（4）启动默认的 Linux 发行版**

```powershell
wsl
```

若需要指定一个发行版，则执行如下命令：

```powershell
wsl -d <发行版名称>
```

**（5）停止默认的 Linux 发行版**

```powershell
wsl --shutdown
```

若需要指定一个发行版，则执行如下命令：

```powershell
wsl --terminate <发行版名称>
```

**（6）设置默认的 Linux 发行版**

```powershell
wsl --set-default <发行版名称>
```

## 图形化操作

如果你觉得以上命令行操作有些许繁琐，那么你可以安装一个图形化管理 WSL 的工具。本文将仅推荐在 Microsoft Store 上下载的两款管理 WSL 的工具。

**WSL Tray Monitor - WSL 系统托盘监控工具**

{% btn center large::WSL Tray Monitor 下载安装::https://apps.microsoft.com/detail/9p781rw2vm6g?hl=zh-cn&gl=CN ::fa-brands fa-windows %}

你可以通过此软件来控制任一 WSL 发行版的启动、停止等操作。

在通知区域图标下，你可以鼠标单击打开管理界面，鼠标双击打开会启动默认的 WSL 发行版并打开终端。

<img src="/images/0606/3.jpg" alt="WSL Tray Monitor 系统托盘监控工具" style="width: 50%">

**WSL Toolbox - 图形化管理 WSL 的工具箱**

{% btn center large::WSL Toolbox 下载安装::https://apps.microsoft.com/detail/9ndggx7m2h0v?hl=zh-cn&gl=CN ::fa-brands fa-windows %}

WSL Toolbox 是一个图形化管理 WSL 的工具箱，你可以在里面针对单个容器进行管理，包括安装、启动、停止、重启等操作。甚至可以导入和导出容器。

但是，对比之前的软件，这个软件并没有系统托盘管理，且容易出现闪退的情况。

<img src="/images/0606/2.jpg" alt="WSL Toolbox 图形化管理 WSL 的工具箱" style="width: 80%">

## 文件管理

你可以在 Windows 资源管理器中访问 <i class="fa-brands fa-linux">Linux</i>，如下图：

<img src="/images/0606/4.jpg" alt="在资源管理器中访问 Linux" style="width: 80%">

## 使用 Visual Studio Code 开发

如果你使用 Visual Studio Code 作为你的开发环境，那么你可以直接在 WSL 中打开你的项目，并进行开发。

你仅需要安装 Visual Studio Code 并安装适用于 WSL 的插件。

![在 WSL 中打开项目](/images/0606/5.jpg)

# 写在最后

最后，希望本文能帮助你更好地了解 WSL，并在日常使用中提高效率。

{% notel green 'fa-solid fa-book' '参考链接' %}
- https://learn.microsoft.com/zh-cn/windows/wsl/install
- https://learn.microsoft.com/zh-cn/windows/wsl/setup/environment
- https://learn.microsoft.com/zh-cn/windows/wsl/basic-commands
{% endnotel %}

