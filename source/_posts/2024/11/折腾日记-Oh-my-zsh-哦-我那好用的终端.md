---
title: '[折腾日记] Oh-my-zsh 哦~我那好用的终端'
date: 2024-11-27 11:58:30
updated: 2024-11-27 11:58:30
tags: 
    - Linux
    - oh-my-zsh
    - Git
    - Github
    - WSL
    - 新手向
categories: 折腾日记
excerpt: 这是关于 Oh-my-zsh 的折腾日志。
thumbnail: /images/2024/1127/cover.png
sticky: 998
---

# 写在最前

写这篇文章的初衷主要是为了记录曾经在 Linux 上折腾过的各种过程，并将其写成类似于学习教程的形式以此来帮助跟作者本人一样在折腾 Linux 的人。

如果你也正在折腾 Linux，那么请简要阅读这篇文章，希望这能有所帮助。 \(￣︶￣\*\)

# 折腾环境

这里本人使用的是基于 WSL 2 下的 Debian 发行版系统，

如果你已安装 WSL，可直接执行如下：

```powershell
wsl.exe --install -d debian
```

当然，如果需要其它可安装的发行版系统，可直接执行：

```
wsl.exe -l -o
```

如果未安装 WSL？不如看看这篇？

{% btn center large::WSL：一个适用于 Windows 的 Linux 子系统::/2024/06/WSL：一个适用于-Windows-的-Linux-子系统/::fas fa-link %}

# 折腾全过程

很显然，默认环境下的 WSL 除了勉强能用的 <kbd>Tab</kbd> 命令/目录补全、<kbd>Ctrl</kbd> + <kbd>R</kbd> 历史记录回溯之外，貌似啥也没有了(ˉ▽ˉ；)...

```bash
debian@DESKTOP-EPQI5KJ:~$ _
```

是的，就是这样。一个平平无奇的交互界面。

但为了能更好地改造交互，不仅要改变外观，还要增加其可用程度。以下是本人折腾时的简要过程。

## 1. 安装必需软件包

很显然，要想改变这一切，需要先改变当前的 Shell 环境。欲查看当前的环境，只需执行：`echo $SHELL`。这里作者默认使用 Bash 环境，其输出为：`/bin/bash`。

不过在此之前，首先就是需要使用 APT 包管理器来安装所需要的软件包。

> 注：这里的 APT 不是想象的那个 APT，而是那个具有超级牛力的 APT [doge]。

执行命令如下：

```bash
sudo apt install git zsh curl vim neofetch -y # 这里的 neofetch 可不装，这里纯粹是为了装 X 用的
```

> **💡 关于下载速度慢的解决方法：**
>
> 使用 APT 时出现下载慢？很可能是因为💿**镜像源**，要想改善其下载速度，**直接修改镜像源即可**。
>
> 这里作者使用清华源镜像以加速，当然还可以用其它的开源镜像站。
>
> 你只需要执行如下命令，即可一次性完成替换镜像源：
>
> ```bash
> cat > /etc/apt/sources.list << EOF
> deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
> # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
> 
> deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
> # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
> 
> deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
> # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
> 
> deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
> # deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
> EOF
> ```
>
> 步骤 2：更新软件源
>
> ```bash
> sudo apt update
> ```
>
> 步骤 3：下载到一半时取消？直接带上 `--fix-missing` 选项就可以继续未完成的下载了O(∩_∩)O。
>
> ```bash
> sudo apt install git zsh curl vim neofetch -y --fix-missing
> ```

## 2. 切换 Shell 环境

当你完成了下载以及安装之后，执行如下命令，可直接将 Bash 更改为 Zsh 环境

```bash
sudo chsh -s /bin/zsh
```

执行后，只需重新登录此用户，你会看到如下提示界面：

```
This is the Z Shell configuration function for new users,
zsh-newuser-install.
You are seeing this message because you have no zsh startup files
(the files .zshenv, .zprofile, .zshrc, .zlogin in the directory
~).  This function can help you with a few settings that should
make your use of the shell easier.

You can:

(q)  Quit and do nothing.  The function will be run again next time.

(0)  Exit, creating the file ~/.zshrc containing just a comment.
     That will prevent this function being run again.

(1)  Continue to the main menu.

(2)  Populate your ~/.zshrc with the configuration recommended
     by the system administrator and exit (you will need to edit
     the file by hand, if so desired).

--- Type one of the keys in parentheses ---

```

没错，到这里已经是完成了一部分！此步骤下，可以直接按下 `0`，不做任何配置即可。之后，你会看到全新的命令行显示。如下：

```shell
DESKTOP-EPQI5KJ% _
```

## 3. 安装与配置 Oh-my-zsh

虽然，已经成功了一部分，但还是缺少了灵魂。为了能让自己的 zsh 变得更极具美观，安装 oh-my-zsh 或许是一个非常不错的一种方式。

### 安装 Oh-my-zsh

这里为了方便国内用户下载 Oh-my-zsh，这里就直接**采用清华源下载的方法**来执行如下操作：

> 详情说明见：[ohmyzsh.git | 镜像站使用帮助 | 清华大学开源软件镜像站 | Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/ohmyzsh.git/)

```bash
cd ~/
git clone https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git
cd ohmyzsh/tools
REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh install.sh
```

等待一系列操作后，你将会看到安装成功的画面：

```
Looking for an existing zsh config...
Found /home/test/.zshrc. Backing up to /home/test/.zshrc.pre-oh-my-zsh
Using the Oh My Zsh template file and adding it to /home/test/.zshrc.

         __                                     __
  ____  / /_     ____ ___  __  __   ____  _____/ /_
 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
                        /____/                       ....is now installed!


Before you scream Oh My Zsh! look over the `.zshrc` file to select plugins, themes, and options.

• Follow us on X: https://x.com/ohmyzsh
• Join our Discord community: https://discord.gg/ohmyzsh
• Get stickers, t-shirts, coffee mugs and more: https://shop.planetargon.com/collections/oh-my-zsh

➜  tools _
```

### 配置我的 zsh

是的，当你看到如上的画面时，Oh-my-zsh 的安装就已经完成了！不过，这要怎么配置我的 zsh 呢？

直接利用 vim 打开 `~/.zshrc` 文件，在这里你可以添加插件以及修改正在使用的主题。

**提示：以下所提到的主题、插件等配置都需要在  `~/.zshrc` 配置文件中修改。**

#### (1) 改变主题

在 `ZSH_THEME` 变量中修改对应主题

```sh
ZSH_THEME="robbyrussell" # 默认主题
ZSH_THEME="random" 		 # 不确定或有多个常用外观的情况下，random 是个不错的选项
```

关于所有可用的主题，执行：`ls -1 $ZSH/themes | cut -d '.' -f1 | less` 可直接查看。

> 关于主题预览，可直接访问：https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

当你遇到不太确定的主题或者遇到喜欢多个主题时，在 `ZSH_THEME` 变量中设置为 `random` 是个很不错的主意(*￣3￣)╭（如果你真心找不到什么特别好看的主题）

当你设置成随机主题时，再次重新登录时，你会看到类似这样的画面：

```sh
[oh-my-zsh] Random theme 'juanghurtado' loaded

test@DESKTOP-EPQI5KJ:/home/debian
> _
```

除了上面的提示，你还可以直接通过 `echo $RANDOM_THEME` 来查看随机到的主题名称。

如果你遇到了几个比较满意的主题，可以直接将其记录到 `ZSH_THEME_RANDOM_CANDIDATES` 变量中，这样以后每次登录都只会在此变量中随机选择主题。

例如：作者就对 `juanghurtado`, `essembeh`, `tjkirch`, `apple` 等主题感兴趣，那么可以将这几个主题都填入到该变量中。内容如下：

```sh
ZSH_THEME_RANDOM_CANDIDATES=( "juanghurtado" "essembeh" "tjkirch" "apple" ) # 注意空格分隔
```

**注意：此变量大约在文件的第 18 行左右，只需将最前面的 `#` 去掉即可。**

#### (2) 通用插件

为了能够让终端变得更加好用，首先来推荐几个内置的 ZSH 插件。

- `aliases`：基于 `alias` 命令，可快速搜索短命令（简写命令）；其命令为 `als`。[点此查看所有用法](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases)。
  - 简要用法 1：`als -g git` 查看 `git` 组下的所有短命令；

  - 👍 **简要用法 2**：`als <keys>` 搜索包含 `<keys>` 的命令以及短命令；

  - 简要用法 3：`als --groups` 查看所有组；

  - **Tips：这对于经常使用 `git` 命令的人群而言非常有用！**

- `git`：默认启用的插件，提供更多的[短命令](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#aliases)以及更有用的[函数](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#functions)；
  - 可直接搭配 `aliases` 查看所有关于 git 的短命令

- `sudo`：启用后，只需按下两次 <kbd>Esc</kbd> 就能在行前自动添加/删除 `sudo` 前缀；

- `z`：显示 / 快速进入最常访问的目录
  - 默认下，执行 `z` 命令，会显示前几个访问频率最高的目录；
  - 在命令行下依次键入 `z`  、<kbd>Space</kbd>  后，连续按下 <kbd>Tab</kbd> 键，可以进入经常访问过的目录。

- `zsh-navigation-tools`：命令历史记录回溯改良版，按下 <kbd>Ctrl</kbd> + <kbd>R</kbd> 键可快速搜索之前使用过的命令

> TIPS：关于所有自带插件，请详见：[Plugins · ohmyzsh/ohmyzsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

**这里就推荐几个 Github 上非常好用的几款 ZSH 插件，以提升使用效率。**

- `zsh-autosuggestions`：自动建议工具，根据命令历史记录来自动完成命令；
- `zsh-completions`：自动补全命令工具，可通过 <kbd>Tab</kbd> 键以快速补全各种常用命令。
- `zsh-syntax-highlighting`：语法检查高亮工具，可检查当前输入的命令以标记不同的颜色；

> 以上推荐的额外插件，均可通过 github 上下载。对应链接如下：
>
> - https://github.com/zsh-users/zsh-autosuggestions
> - https://github.com/zsh-users/zsh-completions
> - https://github.com/zsh-users/zsh-syntax-highlighting

> 国内若不能直接访问 Github，那么，请尝试使用 gitee，对应链接如下：
>
> - https://gitee.com/sasukeZhou/zsh-autosuggestions
> - https://gitee.com/yuhldr/zsh-completions
> - https://gitee.com/minhanghuang/zsh-syntax-highlighting


#### (3) 添加插件

欲添加插件，可以在 `~/.zshrc` 文件中的 `plugins` 变量来进行添加，具体如下例：

```sh
plugins=(
    aliases
    git
    sudo
    z
    zsh-navigation-tools
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)
```

**对于第三方插件（自行下载的插件）**

要想添加插件，有以下几种方法：

**👍 Git 安装**

以安装 `zsh-autosuggestions` 为例：

可直接通过命令以实现安装：

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

**手动安装**

还是以安装 `zsh-autosuggestions` 为例，

在浏览器中[点击下载](https://github.com/zsh-users/zsh-autosuggestions/releases/tag/v0.7.1)对应的压缩包 `(*.zip)`。

解压压缩包，将解压后的文件复制到 `$ZSH_CUSTOM/plugins/` 目录下。具体命令如下：

```sh
unzip zsh-autosuggestions-0.7.1.zip
cp -r zsh-autosuggestions-0.7.1 $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

**注意：这里的 `zsh-autosuggestions-0.7.1` 为解压后的文件夹名称，请根据实际情况进行修改；**

**注意：若当前发行版系统找不到 `unzip` 命令，请自行通过 apt 安装 `unzip` 软件包。具体命令为：`sudo apt install unzip -y`。**

# 写在最后

关于下一篇内容，个人考虑在 Neovim 上入手，如果有较强的折腾能力，可以尝试将 neovim 改造成一个命令行下的 IDE(\*^_^\*)。

还是那句话：感兴趣？建议点个收藏或关注？(￣▽￣)"（多少有点不好意思）


