---
title: 搭建个人博客（一）：如何在 Github Page 上搭建我的个人博客
date: 2024-04-23 19:08:53
categories: '博客搭建'
tags: 
    - 'Git'
    - '博客搭建'
thumbnail: "/images/042301/5.jpg"
excerpt: "在这本篇文章中，可以跟随步骤来快速搭建属于自己的博客网站"
---

## 概述

如上标题，现在可以拥有属于自己的个人博客了 \~（＾▽＾）\~ ，

关于个人博客，可以利用 Github Page 来搭建自己的个人博客。

## 怎么做？

### 1. 注册 Github

既然提到了 Github Page ，首先就得[注册自己的 Github 账号](https://github.com/signup)。

> 如果 Github 界面打不开，建议使用 [Watt Toolkit](https://steampp.net/)😃，（不仅可以加速 Steam、橙子、育碧，同时也能加速 Github）
>
> 注册一个 Github 账号只需要邮箱，并且进行邮箱验证就能快速完成！ヾ(•ω•`)o

### 2. 创建自己的仓库

注册之后，接下来就要创建自己的仓库，
首先点击【New】，如下图：

![1.jpg](/images/042301/1.jpg)

其次，创建仓库时，**仓库名一定要以`[你的用户名].github.io` 为名，** 默认下都会将其设为 Github Page，之后就能完成创建。具体看下图：

![2.jpg](/images/042301/2.jpg)

创建完成之后，点击进入你的仓库项目，依次点击【Settings】→ 【Pages】→【Deploy from a branch】，并选择【Github Action】（作此步是方便为了后期可以更换框架来改善自己的博客网页）
![2.1.jpg](/images/042301/2.1.jpg)

### 3. 选择框架

当你做完上述步骤后，你可以直接访问自己的网页，如下图：
![3.0.jpg](/images/042301/3.0.jpg)

接下来就是选择网页框架。这里就以 Hexo 为例，这里就只需要用到 `git` 和 `node.js` 两个依赖软件了，关于详细地安装步骤，请直接参照[官方文档](https://hexo.io/zh-cn/docs/)即可

完成后的搭建，大概是长这样的：

![3.jpg](/images/042301/3.jpg)

当然，这还不够，你还可以给它更换一个更好看的主题，这里作者就用了 Redefine 主题，大概就是长这样的(\*^_^\*)：

![4.jpg](/images/042301/4.jpg)

{% notel blue 'fa-solid fa-lightbulb' '跳转提示' %}

关于怎么配置这个主题，

请跳转到：[【搭建个人博客（二）：如何详细配置 Hexo 使用 Rendefine 主题美化博客】](../../24/搭建个人博客（二）：如何详细配置-Hexo-使用-Rendefine-主题美化博客)

{% endnotel %}

最后简单的做个配置，最终呈现了这样的效果：

![5.jpg](/images/042301/5.jpg)


### 4. 上传到 Github

接下来，将本地上制作好的内容上传到 Github 仓库中。关于怎么上传部署 Github Pages，[请点击查看关于 Hexo 上传部署到 Github Pages 的教程](https://hexo.io/zh-cn/docs/github-pages)

首次执行，需要下列的所有命令：

```shell
git clone [你的Github仓库地址]
cp -r [你的博客名称]/* [Github仓库名称] # 注意两个路径之间留下至少一个空格
cd [Github仓库名称]
git config --global user.name "[你的Github昵称]"
git config --global user.email "[你注册 Github 时所用的邮箱]"
git remote add origin [你的Github仓库地址]
git add *
git commit -m "这里随便写点什么" # 此行指令可不写
git push -u origin main
```

等待上传完成即可(\*^_^\*)

-----

## 写在后面

下一篇将继续详细【[配置 Hexo，以及如何使用 Redefine 主题美化博客](../../24/搭建个人博客（二）：如何详细配置-Hexo-使用-Rendefine-主题美化博客)】

本篇文章中部分没有提到的内容，下一篇也将会详细介绍(\*^_^\*)

