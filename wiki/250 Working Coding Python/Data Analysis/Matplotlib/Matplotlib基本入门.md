# Matplotlib 基本入门



## 图形绘制

### 绘制简单图形

```python
from matplotlib import pyplot as plt


# figure: 我们画的图
fig = plt.figure(figsize=(20, 8), dpi=80)

x = range(2, 26, 2)

y = [15, 13, 14.5, 17, 20, 25, 26, 26, 24, 22, 18, 15]

plt.plot(x, y)

plt.savefig("./sig_size.png")

# 设置步长
# plt.xticks(x)

plt.xticks(x, list(x)[::1])

plt.show()
```

![01绘制简单图形](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/01%E7%BB%98%E5%88%B6%E7%AE%80%E5%8D%95%E5%9B%BE%E5%BD%A2.png)



### 案例：绘制折线图观测每分钟气温变化

```python
from matplotlib import pyplot as plt
import random


plt.figure(figsize=(20, 8))
x = range(120)

# Python 需要设置随机种子，让每次随机的结构都是一样的。
random.seed(10)
y = [random.randint(20, 35) for i in range(120)]

plt.plot(x, y)

# 设置刻度规则
_x_ticks = ["10:{}".format(i) for i in x if i<60]
_x_ticks += ["11:{}".format(i-60) for i in x if i>60]

# 按照规则进行绘图
plt.xticks(x[::5], _x_ticks[::5])

plt.savefig("./tempary.png")

plt.show()
```



![02绘制折线图观测每分钟气温变化](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/02%E7%BB%98%E5%88%B6%E6%8A%98%E7%BA%BF%E5%9B%BE%E8%A7%82%E6%B5%8B%E6%AF%8F%E5%88%86%E9%92%9F%E6%B0%94%E6%B8%A9%E5%8F%98%E5%8C%96.png)



### 设置中文显示

```python
# coding=utf-8
from matplotlib import pyplot as plt
import random
import matplotlib


plt.figure(figsize=(20, 8))
x = range(120)

# Python 需要设置随机种子，让每次随机的结构都是一样的。
random.seed(10)
y = [random.randint(20, 35) for i in range(120)]

plt.plot(x, y)

# 设置字体
font = {
    "family": "MicroSoft Yahei",
    "weight": "bold",
#     "size": "larger"
}
matplotlib.rc("font", **font)


# 设置刻度规则
_x_ticks = ["10点{}".format(i) for i in x if i<60]
_x_ticks += ["11点{}".format(i-60) for i in x if i>60]

# 按照规则进行绘图
# plt.xticks(x[::5], _x_ticks[::5], rotation=90, fontproperties=my_font)
plt.xticks(x[::5], _x_ticks[::5], rotation=90)


plt.xlabel("Time")
plt.ylabel("Tempara")
plt.title("The Temparary every minutes from 10 to 12 o'clock")

# plt.savefig("./tempary.png")

plt.show()
```

![03绘制折线图观测每分钟气温变化+中文](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/03%E7%BB%98%E5%88%B6%E6%8A%98%E7%BA%BF%E5%9B%BE%E8%A7%82%E6%B5%8B%E6%AF%8F%E5%88%86%E9%92%9F%E6%B0%94%E6%B8%A9%E5%8F%98%E5%8C%96+%E4%B8%AD%E6%96%87.png)



```python
# 统计11岁到30岁每年交的女朋友数量

from matplotlib import pyplot as plt

x = range(11, 31)

y1 = [1, 0, 1, 1, 2, 4, 3, 2, 3, 4, 4, 5, 6, 5, 4, 3, 3, 1, 1, 1]
y2 = [1, 0, 3, 1, 2, 2, 3, 3, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]


plt.xticks(x[::1])

plt.plot(x, y1)
plt.plot(x, y2)

plt.xlabel("The age of mine")
plt.ylabel("Numbers of my girfriend")
plt.title("The girfriend of mine from 11 to 30")

plt.show()
```

![04统计11岁到30岁每年交的女朋友数量](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/04%E7%BB%9F%E8%AE%A111%E5%B2%81%E5%88%B030%E5%B2%81%E6%AF%8F%E5%B9%B4%E4%BA%A4%E7%9A%84%E5%A5%B3%E6%9C%8B%E5%8F%8B%E6%95%B0%E9%87%8F.png)





### 显示多个图形及相应图例

案例：统计11岁到30岁每年交的女朋友数量

```python
# 统计11岁到30岁每年交的女朋友数量

from matplotlib import pyplot as plt

x = range(11, 31)

y1 = [1, 0, 1, 1, 2, 4, 3, 2, 3, 4, 4, 5, 6, 5, 4, 3, 3, 1, 1, 1]
y2 = [1, 0, 3, 1, 2, 2, 3, 3, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]


plt.xticks(x[::1])

# plt.plot(x, y1)
# plt.plot(x, y2)


plt.plot(x, y1, label="Mine", linestyle="--", color="red", alpha=0.5)
plt.plot(x, y2, label="My classmates", linestyle="-", color="blue", alpha=0.5)

plt.legend(loc="best")

plt.xlabel("The age of mine")
plt.ylabel("Numbers of my girfriend")
plt.title("The girfriend of mine from 11 to 30")

plt.show()
```

![05统计11岁到30岁每年交的女朋友数量+图例](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/05%E7%BB%9F%E8%AE%A111%E5%B2%81%E5%88%B030%E5%B2%81%E6%AF%8F%E5%B9%B4%E4%BA%A4%E7%9A%84%E5%A5%B3%E6%9C%8B%E5%8F%8B%E6%95%B0%E9%87%8F+%E5%9B%BE%E4%BE%8B.png)



## 折线图绘制

- 不同条件(维度)之间的内在关联关系
- 观察数据的离散聚合程度



```python
# 显示温度

from matplotlib import pyplot as plt


# 设置图形大小
plt.figure(figsize=(20, 8), dpi=80)


x1 = range(1, 32)
x2 = range(51, 82)

a = [11,17,16,11,12,11,12,6,6,7,8,9,12,15,14,17,18,21,16,17,20,14,15,15,15,19,21,22,22,22,23]
b = [26,26,28,19,21,17,16,19,18,20,20,19,22,23,17,20,21,20,22,15,11,15,5,13,17,10,11,13,12,13,6]

plt.scatter(x1, a)
plt.scatter(x2, b)

# 设置X轴刻度
_x = list(x1) + list(x2)
_x_ticks = ["Mar{}".format(i) for i in x1]
_x_ticks += ["Oct{}".format(i) for i in x2]


plt.xticks(_x, _x_ticks, rotation=45)



plt.xlabel("Time")
plt.ylabel("Temparary")
plt.title("The temp range on Mar & Oct")

plt.show()
```

![06折线图](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/06%E6%8A%98%E7%BA%BF%E5%9B%BE.png)



## 条形图绘制

- 数量统计
- 频率统计（市场饱和度）



```python
from matplotlib import pyplot as plt

plt.figure(figsize=(20, 8), dpi=80)

a = ["战狼2","速度与激情8","功夫瑜伽","西游伏妖篇","变形金刚5：最后的骑士","摔跤吧！爸爸","加勒比海盗5：死无对证","金刚：骷髅岛","极限特工：终极回归","生化危机6：终章","乘风破浪","神偷奶爸3","智取威虎山","大闹天竺","金刚狼3：殊死一战","蜘蛛侠：英雄归来","悟空传","银河护卫队2","情圣","新木乃伊",]

b=[56.01,26.94,17.53,16.49,15.45,12.96,11.8,11.61,11.28,11.12,10.49,10.3,8.75,7.55,7.32,6.99,6.88,6.86,6.58,6.23]

plt.bar(range(len(a)), b, width=0.5, color="orange")

plt.xticks(range(len(a)), a, rotation=90)

plt.show()
```

![07条形图绘制](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/07%E6%9D%A1%E5%BD%A2%E5%9B%BE%E7%BB%98%E5%88%B6.png)



```python
from matplotlib import pyplot as plt


plt.figure(figsize=(20, 8), dpi=80)

a = ["猩球崛起3：终极之战","敦刻尔克","蜘蛛侠：英雄归来","战狼2"]
b_16 = [15746,312,4497,319]
b_15 = [12357,156,2045,168]
b_14 = [2358,399,2358,362]

_bar_width = 0.1

_x = range(len(a))

plt.bar(_x, b_14, width=_bar_width, color="blue")
plt.bar([i + _bar_width for i in _x], b_15, width=_bar_width, color="red", label="Sep 15")
plt.bar([i + _bar_width * 2 for i in _x], b_16, width=_bar_width, color="orange", label="Sep 16")

_x_ticks = [i + _bar_width for i in _x]

plt.xticks(_x_ticks, a, rotation=90)

plt.show()
```

![08条形图绘制02](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/08%E6%9D%A1%E5%BD%A2%E5%9B%BE%E7%BB%98%E5%88%B602.png)



## 绘制直方图

- 用户的年龄分布状态
- 一段时间内用户点击次数的分布状态
- 用户活跃时间的分布状态



```python
from matplotlib import pyplot as plt



plt.figure(figsize=(20, 8), dpi=80)


a=[131,  98, 125, 131, 124, 139, 131, 117, 128, 108, 135, 138, 131, 102, 107, 114, 119, 128, 121, 142, 127, 130, 124, 101, 110, 116, 117, 110, 128, 128, 115,  99, 136, 126, 134,  95, 138, 117, 111,78, 132, 124, 113, 150, 110, 117,  86,  95, 144, 105, 126, 130,126, 130, 126, 116, 123, 106, 112, 138, 123,  86, 101,  99, 136,123, 117, 119, 105, 137, 123, 128, 125, 104, 109, 134, 125, 127,105, 120, 107, 129, 116, 108, 132, 103, 136, 118, 102, 120, 114,105, 115, 132, 145, 119, 121, 112, 139, 125, 138, 109, 132, 134,156, 106, 117, 127, 144, 139, 139, 119, 140,  83, 110, 102,123,107, 143, 115, 136, 118, 139, 123, 112, 118, 125, 109, 119, 133,112, 114, 122, 109, 106, 123, 116, 131, 127, 115, 118, 112, 135,115, 146, 137, 116, 103, 144,  83, 123, 111, 110, 111, 100, 154,136, 100, 118, 119, 133, 134, 106, 129, 126, 110, 111, 109, 141,120, 117, 106, 149, 122, 122, 110, 118, 127, 121, 114, 125, 126,114, 140, 103, 130, 141, 117, 106, 114, 121, 114, 133, 137,  92,121, 112, 146,  97, 137, 105,  98, 117, 112,  81,  97, 139, 113,134, 106, 144, 110, 137, 137, 111, 104, 117, 100, 111, 101, 110,105, 129, 137, 112, 120, 113, 133, 112,  83,  94, 146, 133, 101,131, 116, 111,  84, 137, 115, 122, 106, 144, 109, 123, 116, 111,111, 133, 150]


bin_width = 3

num_bin = int((max(a)-min(a))/bin_width)

plt.hist(a, num_bin)

plt.xticks(list(range(min(a), max(a)))[::bin_width], rotation=45)

plt.show()
```

![09绘制直方图](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/09%E7%BB%98%E5%88%B6%E7%9B%B4%E6%96%B9%E5%9B%BE.png)



```python
from matplotlib import pyplot as plt



plt.figure(figsize=(20, 8), dpi=80)

quantity = [836,2737,3723,3926,3596,1438,3273,642,824,613,215,47]


# bin_width = 3

# num_bin = int((max(a)-min(a))/bin_width)

# plt.hist(quantity, num_bin)

# plt.xticks(list(range(min(a), max(a)))[::bin_width], rotation=45)

plt.hist(quantity)

plt.show()
```

![10绘制直方图02](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/10%E7%BB%98%E5%88%B6%E7%9B%B4%E6%96%B9%E5%9B%BE02.png)



## 多图形绘制

### 普通多图形绘制

```python
from matplotlib import pyplot as plt
import numpy as np


fig = plt.figure(figsize=(20, 8), dpi=80)

ax1 = fig.add_subplot(2,2,1)
ax2 = fig.add_subplot(2,2,2)
ax3 = fig.add_subplot(2,2,3)
ax4 = fig.add_subplot(2,2,4)

random_arr = np.random.randn(100)
# print(random_arr)

# plt.plot(random_arr)
ax2.plot(random_arr)


plt.show()
```

![11多图形绘制](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/11%E5%A4%9A%E5%9B%BE%E5%BD%A2%E7%BB%98%E5%88%B6.png)





### 推荐方式创建多个图表

```python
import matplotlib.pyplot as plt
import numpy as np


fig, subplot_arr = plt.subplots(2, 2)

subplot_arr[1, 0].hist(np.random.randn(100), bins=10, color='r', alpha=0.3)
subplot_arr[1, 1].hist(np.random.randn(100), bins=10, color='b', alpha=0.3)
subplot_arr[0, 0].hist(np.random.randn(100), bins=10, color='orange', alpha=0.3)
subplot_arr[0, 1].hist(np.random.randn(100), bins=10, color='black', alpha=0.3)


plt.show()
```

![12推荐多图](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/12%E6%8E%A8%E8%8D%90%E5%A4%9A%E5%9B%BE.png)



## 矩阵绘图

基本绘制

```python
import matplotlib.pyplot as plt
import numpy as np


m = np.random.rand(10, 10)

print(m)

plt.imshow(m, interpolation='nearest', cmap=plt.cm.ocean)

plt.colorbar()

plt.show()
```



### 案例

```python
import matplotlib.pyplot as plt
import numpy as np


fig, axes = plt.subplots(2)

axes[0]
```

![13矩阵绘图](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/13%E7%9F%A9%E9%98%B5%E7%BB%98%E5%9B%BE.png)



## 刻度、标签、图例

1. 设置刻度范围 

```python
plt.xlim(), plt.ylim()

ax.set_xlim(), ax.set_ylim()

```
2. 设置显示的刻度
```python

plt.xticks(), plt.yticks()

ax.set_xticks(), ax.set_yticks()

```
3. 设置刻度标签
```python

ax.set_xticklabels(), ax.set_yticklabels()

```
4. 设置坐标轴标签
```python

ax.set_xlabel(), ax.set_ylabel()

```
5. 设置标题
```python

ax.set_title()

```
6. 图例
```python

ax.plot(label=‘legend’)

ax.legend(), plt.legend()

loc=‘best’：自动选择放置图例最佳位置
```


```python
import matplotlib.pyplot as plt
import numpy as np
import random

fig, ax = plt.subplots(1)

np.random.seed(10)
ax.plot(np.random.randn(1000).cumsum(), label='line0')

# 设置刻度
#plt.xlim([0,500])
ax.set_xlim([0, 800])

# 设置显示的刻度
#plt.xticks([0,500])
ax.set_xticks(range(0,800,100))

# 设置刻度标签
ax.set_yticklabels(['Jan', 'Feb', 'Mar'])

# 设置坐标轴标签
ax.set_xlabel('Number')
ax.set_ylabel('Month')

# 设置标题
ax.set_title('Example')

# 图例
ax.plot(np.random.randn(1000).cumsum(), label='line1')
ax.plot(np.random.randn(1000).cumsum(), label='line2')
ax.legend()
ax.legend(loc='best')
#plt.legend()
```



![14刻度、标签、图例](_resource/Matplotlib%E5%9F%BA%E6%9C%AC%E5%85%A5%E9%97%A8/14%E5%88%BB%E5%BA%A6%E3%80%81%E6%A0%87%E7%AD%BE%E3%80%81%E5%9B%BE%E4%BE%8B.png)

