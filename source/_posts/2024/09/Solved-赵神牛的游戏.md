---
title: '[Solved] 赵神牛的游戏（解题历程）'
tags:
  - 解题历程
  - 💡解题
  - C_and_Cpp
categories: 刷题TODO
excerpt: 源于9月11日题目
mathjax: true
date: 2024-09-12 19:14:09
updated: 2024-09-12 19:14:09
thumbnail:
---

{% btn center large::点击这里查看题目来源::https://www.luogu.com.cn/problem/P2006::fas fa-link %}

# 开始之前

这是我有史以来第一次做过最烦的题目(*虽然这是入门级别的难度*)。如果你已做过此题目并看到此篇题解，请跳过此篇，这是作者解题时的心路历程。

# 解题历程

## 第一次

### 审题 & 敲码

在还未完全读完整个题目的情况下，单看题目中所给的输入样本和输出样本。认为这道题目的输出只需要判断赵神牛能否打败 Boss 即可（是则输出为 `1`，不能则输出 `-1`）。

如第一个输入样例与第二个输入样例：


> **样例输入 #1**
> 
> ```
> 100 3 5000
> 20 1000
> 90 1
> 110 10000
> ```
> 
> **样例输出 #1**
> 
> ```
> 1
> ```
> 
> **样例输入 #2**
> 
> ```
> 50 4 10
> 60 100
> 70 1000
> 80 1000
> 90 0
> ```
> 
> **样例输出 #2**
> 
> ```
> -1
> ```

随后，我就根据题目定义两个数组 `spend_a`, `spend_b`，分别存放了赵神牛的法力消耗与使用技能时的伤害值。于是就有了如下代码：

```C
#include <stdio.h>

int main() {
    // k: 法力值，m: 技能数，n: boss_HP
    int k, m, n;
    scanf("%d %d %d", &k, &m, &n);
    // a: 耗费法力，b: 造成伤害
    int a, b;
    // 定义主角可用的技能
    int spend_magic[255];
    // 定义主角可用的技能
    int can_use_skill = 0;

    // boss 受到的伤害
    int get_hurt[255];

    // 循环输入 m 个技能
    for (int i = 0; i < m; i++) {
        scanf("%d %d", &a, &b);
        // 假如有足够的法力值以使用此技能
        if (k > a)
        {
            spend_magic[i] = a;
            get_hurt[i] = b;
            can_use_skill++;
        }
    }

    // 假如主角没有足够的法力值使用任何技能
    if (can_use_skill <= 0)
    {
        printf("-1");
        return -1;
    }
    
    // 与 Boss 决斗
    for (int i = 0; i < can_use_skill; i++)
    {
        while (k > 0 || n > 0)
        {
            k -= spend_magic[i];
            n -= get_hurt[i];
        }
        
        if (n <= 0)
        {
            printf("1");
            return 1;
        }   
    }
    
    printf("-1");
    return -1;
}
```

正当我信誓旦旦的写出了代码之后，提交到 OJ 评判，最终得到了大量的**RE【Runtime Error】**报错，甚至还有一两个**TLE【Time Limit Exceeded】**报错。

### 错误分析

**之一：返回值不应当是任何数，只能为 0**

翻看代码，发现 `main()` 函数中的返回值(`return X`)中的 `X` 都被我定义成 `-1` 或 `1`，导致出现 **RE**;

后来才知道，**C 语言中的 `main()` 函数的返回值应当以 `0` 的方式正常退出即可。**

**之二：运行时间过长导致超出时间限制**

解决此问题，最先应当解决的就是含有 `for` 与 `while` 循环的部分了；其次，
就是删除多余的循环。

## 第一次 Again

### 修改 & 敲码

经过了重重修改并反复提交之后，敲出了如下代码：

```C
#include <stdio.h>

int main() {
    // k: 法力值，m: 技能数，n: boss_HP
    int k, m, n;
    scanf("%d %d %d", &k, &m, &n);
    // a: 耗费法力，b: 造成伤害
    int a, b;
    int spend_a[30000], spend_b[30000];

    // 循环输入 m 个技能
    for (int i = 0; i < m; i++) {
        scanf("%d %d", &a, &b);
        spend_a[i] = a;
        spend_b[i] = b;
    }

    for (int i = 0; i < m; i++)
    {
        // 假如有足够的法力值以使用此技能
        if (k > spend_a[i]) {
            // 与 Boss 决斗
            if (k / spend_a[i] * spend_b[i] >= n)
            {
                printf("1");
                return 0;
            }
        }
    }
    
    printf("-1");
    return 0;
}
```

没错，这次的代码优化了许多。提交之后，虽然没有出现任何的**RE**和**TLE**报错，**但出现了大量的 WA 报错**。😂😂😂

很难想到，这究竟在哪里出了问题。

## 第二次

### 在解题路上摸爬滚打，终于找到原因

基于第一次的代码，反复修改，并没有找到原因。在经历了长达4个小时的头脑风暴后，我还是毅然决然地选择~~放弃(bushi)~~请教拥有ACM竞赛经验的同学。他大致看了我所写的代码，指出了许多的小问题。

在经历了多番的教导与纠错之下，我**成功地推翻了之前的所有代码**，**重新审题并整理了一遍思路**，反反复复地修改和优化代码。于是，就得到了相对最接近答案的代码：

```C
#include <stdio.h>

int main()
{
    // k: 法力值，m: 技能数，n: boss_HP, 
    // can_defeat: 可以打boss的技能数量, 
    // answer: 可以打boss的技能编号
    int k, m, n, can_defeat = 0; int answer[30000];
    scanf("%d %d %d", &k, &m, &n);
    // a: 耗费法力，b: 造成伤害
    int a, b;
    for (int i = 0; i < m; i++)
    {
        scanf("%d %d", &a, &b);
        if (a == 0 && b > 0) // 这里是为了解决除数为 0 的情况
        {
            answer[can_defeat] = i + 1;
            can_defeat++;
        }
        else if (b * (k / a) >= n)
        {
            answer[can_defeat] = i + 1; 
            can_defeat++;
        }
    }

    for (int i = 0; i < can_defeat; i++)
    {
        if (i < can_defeat - 1)
        {
            printf("%d,", answer[i]);
        }
        else
        {
            printf("%d\n", answer[i]);
        }
    }
    if (can_defeat == 0)
    {
        printf("-1");
    }

    return 0;
}
```

其中上述代码作出的修改点有：

1. 删除了 `spend_a` 和 `spend_b` 这两个数组，因为不需要记录技能的消耗和伤害值，只需要判断是否可以打 boss 即可。

2. 在 `for` 循环中，判断是否可以打 boss 的条件由 `k / spend_a[i] * spend_b[i] >= n` 改为 `b * (k / a) >= n`，因为 `k / spend_a[i] * spend_b[i]` 可能会因为除数太小而溢出。

3. 在 `for` 循环中，判断是否可以打 boss 的条件由 `k > spend_a[i]` 改为 `a == 0 && b > 0`，因为当 `a == 0 && b > 0` 时，说明是 `k` 无法消耗，但 `b` 可以造成伤害，此时可以打 boss。

### 经历了漫长的解题抗争之后，才发现的小问题

正当以为终于可以解开这道题~~（**解开了，又没完全解开**）~~的时候，结果仍然是**WA**。我经历了无数次毫无意义的修改和调试，还是没能发现问题所在。

最后，同学仔细查看了我所写的代码之后，才发现了问题所在：**没有仔细审题！！！**

是的，这问题<u>**我从头到尾都没有注意过**</u>，就是**输出多个技能序列时分隔的问题**。我的代码中是用 `,` 隔开，而题目中的输出要求是用**空格**隔开。

终于终于，我最后一次提交了正确的代码，终于全部通过了😭😭😭~~~~
