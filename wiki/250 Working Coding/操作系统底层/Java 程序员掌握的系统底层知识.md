# Java 程序员掌握的系统底层知识

## 总体架构

- 硬件基础知识
	- Java相关硬件知识

- 汇编语言的执行过程（时钟发生器寄存器程序计数器）
- 计算机启动过程
- 操作系统基本知识
- 进程线程纤程的基本概念（面试高频）
	- 纤程的实现

- 内存管理
- 进程管理与线程管理（进程与线程在Linux中的实现）
- 中断与系统调用（软中断）
- 内核同步基础知识
- 关于硬盘IO DMA



## 图书推荐及其原则

读书的原则：不求甚解，观其大略

你如果进到庐山里头，二话不说，蹲下头来，弯下腰，就对着某棵树某棵小草猛研究而不是说先把庐山的整体脉络跟那研究清楚了，那么你的学习方法肯定效率巨低而且特别痛苦，最重要的还是慢慢地还打击你的积极性，说我的学习怎么那么不 happy 啊，怎么那么特没劲那，因为你的学习方法错了，大体读明白，先拿来用，用着用着，很多道理你就明白了

图书推荐

- 《编码：隐匿在计算机软硬件背后的语言》
- 《深入理解计算机系统》

- [ ] 语言：C JAVA 
	- K&R《C 程序设计语言》
	- 《C Primer Plus》

- [ ] 数据结构与算法： -- 毕生的学习 leetCode
	- 《Java 数据结构与算法》《算法》
	- 《算法导论》《计算机程序设计艺术》// 难

- 操作系统：
	- Linux 内核源码解析
	- Linux 内核设计与实现
	- 30 天自制操作系统

- 网络：机工《TCP/IP 详解》卷一 翻译一般

- 编译原理：
	- 机工 龙书 《编译原理》
	- 《编程语言实现模式》马语

- 数据库：
	- SQLite 源码 
	- Derby - JDK 自带数据库

要事第一：

- 底层原理适度打开
- 当你凝望深渊，深渊也在凝望你。当你打开潘多拉之盒，那么它也将吞噬你的精力和时间。



## CPU 的制作过程

Intel cpu 的制作过程

[https://haokan.baidu.com/v?vid=11928468945249380709&pd=bjh&fr=bjhauthor&type=](https://haokan.baidu.com/v?vid=11928468945249380709&pd=bjh&fr=bjhauthor&type=video)[video](https://haokan.baidu.com/v?vid=11928468945249380709&pd=bjh&fr=bjhauthor&type=video)

CPU 是如何制作的（文字描述）

[https](https://www.sohu.com/a/255397866_468626)[://www.sohu.com/a/255397866_468626](https://www.sohu.com/a/255397866_468626)



## CPU 的原理

> 计算机需要解决的最根本问题：如何代表数字

晶体管是如何工作的：

[https://haokan.baidu.com/v?vid=16026741635006191272&pd=bjh&fr=bjhauthor&type=](https://haokan.baidu.com/v?vid=16026741635006191272&pd=bjh&fr=bjhauthor&type=video)[video](https://haokan.baidu.com/v?vid=16026741635006191272&pd=bjh&fr=bjhauthor&type=video)

晶体管的工作原理：

<https://www.bilibili.com/video/av47388949?p=2>



## 汇编语言（机器语言）的执行过程

汇编语言的本质：机器语言的助记符 其实它就是机器语言

- 计算机通电 --> CPU 读取内存中固定位置的程序（电信号输入）---> 时钟发生器不断震荡通断电 ---> 推动 CPU 内部一步一步执行（执行多少步取决于指令需要的时钟周期）---> 计算完成 ---> 写回（电信号）---> 写给显卡输出（sout，或者图形）
	- 时钟发生器每通断一次电称为一个始终周期
	- 时钟发生器每秒可以振荡的次数为 主频，单位为：GHz(几十亿次)



## 量子计算机

- 量子比特，同时表示 1 0
- 同时表示01，即1位量子位



## CPU 的基本组成

![a0738bbd57c786a4ee9208bc684eb4f5.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/839db4f932d44e8e99eb13dd31aca4b5.png)

1. PC -> Program Counter 程序计数器
	- 记录当前指令地址
	- 依据当前指令地址所占空间自动偏移

2. Registers -> 暂时存储 CPU 计算需要用到的数据
	- 距离CPU最近的数据存储

3. ALU -> Arithmetic & Logic Unit 运算单元
	- 距离

4. CU -> Control Unit 控制单元
	- 中断相关的控制信息

5. MMU -> Memory Management Unit 内存管理单元
	- 内存管理：软件 +　硬件（这里就是）

6. cache



## 缓存

![b33b75df5edf912efc0effdc1df31310.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/66ebf78750534f379ca3d92f75000fd4.png)


数据读取：
- 按块读取（cache line）
- 依据程序局部性原理，可以提升效率
- 充分发挥总线，CPU针脚等一次性读取更多数据的能力


intel - MESI Cache 一致性协议

1. 一致性协议：<https://www.cnblogs.com/z00377750/p/9180644.html>
2. CPU 每个 cache line 标记四种状态（额外两位）
3. 这种协议实现了锁总线，即是缓存锁的一种。同时，对于有些无法被缓存的数据，或者跨越多个缓存行的数据依然必须使用总线锁。
4. 另外：MSI MESI MOSI Synapse Firefly Dragon 等均是不同公司的一致性协议

![0507f8c36f8864f0dd6e072d3915d86e.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/e0064a764ce642119f27d8adbd8f02d2.png)

缓存行：

- 缓存行越大，局部性空间效率越高，但读取时间慢
- 缓存行越小，局部性空间效率越低，但读取时间快
- 取一个折中值，目前多用：64 字节

```java
package com.mashibing.juc.c_028_FalseSharing;

public class T03_CacheLinePadding {

    public static volatile long[] arr = new long[2];

    public static void main(String[] args) throws Exception {
        Thread t1 = new Thread(()->{
            for (long i = 0; i < 10_0000_0000L; i++) {
                arr[0] = i;
            }
        });

        Thread t2 = new Thread(()->{
            for (long i = 0; i < 10_0000_0000L; i++) {
                arr[1] = i;
            }
        });

        final long start = System.nanoTime();
        t1.start();
        t2.start();
        t1.join();
        t2.join();
        System.out.println((System.nanoTime() - start)/100_0000);
    }
}
```

```java
package com.mashibing.juc.c_028_FalseSharing;

public class T04_CacheLinePadding {

    public static volatile long[] arr = new long[16];

    public static void main(String[] args) throws Exception {
        Thread t1 = new Thread(()->{
            for (long i = 0; i < 10000_0000L; i++) {
                arr[0] = i;
            }
        });

        Thread t2 = new Thread(()->{
            for (long i = 0; i < 10000_0000L; i++) {
                arr[8] = i;
            }
        });

        final long start = System.nanoTime();
        t1.start();
        t2.start();
        t1.join();
        t2.join();
        System.out.println((System.nanoTime() - start)/100_0000);
    }
}
```

一种编程方式： **缓存行对齐**：
- 对于有些特别敏感的数字，会存在线程高竞争的访问，为了保证不发生伪共享，可以使用缓存航对齐的编程方式

JVM disruptor JDK7 coding:

```java
public long p1, p2, p3, p4, p5, p6, p7;

	private volatile long cursor = INITIAL_CURSOR_VALUE;
	
	public long p8, p9, p10, p11, p012, p13, p14;

```

说明：
- JDK7 中，很多采用 long padding 提高效率
- JDK8，加入了 @Contended 注解需要加上：JVM -XX:-RestrictContended
	- 加入注解后，JVM可以依据底层CPU制造商来设置不同的字节，保证不同的缓存行

> 不同部件读取（程序的局部性原理）：
- 内存读取：缓存行，一行一行地读取
- 内存存储：一页一页地存
- 硬盘读取：一块一块

![3759ff70297ed8e479d17343f5c22a04.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/294a0bd6ff8e4ca09559db92cc63920a.png)

## 乱序执行

CPU 在进行读等待的同时执行指令，是 CPU 乱序的根源，乱序执行以便提升效率。
- 指令1:去内存读数据,等待返回
- 指令2:优先执行


乱序执行的程序验证：

1. 参考博客：[https://preshing.com/20120515/memory-reordering-caught-in-the-act/](https://preshing.com/20120515/memory-reordering-caught-in-the-act/)

2. jvm/jmm/Disorder.java
```

```

### 乱序执行可能产生的问题

DCL单例为什么要加volatile？

- 对象初始化会有


### 禁止乱序(有序性保障)

CPU 层面：Intel -> 原语 (mfence lfence sfence) 或者锁总线

intel lock 汇编指令实现：
- 硬件：原子指令，如 x86 上的 "lock addl 0x0(esp)" 指令是一个 Full Barrier, 执行时会锁住内存子系统来确保执行顺序，甚至跨多个cpu
- 软件：Software Locks 通常使用内存屏障或原子指令来实现变量可见性和保持程序顺序。

x86 CPU 内存屏障：
1. intel 原语（汇编指令）完成屏障
	- lfence:load fence 读屏障：在lfence指令前的所有读操作，必须在lfence指令后的读操作前完成。
	- sfence:save fence 写屏障：在sfence指令前的所有写操作，必须在sfence指令后的写操作前完成。
	- mfence: mixed fence 读写屏障：在mfence指令前的所有读写操作，必须在mfence指令后的读写操作前完成。
2. 同时，也可以使用总线锁实现。

JVM 层级：8 个 hanppens-before 原则 4 个内存屏障 （LL LS SL SS）

JSR内存屏障
1. LoadLoad屏障：
	- 对于这样的语句Load1；LoadLoad；Load2;
	- 那么，在Load2及后续读取操作要读取的数据被访问前，保证Load1要读取的数据被读取完毕。

2. StoreStore屏障：
	- 对于这样的语句Store1；StoreStore；Store2;
	- 那么，在Store2及后续写入操作执行前，保证Store1的写入操作对其它处理器可见。

3. LoadStore屏障：
	- 对于这样的语句Load1；LoadStore；Store2，
	- 在Store2及后续写入操作被刷出前，保证Load1要读取的数据被读取完毕。

4. StoreLoad屏障：
	- 对于这样的语句Store1；StoreLoad；Load2;
	- 在Load2及后续所有读取操作执行前，保证Store1的写入对所有处理器可见。

JVM 层面对于 volatile 的实现细节：

```java
// case 1
StoreStoreBarrier
// #################
volatile 写操作
// #################
StoreLoadBarrier

// case 2
LoadLoadBarrier
// ################
volatile 读操作
// ################
LoadStoreBarrier
```
- 以上两种情况，所有在 `#`上下操作都实现了完全屏障。
- 这里是 JVM 层面要求的禁止指令重排序规则，实际实现仍然是底层的`lock addl 0x0`
- 若 `volatile new Class` 那么，整个类全部实现屏障（这里是马老师的验证结果，无数据参考）

Hanppens-before 原则（JVM 规定重排序必须遵守的规则） -- JLS17 4.5
- 程序次序规则：同一个线程内，按照代码出现的顺序，前面的代码先行于后面的代码，准确的说是控制流顺序，因为要考虑到分支和循环结构。
- 管程锁定规则：一个unlock操作先行发生于后面（时间上）对同一个锁的lock操作。
- volatile变量规则：对一个volatile变量的写操作先行发生于后面（时间上）对这个变量的读操作。
- 线程启动规则：Thread的start（）方法先行发生于这个线程的每一个操作。
- 线程终止规则：线程的所有操作都先行于此线程的终止检测。可以通过Thread.join（）方法结束、Thread.isAlive（）的返回值等手段检测线程的终止。
- 线程中断规则：对线程interrupt（）方法的调用先行发生于被中断线程的代码检测到中断事件的发生，可以通过Thread.interrupt（）方法检测线程是否中断.
- 对象终结规则：一个对象的初始化完成先行于发生它的finalize（）方法的开始。
- 传递性：如果操作A先行于操作B，操作B先行于操作C，那么操作A先行于操作c

as-if-serial : 
- 不管硬件什么顺序(即有可能发生重排序，但是没啥影响)，单线程执行的结果不变，看上去像是 serial

案例：
问题：将请求按照顺序执行
解答：Thread 使用 SingleThreadPool.

## 合并写（不重要）

Write Combining Buffer（合并写技术，提升写效率）
- 一般是 4 个字节
- 由于 ALU 速度太快，所以在写入 L1 的同时，写入一个 WC Buffer，满了之后，再直接更新到 L2

![3759ff70297ed8e479d17343f5c22a04.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/294a0bd6ff8e4ca09559db92cc63920a-1593518329224.png)

## NUMA

Non Uniform Memory Access

UMA： 同一访问内存，多个CPU访问时不具备明显的优先级访问权限。
- 不容易扩展
- CPU数量增多后引起内存访问冲突加剧，很多资源花在争抢内存地址上面了。
- 一般而言，4颗左右比较合适。

NUMA：分配内存会优先分配该线程所在 CPU 的最近内存。当然，访问举例别人近的内存也就是低有限级。
- 目前更多才有此架构，当然看生产厂家

ZGC - NUMA aware
- 由于 CPU 底层结构 NUMA，那么产生了相关的软件技术


## 启动过程（不重要）

![2da1ff15255b905e05b9165a3348d2b8.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/28820a88fb5c45679fefe59d4a508429.png)

通电 -> bios uefi 工作 -> 加电自检 -> 到硬盘固定位置()加载 bootloader -> 读取可配置信息 -> CMOS
- BIOS UEFI:Unified Extensible Firmware Interface
- bootloader 写死到磁盘的第一个扇区，并loader到固定位置
- CMOS(Complementary Metal Oxide Semiconductor): 需要持续通电，断电后信息消失
- 启动操作系统：掉转 `Ox700`



### 操作系统

定义：所有软件的老大
- 管理硬件：内存，硬盘，CPU
- 管理应用：进程

结构：
- Hardware
- Shell::kernel
- 应用
- 《Linux 内核设计以及实践》

kernel
- CUP 调度
- 内存管理
- 中断处理，设备驱动
- 应用管理，进程调度
- 文件系统

鸿蒙微内核：
- 针对5G + IoT
- 全场景
	- 手机 PC 平板 车辆 智能穿戴 家居设备
- 弹性部署
- 开源
- 方舟编译器
- 混合内核 Linux + LiteOS + ...



### 内核分类

微内核 - 弹性部署 5G IoT
宏内核 - PC phone
外核 - 科研 实验中 为应用定制操作系统 (类似多租户 request-based GC JVM)

1. 宏内核：所有相关都集成一体
2. 微内核：仅仅具备应用管理和进程调度，其他功能全部通过调度实现完成
	- 效率微低，弹性部署
3. 外核： 依据应用端实现操作系统内核定制

VMM:
- 虚拟机监控器，硬件资源过剩



## 用户态与内核态

DOS：不分级别，直接操作硬件。

目前Linux cpu 分不同的指令级别
- intel CPU 分四个级别：ring 0, ring 1, ring 2, ring 3
- linux 内核跑在 ring 0 级， 用户程序跑在 ring 3，对于系统的关键访问，需要经过 kernel 的同意，保证系统健壮性

- 内核执行的操作 ---> 200 多个系统调用 sendfile read write pthread fork
	- JVM -> 站在 OS 老大的角度，就是个普通程序



## 程序 进程 线程 纤程

面试高频：进程和线程有什么区别？

答案：
普通：进程就是一个程序运行起来的状态，线程是一个进程中的不同的执行路径。
专业：进程是 OS 分配资源的基本单位，线程是执行调度的基本单位。分配资源最重要的是：独立的内存空间，线程调度执行（线程共享进程的内存空间，没有自己独立的内存空间）

### 进程

操作系统分配资源的基本单位。

### 线程

线程在 Linux 中的实现： 《Linux 内核设计与实现》 第三版 28 页
- 每个操作系统对于线程的实现不同
- Linux 中就是一个普通进程，只是和其他进程共享资源（内存空间，全局数据等。。。）
- 其他系统都有各自的所谓LWP 的实现：Light Weight Process
- 高层面理解：一个进程中不同的执行路线。

实现：
1. hotspot JVM（用户级）与操作系统内存都是一一对应的, 所以线程是重量级的
2. 在JVM中继续开辟线程，同在用户级里面进行线程切换。实际上仅一个线程。


### fiber 纤程

纤程：用户态的线程，线程中的线程，切换和调度不需要经过操作系统

优势：
- 1：占有资源很少：OS启动一个线程1M  Fiber为4K 
- 2：切换比较简单，可启动很多个10W+

目前 2020 3 22 支持内置纤程的语言：
- Kotlin Scala Go Python(lib)... 
- Java? （open jdk : loom）

## Java 中对于纤程的支持：没有内置，盼望内置

利用 Quaser 库（不成熟）

> pom.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>mashibing.com</groupId>
    <artifactId>HelloFiber</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- https://mvnrepository.com/artifact/co.paralleluniverse/quasar-core -->
        <dependency>
            <groupId>co.paralleluniverse</groupId>
            <artifactId>quasar-core</artifactId>
            <version>0.8.0</version>
        </dependency>
    </dependencies>

</project>
```
> 线程版

```java
import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.SuspendExecution;
import co.paralleluniverse.strands.SuspendableRunnable;

public class HelloFiber {

    public static void main(String[] args) throws  Exception {
        long start = System.currentTimeMillis();
        
        Runnable r = new Runnable() {
            @Override
            public void run() {
                calc();
            }
        };

        int size = 10000;

        Thread[] threads = new Thread[size];
        for (int i = 0; i < threads.length; i++) {
            threads[i] = new Thread(r);
        }

        for (int i = 0; i < threads.length; i++) {
            threads[i].start();
        }

        for (int i = 0; i < threads.length; i++) {
            threads[i].join();
        }

        long end = System.currentTimeMillis();
        System.out.println(end - start);


    }

    static void calc() {
        int result = 0;
        for (int m = 0; m < 10000; m++) {
            for (int i = 0; i < 200; i++) result += i;

        }
    }
}
```
> 纤程版本

```java
import co.paralleluniverse.fibers.Fiber;
import co.paralleluniverse.fibers.SuspendExecution;
import co.paralleluniverse.strands.SuspendableRunnable;

public class HelloFiber2 {

    public static void main(String[] args) throws  Exception {
    
        long start = System.currentTimeMillis();

		//  纤程
        int size = 10000;

        Fiber<Void>[] fibers = new Fiber[size];

        for (int i = 0; i < fibers.length; i++) {
        
            fibers[i] = new Fiber<Void>(new SuspendableRunnable() {
                public void run() throws SuspendExecution, InterruptedException {
                    calc();
                }
            });
        }

        for (int i = 0; i < fibers.length; i++) {
            fibers[i].start();
        }

        for (int i = 0; i < fibers.length; i++) {
            fibers[i].join();
        }

        long end = System.currentTimeMillis();
        System.out.println(end - start);

    }

    static void calc() {
        int result = 0;
        for (int m = 0; m < 10000; m++) {
            for (int i = 0; i < 200; i++) result += i;
        }
    }
}
```
作业：
目前是 10000 个 Fiber -> 1 个 JVM 线程，想办法提高效率，10000Fiber -> 10 份 -> 10Threads
```

```

## 纤程的应用场景

纤程 vs 线程池：很短的计算任务，不需要和内核打交道，并发量高！

## 进程

Linux 中也称为 task, 是系统分配资源的基本单位
- 资源：独立的地址空间，内核数据结构（进程描述符） 全局变量 数据段。。。
- 进程描述符：PCB（Process Control Block)

### 内核进程

内核启动后经常需要做一些后台操作，这些由Kernel Thread 来完成。仅仅在内核空间运行。

### 进程创建和启动

系统函数: 
- fork() --- clone()
- exec()

B = fork(A):
- A： 父进程
- B： 子进程



### 僵尸进程



```bash
# 查找僵尸进程
ps -ef | grep defunct
```
定义： 父进程产生子进程后，会维护子进程的一个PCB结构，子进程退出，由父进程释放。如果父进程没有释放，那么子进程成为一个僵尸进程
- 僵尸进程需要手动释放，主要是因为未关机的服务器中可能存在持续增长的僵尸进程

> zombie.c
```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>


int main()
｛
	// for() 返回两个值，1 为子进程程序。
	pid_t pid = fork();
	
	// 子进程运行
	if(0 == pid)
	{
		printf("child id is %d\n", getpid());
		printf("parent id is %d\n", getppid());
	}else // 父进程一致运行，不释放子程序
	{
		while(1);
	}
	
}
```
- 编译及后台运行：`gcc zombie.c -o zombie && ./zombie &`
- 查看僵尸进程：`ps` 僵尸进程后面有 `<defunct>`



### 孤儿线程

- 子进程结束之前，父进程已经退出
- 孤儿进程会成为ipt进程的孩子：
	- 若图形化界面存在，那么进程由此进程维护
	- 若无图形化界面，那么由1号进程维护（1号为所有进程的公爹）

> orphan.c
```
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>


int main()
｛
	// for() 返回两个值，1 为子进程程序。
	pid_t pid = fork();
	
	// 子进程运行
	if(0 == pid)
	{
		printf("child ppid is %d\n", getppid());
		sleep(10);
		printf("parent ppid is %d\n", getppid());
	}else // 父进程提前退出
	{
		printf("parent id is %d\n", getpid());
		sleep(5);
		exit();
	}
	
}
```



## 进程（任务）调度

内核进程调度器决定：
- 该那个进程运行？何时开始？运行多长时间？
- 每个进程都有自己的调度方案。

从单任务（独占）到多任务（分时）
- 最开始：DOS MacOS 早期版本， Windows3.1 ...
- 到目前：timeslice - CPU 分片执行功能
- 原则：最大限度地压榨cpu资源

技术：
- 工程技术：大家都可以学会。
- 作出自己的工程方为正途。

多任务（multitasking)
1. 非抢占式（cooperative multitasking）
	- 除非进程主动让出cpu（yielding），否则将一直运行
2. 抢占式（preemptive multitasking）
	- 由进程调度器强制开始或暂停（抢古）某一进程的执行

进程调度（选修）
1. Linux2.5 经典 Unix 0(1) 调度策略，偏向服务器，但对交互不友好
	- timeslice 轮询策略
	- 没有即时响应，
2. Linux2.6.23 采用 CFS 完全公平调度算法Completely Fair Scheduler
	- 按优先级分配时间片的比例，记录每个进程的执行时间，如果有一个进程执行时间不到他应该分配的比例,优先执行

进程类型
- IO密集型大部分时间用于等待IO
- CPU密集型大部分时间用于闷头计算

进程优先级
- 实时进程 >>> 普通进程（0-99）
- 普通进程nice值（-20-19）

时间分配
- linux采用按优先级的CPU时间比
- 其他系统多采用按优先级的时间片
eg.两个app同时运行
- 一个文本处理程序
- 一个影视后期程序

Linux 默认调度策略：

1. 实时进程（急诊）：
	- 优先级分高低：SCHED_FIFO (First In First Out)，此种等级最高。除非自己让出CPU资源否则Linux会直至执行它。除非还有更高级别的FIOFO和RR抢占它。
	- 优先级一样时：SCHED_RR（Round Robin），RR只是这种线程中是同级别FIFO中的平均分配
	- 只有实时进程主动让出，或者执行完毕后，普通进程才有机会运行

2. 普通： CFS



## 中断

中断处理机制的实现细节：
硬件中断 --- 中断控制器 --- CPU --- kernel --- 中断处理程序
- 中断向量表：
	- n1 - 键盘 - 处理程序
	- n2 - 鼠标 - 处理程序
	- 0x80 - 软中断 - 处理程序
- CPU依据特定的中断信号写入固定内存位置
- kernel 读取到中断信号，并执行写好的中断
- 中断处理上半场为kernel, 下半场为应用程序

分类：
硬中断：
- 硬件跟操作系统内核打交道的一种机制
软中断（80 Hex 中断） == 系统调用
- 应用中断程序，调用系统函数
- 系统调用：int 0x80 或者 sysenter 原语（更进一步）
	- 通过 ax 寄存器填入调用号
	- 参数通过 bx cx dx si di 寄存器传入内核
	- 返回值通过 ax 返回
- 操作系统系统函数调用表
	- eax <- 系统调用号
	- write <- 4号
	- exit <- 1号

案例：
java 读网络 –> jvm read() – > c库 read() - >
内核空间 -> system_call() （系统调用处理程序 sysenter 原语，依据系统函数调用表） -> sys_read() 处理响应，并将处理结果寄存在 ax 中 -> 返回jvm -> java

### 从汇编角度理解软中断

#### 搭建汇编环境

安装：
```
# nasm 是用来编译汇编文件的 .asm
yum install nasm
```

> hello.asm
```
;hello.asm
;write(int fd, const void *buffer, size_t nbytes)
;- fd 文件描述符 file descriptor - linux下一切皆文件

section data
    msg db "Hello", 0xA
    len equ $ - msg

section .text
global _start
_start:

    mov edx, len
    mov ecx, msg
    mov ebx, 1 ;文件描述符1 std_out
    mov eax, 4 ;write函数系统调用号 4
    int 0x80

    mov ebx, 0
    mov eax, 1 ;exit函数系统调用号
    int 0x80
```

编译：
- `nasm -f elf hello.asm -o hello.o`

链接：
- `ld -m elf_i386 -o hello hello.o`


一个程序的执行过程，要么处于用户态，要么处于内核态
- 而程序的IO执行过程中，对于阻塞和非阻塞的判定为：
- 程序执行过程中，一定会调用内核态执行，而区分阻塞和非阻塞的关键点在于：此时，用户态的部分是否还可以继续执行工作。不能干活为阻塞，可以干活的为非阻塞。



## 内存管理

### 发展历程

1. DOS 时代： 同一时间只能有一个进程在运行（也有一些特殊算法可以支持多进程）
2. windows9x：多个进程全部装入内存
    - 1：内存不够用，撑爆了 
    - 2：互相打扰
3. 为了解决这两个问题，诞生了现在的内存管理系统：虚拟地址 分页装入 软硬件结合寻址
	- 1.分页（内存不够用），内存中分成固定大小的页框（page frame 4K），同时也把程序（硬盘上）分成 4K 大小的块，用到哪一块，加载那一块，加载的过程中，如果内存已经满了，会把最不常用的一块放到 swap 分区， 把最新的一块加载进来，这个就是著名的 LRU** 算法**
		- 案例：win 双击应用，即将程序**页表**加载在内存中。同时，加载入口地址页，之后连接其他页。同时，如果内存空间满了，那么会把最不常用的一块放如 Linux 的 swap 分区
	    1.  LRU 算法 LeetCode146 题，头条要求手撕，阿里去年也要求手撕
	    2.  Least Recently Used 最不常用，近乎所有的设计到缓存的都会设计到此算法:LRU, LFU
	    3.  哈希表（保证 查找操作 O(1)） + 链表 （保证 排序操作和新增操作 O(1)））
		
4.  双向链表 （保证 左边指针 指向右边块）
		
	- 2.虚拟内存（解决相互打扰问题）
		1. DOS Win31 应用程序... 互相干掉
   	2. 为了保证互不影响 - 让进程工作在虚拟空间，程序中用到的空间地址不再是直接的物理地址，而是虚拟的地址，这样，A 进程永远不可能访问到 B 进程的空间
    3.  虚拟空间多大呢？寻址空间 - 64 位系统 2 ^ 64，比物理空间大很多 ，单位是 byte
    4.  站在虚拟的角度，进程是独享整个系统 + CPU
    5.  内存映射：偏移量 + 段的基地址 = 线性地址 （虚拟空间）
 6.  线性地址通过 OS + MMU（硬件 Memory Management Unit）
	
   - 3. 缺页中断（不是很重要）：
   
    1.  虚拟内存中需要用到数据页，实际内存中没有，产生缺页异常（中断），由内核处理并加载硬盘数据页到内存中。

虚拟内存：
每个进程都虚拟的独占整个CPU
进程内部分段，段内部分页，需要该页的时候加载到内存页框(page frame)

![c69bdbe4fcb799f039c7d834abb11c3c.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/a48eebc221b74334a0f07ebe70045207.png)

内存映射：
1. 操作 数据段 数据区 逻辑地址 ---> 段的基地址 + 偏移量（逻辑地址） == 虚拟地址/线性地址
2. 线性地址通过 OS + MMU（硬件 Memory Management Unit）映射到真正地逻辑地址


内存地址映射：

![681e4ddac3b2f284132ff2870e3f4ad3.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/918fa8acf79b4ecdb233eaafffcc160c.png)



### ZGC （The Z garbage collector）

算法叫做：Colored Pointer + Load Barrier
- GC 信息记录在指针上，不是记录在头部， immediate memory use
- 42 位指针 寻址空间 4T 
	- JDK13 ---> 16T 目前为止最大 16T 2^44
	- 原因：地址总线目前：48 位。因此，4 位给了颜色指针，而剩余的还有44位可以用于寻址

![89e439ffba359962383b836831e300fd.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/8ca23a017a294337a9a3f4088ba5bd63.png)

- 颜色指针：四个互相排斥
- 颜色指针本质上包含了地址映射的概念
	- Marked0（4T）
	- Marked1 (8T)
	- Remapped (12T)
	- Finalizable (16T)

### CPU 如何区分 一个立即数 和 一条指令

- 总线内部分为：数据总线 地址总线 控制总线
- 地址总线目前：48 位
- 因此，4 位给了颜色指针，而剩余的还有44位可以用于寻址

## 内核同步机制


### 关于同步理论的一些基本概念

- 临界区（critical area）: 访问或操作共享数据的代码段 
	- 简单理解：synchronized 大括号中部分（原子性）

- 竞争条件（race conditions）两个线程同时拥有临界区的执行权

- 数据不一致：data unconsistency 由竞争条件引起的数据破坏

- 同步（synchronization）避免 race conditions
	- 定义同时执行临界区的代码区时所定的执行规则

- 锁：完成同步的手段（门锁，门后是临界区，只允许一个线程存在） 
	- 上锁解锁必须具备原子性

- 原子性（象原子一样不可分割的操作）
- 有序性（禁止指令重排）
- 可见性（一个线程内的修改，另一个线程可见）

> 参看见互斥锁 排他锁 共享锁 分段锁

### 内核同步常用方法

目的：保证原子性，有序性，可见性(Atomicity, Ordering, Visibility)

1. 原子操作：内核中类似于 AtomicXXX，位于 <Linux/types.h>

2. 自旋锁：内核中通过汇编支持的 cas，位于 <asm/spinlock.h>
	- 离开后，再次回来的时候 检查一下锁状态

3. 读 - 写自旋 – 类似于 ReadWriteLock
	- 可同时读，只能一个写
	- 读的时候是共享锁，写的时候是排他锁

4. 信号量 – 类似于 Semaphore(PV 操作 down up 操作：占有和释放） 
	- 重量级锁，线程会进入 wait，适合长时间持有的锁情况
	- 内核里面的 Semaphore

5. 读-写信号量 – downread upread downwrite upwrite 
	- 多个写，可以分段写，比较少用(分段锁）

6. 互斥体 (mutex) – 特殊的信号量（二值信号量）
	-  平时所说的 Syncinized

7. 完成变量 – 特殊的信号量（A 发出信号给 B，B 等待在完成变量上） 
	- 内核vfork() 在子进程结束时通过完成变量叫醒父进程
	- 类似于 (Latch)

8. BKL：大内核锁（早期，现在已经不用）

9. 顺序锁（2.6）：
	– 线程可以挂起的读写自旋锁 
	- 使用序列计数器实现：从 0 开始，写时增加 (+1)，写完释放 (+1)，读前发现单数， 说明有写线程，等待或其他等自行决定是否操作，读前读后序列一样，说明没有写线程打断）

10. 禁止抢占 – preempt_disable()

11. 内存屏障 – 见 volatile



## 自定义操作系统

### 1. 编写汇编码

> boot.asm
```
; 文件名 boot.asm
 
org 7c00h                     ; BIOS读入MBR后，从0x7c00h处开始执行
 
; 下面部分和10h有关中断，10h中断用来显示字符
mov ax, cs
mov es, ax
mov ax, msg
mov bp, ax                    ; ES:BP表示显示字符串的地址
mov cx, msgLen                ; CX存字符长度
mov ax, 1301h                 ; AH=13h表示向TTY显示字符，AL=01h表示显示方式（字符串是否包含显示属性，01h表示不包含）
mov bx, 000fh                 ; BH=00h表示页号，BL=0fh表示颜色
mov dl, 0                     ; 列
int 10h
  
msg: db "hello world, welcome to OS!"
msgLen: equ $ - msg           ; 字符串长度
times 510 - ($ - $$) db 0     ; 填充剩余部分
dw 0aa55h                     ; 魔数，必须有这两个字节BIOS才确认是MBR
```

### 2. 编译
```
nasm boot.asm -o boot.bin
```

### 3. 制作启动软盘

1.  dd if=/dev/zero of=floppy.img bs=1474560 count=1 **生成空白软盘镜像**
2.  dd if=boot.bin of=myos.img bs=512 count=1 **制作包含主引导记录 boot.bin 的启动镜像文件**
3.  dd if=floppy.img of=myos.img skip=1 seek=1 bs=512 count=2879 **在 bin 生成的镜像文件后补上空白，成为合适大小的软盘镜像，一共 2880 个扇区，略过第一个**

### 4. 用软盘启动系统

1.  将 myos.img 下载到 windows
2.  VMWare 创建空的虚拟机

    1.  文件 - 创建新的虚拟机 - 典型
    2.  稍后安装操作系统
    3.  其他
    4.  一路 next 完成
    5.  虚拟机设置，去掉 CD/DVD 选项中 “启动时连接”
    6.  网络，选择 “仅主机模式”，勾选 “启动时连接”（好像无所谓）
    7.  添加软盘驱动器 使用软盘映像 找到 myos.img
3.  启动虚拟机

### 为什么是 0x7C00?

![1e6880343ec80213e0b4a57b96b6f0f4.png](_resource/Java%20%E7%A8%8B%E5%BA%8F%E5%91%98%E6%8E%8C%E6%8F%A1%E7%9A%84%E7%B3%BB%E7%BB%9F%E5%BA%95%E5%B1%82%E7%9F%A5%E8%AF%86/da0916a4ff734fe98b7027db55c26267.png)

参考：<https://www.glamenv-septzen.net/en/view/6> 
 <http://mashibing.com/doc/>



## Reference

[I wrote an operating system in conjunction with (a) - 10 mins to write the operating system](https://www.programmersought.com/article/90352129718/)
[Why BIOS loads MBR into 0x7C00 in x86 ?](https://www.glamenv-septzen.net/en/view/6)