---
title: '[疑难解答] 关于 Github 的问题解决方法'
tags:
  - Github
  - Git
  - 疑难解答
  - 新手向
categories: 疑难解答
excerpt: Github 相关的问题解决方法都在这里，后续还在继续更新....
thumbnail: https://askanydifference.com/wp-content/uploads/2023/06/github.jpg
date: 2024-09-01 12:48:45
---


# 前言

<!-- ![Github](https://askanydifference.com/wp-content/uploads/2023/06/github.jpg) -->
<img src="https://askanydifference.com/wp-content/uploads/2023/06/github.jpg" alt="Github" width="75%">

Github 是一个很常用的代码托管平台，我们可以利用此平台下载或克隆到优质的代码仓库，但是在某些情况下，我们可能会遇到一些问题，下面是由本人列举的一些问题与解决方法，希望这能有所帮助😉。

# 1、Github 访问不了

大多数国内的用户在访问 Github 时总会遇到加载速度缓慢，甚至无法访问站点的情况。关于此类问题，有以下几个方法解决：

## 1.1 利用 Watt Toolkit 加速访问 👍

众所周知，Watt Toolkit (Steam++ 前身) 是一个非常适合新手的软件，你仅需在【网络加速】页面上勾选上 <i class="fa-brands fa-github"></i> Github 选项，点击 [立即加速] 即可。这也是本人最为推荐的方法。

{% btn center large::Watt Toolkit 下载::https://steampp.net/::fa-solid fa-download %}

![](/images/2024/0901/1.jpg)

## 1.2 科学上网

如果有经济条件，科学上网是非常不错的选择。现如今，本人最推荐的是以下两款主流的科学上网软件：

**V2rayNG**：一个基于 v2ray 的免费开源软件，支持 Windows、Android、iOS 等平台。
{% btn center large::V2rayNG 下载::https://github.com/2dust/v2rayNG/releases ::fa-brands fa-github %}
**Clash 小猫咪**：一个开源的代理软件，支持 Windows、Android、iOS 等平台。
{% btn center large::Clash 下载::https://github.com/clashdownload/Clash ::fa-brands fa-github %}

如果需要追求网络稳定、快速，那么**购买靠谱的节点或机场**是不错的选择。反之，如果没有经济条件，选择**免费节点**也是不错的选择，但不能保证网络一直稳定、快速。

关于免费节点的获取，本文就不分享免费节点站点了，请自行使用必应或 Google 搜索。

**注意：寻找免费节点时，请尽量不要使用百度搜索！**

# 2、无法从 Github 项目中克隆或推送项目

此类问题非常常见，当你在终端下执行 `git clone <URL>` 或者 `git push -u origin main` 时，可能会出现不同程度的报错：

## 443 端口无法连接

```
fatal: unable to access 'https://github.com/XXX/XXX.git/': Failed to connect to github.com port 443 after 21066 ms: Could not connect to server
```

此类问题下最好是通过**使用代理**，在使用此方法前，首先请确保你已安装如上提到的软件，如：Clash、V2rayNG 等。

不同的软件，对应使用的端口也不相同，具体如下：

**1、Clash 小猫咪**

通过其默认端口 `7890` 以直接配置如下：

```bash
git config --global http.proxy 127.0.0.1:7890
git config --global https.proxy 127.0.0.1:7890
```

**2、V2rayNG**

关于此软件，需要打开软件主界面，在如下图所指示的地址就是配置代理的选项，

![新版 UI](/images/2024/0901/3.jpg)

{% note yellow fa-circle-exclamation %}

**注意：**

V2rayN 的 UI 版本不同，如果使用的是旧版本的 V2rayN，则为如下图所指示：

![旧版 UI](/images/2024/0901/2.jpg)

{% endnote %}

这里就按照 Http 所提供的端口 `10809` 进行配置即可：

```bash
git config --global http.proxy 127.0.0.1:10809
git config --global https.proxy 127.0.0.1:10809
```

## Git 中的 Github 邮箱与密码

假如你需要在 Github 中克隆一个私有的项目仓库或推送项目仓库时，往往会出现如下情况：

```
Username for 'https://github.com':
Password for 'https://username@github.com':
```

此类情况下，你需要输入**对应的用户名和对应的 Token** 才能继续操作。关于 Token 的获取，请看下文。

1. 首先点击此链接 [New Personal Access Token (Classic) (github.com)](https://github.com/settings/tokens/new)
   
2. 根据如下图所示操作：
   ![](/images/2024/0424/1.jpg)

3. 完成后点击最下方的绿色按钮【Generate token】，这将会生成一个随机的 token，如下图：
   ![](/images/2024/0424/2.jpg)

   上图中的绿色框为所需要的 Token​。

   {% note danger 'fa-solid fa-circle-info' %}
   **需要注意：**

   ​	每次仅会显示一次完整的 Token，下一次刷新页面后将会完全隐藏，建议生成后做好备份！

   {% endnote %}

# 后记

本篇内容仅是本人在 Github 上的常见问题，如果遇到其它问题或者有更好的解决方案，欢迎在评论区下留言！