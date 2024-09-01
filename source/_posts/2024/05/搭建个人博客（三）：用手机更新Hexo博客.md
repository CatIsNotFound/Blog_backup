---
title: 搭建个人博客（三）：用 Android 手机更新 Hexo 博客
tags:
  - 博客搭建
  - 软件安利
  - Git
  - Github
  - Hexo
  - Android
categories: 博客搭建
excerpt: >-
  现如今，Hexo 博客已经成为一个非常流行的博客框架，但是 Hexo
  博客的更新通常需要通过命令行操作，对于不擅长命令行操作的小白来说，更新博客就显得十分麻烦。本文将介绍仅适用于 Android 的软件，帮助你在手机上轻松地更新 Hexo 博客。
date: 2024-05-27 10:18:00
updated: 2024-06-08 21:02:24
thumbnail: /images/2024/0527/banner.jpg
---

# 前言

现如今，Hexo 博客已经成为一个非常流行的博客框架，但是 Hexo 博客的更新通常需要通过命令行操作，对于不擅长命令行操作的小白来说，更新博客就显得十分麻烦。本文将介绍仅适用于 Android 的软件，帮助你在手机上轻松地更新 Hexo 博客。


# 备份博客存档

首先，在利用手机之前，首先就是在自己的电脑上**备份自己的博客**。

（PS: 如果不是在电脑上写 Hexo 博客，请当博主没说~ o(\*￣▽￣\*)o）

在此，请直接在 Github 上[**新建一个公共仓库（Public Repository）**](https://github.com/new)，将自己的博客上传到 Github 中。

假设：你已在 Github 上新建了一个名为 `blogBackup` 的公共仓库，那么你应当在命令行下，执行如下命令：

```bash
git init
git add .
git commit -m "20210412" # 此处建议填写上传时间，如：20210412"
git remote add origin https://github.com/yourname/blogBackup.git
git push -u origin master
```

**注意：请将第4行中的 Git 仓库地址替换自己实际的 Github 仓库地址。**

当你完成以上这些命令后，请回到你新建好的 Github 公共仓库以确认上传成功。

# WeBlog

{% notel blue 'fa-solid fa-book' '软件简介' %}

WeBlog 是一个运行在安卓的静态博客编写器，他提供从编写，构建到预览预览博客的能力，同时包含GIT，终端，自定义 Shell 脚本等功能。 新建文章，标签管理，现代化的UI，可以提供更好博客编写的体验。

![](/images/2024/0527/banner.jpg)

{% endnotel %}

## 下载安装

**注意：WeBlog 目前仅支持 Android 系统**

请直接点击下面链接，选择 Arm64 架构的安装包下载并安装。

{% btn center large::点击这里下载软件::https://github.com/PangBaiWork/WeBlog/releases ::fa-brands fa-github %}

## 导入博客

打开 WeBlog 后，**请务必安装 Hexo 框架及外部存储权限申请**。

在主页上点击 `拉取项目`，输入你的 Github 上的仓库地址。

{% notel red 'fa-solid fa-circle-info' '注意' %}

这里并非填你的 Github Pages 仓库地址，而是填写你的**备份博客的仓库地址** （类似于：`https://github.com/yourname/blogBackup.git`，否则无法识别到 Hexo 博客项目。

{% endnotel %}

接着，在选择文件夹时，**请一定要新建一个空的文件夹**，否则无法拉取 Github 仓库项目。

![](/images/2024/0527/1.jpg)

最后，请耐心等待加载，一般需要几分钟才能完成克隆。

## 写博客

**1. 定位你的博客文章目录**

在写博客之前，若需要找到你之前所写的文章，请直接打开你的项目源目录，依次点击 `source` → `_posts` 文件夹，在此目录下，你将看到你之前所写的所有博客文章。

**2. 新建博客文章**

点击右下角的 `+` 号，按照提示填写文章基本信息即可完成创建。

或者直接在终端下执行如下命令：

```bash
hexo new "文章标题"
```

![](/images/2024/0527/2.jpg)

**3. 尽情写作吧！**

## 好用的脚本文件

为了方便编辑或更新博客，请根据自己的需求，在项目源目录的 `.scripts` 文件夹下添加 Shell 脚本，以便减少不必要的操作。

- `update-to-github-pages.sh`：用于将本地博客更新到 Github Pages 仓库。

注意：这将会一次性将博客的所有文件上传到 Github Pages 仓库，并覆盖掉原有的文件。

```bash
#!/bin/bash
hexo clean
hexo generate
hexo deploy
```

- `backup-your-blog.sh`：用于将博客存档上传到 Github 仓库中。

```bash
#!/bin/bash
git add .
# 这将会自动生成当前日期作为备份的备注。如：20210412
git commit -m "$(date +%Y%m%d)" 
git push -u origin master
```

- `setup-your-git.sh`：用于配置 Git 全局参数。**（建议导入博客后，执行一次）**

```bash
#!/bin/bash
git config --global user.name "yourname"
git config --global user.email "youremail@gmail.com"
git config --global --add safe.directory $PWD
```

这里需要修改 `yourname` 和 `youremail@gmail.com` 为你的实际用户名和邮箱。

当你不确定是否配置成功时，可以尝试在终端下单独执行如下命令查看参数是否生效。

```bash
git config --global user.name
git config --global user.email
git config --global safe.directory
```

----

# 常见问题

{% tabs question_answer %}

<!-- tab 💡 常见问题一 -->

Q：为什么拉取项目后，打开自建的文件夹仍是空的？

A：请检查你的远程 Github 仓库是否为私人仓库，若为私人仓库（Private），请将该仓库转换为公共仓库（Public）。

![](/images/2024/0513/6.jpg)

![](/images/2024/0513/7.jpg)

<!-- endtab -->

<!-- tab 💡 常见问题二 -->

Q：当我拉取完项目后，为什么提示找不到 Hexo 框架？

即使用【实时预览】时，直接出现 `The LivePreview is ended.` 提示。

A：在解决此问题前，请先查看你的项目源目录下是否有 `node_modules` 目录。一般情况下，当你备份博客存档时，`node_modules` 目录往往不会被上传到 Github 仓库。

请直接从底部界面向上滑动，打开终端，并执行 `npm install` 命令，等待安装依赖即可。

<!-- endtab -->

<!-- tab 💡 常见问题三 -->

Q：执行 `npm install` 命令时报错？

A：在确认此问题前，请按照如下方式排查：

方法一：检查你的项目源目录是否有 `package.json` 文件。

若你的项目源目录下没有 `package.json` 文件，则需要执行 `npm init` 命令，并按照提示输入相关信息。

方法二：将 `node_modules` 目录复制到你的项目目录中。

为了方便操作，这里作者建议：直接在你的项目源目录下新建一个 `install.sh` 文件并编辑，

这里假设你的 Github 仓库名为 `blogBackup`，**注意替换自己的 Github 仓库地址。**

```bash
#!/bin/bash
# install.sh
# 一次性执行脚本
# 可直接克隆博客存档到本地项目中
# 用于解决无法安装 Hexo 依赖问题
BLOG_DIR=$PWD
cd ~
if [ ! -d ~/blogBackup ];then
    echo "→ 正在克隆……"
    git clone https://github.com/yourname/blogBackup.git # 此处需替换为你的 Github 仓库地址
    cd blogBackup
else
    echo "→ 正在合并……"
    cd blogBackup
    git pull
fi
if [ $? -ne 0 ];then
    echo "❌ 无法拉取仓库！"
    exit 255
fi
if [  ! -d node_modules ];then
    echo "→ 正在安装依赖...."
    npm install
fi
if [ $? -ne 0 ];then
    echo "❌ 下载/安装依赖失败！"
    exit 255
fi
cp -r node_modules $BLOG_DIR

# 注意：
# 其中的第10行的git仓库地址替换为实际的仓库地址。

# 若需要调试于终端之上，请执行：
# bash ./.scripts/install.sh
```

![](/images/2024/0527/3.jpg)

完成脚本执行后，执行 `npm list` 查看是否包含 `hexo` 依赖即可。

<!-- endtab -->

{% endtabs %}

---

以上是本篇文章的全部内容，若在使用过程中遇到问题，请在评论区留言。
