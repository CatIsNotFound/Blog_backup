---
title: 从 0 开始学 Linux：Bash Shell 快速入门
tags:
  - 脚本
  - Linux 学习
categories: 技术教程
date: 2024-06-09 13:10:00
excerpt: 本教程将帮助 Linux 新手或菜鸟通过使用 Bash 命令行使用一些基本命令。
thumbnail: /images/2024/0606/R-C.jpg
---

# 写在最前

本教程将介绍一些基本的 Bash 命令行操作，包括目录操作、文件操作、文件处理等。

文中出现的命令块中的 `[Content]` 表示可选内容，即可以省略。`<Content>` 表示必填内容，不可省略。

命令块示例：

```bash
sudo apt install <软件包> [-y]
```

其中的 `<软件包>` 表示必填，`[-y]` 表示可选。

{% notel blue 'fa-solid fa-book' '准备之前' %}

在阅读本文教程之前，如果还未安装 Linux 环境，请先在下方按钮中选择任一方式以进行安装：

{% btn center large ::从 0 开始学 Linux - 安装 Ubuntu 24.04 LTS 系统::/2024/04/26/从-0-开始学-Linux-安装-Ubuntu-24-04-LTS-系统 :: fa-solid fa-link %}

{% btn center large ::WSL：一个适用于 Windows 的 Linux 子系统::/2024/06/06/WSL：一个适用于-Windows-的-Linux-子系统:: fa-solid fa-link %}

{% endnotel %}

# Bash 命令行

Bash 是一种交互式命令行解释器，它提供命令行界面，让用户可以执行命令、查看文件、创建目录、删除文件等操作。

## 命令组成

Bash 命令由命令名和参数组成。

命令名：命令的名称，如 `ls`、`cd`、`mkdir`、`rm` 等。

参数：命令的附加信息，通常以 `-o` 或者 `--option` 形式出现。参数可以混合使用。

命令组成示例：

```bash
ls -l -h -a
ls -lah
```

## 输入命令

1. 直接在命令行中输入完整的命令，并按下 `Enter` 键。

1. 在命令行中输入命令的前缀或输入文件路径时，按下 `Tab` 键，Bash 会自动补全命令。

1. 使用历史命令：
    - 输入 `history` 命令，可以查看历史命令。
    - 在命令行中输入 `!<命令编号>`，可以执行历史命令。

1. 命令回溯：
    - 使用方向键 `↑` 和 `↓` 可以回溯历史命令。
    - 使用快捷键 `Ctrl` + `R`，可以快速执行之前的命令。

1. 编辑命令：
    - 使用 `Ctrl` + `A` 定位到命令行首。
    - 使用 `Ctrl` + `E` 定位到命令行尾。
    - 使用 `Ctrl` + `K` 删除光标到命令行尾的内容。
    - 使用 `Ctrl` + `U` 删除光标到命令行首的内容。

## 退出命令行

退出命令行有两种方式：

1. 直接按下 `Ctrl` + `D` 键。

1. 输入 `exit` 命令。

# 常用命令

以下是一些常用的命令，包括目录操作、文件操作、文件处理等。

若需要了解更多命令，请直接查询 Linux Shell 基础命令速查表（非完整版）。

{% btn center large ::Linux Shell 基础命令速查表::/2024/04/25/Linux-Shell-命令速查表:: fa-solid fa-link %}

## 管理软件包

你可以利用命令行实现安装、卸载、更新软件包等操作。

**不同的 Linux 发行版，所对应的包管理器有所不同。** 请根据自己所用的发行版系统对号入座。

{% tabs pkg-manager %}
<!-- tab Debian / Ubuntu -->

- 安装软件包：

```bash
sudo apt install <软件包名> [-y]
```

其中的 `-y` 参数可选，表示跳过确认并直接安装。

- 更新软件包：

```bash
sudo apt update
sudo apt upgrade [-y]
```

- 卸载软件包：

```bash
sudo apt remove <软件包名> [-y]
sudo apt autoremove [-y]
```

或者，直接执行 `sudo apt purge <软件包名> [-y]` 即可。

- 搜索软件包：

```bash
apt search <软件包名> [--full-name-only | --names-only]
```

`--full-name-only`： 参数可选，仅显示完整的软件包名称；

`--names-only`： 参数可选，仅显示软件包名称。

<!-- endtab -->
<!-- tab Fedora / Red Hat -->

{% note yellow 'fa-solid fa-exclamation-triangle' %}

**注意：**

若你的 Red Hat 版本低于 8.0（不包括 8.0），请将 `dnf` 替换为 `yum`。

如果你不确定当前是否可以使用 `dnf`，请直接执行 `which dnf` 即可。

{% endnote %}

- 安装软件包：

```bash
sudo dnf install <软件包名> [-y]
```

其中的 `-y` 参数可选，表示跳过确认并直接安装。

- 更新软件包：

```bash
sudo dnf upgrade [-y]
```

- 卸载软件包：

```bash
sudo dnf remove <软件包名> [-y]
```

或者，直接执行 `sudo dnf erase <软件包名> [-y]` 即可。

- 搜索软件包：

```bash
dnf search <软件包名>
```

<!-- endtab -->
<!-- tab Arch / Manjaro -->
- 安装软件包：

```bash
sudo pacman -S <软件包名> [--noconfirm]
```

`--noconfirm`： 参数可选，表示跳过确认并直接安装。

- 更新软件包：

```bash
sudo pacman -Syu
```

- 卸载软件包：

```bash
sudo pacman -R <软件包名> [--noconfirm]
```

或者，直接执行 `sudo pacman -Rs <软件包名> [--noconfirm]` 即可。

- 搜索软件包：

```bash
pacman -Ss <软件包名>
```

<!-- endtab -->
<!-- tab openSUSE -->
- 安装软件包：


```bash
sudo zypper install <软件包名> [-y]
```

其中的 `-y` 参数可选，表示跳过确认并直接安装。

- 更新软件包：

```bash
sudo zypper refresh
sudo zypper update [-y]
```

- 卸载软件包：

```bash
sudo zypper remove <软件包名> [-y]
```

或者，直接执行 `sudo zypper rm <软件包名> [-y]` 即可。

- 搜索软件包：

```bash
zypper search <软件包名>
```

<!-- endtab -->

{% endtabs %}

## 文件管理

你可以利用命令行实现文件管理操作，如创建、删除、移动、复制文件或目录。

### 目录操作

- 切换工作目录：

```bash
cd <目录路径>
```

特别的目录路径有：
1. `~` 表示当前用户的主目录。
1. `-` 表示回到上一次所在的目录。
1. `.` 表示当前目录。
1. `..` 表示上级目录。

- 创建目录：

```bash
mkdir [-p] <目录路径>
```

其中的 `-p` 参数可选，表示创建父目录。

- 删除目录：

```bash
rm -r <目录路径>
```

其中的 `-r` 参数可选，表示递归删除目录及其内容。

- 复制目录：

```bash
cp -r <源目录路径> <目标目录路径>
```

或者，直接执行 `cp -r <源目录路径>/* <目标目录路径>` 即可。

- 移动目录：

```bash
mv <源目录路径> <目标目录路径>
```

`mv` 命令既可以实现文件或目录的移动，同时也可以重命名。

比如：`mv file1.txt file2.txt` 可以将 `file1.txt` 重命名为 `file2.txt`。

- 查看目录内容：

```bash
ls [目录路径] [参数]
```

直接输入 `ls` 将显示当前目录的内容。

其中，`ls` 常用的参数有：

- `-a`： 显示所有文件，包括隐藏文件。
- `-l`： 显示详细信息，包括文件权限、所有者、大小、修改时间等。
- `-h`： 以人类可读的方式显示文件大小。
- `-R`： 递归显示目录下的所有文件。

### 文件操作

- 创建文件：

```bash
touch <文件路径>
```

- 删除文件：

```bash
rm <文件路径>
```

- 复制文件：

```bash
cp <源文件路径> <目标文件路径>
```

- 移动文件：

```bash
mv <源文件路径> <目标文件路径>
```

- 查看文件内容：

```bash
cat <文件路径>
```

- 查看文件属性：

```bash
file <文件路径>
ls -l <文件路径>
```

- 查看文件大小：

```bash
du -sh <文件路径>
```

## 文件处理

你可以通过命令行实现文件处理操作。

### 写入文件

写入文件有多种方式，以下介绍几种常用方法：

**方法一：使用 `echo` 可以将内容写入文件。**

```bash
echo <内容> > <文件路径>
echo <内容> >> <文件路径>
```

1. `>` 表示写入文件，若文件内容存在，则覆盖原有内容；

1. `>>` 表示追加内容到文件末尾。

**方法二：使用 `tee` 命令可以将内容写入文件，并同时输出到屏幕。**

```bash
tee [-a] <文件路径>
```

执行此命令后，你可以输入内容并按下回车，内容将同时写入文件和屏幕。若要结束输入，请按下快捷键： `Ctrl` + `D` 或 `Ctrl` + `C`。

其中的 `-a` 参数可选，表示追加内容到文件末尾。

**方法三：使用 `cat` 命令将内容写入文件。**

```bash
cat > <文件路径>
cat >> <文件路径>
```

执行此命令后，你可以输入内容并按下回车，内容将写入文件。若要结束输入，请按下快捷键： `Ctrl` + `D` 或 `Ctrl` + `C`。

### 读取文件

**方法一：使用 `cat` 命令读取文件内容。**

```bash
cat <文件路径>
```

**方法二：使用 `less` 命令分页显示文件内容。**

```bash
less <文件路径>
```

**方法三：使用 `head` 命令显示文件开头内容。**

```bash
head [-n <行数>] <文件路径>
```

**方法四：使用 `tail` 命令显示文件末尾内容。**

```bash
tail [-n <行数>] <文件路径>
```

**方法五：使用 `grep` 命令搜索文件内容。**

```bash
grep <搜索内容> <文件路径>
```

或者你可以利用 `cat`、 `grep` 以及管道符 `|` 组合命令以搭配使用。

```bash
cat <文件路径> | grep <搜索内容>
```

### 搜索文件

**方法一：使用 `find` 命令搜索文件。**

```bash
find <目录路径> [选项]
```

其中，`find` 命令常用的参数有：

1. `-name`： 指定文件名。
1. `-type`： 指定文件类型。
    - `f`： 显示普通文件。
    - `d`： 显示目录。
    - `l`： 显示符号链接。
1. `-iname`： 指定文件名，**不区分大小写**。
1. `-size`： 指定文件大小。
    - `+n`： 大于 `n` 字节的文件。
    - `-n`： 小于 `n` 字节的文件。
    - `n`： 等于 `n` 字节的文件。
1. `-mtime`： 指定文件最后修改时间。
    - `+n`： 距离现在 `n` 天以内的文件。
    - `-n`： 距离现在 `n` 天以前的文件。
    - `n`： 距离现在 `n` 天的文件。
1. `-exec`： 执行命令。

```bash
find <目录路径> -name <文件名> -exec <命令> {} \;
```

其中的 `{}` 表示搜索结果中的每一个文件名。


**方法二：使用 `locate` 命令搜索文件。**

```bash
locate <文件名>
```

{% note yellow 'fa-solid fa-exclamation-triangle' %}

**注意：**

部分发行版可能没有安装 `locate` 命令，请直接使用对应的包管理器以安装 `mlocate`。

具体安装方法，请见：[管理软件包](#管理软件包) 一节

{% endnote %}

# 写在最后

以上仅介绍了一些基本的 Bash 命令行操作，若需要了解更多命令，请直接查询 Linux Shell 基础命令速查表（非完整版）。

{% btn center large ::Linux Shell 基础命令速查表::/2024/04/25/Linux-Shell-命令速查表:: fa-solid fa-link %}

若在学习过程中遇到问题，欢迎在评论区留言。

{% notel green 'fa-solid fa-book' '跳转提示' %}

若你需要学习 Bash 脚本，请点击下方按钮：

{% btn center large ::从 0 开始学 Linux - Bash Shell 脚本入门::/2024/06/09/从-0-开始学-Linux-Bash-Shell-脚本入门 :: fa-solid fa-link %}

{% endnotel %}