---
title: '[答疑解惑] C++ 中的 gets() 函数替代方案'
date: 2024-12-03 20:16:06
updated: 2024-12-03 20:16:06
tags: 
    - C/C++
    - 答疑解惑
    - 新手向
categories: 答疑解惑
excerpt: 关于 gets() 函数不能在 C++ 11 及以后使用的替代方案
---

# 简述

在学习 C++ 的时候，发现 `gets()` 函数不能直接在 C++ 环境下使用。

下述代码中，本人编写了较为简单的程序，用于输出用户输入行内的两段内容。

```cpp
#include <iostream>
#include <cstring>
using namespace std;
int main() {
    char c_name[127];
    string s_name;
    cout << "Please input your name:";
    gets(c_name);
    // 当 c_name 长度小于 2 时，要求重新输入
    while (strlen(c_name) < 2) {
        cout << "Error: Please input again!\nYour name:";
        gets(c_name);
    }
    // 输出结果
    cout << "Your name: " << c_name << endl;
    return 0;
}
```

很显然，运行后出现了以下报错内容：

```
error: ‘gets’ was not declared in this scope; did you mean ‘getw’?
```

# 分析原因 & 解决方案

C++ 11 及以后版本中，`gets()` 函数已被废弃，因为其存在安全漏洞，即 `gets()` 函数在输入字符串时，**不会检查字符串的长度**，可能会**导致缓冲区溢出**。

因此，在 C++ 中，针对 `char` 类型的字符串，一般使用 `fgets()` 函数来代替； 

`fgets()` 函数可以正确地检查字符串的长度，避免缓冲区溢出。


# 函数使用

**`fgets()` 函数**

其函数定义于 `<cstdio>` 头文件中，其函数原型如下：

```cpp
char* fgets( char* str, int count, std::FILE* stream );
```

其中的参数含义如下：

- `str`：用于存储读取的字符串。
- `count`：读取的字符串的最大长度，包括字符串结束符。
- `stream`：文件流对象。可以是 `stdin`、`stdout`、`stderr`、`FILE*` 类型的指针等。

# 使用示例

根据如上的分析与解决方案，由 [【简述】](#简述) 中所述的代码示例可改写成如下：

```cpp
#include <iostream>
#include <cstring>
#include <cstdio>
using namespace std;

int main() {
    char c_name[127];
    string s_name;
    cout << "Please input your name:";
    fgets(c_name, 127, stdin);
    while (strlen(c_name) < 2) {
        cout << "Error: Please input again!\nYour name:";
        fgets(c_name, 127, stdin);
    }
    cout << "Your name in char: " << c_name;
    return 0;
}
```

# 参考资料

1. [std::fgets - cppreference.com - C++参考手册](https://cppreference.cn/w/cpp/io/c/fgets)
1. [gets, gets_s - cppreference.com - C++参考手册](https://cppreference.cn/w/c/io/gets)
1. [为什么gets函数不能用了？ - ACM与蓝桥杯竞赛指南 - C语言网](https://www.dotcpp.com/course/868)
