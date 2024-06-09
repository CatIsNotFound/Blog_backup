---
title: 从 0 开始学 Linux：Bash Shell 脚本入门
date: 2024-06-09 13:15:33
tags: [Linux 学习, 脚本]
categories: 技术教程
excerpt: 本文将在已有的基础上，学习 Bash Shell 脚本的基本语法和使用方法。
thumbnail: /images/0606/R-C.jpg
---

Bash 是一个支持脚本的命令行解释器，你可以利用脚本来自动化执行一些重复性的任务。

本文将在已有的基础上，学习 Bash Shell 脚本的基本语法和使用方法。若你对 Bash Shell 还不熟悉，请先阅读以下文章：

{% btn large center ::从 0 开始学 Linux：Bash Shell 快速入门::/2024/06/09/从-0-开始学-Linux-Bash-Shell-快速入门::fa-solid fa-link %}


# 脚本文件

脚本文件以 `.sh` 结尾，并包含一系列命令。

若要运行脚本，需为脚本文件添加可执行权限并执行，也可以通过 `bash` 命令以执行。

```bash
chmod +x <脚本文件路径>
./<脚本文件路径>
```

```bash
bash <脚本文件路径>
```

# 定义解释器

脚本文件第一行必须指定脚本的解释器，即 `/bin/bash`。

```bash
#!/bin/bash
```

当然，你也可以指定其它的 Shell 解释器，如 `/bin/sh`、`/bin/zsh`等。甚至，你还可以使用 Python 解释器以执行 Python 脚本。

```bash
#!/bin/python
```

# 注释

注释以 `#` 开头，表示后面的内容为注释。

```bash
# 这是一行注释
```

# 变量

变量是存储数据的容器，可以用来保存字符串、数字、列表等数据。

## 定义变量

变量名只能包含字母、数字和下划线，且不能以数字开头。

你可以利用 \` ... \` 来包裹命令，或者用 `$(command)` 定义变量。其中的 `command` 为执行的命令，将输出结果赋值给变量。

```bash
# 定义变量
name="John"
age=30
pwd=`pwd` # 获取当前目录路径
file_list=$(ls) # 获取当前目录下的文件列表
list="1 4 7 10" # 列表，用空格分隔

# 输出变量
echo name=$name
echo age=$age
echo pwd=$pwd
echo file_list=$file_list
# 循环输出列表
echo "List:"
for num in $list; do
    echo $num
done
```

## 利用用户输入赋值

你可以利用 `read` 命令从用户输入中获取值并赋值给变量。

```bash
# 利用 read 命令获取用户输入并赋值给变量
read -p "Please enter your name: " name
echo "Your name is $name."
```

`-p` 参数表示提示用户输入，`name` 为用户所赋值的变量。

## 特殊变量

在 Bash 中，有一些特殊的变量，可以用来获取系统信息等，大致如下：

- `$0`： 当前脚本的文件名。
- `$n`： 传递给脚本或函数的参数。**其中，`n` 需要代替为对应的参数序号。**
- `$#`： 传递给脚本或函数的参数个数。
- `$*`： 传递给脚本或函数的所有参数。
- `$@`： 传递给脚本或函数的所有参数，每个参数以空格分隔。
- `$?`： 上个命令的退出状态。`0` 表示命令成功，否则表示失败。
- `$$`： 当前 Shell 进程的进程 ID。
- `$!`： 当前 Shell 最后运行的后台进程的进程 ID。
- `$HOME`： 当前用户的主目录。
- `$PWD`： 当前工作目录。
- `$OLDPWD`： 上一个工作目录。
- `$UID`： 当前用户的 UID。
- `$EUID`： 当前用户的有效 UID。
- `$USER`： 当前用户的用户名。
- `$GROUPS`： 当前用户的组列表。
- `$PATH`： 查找命令的路径。

## 运算变量

变量还可以用来执行简单的运算。

你可以利用 `expr` 命令进行基本的运算，也可以利用 `$((...))` 或 `$[...]` 进行更复杂的运算。

```bash
# 定义变量
num1=10
num2=5

# 运算
result1=$((num1 + num2))
result2=$[num1 - num2]
result3=`expr $num1 \* $num2`

# 输出结果
echo "num1 + num2 = $result1"
echo "num1 - num2 = $result2"
echo "num1 * num2 = $result3"
```

{% note yellow 'fa-solid fa-exclamation-triangle' %}

**注意：**

使用 `*` 运算符时，需要使用反转义符 `\` 来转义。即 `\*` 而不是 `*`。

{% endnote %}

# 条件语句

条件语句可以根据条件执行不同的代码块。

## 语句结构

```bash
# if 语句
if [ <条件> ]; then
    <代码块>
fi

# if-else 语句
if [ <条件> ]; then
    <代码块>
else
    <代码块>
fi

# if-elif-else 语句
if [ <条件1> ]; then
    <代码块1>
elif [ <条件2> ]; then
    <代码块2>
else
    <代码块3>
fi
```

## 运算符

条件语句中可以使用以下运算符：

- `-eq`：等于 `equals`。
- `-ne`：不等于 `not equal`。
- `-gt`：大于 `greater than`。
- `-lt`：小于 `less than`。
- `-ge`：大于等于 `greater than or equal`。
- `-le`：小于等于 `less than or equal`。

这里假设 `x` 和 `y` 分别等于 `10` 和 `20`，则：

| 示例 | 结果 |
| :----: | :----: |
| `[ $x -eq $y ]` | `false` |
| `[ $x -ne $y ]` | `true` |
| `[ $x -gt $y ]` | `false` |
| `[ $x -lt $y ]` | `true` |
| `[ $x -ge $y ]` | `false` |
| `[ $x -le $y ]` | `true` |

{% note yellow 'fa-solid fa-exclamation-triangle' %}

**注意：**

这里的 `-eq` 等运算符前后都需要有空格。且 `-eq` 等运算符只能用于数字比较，**不能用于字符串比较**。

{% endnote %}

## 字符串比较

条件语句也可以比较字符串。通常，字符串比较使用 `==` 、 `!=`、`=~` 等运算符。

- 字符串相等关系可以使用 `==` 运算符，表示任意字符串相等关系。

- 字符串包含关系可以使用 `=~` 或者 `*string*` 运算符，表示任意字符串包含关系。

- 字符串不匹配关系可以使用 `!=` 运算符，表示任意字符串不匹配关系。

- 字符串不包含关系可以使用 `!=` 运算符和 `*` 运算符，表示任意字符串不包含关系。

```bash
# 定义变量
str1="helloworld"
str2="owo"
str3="world"

# 字符串比较
if [ $str1 == $str3 ]; then
    echo "str1 is equal to str2"
fi

# 字符串包含
if [[ $str1 =~ $str2 ]]; then
    echo "str2 is included in str1"
fi

if [[ $str1 == *$str3* ]]; then
    echo "str3 is included in str1"
fi

# 字符串不匹配
if [[ $str1 != $str2 ]]; then
    echo "str1 is not equal to str2"
fi

# 字符串不包含
if [[ $str2 != *$str3* ]]; then
    echo "str2 is not included in str1"
fi
```

## 逻辑运算符

条件语句还可以使用逻辑运算符 `&&` 和 `||` 来组合多个条件。

- `&&`： 逻辑与 `and`。
- `||`： 逻辑或 `or`。

示例：判断 `var1` 和 `var2` 是否都在 `vars` 列表中， `var2` 或 `var3` 两者之中是否有一元素在 `vars` 列表中。

```bash
# 定义变量
var1="apple"
var2="banana"
var3="orange"
vars="[apple banana cherry]"

if [[ $var1 =~ $vars ]] && [[ $var2 == *$vars* ]]; then
    echo "var1 and var2 are in vars"
fi

if [[ $var2 =~ $vars ]] || [[ $var3 =~ $vars ]]; then
    echo "var2 or var3 are in vars"
fi
```

## 示例

示例 1：判断 `~/apt/history.log` 文件是否存在，若不存在，则复制 `/var/log/apt/history.log` 文件到 `~/apt/history.log` 中。

注意：你还需要判断 `~/apt` 目录是否存在。

```bash
# 判断 ~/apt 目录是否存在
if [ ! -d ~/apt ]; then
    mkdir ~/apt
fi

# 判断 ~/apt/history.log 文件是否存在
if [ ! -f ~/apt/history.log ]; then
    cp /var/log/apt/history.log ~/apt/history.log
fi
```

示例 2：判断当前用户是否为 `root`，若不是，则提示用户输入密码。

```bash
#!/bin/bash
# 判断当前用户是否为 root
# 方法一：利用 $UID 变量，若等于 0，则当前用户为 root
if [ $UID -ne 0 ]; then
    echo "Please use root account to run this script."
else
    echo "You are root."
fi

# 方法二：利用 $EUID 变量，若等于 0，则当前用户为 root
if [ $EUID -ne 0 ]; then
    echo "Please use root account to run this script."
else
    echo "You are root."
fi

# 方法三：利用 $USER 变量，若等于 root，则当前用户为 root
if [ $USER != "root" ]; then
    echo "Please use root account to run this script."
else
    echo "You are root."
fi
```


# 循环语句

循环语句可以重复执行代码块。

## 语句结构

在使用 `for` 循环时，变量的取值可以是列表、范围或命令的输出结果。

其中的 `<命令>` 可以用反引号 \` ... \` 包裹，也可以用 `$()` 包裹。

```bash
# for 循环
for <变量> in <值1> <值2>...; do
    <代码块>
done

for <变量> in {<值1>..<值2>}; do
    <代码块>
done

for <变量> in [`<命令>` || $(<命令>)]; do
    <代码块>
done

# while 循环
while [ <条件> ]; do
    <代码块>
done

# until 循环
until [ <条件> ]; do
    <代码块>
done
```

## 循环控制

循环语句还可以控制循环的次数。

- `break`： 跳出循环。
- `continue`： 跳过当前循环，继续下一次循环。

## 示例

示例 1：打印 1 到 10 的偶数。当遇到 6 时，跳出循环。

```bash
# for 循环
for i in {1..10}; do
    if [ $((i%2)) -eq 0 ]; then
        echo $i
    fi
    if [ $i -eq 6 ]; then
        break
    fi
done
```

若你对 Java 熟悉，你可能还会发现 `for` 循环的语法类似于 Java 中的 `for` 循环。

```bash
# for 循环
for ((i=1; i<10; i+=2)); do
    echo $i
    if [ $i -eq 6 ]; then
        break
    fi
done
```

示例 2：打印 1 到 10 的所有偶数，当遇到 6 时，跳过当前循环，继续下一次循环。

```bash
# while 循环
count=0
while [ $count -lt 10 ]; do
    count=$((count+2))
    if [ $count -eq 6 ]; then
        continue
    fi
    echo $count
done
```

示例 3：打印 1 到 10 的所有偶数，当遇到 4 时，跳过当前循环；当遇到 6 时，跳出循环。

```bash
# until 循环
count=0
until [ $count -eq 10 ]; do
    count=$((count+1))
    if [ $count -eq 4 ]; then
        continue
    fi
    if [ $count -eq 6 ]; then
        break
    fi
    echo $count
done
```

# 选择语句

选择语句可以根据用户的选择执行不同的代码块。

## 语句结构

`select` 语句可以让用户从列表、范围、命令输出结果中选择一个值，并赋值给变量。

```bash
# select 语句
select <变量> in [<值1> <值2>... || {<值1>..<值2>}]; do
    <代码块>
done

select <变量> in [`command` || $(command)]; do
    <代码块>
done
```

`case` 语句也可以根据变量的值执行不同的代码块。使用 `case` 语句时需要注意以下几点：

1. `case` 语句必须与 `esac` 配对使用。
1. `case` 语句中的 `in` 必须与 `)` 配对使用。
1. `case` 语句中的 `;;` 必须与 `)` 配对使用。
1. `case` 语句中的 `*)` 表示其他情况。

```bash
case <变量> in
    <值1>)
        <代码块1>
        ;;
    <值2>)
        <代码块2>
        ;;
    *)
        <代码块3>
        ;;
esac
```

{% note red 'fa-solid fa-exclamation-triangle' %}

**注意：**

选择语句只能在交互式 Shell 中使用，如 `bash` 或 `zsh`。

注意每条命令的结尾必须以 `;;` 结尾，表示选择结束。

{% endnote %}

## 示例

示例 1：提示用户输入数字，并根据输入执行不同的操作。

- 输入 `start` 时启动服务器；
- 输入 `stop` 时停止服务器；
- 输入 `restart` 时重启服务器；
- 输入 `exit` 时退出脚本。
- 输入其他内容时显示错误信息。

```bash
# select 语句
echo "Please select an option:"
# select 语句
echo "Please select an option:"
select option in start stop restart exit; do
    case $option in
        start)
            echo "Starting the server..."
            ;;
        stop)
            echo "Stopping the server..."
            ;;
        restart)
            echo "Restarting the server..."
            ;;
        exit)
            echo "Exit..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
```

{% note yellow 'fa-solid fa-exclamation-triangle' %}

**注意：**

当执行 `select` 语句时，脚本会持续循环，直到用户输入 `exit` 选项才能退出循环。

若用户需要直接退出程序，按下 `Ctrl+C` 即可。

{% endnote %}

示例 2：提示用户输入数字，并根据输入执行不同的操作。

1. 输入 `1` 时，打印 `You entered 1`。
1. 输入 `2` 时，打印 `You entered 2`。
1. 输入 `3` 时，打印 `You entered 3`。
1. 输入其他值时，打印 `Invalid input`。


```bash
# case 语句
echo "Please enter a number:"
read num
case $num in
    1)
        echo "You entered 1"
        ;;
    2)
        echo "You entered 2"
        ;;
    3)
        echo "You entered 3"
        ;;
    *)
        echo "Invalid input"
        ;;
esac
```

# 函数

函数可以将一系列命令封装成一个整体，可以重复使用。

## 语法结构

```bash
# 定义函数
function <函数名 1>() {
    <代码块>
    return <返回值>  # 可选语句，但必须在函数体最后一行
}

# 或者可以省略 function 关键字
<函数名 2>() {
    <代码块>
    <函数名 1> [<参数>]   # 可以调用其他函数
    return <返回值>    
}

# 调用函数
<函数名>
```

{% note yellow 'fa-solid fa-exclamation-triangle' %}

**注意：** 关于函数定义，你需要注意以下几点：

1. 函数定义时，函数名只能包含字母、数字和下划线，且不能以数字开头。

1. 函数调用时，函数名后面可以加上参数，参数之间用空格分隔。

1. 函数定义时，函数体必须用花括号 `{}` 包裹。

1. 函数定义时，函数体内的变量作用域为局部变量，函数执行结束后，局部变量会被销毁。

1. 函数可以返回值，使用 `return` 语句。但必须将 `return` 语句置于函数体最后一行。否则，函数将立即结束。

1. 函数可以调用其他函数。
{% endnote %}

## 示例

示例 1：定义一个函数 `hello()`，要求用户输入姓名，并打印 `Hello, <姓名>!`。

```bash
# 定义函数
function hello() {
    echo "Hello, $1!"
}

# 调用函数
read -p "Please enter your name: " name
hello $name
```

示例 2：定义一个函数 `times()` 和一个函数 `sum()`，要求用户输入一个数字，并打印 `The sum is <结果>`。

参考输入输出：

- `3` --> `The sum is 6`
- `5` --> `The sum is 120`
- `10` --> `The sum is 3628800`


```bash
# 定义函数
times() {
    echo $(( $1 * $2 )) # 即 $total * $i，计算阶乘
}

sum() {
    total=1
    for (( i=1; i<=$1; i++ )); do
        total=`times $total $i`  # 调用 times 函数，计算阶乘
    done
    echo "The sum is $total"
}

# 调用函数
read -p "Please enter a number: " num
sum $num
```

示例 3：定义一个函数 `install_packages()`，要求用户输入软件包名，并安装指定的软件包。定义一个函数 `package_manager()`，用于搜寻系统中可用的软件包管理工具，并安装指定的软件包。

注意：针对 Arch Linux 使用的 `pacman` 的命令有所不同，需要进行单独修改。

```bash
# 定义函数
function install_packages() {
    # 假如没有输入软件包名
    if [ ! $2 ]; then
        echo "Error: Please enter a package name."
        return 1
    fi
    # 假如使用的是 pacman
    if [ $1 == pacman ];then
        sudo pacman -S $2 --noconfirm
    else
        sudo $1 install $2 -y
    fi
}

function package_manager() {
    for manager in apt dnf pacman yum zypper; do
        which $manager &> /dev/null
        # 假如对应的包管理工具存在，则安装软件包
        if [ $? -eq 0 ]; then
            echo "Using $manager to install $1"
            install_packages $manager $1 
            return 0
        fi
    done
    echo "No package manager found"
    return 1
}
    
# 调用函数
read -p "Please enter a package name: " package
package_manager $package
```