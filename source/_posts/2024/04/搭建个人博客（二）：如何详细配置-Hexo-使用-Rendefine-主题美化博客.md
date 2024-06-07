---
title: 搭建个人博客（二）：如何详细配置 Hexo + 使用 Redefine 主题美化博客
tags:
  - 个人博客
  - 博客搭建
categories: 博客搭建
thumbnail: /images/0424/banner.jpg
excerpt: 在这篇文章中，将会详细地讲述搭建后关于 Hexo 的配置以及如何自定义自己的 Redefine 主题。
date: 2024-04-24 14:44:21
---


## 概述

在这上一篇[【搭建个人博客（一）：如何在 Github Page 上搭建我的个人博客】](../../23/搭建个人博客（一）：如何在-Github-Page-上搭建我的个人博客)文章中，我们已经完成了搭建。在这篇文章中，将会详细地讲述搭建后关于 Hexo 的配置以及如何自定义自己的 [Redefine 主题](https://redefine.ohevan.com/)。

## Hexo 配置

### 基础配置

打开项目目录下的 `_config.yml` 文件，请找到如下内容并修改如下：

```yaml
# Site
title: 						# 必填，输入网站标题
subtitle: 					# 此处可不填，子标题
description: 				# 此处可不填，网站简介
keywords: 					# 此处可不填，关键词
author:  					# 必填，作者名称
language: zh-CN				# 必填，使用的语言，这里应填为 `zh-CN` 
timezone: 'Asia/Shanghai'	# 必填，时区，在国内建议选择上海时间

# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'
url: https://<你的 Github 用户名>.github.io 	# 必填，Github Page 的地址
permalink: :year/:month/:day/:title/
permalink_defaults:
pretty_urls:
  trailing_index: true # Set to false to remove trailing 'index.html' from permalinks
  trailing_html: true # Set to false to remove trailing '.html' from permalinks
```

### 如何更换默认主题

在完成 Hexo 搭建时，如果需要更换默认主题，仅需在项目根目录下的 `_config.yml` 文件中找到并修改如下：

```yaml
theme: redefine	# 请在此处修改主题名称，比如：redefine
```

当然，你可以在 *https://hexo.io/themes/* 上选择其它主题，这篇就以使用 [Redefine](https://redefine.ohevan.com/) 主题为例。 

### Deploy 设置

关于这个，它可以方便我们一次性将写好的博客及配置好的主题打包上传到 Github，以自动同步 Github Page 中，具体需在 `_config.yml` 文件下找到并修改如下：

```yaml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  # 必填，Github 仓库地址
  repo: https://github.com/<Github 用户名>/<Github 用户名>.github.io.git 
  branch: 'main'	# 决定上传到哪个节点下，这里默认选择 'main'
  token: 			# 可不填
```

### 测试

完成这些配置后，需做好如下命令：

```shell
hexo clear
hexo g
hexo d
```

若执行时出现以下信息时，需要手动输入用户名及邮箱

```
Username for 'https://github.com': CatIsNotFound # 输入 Github 用户名
Password for 'https://CatIsNotFound@github.com': # 从 Github 中粘贴自己生成的 Token
```

{% notel yellow 'fa-solid fa-lightbulb' '如何获取 Token？' %}

1. 要想获取 Token，首先进入此链接 [New Personal Access Token (Classic) (github.com)](https://github.com/settings/tokens/new)
   
2. 根据如下图所示操作：
   ![](/images/0424/1.jpg)

3. 完成后点击最下方的绿色按钮【Generate token】，这将会生成一个随机的 token，如下图：
   ![](/images/0424/2.jpg)

   上图中的绿色框为所需要的 Token​。

   {% note danger 'fa-solid fa-circle-info' %}
   **需要注意：**

   ​	每次仅会显示一次完整的 Token，下一次刷新页面后将会完全隐藏，建议生成后做好备份！

   {% endnote %}

{% endnotel %}

若已经完成了上传，只需要在 github 上刷新即可查看到上传的内容是否类似如下：

![](/images/0424/3.jpg)

## Redefine 美化主题配置

### 一、安装和测试主题：

#### 安装主题

```shell
npm install hexo-theme-redefine@latest
```

#### 启用主题

[点击此处查看如何更换主题](#如何更换默认主题)，这里不再赘述

#### 主题配置文件

在项目根目录下，新建一个 `_config.redefine.yml` 文件，并复制如下内容：

```yaml
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# THEME REDEFINE CONFIGURATION FILE V2
# BY EVANNOTFOUND
# GITHUB: https://github.com/EvanNotFound/hexo-theme-redefine
# DOCUMENTATION: https://redefine-docs.ohevan.com
# DEMO: https://redefine.ohevan.com
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# BASIC INFORMATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/basic/info
info:
  # Site title
  title: Theme Redefine
  # Author name
  author: The Redefine Team
  # Site URL
  url: https://redefine.ohevan.com
# BASIC INFORMATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# IMAGE CONFIGURATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/basic/defaults
defaults:
  # Favicon
  favicon: /images/redefine-favicon.svg
  # Site logo
  logo: 
  # Site avatar
  avatar: /images/redefine-avatar.svg
# IMAGE CONFIGURATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# COLORS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/basic/colors
colors:
  #Primary color
  primary: "#A31F34"
  # Secondary color (TBD)
  secondary:
  # Default theme mode initial value (will be overwritten by prefer-color-scheme)
  default_mode: light # light, dark
# COLORS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# SITE CUSTOMIZATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/basic/global
global:
  # Custom fonts
  fonts:
    # Chinese fonts
    chinese: 
      enable: false # Whether to enable custom chinese fonts
      family:  # Font family
      url:  # Font URL to CSS file
    # English fonts
    english: 
      enable: false # Whether to enable custom english fonts
      family:  # Font family
      url:  # Font URL to CSS file
  # Content max width
  content_max_width: 1000px
  # Sidebar width
  sidebar_width: 210px
  # Effects on mouse hover
  hover:
    shadow: true # shadow effect
    scale: false # scale effect
  # Scroll progress
  scroll_progress:
    bar: false # progress bar
    percentage: true # percentage
  # Website counter
  website_counter:
    url: https://cn.vercount.one/js # counter API URL (no need to change)
    enable: true # enable website counter or not
    site_pv: true # site page view
    site_uv: true # site unique visitor
    post_pv: true # post page view
  # Whether to enable single page experience (using swup). See https://swup.js.org/. similar to pjax
  single_page: true
  # Whether to enable Preloader.
  preloader: true
  # Whether to enable open graph
  open_graph: true
  # Google Analytics
  google_analytics:
    enable: false # Whether to enable Google Analytics
    id:  # Google Analytics Measurement ID
# SITE CUSTOMIZATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end
    

# FONTAWESOME >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/basic/fontawesome
fontawesome: # Pro v6.2.1
  # Thin version
  thin: false
  # Light version
  light: false
  # Duotone version
  duotone: false
  # Sharp Solid version
  sharp_solid: false
# FONTAWESOME <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# HOME BANNER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/home/home_banner
home_banner:
  # Whether to enable home banner
  enable: true
  # style of home banner
  style: fixed # static or fixed
  # Home banner image
  image: 
    light: /images/wallhaven-wqery6-light.webp # light mode
    dark: /images/wallhaven-wqery6-dark.webp # dark mode
  # Home banner title
  title: Theme Redefine
  # Home banner subtitle
  subtitle:
    text: [] # subtitle text, array
    hitokoto:  # 一言配置
      enable: false # Whether to enable hitokoto
      api: https://v1.hitokoto.cn # API URL, can add types, see https://developer.hitokoto.cn/sentence/#%E5%8F%A5%E5%AD%90%E7%B1%BB%E5%9E%8B-%E5%8F%82%E6%95%B0
    typing_speed: 100 # Typing speed (ms)
    backing_speed: 80 # Backing speed (ms)
    starting_delay: 500 # Start delay (ms)
    backing_delay: 1500 # Backing delay (ms)
    loop: true # Whether to loop
    smart_backspace: true # Whether to smart backspace
  # Color of home banner text
  text_color: 
    light: "#fff" # light mode
    dark: "#d1d1b6" # dark mode
  # Specific style of the text
  text_style: 
    # Title font size
    title_size: 2.8rem
    # Subtitle font size
    subtitle_size: 1.5rem
    # Line height between title and subtitle
    line_height: 1.2
  # Home banner custom font
  custom_font: 
    # Whether to enable custom font
    enable: false
    # Font family
    family: 
    # URL to font CSS file
    url:
  # Home banner social links
  social_links:
    # Whether to enable
    enable: false
    # Social links style
    style: default # default, reverse, center
    # Social links
    links:
      github:  # your GitHub URL
      instagram: # your Instagram URL
      zhihu:  # your ZhiHu URL
      twitter:  # your twitter URL
      email:  # your email
      # ...... # you can add more
    # Social links with QRcode drawers
    qrs:
      weixin:  # your Wechat QRcode image URL
      # ...... # you can add more
# HOME BANNER <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# NAVIGATION BAR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/home/navbar
navbar:
  # Auto hide navbar
  auto_hide: false
  # Navbar background color
  color:
    left: "#f78736" #left side 
    right: "#367df7"  #right side
    transparency: 35 #percent (10-99)
  # Navbar width (usually no need to modify)
  width:
    home: 1200px #home page
    pages: 1000px #other pages
  # Navbar links
  links:
    Home: 
      path: / 
      icon: fa-regular fa-house # can be empty
    # Archives: 
    #   path: /archives 
    #   icon: fa-regular fa-archive # can be empty
    # Status: 
    #   path: https://status.ohevan.com/
    #   icon: fa-regular fa-chart-bar
    # About: 
    #   icon: fa-regular fa-user
    #   submenus:
    #     Me: /about
    #     Github: https://github.com/EvanNotFound/hexo-theme-redefine
    #     Blog: https://ohevan.com
    #     Friends: /friends
    # Links: 
    #   icon: fa-regular fa-link
    #   submenus:
    #     Link1: /link1
    #     Link2: /link2
    #     Link3: /link3
    # ...... # you can add more
  # Navbar search (local search). Requires hexo-generator-searchdb (npm i hexo-generator-searchdb). See https://github.com/theme-next/hexo-generator-searchdb
  search:
    # Whether to enable
    enable: false
    # Preload search data when the page loads
    preload: true
# NAVIGATION BAR <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# HOME PAGE ARTICLE SETTINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/home/home
home:
  # Sidebar settings
  sidebar:
    enable: true # Whether to enable sidebar
    position: left # Sidebar position. left, right
    first_item: menu # First item in sidebar. menu, info
    announcement: # Announcement text
    show_on_mobile: true # Whether to show sidebar navigation on mobile sheet menu
    links:
      # Archives: 
      #   path: /archives 
      #   icon: fa-regular fa-archive # can be empty
      # Tags: 
      #   path: /tags 
      #   icon: fa-regular fa-tags # can be empty
      # Categories: 
      #   path: /categories 
      #   icon: fa-regular fa-folder # can be empty
      # ...... # you can add more
  # Article date format
  article_date_format: auto # auto, relative, YYYY-MM-DD, YYYY-MM-DD HH:mm:ss etc.
  # Article categories visibility
  categories:
    enable: true  # Whether to enable
    limit: 3 # Max number of categories to display
  # Article tags visibility
  tags:
    enable: true  # Whether to enable
    limit: 3  # Max number of tags to display
# HOME PAGE ARTICLE SETTINGS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# ARTICLE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/posts/articles
articles:
  # Set the styles of the article
  style:
    font_size: 16px # Font size
    line_height: 1.5 # Line height
    image_border_radius: 14px # image border radius
    image_alignment: center # image alignment. left, center
    image_caption: false # Whether to display image caption
    link_icon: true # Whether to display link icon
    title_alignment: left # Title alignment. left, center
    headings_top_spacing: # Top spacing for headings from h1-h6
      h1: 5rem
      h2: 4rem
      h3: 2.8rem
      h4: 2.5rem
      h5: 2.2rem
      h6: 2rem
  # Word count. Requires hexo-wordcount (npm install hexo-wordcount). See https://github.com/willin/hexo-wordcount
  word_count:
    enable: true # Whether to enable
    count: true # Whether to display word count
    min2read: true # Whether to display reading time
  # Author label
  author_label: 
    enable: true # Whether to enable
    auto: false # Whether to automatically add author label, e.g. Lv1, Lv2, Lv3...
    list: []
  # Code block settings
  code_block:
    copy: true # Whether to enable code block copy button
    style: mac # mac | simple
    font: # Custom font
      enable: false # Whether to enable
      family: # Font family
      url: # Font URL to CSS file
  # Table of contents settings
  toc:
    enable: true # Whether to enable TOC
    max_depth: 3 # TOC depth
    number: false # Whether to add number to TOC automatically
    expand: true # Whether to expand TOC
    init_open: true # Open toc by default
  # Whether to enable copyright notice
  copyright:
    enable: true # Whether to enable
    default: cc_by_nc_sa # Default license, can be cc_by_nc_sa, cc_by_nd, cc_by_nc, cc_by_sa, cc_by, all_rights_reserved, public_domain
  # Whether to enable lazyload for images
  lazyload: true
  # Article recommendation. Requires nodejieba (npm install nodejieba). Transplanted from hexo-theme-volantis.
  recommendation:
    # Whether to enable article recommendation
    enable: false
    # Article recommendation title
    title: 推荐阅读
    # Max number of articles to display
    limit: 3
    # Max number of articles to display mobile
    mobile_limit: 2
    # Placeholder image
    placeholder: /images/wallhaven-wqery6-light.webp
    # Skip directory
    skip_dirs: []
# ARTICLE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# COMMENT >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/posts/comment
comment:
  # Whether to enable comment
  enable: true
  # Comment system
  system: waline # waline, gitalk, twikoo, giscus
  # System configuration
  config:
    # Waline comment system. See https://waline.js.org/
    waline:
      serverUrl: https://example.example.com # Waline server URL. e.g. https://example.example.com
      lang: zh-CN # Waline language. e.g. zh-CN, en-US. See https://waline.js.org/guide/client/i18n.html
      emoji: [] # Waline emojis, see https://waline.js.org/guide/features/emoji.html
      recaptchaV3Key: wasd # Google reCAPTCHA v3 key. See https://waline.js.org/reference/client/props.html#recaptchav3key
      turnstileKey: # Turnstile key. See https://waline.js.org/reference/client/props.html#turnstilekey
    # Gitalk comment system. See https://github.com/gitalk/gitalk
    gitalk:
      clientID: # GitHub Application Client ID
      clientSecret: # GitHub Application Client Secret
      repo: # GitHub repository
      owner: # GitHub repository owner
      proxy: # GitHub repository proxy
    # Twikoo comment system. See https://twikoo.js.org/
    twikoo:
      version: 1.6.10 # Twikoo version, do not modify if you dont know what it is
      server_url: # Twikoo server URL. e.g. https://example.example.com
      region: # Twikoo region. can be empty
    # Giscus comment system. See https://giscus.app/
    giscus:
      repo: # Github repository name e.g. EvanNotFound/hexo-theme-redefine
      repo_id: # Github repository id
      category: # Github discussion category
      category_id: # Github discussion category id
      mapping: pathname # Which value to use as the unique identifier for the page. e.g. pathname, url, title, og:title. DO NOT USE og:title WITH PJAX ENABLED since pjax will not update og:title when the page changes
      strict: 0 # Whether to enable strict mode. e.g. 0, 1
      reactions_enabled: 1 # Whether to enable reactions. e.g. 0, 1
      emit_metadata: 0 # Whether to emit metadata. e.g. 0, 1
      lang: en # Giscus language. e.g. en, zh-CN, zh-TW
      input_position: bottom # Place the comment box above/below the comments. e.g. top, bottom
      loading: lazy # Load the comments lazily
# COMMENT <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# FOOTER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/footer
footer:
  # Show website running time
  runtime: true # show website running time or not
  # Icon in footer, write fontawesome icon code here
  icon: '<i class="fa-solid fa-heart fa-beat" style="--fa-animation-duration: 0.5s; color: #f54545"></i>'
  # The start time of the website, format: YYYY/MM/DD HH:mm:ss
  start: 2022/8/17 11:45:14
  # Site statistics
  statistics: true # show site statistics or not (total articles, total words)
  # Footer message
  customize:
  # ICP record number. See https://beian.miit.gov.cn/
  icp:
    enable: false # Whether to enable
    number: # ICP record number
    url: # ICP record url
# FOOTER <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# INJECT >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/inject
inject:
  # Whether to enable inject
  enable: false
  # Inject custom head html code
  head: 
    -
    -
  # Inject custom footer html code
  footer:
    -
    -
# INJECT <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# PLUGINS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/plugins
plugins:
  # RSS feed. Requires hexo-generator-feed (npm i hexo-generator-feed). See https://github.com/hexojs/hexo-generator-feed
  feed:
    enable: false # Whether to enable
  # Aplayer. See https://github.com/DIYgod/APlayer
  aplayer:
    enable: false # Whether to enable
    type: fixed # fixed, mini
    audios:
      - name: # audio name
        artist: # audio artist
        url: # audio url
        cover: # audio cover url
        lrc: # audio cover lrc
#      - name: # audio name
#        artist: # audio artist
#        url: # audio url
#        cover: # audio cover url
#        lrc: # audio cover lrc
      # .... you can add more audios here
  # Mermaid JS. Requires hexo-filter-mermaid-diagrams (npm i hexo-filter-mermaid-diagrams). See https://mermaid.js.org/
  mermaid:
    enable: false # enable mermaid or not
    version: "9.3.0" # default v9.3.0
# PLUGINS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# PAGE TEMPLATES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/page_templates
page_templates:
  # Friend Links page column number
  friends_column: 2
  # Tags page style
  tags_style: blur # blur, cloud
# PAGE TEMPLATES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end


# CDN >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/cdn
cdn:
  # Whether to enable CDN
  enable: false
  # CDN Provider
  provider: staticfile # staticfile, bootcdn, cdnjs, jsdelivr, unpkg, custom
  # Custom CDN URL
  # format example: https://cdn.custom.com/hexo-theme-redefine/${version}/source/${path}
  # The ${path} must be in the source folder of the theme
  custom_url: 
# CDN <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end

# DEVELOPER MODE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> start
# Docs: https://redefine-docs.ohevan.com/developer
developer:
  # Whether to enable developer mode (only for developers who want to modify the theme source code, not for ordinary users)
  enable: false
# DEVELOPER MODE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end
```

#### 测试主题

完成如上配置后，首先请保证你的文件目录存放位置是否正确，具体如下：

![](/images/0424/7.jpg)

仅需在终端下执行如下命令，即可看到切换好的主题：

```shell
hexo s
```

### 二、配置主题

以下配置均在 `_config.redefine.yml` 文件中完成，具体可参见[官方配置教程](https://redefine-docs.ohevan.com/basic)，这里就仅仅介绍部分比较需要配置的部分了

> PS：这里不是作者偷懒，是因为配置项太多了，实在有点没有啥精力讲完。

#### 基本信息

首先，你需要为自己的网站设置好标题、作者名以及其它的必要信息，具体可以看我的配置：

```yaml
info:
  # 站点名称
  title: CatIsNotFound
  # 作者名称
  author: CatIsNotFound
  # 此处指向自己的 Github Page 链接
  url: https://catisnotfound.github.io/ 
  
defaults:
  # Favicon
  favicon: /images/redefine-favicon.svg # 默认的图标，暂时不改
  # Site logo
  logo: 			# 目前作者暂时没有设计博客图标，可以先空着
  # Site avatar
  avatar: <建议直接从 GitHub 上获取自己的头像链接>
 
colors:
  # 这里可以选择网站的主色调，建议使用取色器来选择
  primary: "#A31F34"
  # 此处可不选，因为作用不大
  secondary:
  # 这里的默认主题可以选择亮色或暗色
  default_mode: light # light, dark
```

#### 首页 Banner

通过如下图一个个比较

![](/images/0424/4.jpg)

```yaml
home_banner:
  # 选择是否显示首页 Banner
  enable: true
  # 样式选择默认
  style: fixed # static or fixed
  # 首页 Banner 图片，这里选择了在线的 URL
  image: 
    light: https://files.codelife.cc/wallhaven/full/g7/wallhaven-g75r7d.jpg?x-oss-process=image/resize,limit_0,m_fill,w_2560,h_1440/quality,Q_92/format,webp # 亮色模式下显示第一张图片
    dark: https://files.codelife.cc/wallpaper/wallspic/167264.jpg?x-oss-process=image/resize,limit_0,m_fill,w_2560,h_1440/quality,Q_92/format,webp # 暗色模式下显示另一种图片
  # 网站标题
  title: <你的网站标题>
  # 子标题
  subtitle:
    # 这里可以选择轮换文本内容
    text: [
      '随心所欲地享受每一天\(￣︶￣*\))', 
      '随时随地，浏览记录O(∩_∩)O', 
      '如果喜欢，建议给个支持( •̀ ω •́ )✧',
      '喜欢的话，留个言好嘛(oﾟvﾟ)ノ',
      '你有建议？反馈作者(●^◡^●)',
      '欢迎来到我的博客(｡･∀･)ﾉﾞ',
      '文字正在不断轮换(*￣3￣)╭',
      '正在努力更新博客(ง •_•)ง',
      '正在不断努力改善博客中ε=( o｀ω′)ノ'
      ] # 通过列表的形式，按顺序轮换文字
    # 这里也可使用附加的插件，但个人觉得不大好用
    hitokoto:  # 一言配置
      enable: false # Whether to enable hitokoto
      api: https://v1.hitokoto.cn # API URL, can add types, see https://developer.hitokoto.cn/sentence/#%E5%8F%A5%E5%AD%90%E7%B1%BB%E5%9E%8B-%E5%8F%82%E6%95%B0
    typing_speed: 150 # Typing speed (ms)
    backing_speed: 30 # Backing speed (ms)
    starting_delay: 1000 # Start delay (ms)
    backing_delay: 3000 # Backing delay (ms)
    loop: true # Whether to loop
    smart_backspace: true # Whether to smart backspace
  # 设置亮/暗色模式下文本的颜色
  text_color: 
    light: "#101010" # light mode
    dark: "#d1d1b6" # dark mode
  # 后面可以保持默认
  text_style: 
    # Title font size
    title_size: 2.8rem
    # Subtitle font size
    subtitle_size: 1.5rem
    # Line height between title and subtitle
    line_height: 1.2
  # 设置自定义字体
  custom_font: 
    # Whether to enable custom font
    enable: false
    # Font family
    family: 
    # URL to font CSS file
    url:
  # 这里可以设置自己的个人社交链接
  social_links:
    # 是否显示自己的个人链接
    enable: true
    # 选择展示的样式
    style: default # default, reverse, center
    # 具体的社交链接
    links:
      github: https://github.com/CatIsNotFound # your GitHub URL
      bilibili: https://space.bilibili.com/1896645285?spm_id_from=333.1007.0.0 # My Bilibili
      zhihu:  https://www.zhihu.com/people/catisnotfound # your ZhiHu URL
      twitter:  # your twitter URL
      email:  liaoxinkai0408@outlook.com # your email
      instagram: # your Instagram URL
      # ...... # you can add more
    # 还可以通过二维码的形式来显示，这里最好用在线 URL 会好一点
    qrs:
      weixin:  # your Wechat QRcode image URL
      # ...... # you can add more
```

#### 导航栏

![](/images/0424/5.jpg)

```yaml
navbar:
  # 是否自动隐藏导航栏
  auto_hide: false
  # 导航栏的背景颜色
  color:
    left: "#f78736" #left side 
    right: "#367df7"  #right side
    transparency: 35 #percent (10-99)
  # 导航栏的宽度
  width:
    home: 1200px #home page
    pages: 1000px #other pages
  # 设置导航栏的链接
  links:
    Home: 
      path: / 
      icon: fa-regular fa-house # can be empty
    Archives: 
      path: /archives 
      icon: fa-regular fa-archive # can be empty
    Categories:
      path: /categories
      icon: fa-regular fa-list
    ShuoShuo: 
      icon: fa-solid fa-comment-dots
      path: /shuoshuo
    Links: 
      icon: fa-regular fa-link
      submenus:
        Github: https://github.com/CatIsNotFound
        Zhihu: https://www.zhihu.com/people/catisnotfound
        Bilibili: https://space.bilibili.com/1896645285
    Github:
      icon: fa-brands fa-github
      path: https://github.com/CatIsNotFound/CatIsNotFound.github.io
  # 搜索功能
  search:
    # 是否显示搜索按钮
    enable: true
    # 页面加载时是否先加载搜索数据
    preload: true
```

#### 侧边栏

![](/images/0424/6.jpg)

```yaml
home:
  # 侧边栏
  sidebar:
    enable: true # 是否显示侧边栏
    position: left # 显示位置，只能为 left 或 right
    first_item: menu # 优先显示菜单还是作者信息. menu, info
    announcement: # Announcement text
    show_on_mobile: true
    links:
      Archives: 
        path: /archives 
        icon: fa-regular fa-archive # 图标可以为空
      Gallery:
        path: /masonry
        icon: fa-solid fa-image
      Tags: 
        path: /tags
        icon: fa-regular fa-tags 
      Categories: 
        path: /categories
        icon: fa-regular fa-folder
```

{% notel yellow 'fa-solid fa-triangle-exclamation' '需要注意' %}

​	这里的 `/masonry` 、`/tags`、`/categories`、`/shuoshuo` 均需要自己创建，若需创建，仅需在终端中执行如下：

```shell
hexo new page masonry
hexo new page tags
hexo new page categories
hexo new page shuoshuo
```

关于相对应的模块，请根据自己的需求，查看[下一节：设定模块](#三、设定模块)。

{% endnotel %}

### 三、设定模块

#### 1. Tags 标签、Categories 分类

##### 创建标签、分类页面

```shell
hexo new page tags
hexo new page categories
```

##### 更改样式

在 `_config.redefine.yml` 文件中的 `page_templates` 配置项里面更改 `tags_style`。

```shell
page_templates:
  # Tags page style
  tags_style: blur # blur, cloud
```

#### 2. 相册 / 瀑布流

##### 创建相册页面

```shell
hexo new page masonry
hexo new page gallery
hexo new page photos
```

以上三个名称均可被匹配成同一页面

##### 如何编辑相册页面

在你的 Hexo 项目的 `source` 文件夹里增加 `_data` 文件夹（如果已有则跳过）

在 `_data` 文件夹下新增 `masonry.yml` 文件。

在 `masonry.yml` 文件里面按照如下格式配置相册信息：

```yaml
- image: 图片 URL
  title: 图片标题
  description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod
 
- image: https://picsum.photos/id/12/2500/1800
  title: Lorem ipsum
  description: Lorem ipsum dolor sit amet
```

#### 3. 说说

##### 创建说说页面

```shell
hexo new page shuoshuo
```

##### 如何编辑说说

在你的 Hexo 项目的 `source` 文件夹里增加 `_data` 文件夹（如果已有则跳过）

在 `_data` 文件夹下新增 `essays.yml` 文件。

在 `essays.yml` 文件里面按照如下格式配置相册信息：

```yaml
- content: 各位如果有什么建议，欢迎各位通过知乎、B站、Github 私聊作者😊
  date: 2024-04-24 00:20:00

- content: |
    这里是【说说】，在这里都是关于我的所有感悟和留言(*^_^*)
    如果你是第一个来看我博客的访客，可以在此处留言哦
    目前暂时没有过多的内容，后期会尽可能多更新点博客(ง •_•)ง
  date: 2024-04-24 00:20:00
```

#### 4. 评论

关于这一块，个人通过官方文档研究了各种各样的方法，最终找到了最佳的方法(\*^_^\*)，具体参考方法如下：

1. 通过 [Deta 部署](https://waline.js.org/guide/deploy/deta.html) 评论系统，只需要注册 Deta 账号并下载安装即可完成。

    {% note info 'fa-solid fa-circle-info' %}

    **需要注意的是:**

    其中的 `serverUrl` 是在 https://deta.space/ 首页上打开 Waline 应用，点击后会打开部署后的网站地址。将其填入 `serverUrl` 配置中，即可完成全部配置

    {% endnote %}

2. 在 `_config.redefine.yml` 文件下找到如下内容并修改你获得到的 `serverUrl`

    ```yaml
    comment:
      config:
        waline:
          serverUrl: https://example.example.com #你拿到的 serverUrl
    ```

这是以上的所有内容，后期还会继续在本文中补充 (\*^_^\*)~
