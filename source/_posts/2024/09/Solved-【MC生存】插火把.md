---
title: '[Solved] 【MC生存】插火把'
tags:
  - 💡解题
  - C/C++
categories: 刷题TODO
excerpt: 源于9月11日题目
date: 2024-09-12 17:50:02
updated: 2024-09-12 18:58:02
thumbnail:
mathjax: true
---

# 解题思路

大致思路：你需要知道地图大小、火把个数、萤石个数，并初始化地图，然后根据用户输入的火把（或萤石）坐标，并根据对应的照亮范围点亮，剩余未点亮的部分（暗区）将出现怪物。

因此有了大致的流程图：

<img src="/images/2024/0912/01.png" alt="流程图" style="width: 50%;" />

💡 **关于点亮范围的实现方法**：

- 火把：可以通过遍历 for 循环来分别实现横向 / 纵向点亮火把所在方位，剩余附近部分则单独点亮；
- 萤石：通过两层嵌套 for 循环将萤石附近区域点亮。


# 代码参考

```c
#include <stdio.h>

int main()
{
    int n, m, k;
    int mX, mY, kX, kY;
    int zombie = 0;
    // 初始设置：地图大小、火把数、萤石数
    scanf("%d %d %d", &n, &m, &k);
    // 创建地图
    int map[105][105];
    // 开始前所有格都是暗格
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            map[i][j] = 0; // 0 = 暗
        }
    }
    for (int i = 0; i < m; i++) {
        scanf("%d %d", &mX, &mY);
        // 点亮火把范围
        for (int x = mX - 3; x < mX + 2; x++)
        {
            map[x][mY-1] = 1;
        }
        for (int y = mY - 3; y < mY + 2; y++)
        {
            map[mX-1][y] = 1;
        }
        // 点亮火把附近
        map[mX - 1 - 1][mY - 1 - 1] = 1;
        map[mX - 1 - 1][mY - 1 + 1] = 1;
        map[mX - 1 + 1][mY - 1 - 1] = 1;
        map[mX - 1 + 1][mY - 1 + 1] = 1;
    }
    for (int i = 0; i < k; i++)
    {
        scanf("%d %d", &kX, &kY);
        // 点亮萤石范围
        for (int x = kX - 3; x < kX + 2; x++)
        {
            for (int y = kY - 3; y < kY + 2; y++)
            {
                map[x][y] = 1;
            }
            
        }
    }
    // 生成怪物数
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            // printf("%d,", map[i][j]);
            if (map[i][j] == 0)
            {
                zombie++;
            }
            
        }
        // printf("\n");
    }
    printf("%d", zombie);
    return 0;
}
```

> 提示：代码部分仅作为参考，可直接在原有基础上再度优化或简化。
