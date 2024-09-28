---
title: 搭建个人博客（五）：完整迁移评论数据至 Vercel（含 Vercel 部署）
tags:
  - 博客搭建
  - Waline
categories: 博客搭建
excerpt: 要想完整迁移 Waline 评论系统的评论数据，请查看此文
thumbnail: /images/2024/0602/waline.jpg
sticky: 999
date: 2024-09-28 13:21:01
updated: 2024-09-28 22:22:01
---



{% notel yellow 'fa-solid fa-exclamation-triangle' '阅前需知' %}

本文主要针对于使用了 **[Deta 部署 Waline 评论系统](/2024/06/02/搭建个人博客（四）：如何实现评论系统)** 或者已使用其它平台部署 Waline 评论系统的使用者而写的文章。

<img src="/images/2024/0602/waline.jpg" width="75%" />

如果需要将之前部署的评论系统里的数据（包括评论、用户、点击数等）完整迁移至 Vercel 所部署的 Waline 评论系统中，需要做以下操作。

{% endnotel %}

# Step 1: 导出数据

为了很好的保存之前部署的评论系统中的数据，需要先将所有的评论及其它数据保存到本地。具体方法如下：

1、打开你的个人博客网页，点击任意文章，在评论区下方点击自己的头像。

![](/images/2024/0928/1.jpg)

2、根据如下图所示，依次点击并选择导出。导出后，会得到一个 `waline.json` 文件（之后导入操作需要用上）。

![](/images/2024/0928/2.jpg)

# Step 2: LeanCloud 操作（使用 Vercel 部署时必用）

{% notel yellow 'fa-solid fa-lightbulb' '提示' %}

如果先前已经使用 LeanCloud 部署过评论系统，可以跳过此步。

{% endnotel %}

1、在 LeanCloud 官网[注册一个账号](https://console.leancloud.app/register)，并创建一个应用。

![](/images/2024/0928/3.jpg)

2、备份 LeanCloud 中的环境变量

![](/images/2024/0928/4.jpg)

{% notel yellow 'fa-solid fa-triangle-exclamation' '需要注意' %}

上图中标注的三个 `AppID`, `AppKey`, `MasterKey` 中的 ID 或密钥复制下来并保存成环境变量文件（以 `waline.env` 命名为例）。具体格式如下，**文件中的 `<...>` 需要替换对应的内容**。

```
LEAN_ID=<AppID>   
LEAN_KEY=<AppKey>
LEAN_MASTER_KEY=<MasterKey>
```
 
之后在部署 Vercel 时，可以一次性导入环境变量。
{% endnotel %}


# Step 3: Vercel 部署 Waline 评论系统

1、在 Vercel 上 [Deploy](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fwalinejs%2Fwaline%2Ftree%2Fmain%2Fexample) Waline 评论系统。

[![deploy](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fwalinejs%2Fwaline%2Ftree%2Fmain%2Fexample)

> 需要注意的是，第一次打开 Vercel 需要登录，此处建议使用 Github 快捷登录即可。

2、根据如下图指示，输入完名字并点击 [Create] 按钮后，等待 1~2 分钟。

![](/images/2024/0928/5.jpg)

当出现烟花庆祝🎉时，表示 Deploy 已经完成，点击黑色按钮 [Go to Dashboard] 即可。

3、根据如下图指示，将写好的环境变量文件 `waline.env` 文件导入。

![](/images/2024/0928/6.jpg)
![](/images/2024/0928/7.jpg)

4、根据下图指示，以执行 Redeploy 操作。

![](/images/2024/0928/8.jpg)
![](/images/2024/0928/9.jpg)

5、等待 1~2 分钟即可完成 Vercel 部署。此时，你可以直接测试自己的评论系统了。

![](/images/2024/0928/10.jpg)

{% notel yellow 'fa-solid fa-exclamation-triangle' '注意' %}

国内网络环境下可能**无法直接访问**到 Vercel 部署的评论系统。若有需要，建议使用代理以访问。

{% endnotel %}

# Step 4: 测试评论系统

要想在自己的博客网站上测试自己部署的 Waline 评论系统，需要做以下几步：

1、在自己的博客项目根目录下找到主题配置文件，这里就以 Redefine 主题为例，打开 `_config.redefine.yml` 文件，找到如下内容，并修改：

```yaml
............
comment:
  # Whether to enable comment
  enable: true
  # Comment system
  system: waline # waline, gitalk, twikoo, giscus
  # System configuration
  config:
    # Waline comment system. See https://waline.js.org/
    waline:
      serverUrl: <在此处粘贴>
      lang: zh-CN
............
```

2、之后在终端下执行：`npx hexo s`

3、打开自己的博客网站（本地下执行预览，只需访问 http://localhost:4000 即可），选择任意文章，在文章页的最下方评论区中测试。



# Step 5: 迁移数据

{% note danger 'fa-solid fa-circle-info' %}
**注意：**在进行导入操作前，请务必**先评论和选择反应**！

否则**导入时会出现弹窗报错**，大致内容为：

```
500: Class or object doesn't exists. [404 GET https://kdxvn5cw.api.lncldglobal.com/1.1/classes/Comment]
```

![](/images/2024/0928/11.jpg)
{% endnote %}

1、在如上图中选择 [登录] 按钮；

<i class="fa-solid fa-circle-info"></i> **需要注意：请先不要登录之前使用的账号，登录其它任意账号！**具体问题，如下对比图：

![](/images/2024/0928/13.jpg)

2、点击 [管理] -> [导入导出]，点击 [导入] 按钮。弹出窗口后，点击 [确认] 以覆盖评论数据。

![](/images/2024/0928/12.jpg)

3、等待 1~2 分钟，当弹出窗口并显示 `导入完成` 时，表示数据迁移完成。

4、最后刷新博客页面，以查看博客里的评论数据是否原样迁移。

