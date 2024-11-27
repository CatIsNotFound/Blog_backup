---
title: '[Switch 分享] 如何实现 Youtube 观看自由'
date: 2024-11-21 19:34:12
updated: 2024-11-21 19:34:12
tags: 
    - Switch
    - Youtube
    - 任天堂
    - 油管
    - Windows
categories: 软件安利
excerpt: 本文主要介绍如何下载并配置网络工具以及如何在 Switch 上流程看油管。
thumbnail: /images/2024/1121/cover.png
sticky: 998
---

# 写在前面

本文主要介绍如何下载并配置网络工具以及如何在 Switch 上流程看油管。如果觉得此篇有用，不如支持此篇文章(\*^_^\*)

![](/images/2024/1121/cover.png)

# 准备

**事先说明：请务必拥有好的网络节点（最起码能够在电脑上访问谷歌）。**

首先，需要在网上下载以下几款软件：

- DNSJumper：一个用于检测 DNS 速度的工具【[点击下载](https://softdown.shwswl.cn/soft/DnsJumper22.zip)】
- Netch：一个用于上网加速的工具【[点击跳转至下载链接](https://github.com/NetchX/Netch/releases)】
- WinPcap：用于辅助 Netch 软件（建议必下）【[点击下载](https://www.winpcap.org/install/bin/WinPcap_4_1_3.exe)】

其次，你只需要做以下事情即可：

- [ ] 下载并解压 DNSJumper、Netch（如果已经下载）；
- [ ] 安装 WinPcap，（如果需要使用 Netch 来实现境外访问）；

# 检测 DNS

根据自己的网络环境，打开 DNSJumper，根据如下图的操作，选择【⚡ 最快 DNS】；

![](/images/2024/1121/1.PNG)

打开之后，点击如下图指示的按钮直接测试 DNS，最后筛选几个毫秒数最小的 DNS 即可。

![](/images/2024/1121/2.PNG)

**注意：这一步在配置 Switch 网络设置时需要用到！**

# Netch 相关配置

**阅前提醒：此步骤需要使用已有的网络节点才能实现网络加速！**

此部分教程适用于需要加速访问油管（▶ Youtube）

## 添加服务器

### 1. 通过订阅添加

1️⃣ 首先，打开 Netch，根据如图所示点开【订阅】菜单。

![](/images/2024/1121/3.PNG)

2️⃣ 按照如下图，填入信息，最后点击【修改】或者【添加】即可。

![](/images/2024/1121/4.PNG)

3️⃣ 完成后，记得再次点击【订阅】菜单，并更新即可。

### 2. 手动添加服务器

以 V2ray 为例：

1️⃣ 选择一个真延迟较低的服务器，（如果没有显示真延迟，先按下 <kbd>Ctrl</kbd> + <kbd>A</kbd> 再按下 <kbd>Ctrl</kbd> + <kbd>R</kbd> 以测试所有服务器 ）

2️⃣ 选中服务器后，按下 <kbd>Ctrl</kbd> + <kbd>C</kbd> 复制；

3️⃣ 打开 Netch，按照如下图所示，直接粘贴即可。

![](/images/2024/1121/6.PNG)

## 简要配置

按照如下图所示的说明进行配置即可。

![](/images/2024/1121/5.PNG)

启动之后，你会得到如下信息：

```
Listen on \Device\NPF_{B86808EE-659B-48E6-864D-DF596E5027B2} (Qualcomm Atheros QCA61x4A Wireless Network Adapter) [74:4c:a1:a4:29:d7]: 192.168.82.5
Use MTU 1400
Publish for 10.6.0.2
Please set the network of your device which is going to be proxied with the following parameters:
    ┌───────────────────────────┐
    │ IP Address       10.6.0.1 │
    │ Mask        255.255.255.0 │
    │ Gateway          10.6.0.2 │
    │───────────────────────────│
    │ MTU                <=1400 │
    └───────────────────────────┘
Proxy 10.6.0.1/32 to 127.0.0.1:2801
```

其中的 IP 地址 `IP Address` 、子网掩码 `Mask`、网关 `Gateway` 在之后配置 Switch 网络时会用到。

# 配置 Switch 网络设置

打开自己的 Switch 设置 → 互联网 → 互联网设置

选择任一 WIFI，然后选择【更改设置】，根据如下图设置 IP 地址以及 DNS 即可。

![](/images/2024/1121/7.jpg)

如果实在找不到合适的 DNS 地址，可以尝试下如下图 : )

![](/images/2024/1121/8.jpg)

最后，不要忘记点击保存设置。

# 写在最后

虽然这是已有的文章，但是还是希望通过此文章来帮助到正在阅读此文的你。(\*^_^\*)