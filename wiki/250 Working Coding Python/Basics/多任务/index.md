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


### 线程执行代码的封装

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



### 互斥锁

threading模块中定义了Lock类，可以方便的处理锁定：
```py
# 创建锁
mutex = threading.Lock()

# 锁定
mutex.acquire()

# 释放
mutex.release()
```



## 进程


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


### 进程通讯

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



### 进程池Pool
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

## 协程



### 迭代器


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


### 生成器


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


### 协程Coroutine


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