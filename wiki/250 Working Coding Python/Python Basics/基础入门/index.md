# Python Basics - 基础入门

##  注释及代码规范

### 注释
- `#`
- `“”“xxx"""`

### 代码规范：PEP8

- 



##  算数运算符简介

- `+`, `-`, `*`,  `/`, `//`, `%`
- str * 50



##  变量的使用

### 变量定义

- 初始化赋值

### 变量的类型

- 数字型

	- bool

		- True
		- False

	- int
	- float
	- complex

- 非数字型

	- 字符串str
	- 列表
	- 元组
	- 字典

- type(name)

	- int(x)
	- float(x)
	- str(x)
	- list()
	- tuple()

### 变量的输入

- str = input()
- print(str)

### 变量的输出

- print("..." % x)

	- %s
	- %d
	- %f
	- %%

- print({}).format(x)
- print(f'... {x}...')
- print(, end="\t")

### 转义字符

- \t
- \n
- \\
- \'
- \"
- \r



### 变量的命名

- 命名规则

	- 字母/下划线/数字组成
	- 不能以数字开头
	- 不能与关键字重名
	- 区分大小写

- 标识符

	- 模块名称

- 关键字
- PEP8

	- 蛇形命名法

		- 变量名
		- 函数名
		- 模块名

	- 大驼峰命名法

		- 类名



## 判断语句

- if ... else
- if ...elif ... else
- 逻辑运算

	- and
	- or
	- not

- 随机数处理

  ```python
  import random
  
  random.randint(12, 20)
  ```



## 运算符

### 算数运算符

- `+`
- `-`
- `*`
- `/`
- `//`
- `%`
- `**`

### 比较运算符

- `==`
- `！=`
- `>`
- `<`
- `>=`
- `<=`

### 逻辑运算符

- `and `
- `not`
- `or`

### 赋值运算符

- `=`
- `+=`
- `-=`
- `*=`
- `/=`
- `//=`
- `%=`
- `**=`

### 运算符优先级



## 循环

- while

	- while True
	- 9 *9 乘法表

- break
- continue



## 函数基础

- 函数定义

	- 定义在前，使用在后

- 函数文档注释

	- `Ctrl + Q`

- 函数的参数

	- 值传递

		- 不可变对象

	- 引用传递

		- 可变对象

- 函数的返回值

	- 存在时，必须接收返回值

- 使用模块中的函数



## 高级变量类型

### 非数字型变量特性

- 都是序列 sequence，也可以理解为 容器
- 取值 []
- 遍历 for in
- 计算长度、最大/最小值、比较、删除
- 链接 + 和 重复 *
- 切片



### 列表 List

定义

- list = []

操作

- 增加

	- 列表.insert(索引, 数据) 在指定位置插入数据
	- 列表.append(数据)	在末尾追加数据
	- 列表.extend(列表2)	将列表2 的数据追加到列表

- 修改

	- 列表[索引] = 数据 修改指定索引的数据

- 删除

	- del 列表[索引]	删除指定索引的数据

		- 本质上是将一个变量从内存中删除， 后续代码将无法再使用这个变量

	- 列表.remove[数据] 删除第一个出现的指定数据
	- 列表.pop	删除末尾数据
	- 列表.pop(索引) 删除指定索引数据
	- 列表.clear 清空列表

- 统计

	- len(列表)	列表长度
	- 列表.count(数据) 数据在列表中出现的次数

- 排序

	- 列表.sort() 升序排序
	- 列表.sort(reverse=True)	降序排序
	- 列表.reverse()	逆序、反转



### 元组 Tuple

定义

- tuple = ()

操作

- tuple[index]
- tuple.index(data)

	- 获取第一次出现的索引

- len(tuple)
- tuple.count(data)



### 字典 Dict

定义

- dict = {}

操作

- 字符串

  - 定义
  - 操作
  - 切片

  	- 字符串[开始索引:结束索引:步长]

  		- 左闭右开

- 公共方法

  - len(item) 计算容器中元素个数	
  - del(item) 删除变量	del 有两种方式
  - max(item) 返回容器中元素最大值	如果是字典，只针对 key 比较
  - min(item)	返回容器中元素最小值	如果是字典，只针对 key 比较
  - cmp(item1, item2)	比较两个值，-1 小于/0 相等/1 大于	Python 3.x 取消了 cmp 函数

- 切片

  - 字符串，列表，元组

- 运算符

  - `+`

  	- 合并

  - `*`

  	- 重复

  - `>` `>>` `>=` `==` `<` `<=`

  	- 元素比较

  - `in`

  	- 是否存在

  - `not in`

  	- 是否不存在

- `for ... in ... else`

```
for 变量 in 集合:

    循环体代码
else:
    没有通过 break 退出循环，循环结束后，会执行的代码
```



## 函数进阶

- 多返回值

	- 元组

- 函数参数

	- 函数参数内部被重新赋值

		- 都不会

	- 函数内部使用方法修改了数据内容

		- 会

	- +=

		- 列表变量调用 += 本质上是在执行列表变量的 extend 方法，不会修改变量的引用

	- 缺省参数

		- 带有默认值的缺省参数在参数列表末尾
		-  多个缺省参数，需要指定参数名

	- 多值参数

		- *args
		- **kwargs
		- 元组和字典的拆包

- 函数递归

	- 实现：栈实现
	- 递归的出口



## 变量进阶

- 引用概念

	- 变量中记录数据的地址

- 函数参数和返回值的传递

	- 函数的 实参/返回值 都是是靠 引用 来传递来的

- 可变和不可变类型

	- 不可变类型

		- 数字类型 int, bool, float, comple
		- 字符串 str
		- 元组 tuple

	- 可变类型

		- 列表 list
		- 字典 dict

	- 字典的 key 只能使用不可变类型的数据

- 哈希 (hash)

	- int = hash(x)

		- 接收一个 不可变类型 的数据作为 参数
		- 返回 结果是一个 整数

- 局部变量和全局变量

	- 生命周期
	- 全局变量

		- 修改： global
		- 命名

- 代码结构

	- shebang
	- import module
	- 全局变量
	- 函数定义
	- 执行代码



## Python编码转换

#### bytes = str.encode()

- str->bytes:encode编码
- https://docs.python.org/3/library/stdtypes.html?highlight=decode#str.encode

#### str = bytes.decode()

- bytes->str:decode解码
- https://docs.python.org/3/library/stdtypes.html?highlight=decode#bytes.decode



