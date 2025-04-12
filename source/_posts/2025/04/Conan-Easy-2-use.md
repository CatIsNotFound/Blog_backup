---
title: Conan 简要用法（包含 IDE）
date: 2025-04-12 14:02:29
tags:
  - C_and_Cpp
  - Conan
  - Python
  - 📦包管理工具
categories:
  - 技术教程
excerpt: 此文章简单介绍了 Conan 的简单使用方法
thumbnail: /images/2025/04/conan-logo.png
---
# 写在最前

> **简介**
> Conan 是一个流行的跨平台 C++ 包管理器。它可以帮助我们在不同的操作系统和环境中管理和共享C++包，让我们更轻松、更高效地开发 C++ 应用。


本文主要介绍了 Conan 2.x 版本的简要用法以及如何在项目中使用 Conan 导入第三方库。

# 安装

## PIP 包管理下载【非常建议👍】

关于 Conan 包管理器，这里**非常值得用 Python PIP 的方式安装**。你仅需执行以下命令即可：

```shell
pip3 install conan
```

**注意：在 Windows 系统下，若要使用 `pip` 指令安装 Conan，请先安装 Python3！**

{% notel yellow 'fa-solid fa-warning' 'Linux 下需要注意' %}

关于 Linux 系统，即使预装了 Python，但也可能还需要安装 `python3-pip` 软件包才能使用 `pip3` 命令。具体命令如下：

**Debian/Ubuntu 系**

```bash
wget https://github.com/conan-io/conan/releases/download/2.15.0/conan-2.15.0-amd64.deb # 这里的 2.15.0 可以替换为其它最新的版本号
sudo dpkg -i conan*.deb
```
*注意：Debian/Ubuntu 系下需要通过[安装包下载](#安装包下载)的方式进行安装！*

**Fedora/Redhat 系**
```bash
sudo dnf install python3-pip -y
```
*注意：Redhat 7及以下版本可能使用的是 YUM 包管理器，因此需要将 `dnf` 替换成 `yum` 才可用。* 

**Arch/Majaro 系**
```bash
yay -S conan
```
*注意：请确保你的 Arch/Majaro 系已经安装了 `yay` 包管理工具！*

{% endnotel %}

{% notel blue 'fa-solid fa-book' '安装事项（引用自官方文档）' %}
请仔细阅读：
- 请确保您的 pip 安装与 Python (&gt;= 3.6) 版本相匹配。
- 在 Linux 上，您可能需要 sudo 权限才能全局安装 Conan。
- 我们强烈建议使用 virtualenvs（virtualenvwrapper 非常好用）来处理与 Python 有关的一切（请查看 https://virtualenvwrapper.readthedocs.io/en/stable/ 或 Windows 上的 https://pypi.org/project/virtualenvwrapper-win ）。对于 Python 3，也可以使用内置模块（请查看 https://docs.python.org/3/library/venv.html ）。如果不使用 virtualenv，conan 依赖项可能会与先前存在的依赖项发生冲突，尤其是当您将 Python 用于其他用途时。
- 在 macOS 上，尤其是可能有系统完整性保护的最新版本，pip 可能会失败。请尝试使用 `virtualenvs`，或使用 `pip install --user conan` 将其安装到 Python 用户的安装目录中。
- 有些 Linux 发行版（如 Linux Mint）要求在安装后重启（shell 重启，如果不够，则注销/系统），因此 Conan 会在路径中找到。
{% endnotel %}

## 安装包下载

如果没有安装 Python，请直接通过 [github.com](https://github.com/conan-io/conan/releases) 下载对应操作系统的安装包即可。

## 验证方法

如果要检查是否已经安装了 Conan，请直接执行如下命令即可：

```bash
conan --help
conan --version
```

# 使用方法

## 必要配置

### 修改必要目录
以 Windows 系统为例，Windows 系统在默认情况下会将所有缓存下载及配置文件存放入 `C:\Users\{你的用户名}\.conan2`。为了尽量减少 C 盘存储空间的压力，建议直接添加必要的环境变量以达到修改配置缓存目录的目的。具体操作如下：

1. 在电脑上新建自定义目录（这里以 `D:/conan` 目录为例）

2. 在自己的电脑上按下 <kbd>Windows</kbd>+<kbd>X</kbd> 快捷键，按下 `Y` 以选择**系统**。在系统信息一栏中找到**高级系统设置**。
   在弹出的窗口中按照如下图指示添加两个用户变量 `CONAN_HOME` 和 `CONAN_USER_HOME` 即可：
   ![](/images/2025/04/env_config.jpg)
3. 保存之后，打开自己的命令行，执行如下命令，以查看是否成功修改了自定义路径。
   ```bash
    conan config home
    ```
4. 当输出为你的自定义目录即可完成修改。

### 生成自己的配置文件

在命令行下，执行如下命令，Conan 会自动生成一份配置文件。
```bash
conan profile detect
```
若已经生成了配置文件，执行如下命令即可显示当前主机的配置文件。
```bash
conan profile show
```

```ini
;主机配置文件
Host profile:
[settings]
arch=x86_64                   ;系统架构
build_type=Release            ;构建类型：Debug/Release
compiler=msvc                 ;编译器: msvc/gcc
compiler.cppstd=17            ;C++ 标准
compiler.runtime=dynamic      ;编译器运行时库
compiler.runtime_type=Release ;编译器运行时类型
compiler.version=194          ;编译器版本
os=Windows                    ;操作系统

;构建机配置文件
Build profile:
....
```

关于配置文件的位置，一般情况下，通过命令行即可查看配置文件所在的路径：

```bash
conan profile list # 获取所有的配置文件名
```

```bash
conan profile path default # default：配置文件名
```

## 示例：使用 Conan 导入第三方库

在自己的 C++ 项目里，如果需要使用 Conan 包管理器来实现导入第三方库，需要做以下几个步骤：

### 创建新的 C++ 项目

举个例子：新建一个项目（名为 `MyJson`），并在项目里导入 `Json` 第三方库，其对应的 `CMakeLists.txt` 文件如下：

```CMake
cmake_minimum_required(VERSION 3.30)  
project(MyJson)  
  
find_package(nlohmann_json REQUIRED)  # 在项目中导入所需的第三方包
  
set(CMAKE_CXX_STANDARD 17)  
add_executable(MyJson main.cpp)  

target_link_libraries(MyJson nlohmann_json::nlohmann_json)
```

在 `main.cpp` 文件下，编辑以下内容：
```cpp
#include <nlohmann/json.hpp>  
#include <iostream>  
int main() {  
    auto my_json = R"(  
	  {  
	    "host": "127.0.0.1",    
	    "port": 8000
	  }
	)";  
    auto parse = nlohmann::json::parse(my_json);  
    std::cout << "Your host: " << parse["host"].get<std::string>() << std::endl;  
    std::cout << "Your port: " << parse["port"].get<int>() << std::endl;  
    return 0;  
}
```

### 编写 Conanfile 文件

为了添加所需要的第三方库，你需要在项目源目录下新建 `conanfile.txt` 文件。

```
[requires]
nlohmann_json/3.11.3
[generators]
CMakeDeps
CMakeToolchain
[layout]
cmake_layout
```

### 下载与安装第三方库

接下来，在自己的项目源目录下打开命令行，下载并安装需要的包。

```bash
conan install . --build=missing [--output-folder=build]
```

这里的 `--build=missing` 用于检查 Conan 是否安装第三方库，（若没有，则自动下载安装） 
这里的 `--output-folder` （可选参数）为输出的路径，这里默认为 `build` 目录。

### 编译项目

在命令行下执行如下：

```bash
cd build
# Windows 下执行：
cmake .. -DCMAKE_TOOLCHAIN_FILE="./generators/conan_toolchain.cmake"
# Linux 下执行：
cmake .. -DCMAKE_TOOLCHAIN_FILE="./Release/generators/conan_toolchain.cmake" -DCMAKE_BUILD_TYPE=Release
# 其它 OS 可能未测试
```

当能正常看到以下提示时，表示构建已完成。

```
....
-- Conan: Target declared 'nlohmann_json::nlohmann_json'
-- Configuring done (5.6s)
-- Generating done (0.0s)
-- Build files have been written to: D:/MyJson/build
```

假如出现以下报错（找不到第三方库）的情况：

```
CMake Error at CMakeLists.txt:4 (find_package):
  By not providing "Findnlohmann_json.cmake" in CMAKE_MODULE_PATH this
  project has asked CMake to find a package configuration file provided by
  "nlohmann_json", but CMake did not find one.


    nlohmann_jsonConfig.cmake
    nlohmann_json-config.cmake

  Add the installation prefix of "nlohmann_json" to CMAKE_PREFIX_PATH or set
  "nlohmann_json" provides a separate development package or SDK, be sure it
  has been installed.


-- Configuring incomplete, errors occurred!
```

建议直接将原有的 `build` 目录删除，并再次在**项目源目录下**执行以下命令以再次生成 `build` 目录即可。

```
cd ..
# rm -rf build # Linux / Mac 下执行
# rm build -R  # Windows 下执行
conan install . --build=missing
```

### 运行程序

完成上述构建之后，在 `build` 目录下执行以下命令以编译程序即可。

```bash
cmake --build . --config Release
```

在 Windows 系统下，如果你使用的是 MSVC 编译器，直接执行如下：

```bash
./Release/MyJson.exe
```

在 Linux 系统下，执行：

```bash
./MyJson
```

若能正常显示如下输出结果即可。

```
Your host: 127.0.0.1
Your port: 8000
```


# IDE 工具下使用 Conan

以目前作者的了解，对于不同的 IDE，有不同的安装与编译方式，这里讲以下几种：
## Visual Studio

### 1. 安装插件

在菜单栏中选择 **扩展 → 管理扩展**，并在搜索栏中搜索 Conan，按照如下图安装即可。

![](/images/2025/04/conan_vs.jpg)

当弹出以下窗口时，点击 【Modify】进行安装，**在此安装期间，请关闭 IDE！**
![](/images/2025/04/conan_vs_2.jpg)
当安装已经完成后，再次打开 IDE 即可。
### 2. 添加第三方库

按如下图所示，在菜单栏中打开 Conan 软件包管理窗口。

![](/images/2025/04/conan_vs_3.jpg)
再按照如下图所示，点击 【设置】图标，选择使用系统 Conan 即可。
![](/images/2025/04/conan_vs_4.jpg)

完成设置后，打开自己的项目，在 Conan 软件包管理窗口下，搜索要安装入项目的软件包并添加项目即可。
![](/images/2025/04/conan_vs_5.jpg)

### 3. 使用

关于使用，每次添加或删除，你需要在自己的项目中，
- 先执行菜单栏中的**生成 → 清理解决方案**。
- 再执行菜单栏中的**生成 → 生成解决方案**。
- 最后尝试调试你的项目即可。

**注意：Visual Studio 下只支持使用 MSBuild 类型的项目，不支持使用 CMake 类型的项目。**
~~（此处别问为什么？是插件告诉我的 (/_ \\) ）~~
## Jetbrain CLion

### 1. 安装插件

若要在 CLion 下使用 Conan，请直接下载并安装插件 Conan。具体点击 **文件 → 设置 → 插件**

安装插件后，请直接重启 IDE。

### 2. 添加所需的第三方库

按照如下图所示的操作进行：

![](/images/2025/04/conan_clion.jpg)
*需要注意：这里的项目必须要包含 `conan_provider.cmake` 文件（自动生成的文件），否则 CLion 将无法正常编译！*
具体方式，即点击如下图的刷新按钮，文件会自动生成。如果没有反应，请反复重试或直接重启 IDE。
![](/images/2025/04/conan_clion_2.jpg)
![](/images/2025/04/conan_clion_3.jpg)
关于安装，请直接在搜索栏中搜索要安装的第三方库，并点击 【Use in Project】 即可。
![](/images/2025/04/conan_clion_4.jpg)

### 3. 使用

安装完对应的第三方库， 你还需要在自己的项目里（即：`CMakeLists.txt` 文件）导入第三方库才能使用，具体见上文中的[示例：创建新的 C++ 项目](#创建新的 C++ 项目) 。


## Qt Creator

### 1. 激活插件

在左边的插件，搜索 Conan 并激活，如下图所示：

![](/images/2025/04/conan_qt.jpg)

### 2. 配置

点击你的项目，在如下图操作中添加构建步骤，选择 `conan install` 选项。

![](/images/2025/04/conan_qt_2.jpg)

**需要注意的是：Qt Creator 对于每一个项目，你都需要在项目源目录下单独新建一个 `conanfile.txt` 或 `conanfile.py` 文件才能正确编译。否则会提示找不到文件！**

# 参考链接

Conan 官方文档说明如下：
- [Install — conan 2.15.0 documentation](https://docs.conan.io/2/installation.html)
- [Build a simple CMake project using Conan — conan 2.15.0 documentation](https://docs.conan.io/2/tutorial/consuming_packages/build_simple_cmake_project.html)

有关于 IDE 配置 Conan 的官方文档如下：
- [Conan Extension for Visual Studio - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=conan-io.conan-vs-extension)
- [Conan plugin | CLion Documentation](https://www.jetbrains.com/help/clion/conan-plugin.html)
- [Conan Package Manager | Qt Creator Documentation](https://doc.qt.io/qtcreator/creator-project-conan.html)