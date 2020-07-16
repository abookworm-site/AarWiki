# Python Basics 正则表达式

# 正则表达式

## `re`模块：正则匹配

```python
#coding=utf-8

import re


# match()进行字符串匹配
result = re.match(正则表达式, 要匹配的字符串)

# 提取数据
result.group()
```



```py
ret = re.match("[1-9]?\d","09")
# Output: 0 即仅有后面\d进行了匹配
print(ret.group())
```



需求：匹配出 `<html><h1>www.itcast.cn</h1></html>`
```
#coding=utf-8

import re

labels = ["<html><h1>www.itcast.cn</h1></html>", "<html><h1>www.itcast.cn</h2></html>"]

for label in labels:
    ret = re.match(r"<(\w*)><(\w*)>.*</\2></\1>", label)
    if ret:
        print("%s 是符合要求的标签" % ret.group())
    else:
        print("%s 不符合要求" % label)

# Output:
# <html><h1>www.itcast.cn</h1></html> 是符合要求的标签
# <html><h1>www.itcast.cn</h2></html> 不符合要求
```



## `search`：搜索

需求：匹配出文章阅读的次数
```
#coding=utf-8
import re

ret = re.search(r"\d+", "阅读次数为 9999")
ret.group()
```



## `findall`：查找所有

需求：统计出python、c、c++相应文章阅读的次数

```
#coding=utf-8
import re

ret = re.findall(r"\d+", "python = 9999, c = 7890, c++ = 12345")
print(ret)
```


## sub 将匹配到的数据进行替换
需求：将匹配到的阅读次数加1
```py
#coding=utf-8
import re

def add(temp):
    strNum = temp.group()
    num = int(strNum) + 1
    return str(num)

ret = re.sub(r"\d+", add, "python = 997")
print(ret)

ret = re.sub(r"\d+", add, "python = 99")
print(ret)
```


## split 根据匹配进行切割字符串，并返回一个列表
需求：切割字符串“info:xiaoZhang 33 shandong”
```py
#coding=utf-8
import re

# 对：或者空格进行切割
ret = re.split(r":| ","info:xiaoZhang 33 shandong")
print(ret)
# 运行结果：
# ['info', 'xiaoZhang', '33', 'shandong']
```


## Python贪婪和非贪婪
Python里数量词默认是贪婪。在"*","?","+","{m,n}"后面加上？，使贪婪变成非贪婪。

```py
>>> s="This is a number 234-235-22-423"
# .+ 尽可能多地匹配字符
# \d+ 只需要一个数字就可以满足条件
>>> r=re.match(".+(\d+-\d+-\d+-\d+)",s)
>>> r.group(1)
'4-235-22-423'
>>> r=re.match(".+?(\d+-\d+-\d+-\d+)",s)
>>> r.group(1)
'234-235-22-423'
```