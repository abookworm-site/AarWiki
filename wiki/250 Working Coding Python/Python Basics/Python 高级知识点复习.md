# Python Basics 多线程

## 线程

1. 在一个进程内的所有线程共享全局变量，很方便在多个线程间共享数据
2. 缺点: 线程是对全局变量随意遂改可能造成多线程之间对全局变量的混乱（即线程非安全）
3. 如果多个线程同时对同一个全局变量操作，会出现资源竞争问题，从而数据结果会不正确

threading模块定义Thread类
```
tk = threading.Thread(target=sayHello, args=(mutex, 10000, )
tk.start()
```

获取线程数量：
```py
length = len(threading.enumerate())
```


## 线程执行代码的封装

```py
#coding=utf-8

import threading
import time

class MyThread(threading.Thread):
	def run(self):
		for i in range(3):
			time.sleep(1)
			msg = "I am" + self.name + " @ " + str(i)
			print(msg)
			

if __name__ == "__main__":
	tk = MyThread()
	# 线程开始执行，调用run()
	tk.start()
```



## 互斥锁

threading模块中定义了Lock类，可以方便的处理锁定：
```py
# 创建锁
mutex = threading.Lock()

# 锁定
mutex.acquire()

# 释放
mutex.release()
```



# 进程


进程pid
```py
pid = os.getpid()
```


Process([group [, target [, name [, args [, kwargs]]]]])

- `target`：如果传递了函数的引用，可以任务这个子进程就执行这里的代码
- `args`：给target指定的函数传递的参数，以元组的方式传递
- `kwargs`：给target指定的函数传递命名参数
- `name`：给进程设定一个名字，可以不设定
- `group`：指定进程组，大多数情况下用不到

Process创建的实例对象的常用方法：

- `start()`：启动子进程实例（创建子进程）
- `is_alive()`：判断进程子进程是否还在活着
- `join([timeout])`：是否等待子进程执行结束，或等待多少秒
- `terminate()`：不管任务是否完成，立即终止子进程

Process创建的实例对象的常用属性：

- `name`：当前进程的别名，默认为Process-N，N为从1开始递增的整数
- `pid`：当前进程的pid（进程号）


## 进程通讯

Method:
```py
import multiprocessing

q = multiprocessing.Queue()
```

- Queue.qsize()：返回当前队列包含的消息数量；
- Queue.empty()：如果队列为空，返回True，反之False ；
- Queue.full()：如果队列满了，返回True,反之False；
- Queue.get([block[, timeout]])：获取队列中的一条消息，然后将其从列队中移除，block默认值为True；
	1. 如果block使用默认值，且没有设置timeout（单位秒），消息列队如果为空，此时程序将被阻塞（停在读取状态），直到从消息列队读到消息为止，如果设置了timeout，则会等待timeout秒，若还没读取到任何消息，则抛出"Queue.Empty"异常；
	2. 如果block值为False，消息列队如果为空，则会立刻抛出"Queue.Empty"异常；

- Queue.get_nowait()：相当Queue.get(False)；

- Queue.put(item,[block[, timeout]])：将item消息写入队列，block默认值为True；

	1. 如果block使用默认值，且没有设置timeout（单位秒），消息列队如果已经没有空间可写入，此时程序将被阻塞（停在写入状态），直到从消息列队腾出空间为止，如果设置了timeout，则会等待timeout秒，若还没空间，则抛出"Queue.Full"异常；
	
	2. 如果block值为False，消息列队如果没有空间可写入，则会立刻抛出"Queue.Full"异常；

- Queue.put_nowait(item)：相当Queue.put(item, False)；



## 进程池Pool
```py
# coding=utf-8
import multiprocessing, os, time, random


def worker(msg):
	"""
	子进程执行动作
	:return: None	
	"""
	
	t_start = time.time()
	
	print("%s 开始执行，进程号为：%d" % (msg, os.getpid()))
	
	time.sleep(random.random() * 2)
	
	t_stop = time.time()
	
	print(msg, "执行完毕，耗时 %0.2f" % (t_stop - t_start))
	
	return None


if __name__ == "__main__":
	
	po = multiprocessing.Pool()
	
	for i in range(0, 10):
		
		po.apply_async(worker, (i, ))
		
	print("------start------")
	
	# 关闭进程池，关闭后po不再接受新的请求
	po.close()

	# 等待所有进程执行完成，必须放在 close 语句中	
	po.join()
	
	print("------end------")
	
```

multiprocessing.Pool常用函数解析：

apply_async(func[, args[, kwds]]) ：使用非阻塞方式调用func（并行执行，堵塞方式必须等待上一个进程退出才能执行下一个进程），args为传递给func的参数列表，kwds为传递给func的关键字参数列表；
close()：关闭Pool，使其不再接受新的任务；
terminate()：不管任务是否完成，立即终止；
join()：主进程阻塞，等待子进程的退出， 必须在close或terminate之后使用；




```py
# -*- coding:utf-8 -*-

# 修改import中的Queue为Manager
from multiprocessing import Manager,Pool
import os,time,random

def reader(q):
    print("reader启动(%s),父进程为(%s)" % (os.getpid(), os.getppid()))
    for i in range(q.qsize()):
        print("reader从Queue获取到消息：%s" % q.get(True))

def writer(q):
    print("writer启动(%s),父进程为(%s)" % (os.getpid(), os.getppid()))
    for i in "itcast":
        q.put(i)

if __name__=="__main__":
    print("(%s) start" % os.getpid())
    q = Manager().Queue()  # 使用Manager中的Queue
    po = Pool()
    po.apply_async(writer, (q,))

    time.sleep(1)  # 先让上面的任务向Queue存入数据，然后再让下面的任务开始从中取数据

    po.apply_async(reader, (q,))
    po.close()
    po.join()
    print("(%s) End" % os.getpid())

```

# 协程



## 迭代器


1. 如何判断对象是否可迭代？
```py
from collections import Iterable

isinstance([], Iterable)
isinstance({}, Iterable)
isinstance("abc", Iterable)
isinstance(mylist, Iterable)
isinstance(100, Iterable)
```
2. 可迭代对象的本质

	- 提过一个迭代器帮助对齐进行迭代遍历
	- 可迭代对象通过 `__iter__()` 提过迭代器：我们在迭代一个可迭代对象时，实际为：先获取该对象提过的迭代器，然后通过迭代器依次获取对象的每一个数据
	- 即：具备 `__iter__()` 的对象就是一个可迭代对象




3. iter() & next()

- list、tuple等都是可迭代对象，我们可以通过iter()函数获取这些可迭代对象的迭代器。然后我们可以对获取到的迭代器不断使用next()函数来获取下一条数据。

- iter()函数实际上就是调用了可迭代对象的__iter__方法。


4. 迭代器Iterator

一个实现了__iter__方法和__next__方法的对象，就是迭代器。
```py
class MyList(object):
    """自定义的一个可迭代对象"""
    def __init__(self):
        self.items = []

    def add(self, val):
        self.items.append(val)

    def __iter__(self):
        myiterator = MyIterator(self)
        return myiterator


class MyIterator(object):
    """自定义的供上面可迭代对象使用的一个迭代器"""
    def __init__(self, mylist):
        self.mylist = mylist
        # current用来记录当前访问到的位置
        self.current = 0

    def __next__(self):
        if self.current < len(self.mylist.items):
            item = self.mylist.items[self.current]
            self.current += 1
            return item
        else:
            raise StopIteration

    def __iter__(self):
        return self


if __name__ == '__main__':
    mylist = MyList()
    mylist.add(1)
    mylist.add(2)
    mylist.add(3)
    mylist.add(4)
    mylist.add(5)
    for num in mylist:
        print(num)
```

5. for...in...循环的本质


## 生成器


只要在def中有yield关键字的 就称为 生成器



yield关键字有两点作用：
保存当前运行状态（断点），然后暂停执行，即将生成器（函数）挂起
将yield关键字后面表达式的值作为返回值返回，此时可以理解为起到了return的作用




1. 执行到yield时，gen函数作用暂时保存，返回i的值;
2. temp接收下次c.send("python")，send发送过来的值，c.next()等价c.send(None)
3. 第一次调用时，c.send(None) 不能携带参数
```py
In [10]: def gen():
   ....:     i = 0
   ....:     while i<5:
   ....:         temp = yield i
   ....:         print(temp)
   ....:         i+=1
   ....:
```


## 协程Coroutine


gevent:

遇到延时操作进行切换

协程补丁 & 多任务管理：
```
from gevent import monkey
import gevent
import random
import time

# 有耗时操作时需要
monkey.patch_all()  # 将程序中用到的耗时操作的代码，换为gevent中自己实现的模块

def coroutine_work(coroutine_name):
    for i in range(10):
        print(coroutine_name, i)
        time.sleep(random.random())

gevent.joinall([
        gevent.spawn(coroutine_work, "work1"),
        gevent.spawn(coroutine_work, "work2")
])
```


# 正则表达式

## `re` 模块

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

## search
需求：匹配出文章阅读的次数
```
#coding=utf-8
import re

ret = re.search(r"\d+", "阅读次数为 9999")
ret.group()
```


## findall
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




## 三次握手，四次挥手

1. 三次握手，四次挥手都是在tcp协议中发生的，这种协议是全双工通信协议，即允许数据同时在两个方向上同时传输，同时进行收发操作。
2. 而三次握手，四次挥手两者都是客户端首先发送相关命令信息。这与端口的绑定有关。

三次握手：是为了客户端与服务端都准备好的连接工作
1. 客户端在连接服务器时进行堵塞，发送syn number标志。
2. 而后服务器端接受到信息进行应答， 准备好资源。发送 ack number + 1;同时也向客户端发送syn num的信息
3. 而后客户端接收到信息，将Num + 1后回送给服务器端

四次挥手：是为了客户端与服务端都进行资源的释放操作
1. 连接断开的时候，客户端先发送连接套接字关闭的命令，
2. 而后服务器端在接收到关闭命令之后，发送关闭接受命令回送信息。
3. 再然后，会调用子套接字的关闭命令，发送给客户端，进行关闭发送命令。
4. 客户端接收到服务器的关闭命令后，进行延迟2msl时间延迟操作，同时回送已接收到关闭命令的信息。在这个过程中，如果服务器端没有接收到回送信息，则会重复再发送子套接字关闭发送的命令。


 可以设置服务器的套接字可以重复利用之前的资源。
```py
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
```






## TCP/IP协议：






## 网络通信过程


1. 首先去系统缓存文件中寻找是否有域名对应的ip地址，如果没有则需要去访问DNS服务器获取该域名对应的IP地址。
	1. 电脑去系统缓存文件中查看是否有默认网关（路由器）的Mac地址，arp -a
	2. 如果有，直接使用。如果没有则使用arp协议广播获取路由器的Mac地址
	3. 依据DNS服务器的IP地址，发送请求解析对应的域名
	4. 而后，通过默认网关以及互联网的层层转发到达DNS域名服务器，获得请求并应答回递。

2. 知道了域名服务器对应的IP地址，之后则向域名对应的IP地址发送三次握手连接请求。连接成功。
3. 而后服务器进行HTTP协议数据应答。
4. 之后便可以通过客户端进行相应的HTTP的请求数据发送以及等待服务器的相关应答操作。
5. 访问结束后，客户端与服务器进行TCP的四次挥手。双方进行相关操作资源的释放。


当然，期间还有路由器之间的发射协议


# Http 协议以及并发服务器





## 长连接与短链接

现在的网站连接都是利用长连接，以减少服务器的资源。短连接使用需要耗费大量的资源


## epoll

当进程单线程实现高并发：
- 


kernel： 操作系统拥有独有的核心空间

单进程单线程瓶颈：
- 将服务器内部的套接字进行复制FD(文件描述符)后，让操作系统检查FD内部是否有新消息到达

共享的内存空间中进行检查：
- 减少复制的内存时间
- 以事件通知的方式进行检查，而非轮询检查。

```py
import epoll

# 1. 创建epoll对象
epoll = select.epoll()

# 将监听套接字对应的ID注册到epoll中
epoll.register(server_socket.fileno(), select.EPOLLIN)


while True:
	
	# 默认堵塞，直到OS检测到数据来，通过事件通知的方式进行告诉这个程序，此时才会解堵塞。
	# return: [(fd, event), (fd2, event2), (fd3, event3)]
	fd_event_list = epoll.poll()
	
	# [(fd, event), (套接字对应的文件描述符，这个文件描述符到底是什么事件，例如可以调用recv接收等)]
	for fd, event in fd_event_list:
		
		if fd == server_socket.fileno():
			# 判断新客户端连接到来
			
			client_socket, client_addr = server_socket.accept()
			
			epoll.register(client_socket.fileno(), select.EPOLLIN)
			
			# 添加字典，从文件描述符获取到套接字
			fd_event_dict[client_socket.fileno()] = client_socket
			
		elif event = select.EPOLLIN:
			# 判断已经连接的客户端有数据发送过来
			recv_data =  fd_event_dict[fd].recv(128).decode("utf-8")
			
			if recv_data:
				# 有数据消息
				service_client(fd_event_dict[fd], recv_data)
				
			else:
				# 没有消息，客户端主动关闭
				fd_event_dict[fd].close()
				epoll.unresigster(fd)
				del fd_event_dict[fd]
		
```




# Python 高级语法

## GIL
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

`


## 数据库

### MySQL 查询

#### 消除重复行
- 在select后面列前使用distinct可以消除重复的行
```
select distinct 列1,... from 表名;
// 例：
select distinct gender from students;
+--------+
| gender |
+--------+
| 女     |
| 男     |
| 保密   |
| 人妖   |
+--------+
4 rows in set (0.00 sec)
```


## 数据库备份和恢复

备份：

```bash
mysqldump -u root -p 数据库名 > 备份文件名.sql;

...
```

恢复：

```bash
mysql -uroot -p 新数据库名 < 备份文件名.sql;

...
```

## 数据库设计

关系型数据库建议在E-R模型的基础上，我们需要根据产品经理的设计策划，抽取出来模型与关系，制定出表结构，这是项目开始的第一步


范式(Normal Form)

 第一范式（1NF）：强调的是列的原子性，即列不能够再分成其他几列。

 第二范式（2NF）：首先是1NF，另外包含两部分内容：
 - 一是表必须有一个主键；
 - 二是没有包含在主键中的列必须完全依赖于主键，而不能只依赖于主键的一部分。

◆ 第三范式（3NF）：首先是 2NF，
- 另外非主键列必须直接依赖于主键，不能存在传递依赖。
- 即不能存在：非主键列 A 依赖于非主键列 B，非主键列 B 依赖于主键的情况。

E-R模型

- E表示entry，实体，设计实体就像定义一个类一样，指定从哪些方面描述对象
	- 一个实体转换为数据库中的一个表
- R表示relationship，关系，关系描述两个实体之间的对应规则
	- 关系的类型包括包括一对一、一对多、多对多
	- 关系也是一种数据，需要通过一个字段存储在表中


### 逻辑删除

删除方案：设置isDelete的列，类型为bit，表示逻辑删除，默认值为0




### 条件查询

where后面支持多种运算符，进行条件的处理
- 比较运算符
- 逻辑运算符
- 模糊查询
- 范围查询
- 空判断


比较运算符
- 等于: =
- 大于: >
- 大于等于: >=
- 小于: <
- 小于等于: <=
- 不等于: != 或 <>


逻辑运算符
- and
- or
- not

模糊查询
- `like`
- `%` 表示任意多个任意字符
- `_` 表示一个任意字符

范围查询
- `in` 表示在一个非连续的范围内
- `not in`


空判断
- 判空: `is null`
- 判非空: `is not null`
- 注意：null与''是不同的

优先级
- 优先级由高到低的顺序为：小括号，not，比较运算符，逻辑运算符
- `and`比`or`先运算，如果同时出现并希望先算or，需要结合()使用



### 总结
```
SELECT select_expr [,select_expr,...] [      
      FROM tb_name
      [WHERE 条件判断]
      [GROUP BY {col_name | postion} [ASC | DESC], ...] 
      [HAVING WHERE 条件判断]
      [ORDER BY {col_name|expr|postion} [ASC | DESC], ...]
      [ LIMIT {[offset,]rowcount | row_count OFFSET offset}]
]
```
完整的select语句
```
select distinct *
	from 表名
		where ....
		group by ... having ...
		order by ...
		limit start,count
```
执行顺序为：
```
from 表名
	where ....
	group by ...
	select distinct *
	having ...
	order by ...
	limit start,count
```


select * from xxxx where price > (select avg(price) from xxxx) order by price desc;


select * from goods where price is group by kind

select * from goods inner join （select cate_name, max(price) as ... from goods group by cate_name) as goods_new_info on 

