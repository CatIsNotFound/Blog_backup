---
title: 'Python 02：求和数组'
categories: ['刷题', '⭐(Easy)']
excerpt: 一边学 Python 一边做题，每日一题系列。
date: 2024-05-15 22:56:17
expires: 2024-06-16 23:00:00
thumbnail:
---

{% btn center large::点击这里查看题目来源::https://www.codewars.com/kata/53dc54212259ed3d4f00071c::fas fa-link %} 

> 难度：⭐(Easy)
> 
> 标签：`列表` `循环` `内置函数`

# 题目描述

编写一个函数，该函数接收一个数字数组并返回数字的总和。数字可以是负数或非整数。如果数组不包含任何数字，则应返回 0。

# 示例

Input: `[1, 5.2, 4, 0, -1]`
Output: `9.2`

Input: `[]`
Output: `0`

Input: `[-2.398]`
Output: `-2.398`


# 答题模板

请在下面所提供的模板中补充代码。

```python
def sum_array(arr):
    # 请在这里补充代码

print(sum_array([1, 5.2, 4, 0, -1])) # Output: 9.2
print(sum_array([])) # Output: 0
print(sum_array([-2.398])) # Output: -2.398
```

# 提示与解题思路

{% folding yellow::💡 没有思路？查看提示。🧐 %}
 
{% tabs tips %}
<!-- tab 🧩 循环求和 -->

正如题目所述，我们可以利用 `for` 循环来求数组的和。

<!-- endtab -->

<!-- tab 🧩 利用内置函数快速求和 -->

Python 中可以利用内置函数快速求指定数组的总和。

<!-- endtab -->


{% endtabs %}

{% folding yellow::💡 看完仍无思路？查看解题思路。🧐 %}

{% tabs solutions %}

<!-- tab 🔑 for 循环求和 -->

1. 定义一个变量 `total` 用来存储数组的和。
2. 遍历数组，将每个元素加到 `total` 变量上。
3. 返回 `total` 变量的值。


```python
def sum_array(arr):
    total = 0
    for num in arr:
        total += num
    return total
```

<!-- endtab -->

<!-- tab 👍 利用内置函数快速求和 -->

在 Python 中，我们可以使用内置函数 `sum()` 来快速求指定数组的总和。

```python
def sum_array(arr):
    return sum(arr)
```

<!-- endtab -->

{% endtabs %}

{% endfolding %}
 
{% endfolding %}