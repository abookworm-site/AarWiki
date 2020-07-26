# Python Basics - 进阶提升

## GIL：全局解释器锁
定义
- GIL - 全局解释器锁：保证同一时刻只有一个线程在工作。
- Cpython解释器由于历史原因所造成的，与python本身语言没有什么关系
- 表现：使用Cpython解释器解释的python语句，即使采用多线程的方式，在同一个时刻也只有一个线程在工作。



多线程还是要比单线程要快：

- 有IO密集型操作的：读写
- 遇到堵塞，则执行非堵塞的任务

- 同时，多进程可以充分利用多核CPU资源。



Python:

- 计算密集型：进程
- IO密集型：多线程，协程

解决方案：
- 不用CPython 解释器。
- 使用C语言编写子线程

```py
from ctypes import *
from threading import Thread

# 加载动态库
lib = cdll.LoadLibrary("./libdead_loop.so")

# 创建一个子线程，让其执行C语言编写的函数，此函数是一个死循环
t = Thread(target=lib.DeadLoop)
t.start()

# 主线程
while True:
	pass
```



## 深拷贝与浅拷贝

### `copy.copy():`
浅拷贝：只会复制最顶层的那个列表。

- 对于元组，不会复制
- 分片`c[:]`
- 字典拷贝
- 形参传递



### `copy.deepcopy():`
深拷贝：

1. 如果 `copy(),deepcopy()` 对一个全部结果都是不可变类型的数据进行拷贝，那么他们结果相同，都是指向引用

2. 如果 `copy(),deepcopy()` 对一个拥有可变类型的数据进行拷贝，那么deepcopy()依然是深拷贝，而copy()是指向

关键：明白自己的需求，从而判断自己采用深拷贝还是浅拷贝。



## 私有化

- `xx`：公有变量
- `_x`：单前置下划线。私有化属性或方法。
    - `from somemodule import *` 禁止导入
    - 类对象和子类可以访问
- `__xx`：双前置下划线。避免与子类中的属性命名冲突，无法在外部直接访问(原理：名字重整所以访问不到)
- `__xx__`：双前后下划线。用户名字空间的魔法对象或属性。
    - 例如:`__init__ `, `__`。请不要自己发明这样的名字
- `xx_`：单后置下划线,用于避免与Python关键词的冲突



## import 导入模块

### `import` 搜索路径

```python
import sys

# 解释器搜索路径
search_path = sys.path

# 添加新路径
sys.path.append('/home/aaron/xxx')
sys.path.insert(0, '/home/aaron/xxx')
```

- 通常都是从当前路径开始搜索，所以一定要注意模块名称



### 重新导入模块`reload`



### 多模块开发注意事项

多模块导入，且共同使用某一模块的数据时，一定要确保模块导入时指向了这个模块的值，而非新增加的局部变量或者全局变量。
即：使用`import model`整体导入，使用 `model.prams`使用这个共享变量。



## 多继承及MRO顺序

多继承时，使用`super().__init__`:
******多继承使用super().__init__ 发生的状态******
(<class '__main__.Grandson'>, <class '__main__.Son1'>, <class '__main__.Son2'>, <class '__main__.Parent'>, <class 'object'>)

```py
print("******多继承使用super().__init__ 发生的状态******")
class Parent(object):
    def __init__(self, name, *args, **kwargs):  # 为避免多继承报错，使用不定长参数，接受参数
        print('parent的init开始被调用')
        self.name = name
        print('parent的init结束被调用')

class Son1(Parent):
    def __init__(self, name, age, *args, **kwargs):  # 为避免多继承报错，使用不定长参数，接受参数
        print('Son1的init开始被调用')
        self.age = age
        super().__init__(name, *args, **kwargs)  # 为避免多继承报错，使用不定长参数，接受参数
        print('Son1的init结束被调用')

class Son2(Parent):
    def __init__(self, name, gender, *args, **kwargs):  # 为避免多继承报错，使用不定长参数，接受参数
        print('Son2的init开始被调用')
        self.gender = gender
        super().__init__(name, *args, **kwargs)  # 为避免多继承报错，使用不定长参数，接受参数
        print('Son2的init结束被调用')

class Grandson(Son1, Son2):
    def __init__(self, name, age, gender):
        print('Grandson的init开始被调用')
        # 多继承时，相对于使用类名.__init__方法，要把每个父类全部写一遍
        # 而super只用一句话，执行了全部父类的方法，这也是为何多继承需要全部传参的一个原因
        # super(Grandson, self).__init__(name, age, gender)
        super().__init__(name, age, gender)
        print('Grandson的init结束被调用')

print(Grandson.__mro__)

gs = Grandson('grandson', 12, '男')
print('姓名：', gs.name)
print('年龄：', gs.age)
print('性别：', gs.gender)
print("******多继承使用super().__init__ 发生的状态******\n\n")
```



## 静态方法 & 类方法

类方法：实例对象通过类方法修改类对象，传递的 `cls` 指向类对象。
静态方法：不同类对象之间特有的不同的属性。

```py
class Foo(object):
    def __init__(self, name):
        self.name = name

    def ord_func(self):
        """ 定义实例方法，至少有一个self参数 """
        # print(self.name)
        print('实例方法')

	# 实例对象通过类方法，修改类对象。传递 cls 指向类对象。
    @classmethod
    def class_func(cls):
        """ 定义类方法，至少有一个cls参数 """
        print('类方法')

	# 与实例对象，类对象都无关的方法，同时又有不同对象之间的区别
	# 不用传递默认参数
    @staticmethod
    def static_func():
        """ 定义静态方法 ，无默认参数"""
        print('静态方法')



f = Foo("中国")
# 调用实例方法
f.ord_func()

# 调用类方法
Foo.class_func()

# 调用静态方法
Foo.static_func()
```



## property属性

```py

class Money(object):
    def __init__(self):
        self.__money = 0

    # 使用装饰器对money进行装饰，那么会自动添加一个叫money的属性，当调用获取money的值时，调用装饰的方法
    @property
    def money(self):
        return self.__money

    # 使用装饰器对money进行装饰，当对money设置值时，调用装饰的方法
    @money.setter
    def money(self, value):
        if isinstance(value, int):
            self.__money = value
        else:
            print("error:不是整型数字")

a = Money()
a.money = 100
print(a.money)
```



## 魔法属性

`__doc__`


`__module__` 和 `__class__`

__module__ 表示当前操作的对象在那个模块
__class__ 表示当前操作的对象的类是什么





## 闭包





## 装饰器



## 元类

### 1. 类也是对象

只要你使用关键字`class`，Python解释器在执行的时候就会创建一个名为类名的对象。同时具有对象的一切操作：

- 可以赋值给一个变量
- 可以拷贝
- 可以增加属性
- 可以作为函数参数传递
- 可以打印



### 2. 动态地创建类

- 当你使用class关键字时，Python解释器自动创建这个对象。任何时候，任何地点。



### 3. 使用 `type` 创建类

`type` 动态创建类：

- `type`可以接受一个类的描述作为参数，然后返回一个类。



语法：

```python
type(类名, 由父类名称组成的元组（针对继承的情况，可以为空），包含属性的字典（名称和值）)

# 示例：
Test2 = type("Test2", (), {}) # 定了一个Test2类
```



### 4. 使用 `type` 创建带有属性的类

type 接受一个字典来为类定义属性

```python
Foo = type('Foo', (), {'bar': True})
```

- 添加的属性是类属性，并不是实例属性



子类继承

```python
FooChild = type('FooChild', (Foo,), {})
```

- type的第2个参数，元组中是父类的名字，而不是字符串



### 5. 使用 `type` 创建带有方法的类

```python
class A(object):
    num = 100

def print_b(self):
    print(self.num)

@staticmethod
def print_static():
    print("----haha-----")

@classmethod
def print_class(cls):
    print(cls.num)

B = type("B", (A,), {"print_b": print_b, "print_static": print_static, "print_class": print_class})
```



### 6. 元类

- 创建类的类

- 函数`type()`实际上是一个元类。type就是Python在背后用来创建所有类的元类。

- type就是Python的内建元类



### 7. `__metaclass__` 属性

作用时机

当创建新类的时候，`__metaclass__` 属性

```python
class Foo(Bar):
    pass
```

1. 查找 `Foo` 中是否有 `__metaclass__` 属性，有则通过该属性创建对象类 `Foo`
2. 没有，则查找父类 `Bar` 中 是否有`__metaclass__` 属性，有则通过该属性创建对象类 `Foo`
3. 没有，则查找在模块层次上是否有`__metaclass__` 属性，有则通过该属性创建对象类 `Foo`
4. 如果还是没有，那么，Python就会调用内置的 type() 来创建对象类 `Foo`



- 定义类的时候为其添加 `__metaclass__` 属性

    

### 8. 自定义元类

元类主要目的

- 为了 **当创建类时能够自动地改变类。**



元类作用：

1. 拦截类的创建
2. 修改类
3. 返回修改之后的类



```python
#coding=utf-8

class UpperAttrMetaClass(type):
    # __new__ 是在__init__之前被调用的特殊方法
    # __new__是用来创建对象并返回之的方法
    # 而__init__只是用来将传入的参数初始化给对象
    # 你很少用到__new__，除非你希望能够控制对象的创建
    # 这里，创建的对象是类，我们希望能够自定义它，所以我们这里改写__new__
    # 如果你希望的话，你也可以在__init__中做些事情
    # 还有一些高级的用法会涉及到改写__call__特殊方法，但是我们这里不用
    def __new__(cls, class_name, class_parents, class_attr):
        # 遍历属性字典，把不是__开头的属性名字变为大写
        new_attr = {}
        for name, value in class_attr.items():
            if not name.startswith("__"):
                new_attr[name.upper()] = value

        # 方法1：通过'type'来做类对象的创建
        return type(class_name, class_parents, new_attr)

        # 方法2：复用type.__new__方法
        # 这就是基本的OOP编程，没什么魔法
        # return type.__new__(cls, class_name, class_parents, new_attr)

# python3的用法
class Foo(object, metaclass=UpperAttrMetaClass):
    bar = 'bip'

# python2的用法
# class Foo(object):
#     __metaclass__ = UpperAttrMetaClass
#     bar = 'bip'


print(hasattr(Foo, 'bar'))
# 输出: False
print(hasattr(Foo, 'BAR'))
# 输出:True

f = Foo()
print(f.BAR)
# 输出:'bip'
```



### 9. 元类应用

#### 9.1. 实现ORM

- [Database Interaction 数据库交互](https://wiki.abookworm.site/Database Interaction/)


