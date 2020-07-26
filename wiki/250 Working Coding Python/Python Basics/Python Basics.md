# Python 基础课程

## 一、语言介绍

### Python简介

1. 脚本语言，无需编译
2. 内置标准库 & 丰富的第三方库
3. 可移植性好，开源



### 网工需要Python:

- 云，SDN来袭，Openstack是Python写的
- 自动化脚本



### Python 全景视图

Python programs can be decomposed(拆解) into modules, statements(语句), expression and objects as follows:

- Programs are composed of modules

    - `from scapy.all import *`
    - `import time`

- Modules contain statements

    ```python
    for i in range(1, 6):
    	ping_result = ping_one(dst, id_no, i, 64)
    	if ping_result:
    		print("...  ")
    ```

- Statements contain expressions

    ```python
    reply_data = ping_one_reply.getlayer(Raw).load()
    # 提取信息
    receive time = time.time()
    ```

    

- Expressions create and process objects



## 二、环境安装

### Python代码运行

1. 文件表头
```python
#!/usr/bin/python3
# coding=utf-8
```
- 首先需要确认 `python3` 路径：`whereis python3` or `which python3`
	- `whereis` 命令会列出所有python3相关的文件版本：/usr/bin/python3.6
	- `which`仅仅获取 `python3` 文件路径

2. 运行方式：
- `python3 filename.py`
- ./filename.py
	- 此种方式需要添加文件的执行权限：`chmod +x filename.py`



### WinSCP

1. 使用WinSCP可以直接连接 Linux 系统，而后通过 Windows 系统程序打开文件。
2. 如果通过 WinSCP 新建文件时，会导致文件末尾的编码问题。解决如下：
	- 安装Dos2Unix： `yum install -y dos2unix`
	- 转码：`dos2unix filename.py`



## 三、内置类型：数字

### 1. 内置对象

1, 内置对象特点

- Built-in objects make programs easy to write
- Built-in object are components of extensions
- Built-in object are often more efficient than custom data structures
- Built-in objects are a standard part of the language.



2, 内置对象类型

![image-20200620011924473](_resource/Python%20Basics/image-20200620011924473.png)



对象分类

| Object type    | Category         | Mutable？ |
| -------------- | ---------------- | --------- |
| Numbers（all） | Numeric - 数值   | No        |
| Strings(all)   | Sequence         | No        |
| Lists          | Sequence         | Yes       |
| Dictionaries   | Mapping - 映射   | Yes       |
| Tuples         | Sequence         | No        |
| Files          | Extension - 扩展 | N/A       |
| Sets           | Set - 集合       | Yes       |
| Frozenset      | Set              | No        |
| bytearray      | Sequence         | Yes       |



#### 2. 基本数字常量

![image-20200620005201092](_resource/Python%20Basics/image-20200620005201092.png)



#### 内建数学工具

- Expression operators(表达式操作符)
    - `+ - * / `
    - `>> ` `<<` `!`
    - `**`
    - `&`：位操作与
    - `and` ： 逻辑且
    - `|`: 位操作或
    - `or`：逻辑或
    - `not`：逻辑非

- Built-in mathematical functions(内建数学函数)
    - `pow()` -
    - `abs()`
    - `round()`
    - `int()`
    - `hex()`

- Utility modules(工具模块)
    - `random`
    - `math`



### 2. 表达式操作符

![image-20200620004839133](_resource/Python%20Basics/image-20200620004839133.png)



#### 表达式操作符优先级

- Operators lower in the table have higher precedence，and so bind more tightly in mixed expressions.（表中越靠后，优先级越高）
- Operators **in the same row** in Table generally group from **left to right** when combined（except for exponentiation，which groups right to left，and comparisons，which chain left to right）.（位于同一行的表达式在组合的时候通常从左至右组合）

>x<y<z（从左往右算）True



#### 运算总结

1. 四则运算

2. 逻辑与或非，三元选择表达式
   
    - `1 or 2` vs `1 and 0` 两者判断的终止位置不同
3. 比较运算
    - `is`
    - `is not`

4. 除法运算与求余数
    - 真除法
    - Floor除法：`10//4 = 2`
    - 求余数： `10%4`

5. 类型转换
    - 整数 vs 浮点数
    - `oct()` `hex()` `bin()`

6. 内置数学函数模块

    - `abs()` `max()` 

7. 随机数

    ```
    import random
    
    random.random()
    random.randint(1, 65535)
    random.randint(1023, 65535)
    random.choice(["中国", "韩国", "美国", "家"])
    
    IP = str(random.randint(1, 255))+'.'+str(random.randint(1, 255))+'.'+str(random.randint(1, 255))+'.'+str(random.randint(1, 255))
    ```



## 四、内置类型：字符串与正则表达式

### 对象分类

| Object type    | Category         | Mutable？ |
| -------------- | ---------------- | --------- |
| Numbers（all） | Numeric - 数值   | No        |
| Strings(all)   | Sequence         | No        |
| Lists          | Sequence         | Yes       |
| Dictionaries   | Mapping - 映射   | Yes       |
| Tuples         | Sequence         | No        |
| Files          | Extension - 扩展 | N/A       |
| Sets           | Set - 集合       | Yes       |
| Frozenset      | Set              | No        |
| bytearray      | Sequence         | Yes       |

### 字符串常量与表达式

![image-20200620012634050](_resource/Python%20Basics/image-20200620012634050.png)



#### 字符串常量

- Single quotes: `'spam'`
- Double quotes: `"spam"`
- Triple quotes: """... spam..."""
- Escape sequences(转意符): "s\tp\na\0m"
- Raw strings（原始字符串）:r"c:\new\test.spm"
- Bytes literals in 3.x and 2.6+(字节字符串: ASCII字符会被自动转码)：b'sp\x01am'



#### 字符串常量与表达式汇总

1. 单双引号都一样
   
    - `'collins\''`
2. 三引号字符串
    - 可换行的连续字符串，有`\n`
    - `print(s)` 调用，保留原始换行

3. 字符串反斜杠字符

    ![image-20200620001727161](_resource/Python%20Basics/image-20200620001727161.png)

    - `\t`: 制表符
    - `\r` & `\n`
        - Unix: 每行结尾是 “<换行>”
        - Win: 每行结尾是 “<换行><回车>”
        - Mac: 每行结尾是"<回车>"
        - 三者之间需要工具转换：`dos2unix`

4. Raw 字符串抑制转移

    - Windows: `r'c:\Users\aaron\`

    - 字符串 `+` & `*` 操作：复制

    - `"a" in mystr`

        

5. 索引与切片

    ​	![image-20200620003542647](_resource/Python%20Basics/image-20200620003542647.png)

    - `s[i:j]`: 包含`i`，不含`j`
    - `s[:]`: 实现了完全顶层的序列对象拷贝，对不可变的字符串对象意义不大
    - 文件列表判断格式：str = "abcdef.txt" 后缀为：str[-3:]

6. 字符串转换工具

    - `str()` & `int()`
        - s = '42' && int(s) + 2
        - str(2) + 'years old'
    - 字符串是不可变类型，不支持原地修改：
        - Wrong: s[3] = 'A'
        - Right: s[:3] + 'A' + s[4:]

7. 字符串方法



### 字符串方法

![image-20200620003153439](_resource/Python%20Basics/image-20200620003153439.png)

- 字符串不可修改：

```
    # 替换操作
    s = "Welcome to ShenZhe"
    b = s.replaece("Baoan", "ShenZhe")
    
    # 查找
    s.find("to")


​    
​    # 大小写
​    us = s.upper()
​    ls = s.lower()
​    
​    # 剥除
​    s = "\n\twelcome to Shenzhen\n\r"
​    s.strip()
​    s.ltrip()
​    s.rtrip()
​    
    shen = list(q)
    
    # 连接
    " ".join(arraylist)
```


​    

字符串格式化表达式与方法

- String formatting expressions: `"...%s..." % (values)`字符串格式化表达式（传统技术）

    The original technique available since Python's inception，this form is based upon the C language's “printf"
    model，and sees widespread use in much existing code.

- String formatting method calls: `"...{}...".format(values)` 字符串格式化方法（新方法）

    A newer technique added in Python 2.6 and 3.0，this form is derived in part from a same-named tool in C#/.NET，and overlaps with string formatting expression functionality.



字符串格式化表达式完整语法：

`%[(keyname)][flags][width]typecode`

- Provide a key name for indexing the dictionary used on the right side of the expression
    - 放置一个字典键
- List flags that specify things like left justification(-)，numeric sign(+)，a blank before positive numbers and a-for negatives（a space），and zero fills(0)
    - 左对齐（-）右对齐（+）补零（0））
- Give a total minimum field width for the substituted text
    - 整体长度
- Set the number of digits（precision）to display after a decimal point for floatingpoint numbers
    - 小数点后的位数



```
x = 1234
res = "integers: ...%d...%-10d...%10d...%010d" % (x, x, x, x)

x = 1.2345678
k = "%-6.2f | %05.2f | %+06.1f" % (x, x, x)

print("%-10s 1\n%-10s 2\n%-10s 3")

print('%-10s 1\n%-10s 2\n%-10s 3' % ('python', 'java', 'c'))
```



字符串格式化方法格式介绍

`{fildname comonent !conversionflag :foratespec}`

- Fieldname 指定参数的一个数字或关键字，后面跟着可选的`name`或者 `[index]`成分引用。
- Conversionflag 可以是r，s，或者a分别是在该值上对repr，str或 `ascii` 内置函数的一次调用。
- Formatspec 指定了如何表示该值，包括字段宽度、对齐方式、补零、小数点精度等细节、并且以一个可选的数字类型编码
    结束。
    - `[[fill]align][sign][#][o][width][，][.precision][typecode]`
    - Align可能是<、>、= 或 ^，分别表示左对齐、右对齐、一个标记字符串后的补充或居中对齐。



```python

x = 3.1415926
"".format(x, x, x)

tmp = '{0}, {1} and {2}'.format('python', 'java', 'c/c++')
# Out: 'python, java and c/c++'

tmp = '{python}, {java} and {c/c++}'.format(python=1, java=2, c/c++=3)
# Out: '1, 2 and 3'

"{0:10}, {1:10} and {2:10}".format('python', 'java', 'c/c++')

"{0:>10}, {1:<10} and {2:10}".format('python', 'java', 'c/c++')

"{0:>10}, {1:<10} and {2:^10}".format("python", "java", "c/c++")
# Out: '     pythonjava      and      c/c++'

x = 3.1415926
'{0:f}, {1:.2f}, {2:0.6.2f}'.format(x, x, x)
# Out: '3.141593, 3.14, 003.14'


import sys

sys.platform
# Out:'win32'

"{0.platform:>10} = {1[kind]：<10}".format(sys, {'kind'})
# Out: '      win32 = laptop'
```



### 正则表达式

#### 简介

参考链接：

http://www.regexlab.com/zh/regref.htm

https://zh.wikipedia.org/wiki/正则表达式



#### 1. 转义字符

| 表达式   | 可匹配            |
| -------- | ----------------- |
| `\r, \n` | 回车和换行符      |
| `\t`     | 制表符            |
| `\\`     | 代表 ”\“ 本身     |
| `\^`     | 匹配 ^ 符号本身   |
| `\$`     | 匹配 $ 符号本身   |
| `\.`     | 匹配小数点(.)本身 |



#### 2. 多种字符

| 表达式 | 可匹配                                                       |
| ------ | ------------------------------------------------------------ |
| \d     | 任意一个数字，0～9中的任意一个                               |
| \w     | 任意一个字母或数字或下划线，也就是`A~Z，a~z，0～9, _`中任意一个 |
| \s     | 包括空格、制表符、换页符等空白字符的其中任意一个             |
| .      | 匹配除了换行符（\n）以外的任意一个字符                       |



```python
import re

re.match('cmd\.exe', 'chdaexe')

re.match('\d{1, 3}\.\d{1, 3}\.\d{1, 3}\.\d{1, 3}', ipstr)
```



#### 3. 自定义多种字符

| 表达式    | 可匹配                                 |
| --------- | -------------------------------------- |
| [ab5@]    | 匹配 “a” 或 "b“ 或 “5“ 或 “@”          |
| [^abc]    | 匹配 “a”."b"."c” 之外的任意一个字符    |
| [f-k]     | 匹配 “f“ ~ “k” 之间的任意一个字母      |
| [^A-F0-3] | 匹配 “A"~“F，“0”~"3”之外的任意一个字符 |



```python
import re

# 匹配Mac地址
re.match('[0-9a-fA-F]{2}-[0-9a-fA-F]{2}-[0-9a-fA-F]{2}-[0-9a-fA-F]{2}-[0-9a-fA-F]{2}-[0-9a-fA-F]{2}', mac_address)
```



#### 4. 匹配次数

| 表达式 | 作用                                                         |
| ------ | ------------------------------------------------------------ |
| {n}    | 表达式重复n次，比如："\w{21}” 相当于 "\W\w"；"a{5}” 相当于“aaaaa” |
| {m, n} | 表达式至少重复m次，最多重夏n次，比如：引 “ba{1,3}" 可以匹配 "ba” 或 “baa” 或 “baaa" |
| {m, }  | 表达式至少重复m次，比如："\w\d{2,}“ 可以匹配 “a12", "456", "M12344" |
| ?      | 匹配表达式0次或者1次，相当于{0, 1}，比如：“a[cd]?“ 可以匹配 “a”, "ac", "ad” |
| +      | 表达式至少出现1次，相当于 {1, }，比如：”a+b" 可以匹配 "ab"，"aab", "aaab" |
| *      | 表达式不出现或出现任意次，相当于{0, }，比如："\^*b“ 可以匹配 “b”, "^^^b" |



#### 5. 代表抽象意义

| 表达式 | 作用                                                         |
| ------ | ------------------------------------------------------------ |
| ^      | 与字符串开始的地方匹配，不匹配任何字符                       |
| $      | 与字符串结束的地方匹配，不匹配任何字符                       |
| \b     | 匹配一个单词边界，也就是单词和空格之间的位置，不匹配任何字符 |



#### 6. 表达式关系

| 表达式 | 作用                                                         |      |
| ------ | ------------------------------------------------------------ | ---- |
| \|     | 左右两边表达式之间“或“关系，匹配左边或者右边                 |      |
| ()     | 1）在被修饰匹配次数的时候，括号中的表达式可以作为整体被修饰<br>2）取匹配结果的时候，括号中的表达式匹配到的内容可以被单独得到 |      |



split/sub

```python
import re

re.split("---", "aaa---bbb---ccc")
# Out: ["aaa", "bbb", "cccc"]

re.split("---|===", "aaa---bbb===ccc")
# Out: ["aaa", "bbb", "cccc"]

re.split('[-=]', 'aaa-bbb=ccc')
# Out: ["aaa", "bbb", "cccc"]

re.sub("--", "...", "aaa--bbb--ccc")
# Out: "aaa...bbb...ccc"
```



groups()

```python
str = "python/java/c/c++"

re.match('(.*)/(.*)/(.*)/(.*)', str).groups()
# Out:('python', 'java', 'c', 'c++')

re.match('(\w+)/(\w+)/(\w+)/(.*)', str).groups()
# Out:('python', 'java', 'c', 'c++')

re.match('(\w+)/(\w+)/(\w+)/(\w+)', str).groups()
# Out:('python', 'java', 'c', 'c')

re.match('(\w{6})/(\w{4})/(\w{1})/(\w{1})', str).groups()
# Out:('python', 'java', 'c', 'c')

re.search('(?P<part1>\w{6})/(?P<part2>\w{4})/(?P<part3>\w{1})/(?P<part4>.*)', str).groups()
# Out:('python', 'java', 'c', 'c++')

re.search('(?P<part1>\w{6})/(?P<part2>\w{4})/(?P<part3>\w{1})/(?P<part4>.*)', str).group(2)
# Out: 'java'

re.search('(?P<part1>\w{6})/(?P<part2>\w{4})/(?P<part3>\w{1})/(?P<part4>.*)', str).group('part2')
# Out: 'java'

re.search('(?P<part1>\w{6})/(?P<part2>\w{4})/(?P<part3>\w{1})/(?P<part4>.*)', str).groupdict()
# Out: {'part1': 'python', 'part2': 'java', 'part3': 'c', 'part4': 'c++'}


```



re.findall

```python
import re

str = "<python><java><c><c++>"

re.findall('<([a-z | \+]+)', str)
# Out: ['python', 'java', 'c', 'c++']

re.search('<([a-z | \+]+)', str).groups()
# Out: ('python',)

```



案例: 匹配 `show interface ip brief` 的状态

```python
#!/usr/bin/python3
# -*- coding=utf-8 -*-

import re

str = "Port-channel1.189               192.168.189.254 YES CONFIG up          up"

ret = re.match('(\w.*\d)\s+(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+YES\s+CONFIG\s+(\w+)\s+(\w+)\s*', str).groups()

print(ret)

print("%-10s : %s" % ("接口", ret[0]))
print("%-10s : %s" % ("IP地址", ret[1]))
print("%-10s : %s" % ("状态", ret[2]))
```



案例：Mac 地址

```python
#!/usr/bin/python3
# -*- coding=utf-8 -*-

str = "166 54a2.74f7.0326    DYNAMIC    Gi1/0/11"

ret = re.match('(\d{1,4})\s+([0-9a-f]{4}\.[0-9a-f]{4}\.[0-9a-f]{4})\s+DYNAMIC\s+(\w.+\d)', str).groups()

print(ret)
print("%-10s : %s" % ("VLAN ID", ret[0]))
print("%-10s : %s" % ("Mac Address", ret[1]))
print("%-10s : %s" % ("接口", ret[2]))

```



案例：打印 Linux 命令

```python
#!/usr/bin/python3
#coding=utf-8

import os

data = os.open('ifconfig').read()
print(data)
```



## 五、内置类型：列表与字典

### 列表

列表属性

- 任意对象的有序集合
- 通过偏移读取
- 可变长度，异构以及任意嵌套
- 属于可变序列的分类
- 对象引用数组



常见列表常量和操作

![image-20200621152624972](_resource/Python%20Basics/image-20200621152624972.png)



![image-20200621152823066](_resource/Python%20Basics/image-20200621152823066.png)





### 字典

字典主要属性：

- 通过键而不是偏移量来读取
- 任意对象的无序集合
- 可变长，异构，任意嵌套
- 属于可变映射类型
- 对象引用表（散列表）

字典基本操作

```python
# 创建字典01
dic1 = {"python": 1, "java": 2, "c":3}

# 创建字典02
dic2 = dict(python=1, java=2, c=3)

# zip 创建字典
dic3 = dict(zip(['python', 'java', 'c'], [1, 2, 3]))
```







字典GET & Update：

GET 方法：

```python
dic = dict(python=1, java=2, c=3)

ret1 = dic.get('python')

# 设置无键值， 则默认返回88
ret2 = dic.get('java', 88)

dic2 = dict(c++='4')

dict = dic.update(dic2)
```

可原处修改

- 键值存在则原处修改，不存在就添加新键值



字典解析

```python
dic1 = {k:v for (k, v) in zip(['python', 'java', 'c'], [1, 2, 3])}

dic2 = {x: x**2 for x in [1, 2, 3, 4]}

dic3 = {x: x*4 fro x in 'python'}

dic4 = {x.upper(): x + '!\ for x in ['python', 'java', 'c']'}
```



字典注意事项：

- 序列运算无效
- 对新索引赋值会添加项
- 键不一定总是字符串（不可改变类型对象都可以）

```python
syndos = {}

syndos[('202.100.1.1', '61.128.1.1', 23)] = 100
syndos[('202.100.1.1', '61.128.1.2', 80)] = 123
syndos[('202.100.1.1', '61.128.1.3', 25)] = 168

```



案例：把防火墙状态信息表存为字典

![image-20200623112811150](_resource/Python%20Basics/image-20200623112811150.png)







## 六、内置类型：元组与文件

元组属性

- 任意对象的有序集合
- 通过偏移读取
- 属于不可变序列
- 类型固定长度，异构，任何嵌套
- 对象引用的数组



元组常量和运算

![image-20200621162159337](_resource/Python%20Basics/image-20200621162159337.png)



元组的排序

思路：

- 先转为列表，之后再转换回元组
- 直接调用 `sorted()`, 得到排序后的列表返回值， 再转换回元组

```python
T = (1, 3, 5, 6, 7, 9, 0, 2, 4, 5,)

tmp = list(T)
T_sort1 = tumple(tmp)

t = sorted(T)
T_sort2 = tuple(t) 
```



元组的解析

```python
T = (1, 2, 3, 4, 5)

L = [x+20 for x in T]

print(L)
```



元组的 index() & count()

```python
T = (1, 2, 3, 4, 2, 5)


# 获取元素下标
index_num = T.index(2) 

# 偏移量2后面出现2的位置
T.index(2, 2)

# 计算次数
T.count(2)
```



元组内部列表的修改



### 文件

常用文件运算

![image-20200621170011275](_resource/Python%20Basics/image-20200621170011275.png)

打开文件

```python
afile = open(filename, mode)
afile.method()
```

- The first argument to open，the external filename，may include a platform-specific and absolute or relative directory path prefix.Without a directory path，the file is assumed to exist in the current working directory（i.e.，where the script runs）.
    - 第一个参数为文件名，平台特殊的，绝对和相对路径都可以，如果不给目录路径，那文件就在当前工作目录

- The second argument to open，processing mode，is typically the string **'r'** to open for text input （the default），**'w'** to create and open for text output，or **'a'** to open for appending text to the end（e.g，for adding to logfiles）.The processing mode argument can specify additional options：
    - r”读，’w写，a’追加
    - Adding a b to the mode string allows for binary data（end-of-line translations and 3.X Unicode encodings are turned of）.（'b'为二进制模式）
    - Adding `a +` opens the file for both input and output（i.e.，you can both read and write to the same file object，often in conjunction with seek operations to reposition in the file）
    - “+” 为读写模式，一般与seek操作一起使用

使用文件

- 文件迭代器是最好的读取行工具
- 内容是字符串，不是对象
- Close是通常选项
- 文件是缓存的并且是可查找的



文件迭代器

```python\
for line in open("myfile.txt"):
	print(line, end="")
```



#### 使用 pickle 存储 Python 原生对象

```python
import pickle

# 创建原对象
dict = {'python': 1, 'java': 2, 'c++': 3}

fi = open('datafile.pkl', 'wb')

pickle.dump(dict, fi)
fi.close()

# 还原对象
fi = open('datafile.pkl', 'rb')
obj = pickle.load(fi)

print(obj)
```



#### 使用 struct 处理二进制

![image-20200621173946772](_resource/Python%20Basics/image-20200621173946772.png)



> 

```python
binfile = open('data.bin', 'wb')

import struct

# （高）'>'（低）: 表示网络字节序，即大端模式：高位在左边，低位在右边
# （低）'<'（高）: 表示主机字节序，即小端模式：低位在左边，高位在右边
# i: int, 四个字节：7
# 4s: 4 * 一个字节：spam
# h: short, 两个字节：8
data = struct.pack('>i4sh', 7, b'spam', 8)

binfile.write(data)

binfile.close()

########updating###########################
with open('data.bin', 'wb') as f:
    data = struct.pack('>i4sh', 7, b'spam', 8)
    f.write(data)

# 读取
binfl = open('data.bin', 'rb')
data = binfl.read()

values = struct.unpack('>i4sh', data)

########updating##########################
with open('data.bin', 'rb') as fl:
    data = fl.read()
    values = struct.unpack('>i4sh', data)
```



案例：1. 打开某一个目录下的所有文件，搜索文件中有特定关键字的文件。并且把找到的文件清单，通过pickle技术保存到一个本地文件（文件名带上日期）中。

> file_control.py

```python
import os
import pickle
from datetime import datetime

file_list = []

root = "/root"


for dirpath, dirnames, filenames in os.walk(root):
    # 目录路径，目录名，文件名
    for filepath in filenames:
        file_list.append(os.path.join(dirpath, filepath))

print(file_list)

find_file_list = []

for filename in file_list:
    file_open = open(filename, 'rb')
	for line in file_open:
        if re.match(b'.*class.*', line):
            find_file_list.append(filename)
        
print(find_file_list)

final_file_name = open('find_file_name.pkl', 'rb')

L1 = pickle.load(final_file_name)

print(L1)

```



案例：2. 使用 Struct 技术构造 TCP 头部

![image-20200621232408772](_resource/Python%20Basics/image-20200621232408772.png)

> tcp_header.py

```python
from random import randint

import struct

# 源端口
source_port = randint(1, 65535)
print(hex(source_port))

# 目的端口
dst_port = 23
print(hex(23))

# 序列号
sn = randin(1, 65535*65535)
print(hex(50))

# 应答序列号
ack_sn = 0

# 窗口大小
windows = 4096
print(hex(4096))

# 2244112： 
# 80：0101 0000
# 2 ：0000 0010
data = struct.pack('>HHIBBH', source_port, dst_port, sn, ack_sn, 80, 2, 4096)


fl = open('data.bin', 'wb')

fl.write(data)

fl.close()

```



## 七、语句和语法：赋值

#### Python 语句



 ![Python语句01](_resource/Python%20Basics/image-20200623113022314.png)



![python语句02](_resource/Python%20Basics/image-20200623113100284.png)

赋值语句

- 赋值语句建立对象引用
- 变量名在首次赋值时会被创建
- 变量名在引用前必须先赋值
- 隐式赋值（例如：导入模块，函数和类）

| Operation                    | Interpretation                                         |
| ---------------------------- | ------------------------------------------------------ |
| spam = 'Spam'                | Basic form                                             |
| spam, ham = 'yum', 'YUM’'    | Tuple assignment(positional)                           |
| [spam, ham] = ['yum', 'YUM'] | List assignment(positional)                            |
| a, b, c, d = 'spam'          | Sequence assignment, generalized                       |
| a, *b = 'spam'               | Extended sequence unpacking(Python 3.x)                |
| spam = ham = 'lunch'         | Multiple-target assignment                             |
| spams += 42                  | Augmented assignment(equivalent to spams = spams + 42) |





![image-20200623113908677](_resource/Python%20Basics/image-20200623113908677.png)



扩展序列解包

```python
seq = [1, 2, 3, 4]

a, b, c, d = seq

print(a, b, c, d)
# Out: (1, 2, 3, 4)

x, *y = "python"
# Out: x=p, y=ython

*x, y = "java"
# Out: x=jav y=a


```

多重赋值

```python
# 不可变类型
>>> a = b = c = 1
>>> a = 2
>>> a, b, c
(2, 1, 1)

>>> a = b = c ="sz"
>>> a, b, c
('sz', 'sz', 'sz')
>>> b = 2*b
>>> a, b, c
('sz', 'szsz', 'sz')

############################
# 可变类型
>>> a = b = c = []
>>> b.append(68)
>>> a, b, c
([68], [68], [68])

# copy()
>>> a = {'sz': 1}
>>> b = a.copy()
>>> c = b.copy()
>>> a, b, c
({'sz': 1}, {'sz': 1}, {'sz': 1})
>>> b = {'sz': 2}
>>> a, b, c
({'sz': 1}, {'sz': 2}, {'sz': 1})

# [:], copy()
>>> a = []
>>> b = a[:]
>>> c = b.copy()
>>> a.append(23)
>>> a, b, c
([23], [], [])
```

- 不可变对象：改一个，其他不变
- 可变对象：改一个，全部都改变了。



增强赋值：

![image-20200625154124011](_resource/Python%20Basics/image-20200625154124011.png)



变量名规则：

1， 语句：(下划线 +字母) + (任意数目的字母， 数字或下划线)

2， 区分大小写

3，禁止使用保留字：



表达式语句：

| Operation              | Interpretation                                               |
| ---------------------- | ------------------------------------------------------------ |
| spam(eggs, ham)        | Function calls                                               |
| spam.ham(eggs)         | Method calls                                                 |
| spam                   | Print vaiables in the interactive interpreter<br>在交互式模式下打印变量 |
| print(a, b, c, sep="") | Printing operations in Python 3.x                            |
| yield x ** 2           | Yielding expression statements                               |



表达式语句和 原处修改:

注意：append() , sort()为内置方法，返回值为None

```python
L = [1, 2]
L = L.append(4)
print(L)
# Out: None
```



## 八、语句和语法：打印

### Python3.0 Print函数

```python
print([object，...][, sep=''][，end='\n'][，file=sys.stdout][，flush=False])
```

- sep is a string inserted between each object's text，which defaults to a single space if not passed；passing an empty string suppresses separators altogether.（分隔符）
- end is a string added at the end of the printed text，**which defaults to a `\n` newline character if not passed. **Passing an empty string avoids dropping down to the next output line at the end of the printed text-the next print will keep adding to the end of the current output line.（结尾符）
- file specifies the file，standard stream，or other file-like object to which the text will be sent；it defaults to the sys.stdout standard output stream if not passed.Any object with a file-like write（string）method may be passed，but real files should be already opened for output.（输出到文件）

- flush，added in 3.3，**defaults to False**. It allows prints to mandate that their text be flushed through the output stream immediately to any waiting recipients.Normally，whether printed output is buffered in memory or not is determined by file；passing a true value to flush forcibly flushes the stream.（强制输出，默认是False（缓存））



seq选项

```python
x = 'python'
y = ['java']
z = ('c/c++')

print(x, y, z)
# Out: python ['java'] ('c/c++')

print(x, y, z, sep='!')
# Out: python!['java']!('c/c++')
```



end 选项

```python
x = 'python'
y = ['java']
z = ('c/c++')

print(x, y, z)
print(x, y, z)
# Out: python ['java'] ('c/c++')
# Out: python ['java'] ('c/c++')

print(x, y, z, end='!!!')
# Out: python ['java'] ('c/c++')!!!python ['java'] ('c/c++')
```



file选项

```python
print(x, y, z, sep='!!!', file=open('data.txt', 'w'))

print(x, y, z)
print(open('data.txt', 'r').read())
```



Print 的字符串工具

- `''%()` && `.format()`



stdout:

- `print()` 语句是Python的个性化特征，提供了sys.stdout对象的简单接口。

```python
import sys

sys.stdout.write('welcome to python\n')
```



自动化流重定向

```python
import sys

tmp = sys.stdout

sys.stdout = open('log.txt', 'a')

print("Here is a test txt log for sys.out.")

sys.stdout = tmp;
print('print testing on screen')
print(open('log.txt', 'r').read())
# Out: Here is a test txt log for sys.out.
```



## 九、语句和语法：`if` 语句

IF/else 语句

```python
if test1:  # if test
    statements1  # Associated block
elif test2:  # Optional elifs
    statements2
else:  # Optional else
    statements3
```



Python 语法规则：

- 语句是逐个运行的，除非你不这样编写。
    - 复合语句 = 首行+‘：’+ 缩进语句
- 语句执行时，空白行、空格以及注释通常会被忽略
    - 而文档字符串（docstring）也会被忽略，但会被保存并可调用魔法方法进行显示

```python
def square(x):
    """
    Function documentation:    
    """
    return x ** 2


print(square.__doc__)
```

通过缩进来决定块

- 块和语句的边界会自动检测

- 避免混合使用制表符和空格

```shell
#Block0###################
#Header-line##############
	#Block1###############
	#Header-line##########
		#Block2###########
	#Block1###############
#Block0###################
```



If/else 三元表达式

```
if x:
	A = Y
else:
	A = Z

# 即：
A = Y if X else Z
```



## 十、语句和语法：`while``for`循环

一般格式：

```python
while test:  # Loop test
    statements  # Loop body
else:  # Optional esle
    statements  # Run if didn't exit loop with break
```

 

Break, Continue, pass & 循环else:

```python
while test:
    statements
    if test:
        break  # Exit loop now, skip else if present
    if test:
        continue  # Go to top of loop now, to test1
else: 
    statements  # Run if we didn't hit a 'break'

```

- break（跳出循环）
    - Jumps out of the closest enclosing loop（past the entire loop statement）

- continue（强制进入下一循环，忽略后面的语句）
    - Jumps to the top of the closest enclosing loop（to the loop's header line）

- pass（什么事情都不做，会继续执行后面的语句）
    - Does nothing at all
    - it's an empty statement placeholder 

- Loop else block（如果循环没有遇到了Break，正常退出，就执行else语句）
    - Runs if and only if the loop is exited normally（i.e，without hitting a break）

- 无限循环：

```python
while True:  # Type Ctrl-c to stop me!
    pass
```



For 循环一般格式：

```python
for target in object:  # Asssign objcet items to target
    statements
    if test:  
        break  # Exit loop now, skip else
    if test:
        continue  # Go to top of loop now
else:
    # 没有遇到 break 正常退出，才能执行else语句
    statement  # If we didn't a 'break'
```



```python
d = {'python': 1, 'java' : 2, 'c/c++': 3}

for key in d.keys():
    print(key)

for value in d.values():
    print(value)

for key, value in d.items()：
	print(key)
    print(value)
    
for x in range(5, -5, 2):
    print(x, end=' ')
```



练习

```python
# 找出 items & tests 中两个清单中相同的内容
items = ['aaa', 111, (4, 5), 2.01]
tests = ['bbb', 333, 111, 3.14, (4, 5)]

result = []

for value in items.values():
    if value in tests:
        result.append(value)

print(result)
```



## 十一、Python函数

### What

一个函数就是将一些语句集合在一起的部件，他们能够不止一次地在程序中运行。函数还能够计算出一个返回值，并能够改变作为函数输入的参数，而这些参数在代码运行时也许每次都不相同。以函数的形式去编写一个操作可以使它成为一个够广泛应用的工具，让我们在不同的情况下能够使用它。

- 最大化的代码重用和最小化的代码冗余
- 流程的分解



### 函数相关的语句和表达式

![image-20200625191150025](_resource/Python%20Basics/image-20200625191150025.png)



`def` 语句格式：

```python
def name(arg1, args2, ...args):
    ...
    return None
```

案例：

```python
def times(x, y):
    return x * y
```

- Python多态：参数传入时不进行类型检查
- 因此，此函数支持所有能够 `*` 操作的对象
- `*` 针对正在被处理的对象进行随机应变

```python
def intersect(seq1, seq2):
    ret = []
    for x in seq1:
        if x in seq2:
            ret.append(x)
    return ret

# o1
s1 = 'SPAM'
s2 = 'SCAM'
intersect(s1, s2)
# Out: ['S', 'A', 'M']

# o2
i1 = (1, 2, 3, 4)
i2 = (4, 5, 6, 7)
intersect(i1, i2)
# Out: [4]
```



作用域

- `global A`



1. global
    - 全局变量位于模块文件内部的顶层的变量名
    - 全局变量如果是在函数内被赋值的话，必须经过声明
    - 全局变量名在函数的内部不经过声明也可以被引用



 传递参数

- 参数的传递通过自动将**对象赋值给本地变量名**来实现
- 函数内部的参数名的赋值不会影响调用者
- 改变函数的可变对象参数的值也许会对调用者有影响
    - 不可变参数通过**值**进行传递
    - 可变对象的通过**指针**进行传递



函数参数匹配表

![image-20200625191320379](_resource/Python%20Basics/image-20200625191320379.png)

| Syntax | Location | Interpretation |
| ------ | -------- | -------------- |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |
|        |          |                |



```python

# 定义默认参数
def func(a, b=2, c=3):
    pass

# 定义不定参数
# *args: 元组的方式
# **kwargs: 使用映射关系的字典方式
def func(*args, **kwargs):
    pass

# 传递参数
l = [1, 2, 3]
func(*l)

d = {'a': 1, 'b': 2, 'c': 3}
f(**d)


```



## 十二、Python模块

### why

- 代码重用
- 系统命名空间的划分
    - 精确导入才能看到另外一个文件中的变量名
- 实现共享服务和数据



### 模块搜索路径

1. 程序本地目录

2. PYTHONPATH（环境变量）目录

    - Liunux 默认没有环境变量目录

        ```python
        # 设置环境变量
        export PYTHONPATH=/root
        
        # 查看环境变量
        env
        ```

3. 标准链接库目录

    ```python
    import sys
    
    # 罗列所有变量目录
    sys.path
    ```

4. 位于以上三个路径中的任何.pth文件的内容

    > file.pth

    ```python
    /root/lib
    /xxx/xxxx
    ```

    

    >  注意：先搜索目录中的文件，将覆盖路径上其他目录中具有相同名字的模块



创建模块

- 任何以  `.py` 为后缀名的文件均被自动认为Python 模块

- 在模块顶层指定的所有变量名都会变成其属性(与模块对象结合的变量名), 并可以导出到供客户端使用



导入模块: 导入函数，变量

- import module1
- from module_name import method
    - from module_name import *
- from path1.path2.module_name import func/



模块 reload

```python
from imp import reload

reload(module_name)
```



`if __name__ == '__main__'`

模块是对象，并且所有的模块都有一个内置属性`__name__`。一个模块的`__name_`属性取决于您如何应用模块。

- 若import一个模块，那么模块`__name__`的属性值通常为模块文件名，不带路径或者文件扩展名。
- 若直接运行模块，`__name__`的属性值将是一个特别缺省 `__main__`。



## 十三、Python类

程序的两种设计思路：

1. 面向过程 - 战术型，自动化脚本： 做事
2. 面向对象 - 战略型，程序： 做东西



面向对象优势

程序就是“用一些东西来做事”！简而言之，类就是一种定义新种类的方法。OOP被证明在两个方面上很有用处。

1. 继承
2. 组合



类的独到之处

1. 通过继承进行定制
    - 类支持OOP的继承，可以在类的外部重新定义其属性从而扩展这个类
2. 多重实例
    - 类基本上就是生产对象的工厂，每次调用一个类，就会产生一个有独立命名空间的新对象。
    - 每一个由类产生的对象都能读取类的属性，并获得自己的命名空间来存储数据，这些数据对于每一个对象来说都不同
3. 运算符重载
    - 通过提供特定的协议方法，类可以定义对象来响应在内置类型上的几种运算。例如，通过类创建的对象可以进行切分，级联和索引等运算
      

案例：开发工资系统

> employee.py

```python
class Employee:
    def __init__(slef, name, depart, money):
        self.name = name
        self.dpart = depart
        self.money = money
        
    def raise_money(self, add_money):
        self.money += (int)add_money

    def raise_money_plus(self, percent)
		self.money *= 1+percent
    def __str__(self):
        return "name: %s, money: %s" % (self.name, self.money)
    
    def details(self):
        attr = []
        attr.append("职务： %s" % self.__class__.__name___)
        
        for x in sorted(self.__dict__.keys()):
			attr.append("%s = %s" % (x, getattr(self, x)))
            
        attr_str = ','.join(attr)
        print(attr_str)

        
if __name__ == "__main__":
    bob = employee('bob', 'sec', 1000)
    bob.raise_money(100)
    bob.raise_money_plus()

```



## 十四、Python多线程与多进程

线程与进程：

- 包含关系：
    - 线程是进程内的一个执行单元，也是进程内的可调度实体。
    - 线程是处理器调度的基本单位，每个进程至少有一个线程；
- 地址空间：
    - 进程有自己独立的地址空间
    - 线程是进程内的一个执行单元；它们共享进程的地址空间
- 资源分配：
    - 进程是资源分配和拥有的单位
    - 同一个进程内的线程共享进程的资源。
- 二者均可并发执行。

1. 一个程序至少有一个进程，一个进程至少有一个线程.
2. 线程的划分尺度小于进程，使得多线程程序的并发性高。
3. 另外，进程在执行过程中拥有独立的内存单元，而多个线程共享内存，从而极大地提高了程序的运行效率。
    - 减少了上下文的切换



一个比较有趣的介绍：
http://www.ruanyifeng.com/blog/2013/04/processes_and_threads.html



案例：

> multiprocessingTest.py

```python
# coding=utf-8
import time


def abk_multi(x, y, z):

	i = 1
	while i < 10:
		sum = x * y * z

		x += 1
		y += 1
		z += 1

		i += 1

		time.sleep(10)

	return None


if __name__ == '__main__':
	abk_multi(x, y, z)
```



> multiprocessingDemo.py

```python
# coding=utf-8
from multiprocessingTest import abk_multi
import multiprocessing
import time
import os


def main():
	"""
	
	"""

	processes = {}
	exit_code = {}

	x = 1
	y = 2
	z = 3

	for i in range(1, 11):
		multi_test = multiprocessing.Process(target=abk_multi, args=(x, y, z))
		multi_test.start()

		processes[(x, y, z)] = multi_test
		# 初始值
		exit_code[(x, y, z)] = 66

		time.sleep(1)

		x += 1
		y += 1
		z += 1

	print(processes)

	while True:
		ALLDONE = 0
		time.sleep(1)

		os.system("clear")

		print("=" * 50)
		
		for key, value in processes.items():
			if value.exitcode == 0:
				exit_code[key] = 0
				print("%-20s 计算结束" % str(key))
			else:
				print("%-20s 还在计算中..." % str(key))

		for val in exit_code.values():
			ALLDONE += val

		if ALLDONE == 0:
			os.system("clear")
			print("全部计算结束！！！")
			break


if __name__ == '__main__':
	main()
```



## 十五、Python异常处理

### try/except/else 语句

```python
try:
    statements  # Run this main action first
except name1:
    statements  # Run if name1 is raised during try block
except (name2, name3):
    statements  # Run if any of these exception occur
except name4 as var:
    statements  # Run if name4 is raised, assign instance raised to var
except:
    statements  # Run for all other exceptions raised
else:
    statements  # Run if no exception was raised during try block
```



try 语句分局形式


|Clause from|Interpretation|
|---|---|
|except|Catch all (or all other) exception types|
|except name|Catch a specific exception only|
|except name as value|Catch the listed exception and assign its instance|
|except (name1, name2)|Catch any of the listed exceptions|
|except (name1, name2) as value|Catch any listed excepotion and assign its instance|
|else|Run if no exception are raised in the try block<br>如果没有任何异常被触发，那么就执行else语句|
|finally|Always perform this block on exit<br>不论任何情况，总是执行finally语句|



案例：

```python
#!/usr/bin/python3
# coding=utf-8

import re


def find_index(obj, index):
    print(obj[index])
    
if __name__ == "__main__":
    try:
    	find_index([1,2, 3, 5, 6, 7, 9], 5)
    exception as e:
        print(e)
        if re.match(".* 'int' object is not subscriptable", str(e)):
       		print("整数对象不支持索引")
        if re.match(".* string indices must be integers", str(e)):
            print("索引必须是整数对象")
    else:
        print("没有任何错误～")
    finally:
        print("总会执行～")
```



`except` vs `except Exception:`

- `except:` 包含一些系统错误，包括 `Ctrl + c` 都可以直接捕获而不提示错误。
- `except Exception:` 推荐使用，且此时捕获的为除系统错误之外的程序异常。

