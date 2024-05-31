---
title: 如何在命令行下使用 Git？
date: 2024-04-23 19:09:08
tags: ['Git']
categories: '技术教程'
excerpt: "Git，作为一款强大的分布式版本控制系统，为代码协作与版本追踪提供了坚实的基础。针对不熟悉命令行操作的菜鸟，本文将简要介绍如何在命令行下利用 Git 进行简单操作。"
thumbnail: https://tse3-mm.cn.bing.net/th/id/OIP-C.DU_6FiZRk0zVTuLtcVQXiQHaEK?rs=1&pid=ImgDetMain
---

Git，作为一款强大的分布式版本控制系统，为代码协作与版本追踪提供了坚实的基础。针对不熟悉命令行操作的菜鸟，本文将简要介绍如何在命令行下利用 Git 进行简单操作。

## 下载 Git

首先，需要先下载 Git，对于不同的操作系统，安装方式各有不同，具体如下：

- Linux: 根据不同的发行版，在终端中输入对应的安装命令即可
  {% tabs Install_git %}
  
  <!-- tab Debian(Ubuntu) -->
  
  ```shell
  sudo apt install git -y
  ```
  
  <!-- endtab -->
  
  <!-- tab Arch Linux -->
  
  ```shell
  sudo pacman -Sy git 
  ```
  
  <!-- endtab -->
  
  <!-- tab Fedora(Redhat) -->
  
  ```shell
  sudo dnf install git -y
  ```
  
  <!-- endtab -->
  
  <!-- tab CentOS(7.9及以下) -->
  
  ```shell
  sudo yum install git -y
  ```
  
  <!-- endtab -->
  
  {% endtabs %}

- Windows / MacOS: https://git-scm.com/downloads

要检查 Git 安装是否完成，只需执行命令：

```bash
git --version
```

## 简单使用 Git

关于此处，你可以直接通过如下图进行速查：

![Git 常用命令速查表](https://www.runoob.com/wp-content/uploads/2015/02/011500266295799.jpg)

以下是较为常用的 Git 命令：

首先最为简单的事，就是从 Github 等其它代码托管平台上**克隆项目**

克隆源代码项目：

```bash
git clone [远程仓库地址]
```

安装完成后，首先第一件事：就是需要先配置用户和邮箱。

配置用户：

```bash
git config --global user.name [你的名字]
```

配置邮箱：

```bash
git config --global user.email [你的邮箱]
```

要初始化一个自己的 Git 项目，执行如下：

```bash
git init [你的项目名]
```

当然，你也可以选择在当前目录下初始化你的 Git，只需执行：`git init`

将文件添加到分支中：

```bash
git add *
git add .
git add [指定的文件或目录]
```

> 这里的 `*` , `.` 都代表当前目录下所有需要添加或修改的文件

将文件从分支中删除：

```bash
git rm -r [指定目录]        # 删除目录及其所有子文件
git rm [指定文件或目录]     # 删除文件
git rm -r *                # 删除所有
```

查看所有已添加到分支里的文件

```bash
git ls-files
```

为分支里的文件进行提交（commit：提交时需要用到的标记）：

```bash
git commit -m '[内容]'
git commit -am '[内容]'  # 添加并提交
git commit --amend -m '[内容]' # 反复修改并提交 
```

查看当前的分支状态：

```bash
git status
```

关于分支（branch）：

```bash
git show-branch     # 查看当前分支历史
git show-branch -a  # 查看当前分支的所有历史
git branch          # 查看当前存在的分支
git branch -a       # 查看所有存在的分支
git branch -M main  # 新建一个 main 分支
git branch -m main main_copy # 将 main 分支改名为 main_copy
```

添加远程仓库（Github、Gitlab、Gitee……）：

```bash
git remote add origin [远程仓库地址]
```

上传/推流到远程仓库：

```bash
git push origin master   # 将本地分支推流到远程分支
```

从远程仓库中获取/合并到本地分支：

```bash
git pull origin master  # 获取远程分支master并merge到本地分支
git merge origin/master     # 从远程分支中合并到本地分支
```

更多进阶的命令，可以查看 [Git 常用命令大全](https://www.runoob.com/note/56524)，内容更加详细(\*^_^\*)。
