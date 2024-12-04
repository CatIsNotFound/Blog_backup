---
title: '[答疑解惑] 关于如何在 C++ 中获取一行输入字符串的方法'
date: 2024-12-04 14:14:10
updated: 2024-12-04 15:23:10
tags: 
  - C/C++
  - 答疑解惑
  - 新手向
categories: 答疑解惑
excerpt: 在 C++ 中，cin 是标准输入流，主要用于等待并获取用户输入的内容，但获取用户输入一行的字符串内容，就不能直接用 cin 来获取。关于其解决方法，详见后文
---

# 简述

在 C++ 中，`std:cin` 是标准输入流，主要用于等待并获取用户输入的内容，但获取用户输入一行的字符串内容，就不能直接用 `cin` 来获取。

示例代码：输出用户输入的字符串

假如用户输入了一行内容中包含**空格**或者**制表符** `Tab` 等空白字符的字符串，空白字符及后面的所有部分会被忽略，导致只能输出空白字符前的字符串。

```cpp
#include <iostream>
using namespace std;

int main() {
    char line[64];
    cin >> line;
    cout << line << endl;    
    return 0;
}

// 输入样例：
// Hello world!
// 输出样例：
// Hello
```



# 解决方法

**1、利用 `string` 中的 `getline()` 方法**

可以将需要获取的变量类型从 `char` 改为 `string` 类型，并使用 `getline()` 方法以获取行内的内容。

**使用方法：`getline()`**

- 其函数定义于 `<string>` 头文件中，其函数原型如下：(只提其中一种使用方法)

  ```cpp
  istream& getline( istream& is, string& str );
  ```

- 其中的参数含义如下：

  - `is`：输入流对象。可以是 `cin`、`fstream`、`istream` 类型的指针等。
  - `str`：用于存储读取的字符串。

因此，根据此方法，可以这么写：

```cpp
#include <iostream>
#include <string>
using namespace std;

int main() {
    string line;
    getline(cin, line);
    cout << line << endl;    
    return 0;
}

// 输入样例：
// Hello world!
// 输出样例：
// Hello world!
```

附加：getline() 与 gets()

**2、利用 `cin.getline()` 方式**

```cpp
cin.getline(char_type* __s, streamsize __n)
```

对应的参数如下：

- `__s`：选定一个字符串对象；
- `__n`：限制的字符个数，其区间范围为 `[0, n)`；

针对 C 语言风格，如果要将用户输入的内容赋值给 `char` 类型的字符串数组，可以这么写：

```cpp
#include <iostream>
using namespace std;

int main() {
    char line[64];
    cin.getline(line, sizeof(line));
    cout << line << endl;    
    return 0;
}

// 输入样例：
// Hello world!
// 输出样例：
// Hello world!
```



# 参考链接

- [c++ - std::cin input with spaces? - Stack Overflow](https://stackoverflow.com/questions/5838711/stdcin-input-with-spaces)
- [Getline in C++ – cin getline() Function Example](https://www.freecodecamp.org/news/getline-in-cpp-cin-getline-function-example/)
