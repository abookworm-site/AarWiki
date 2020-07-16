# Python Basics - 进阶提升

## GIL：全局解释器锁
一、定义：
- GIL - 全局解释器锁：保证同一时刻只有一个线程在工作。
- 是Cpython解释器由于历史原因所造成的，与python本身语言没有什么关系
- 表现：使用Cpython解释器解释的python语句，即使采用多线程的方式，在同一个时刻也只有一个线程在工作。

多线程还是要比单线程要快：
- 有IO密集型操作的：读写
- 遇到堵塞，则执行非堵塞的任务

多进程可以充分利用多核CPU资源。

Python:
- 计算密集型：进程
- IO密集型：多线程，协程

解决方案：
- 不用CPython 解释器。
- 使用c语言编写子线程

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


copy.copy():
浅拷贝：只会复制最顶层的那个列表。
- 对于元组，不会复制
- c[:]
- 字典拷贝
- 形参传递


copy.deepcopy():
深拷贝：
1. 如果copy(),deepcopy()对一个全部结果都是不可变类型的数据进行拷贝，那么他们结果相同，都是指向引用

2. 如果copy(),deepcopy()对一个拥有可变类型的数据进行拷贝，那么deepcopy()依然是深拷贝，而copy()是指向

关键：明白自己的需求，从而判断自己采用深拷贝还是浅拷贝。



## 私有化

- `xx`: 公有变量
- `_x`: 单前置下划线,私有化属性或方法，`from somemodule import *` 禁止导入,类对象和子类可以访问
- `__xx`：双前置下划线,避免与子类中的属性命名冲突，无法在外部直接访问(名字重整所以访问不到)
- `__xx__`:双前后下划线,用户名字空间的魔法对象或属性。例如:__init__ , __ 不要自己发明这样的名字
- `xx_`:单后置下划线,用于避免与Python关键词的冲突



## import 导入模块

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







