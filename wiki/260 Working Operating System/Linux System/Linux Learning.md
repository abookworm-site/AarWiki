Linux Learning

# Operation System - Linux 

## 目录和文件操作

### 类Unix的文件根目录

> Linux 一切皆文件

#### All in here
1. 系统启动必须：
    - /boot：存放的启动Linux 时使用的内核文件，包括连接文件以及镜像文件。
    - /etc：存放所有的系统需要的配置文件和子目录列表，更改目录下的文件可能会导致系统不能启动。
    - /lib：存放基本代码库（比如c++库），其作用类似于Windows里的DLL文件。几乎所有的应用程序都需要用到这些共享库。
    - lib64: 
    - /sys： 这是linux2.6内核的一个很大的变化。该目录下安装了2.6内核中新出现的一个文件系统 sysfs 。sysfs文件系统集成了下面3种文件系统的信息：针对进程信息的proc文件系统、针对设备的devfs文件系统以及针对伪终端的devpts文件系统。该文件系统是内核设备树的一个直观反映。当一个内核对象被创建的时候，对应的文件和目录也在内核对象子系统中

2. 指令集合：
	- /bin：存放着最常用的程序和指令
	- /sbin：只有系统管理员能使用的程序和指令。

3. 外部文件管理：

	- /dev ：Device(设备)的缩写, 存放的是Linux的外部设备。注意：在Linux中访问设备和访问文件的方式是相同的。
	- /media：类windows的其他设备，例如U盘、光驱等等，识别后linux会把设备放到这个目录下。
	- /mnt：临时挂载别的文件系统的，我们可以将光驱挂载在/mnt/上，然后进入该目录就可以查看光驱里的内容了。

4. 临时文件：

	- /run：是一个临时文件系统，存储系统启动以来的信息。当系统重启时，这个目录下的文件应该被删掉或清除。如果你的系统上有 /var/run 目录，应该让它指向 run。
	- /lost+found：一般情况下为空的，系统非法关机后，这里就存放一些文件。
	- /tmp：这个目录是用来存放一些临时文件的。

5. 账户：

	- /root：系统管理员的用户主目录。
	- /home：用户的主目录，以用户的账号命名的。
	- /usr：用户的很多应用程序和文件都放在这个目录下，类似于windows下的program files目录。
		- /usr/bin：系统用户使用的应用程序与指令。
		- /usr/sbin：超级用户使用的比较高级的管理程序和系统守护程序。
		- /usr/src：内核源代码默认的放置目录。

6. 运行过程中要用：

	- /var：存放经常修改的数据，比如程序运行的日志文件（/var/log 目录下）。
	- /proc：管理内存空间！虚拟的目录，是系统内存的映射，我们可以直接访问这个目录来，获取系统信息。这个目录的内容不在硬盘上而是在内存里，我们也可以直接修改里面的某些文件来做修改。

7. 扩展用的：

	- /opt：默认是空的，我们安装额外软件可以放在这个里面。
	- /srv：存放服务启动后需要提取的数据（不用服务器就是空）

#### Common using
- /boot : 内核和启动程序的相关文件

- /dev  : 设备文件所在目录
- /media: 挂载设备媒体，U盘，光驱等
- /mnt  : 挂载的文件系统

- /home/
- /usr  : unix system resources 庞大和复杂的目录
    - /usr/local : 用户自己安装软件的目录

- /proc : 系统内存的映射，会保留进制运行的一些信息
- /etc  : 系统软件的启动和配置目录
    - /etc/passwd : 用户存放文件
    - man 5 passwd: 查看文件格式



## Linux 命令

### 终端命令格式

```bash
command [-options] [parameter]
```

说明：

- `command`：命令名，相应功能的英文单词或单词的缩写
- `[-options]`：选项，可用来对命令进行控制，也可以省略
- `parameter`：传给命令的参数，可以是 **零个**、**一个** 或者 **多个**

> `[]` 代表可选



### 查看帮助`man` or `--help`

1，查看帮助文件

```bash
command --help
```

2， 查看命令使用手册

```bash
man command
```

- 查阅 `command` 命令的使用手册
- `man` 是 **manual** 的缩写，是 Linux 提供的一个 **手册**，包含了绝大部分的命令、函数的详细使用说明



使用 `man` 时的操作键：

| 操作键   | 功能                 |
| -------- | -------------------- |
| 空格键   | 显示手册页的下一屏   |
| Enter 键 | 一次滚动手册页的一行 |
| b        | 回滚一屏             |
| f        | 前滚一屏             |
| q        | 退出                 |
| /word    | 搜索 **word** 字符串 |



### 查看终端命令历史记录 `history`



### 查看终端登录历史记录 `last`



> 其他：
>
> - 按 `上`／`下` 光标键可以在曾经使用过的命令之间来回切换
> - 如果想要退出选择，并且不想执行当前选中的命令，可以按 `ctrl + c`



## 文件列表

### `ls` ：list --- 查看文件列表

一、命令参数
- `ls -l`
- `ls -a`
- `ls -h` : 人性化显示
- `ll`: 常用，或者一般修改为其他常用的映射命令。
- `ls -R` : 递归显示子目录的内容
- `ls -lrt` : 按照时间排序

二、通配符 `*` 和 `？`

| 通配符 | 含义                                 |
| ------ | ------------------------------------ |
| *      | 代表任意个数个字符                   |
| ?      | 代表任意一个字符，至少 1 个          |
| []     | 表示可以匹配字符组中的任一一个       |
| [abc]  | 匹配 a、b、c 中的任意一个            |
| [a-f]  | 匹配从 a 到 f 范围内的的任意一个字符 |



三、相对路径和绝对路径



## 目录相关

### `cd` : change dir

一、回到家目录：
- cd ~
- cd $HOME
- cd

### pwd

### which

### mkdir
一、命令参数
- mkdir dir1 [dir2 dir3 ...] 
- mkdir dir1/dir2 -p ---递归创建目录



## 文件相关

### touch : 创建文件

一、命令参数
- touch filename 
    - 创建文件
    - 若文件已存在，那么修改文件的修改时间

### rm : remove 删除
一、命令参数
- `rm filename`
- `rm -r dir`: 递归删除文件目录
- `rm -rf *` : 强制删除目录下的全部内容

### cp : copy & mv : move 复制
- 考虑当前文件或者目录存不存在
    - 存在：保存当前存在的目录下面
    - 不存在：修改拷贝目录、文件名称，之后拷贝其内的内容



## 文件内容查看

### cat : 直接命令行中显示信息

### more/less : 分屏显示文件信息
- 回车： 逐行显示
- 空格： 单页显示

### head : 查看文件头
- 默认10行
- head -n file: 显示指定的行数

### tail ： 查看文件尾
- 默认10行
- tail -n file : 显示指定的行数
- tail -f file : 一直跟踪文件末尾



## 统计信息

### tree

### wc : 统计文件信息内容
- wc *  : 统计整个目录
- wc -l : 显示行数
- wc -w : 统计单词数
- wc -c : 显示字节数

### du : 查看目录占用空间
- du -h : 更适合人类观察
- du -h --max-depth=1 : 递归一级子目录

### df : 查看磁盘空间信息
- df -h : 显示磁盘使用情况
- df -h --block-size=GB : 按照GB统计显示



## 文件属性和用户用户组

### 登录用户whoami

查看登录用户

### 文件权限和软硬连接

文件类型：
- 普通文件：`-
- 目录文件：`d`
- 符号链接：`l`
- 字符设备：`c`
- 块设备  ：`b`
- 管道设备：`p`
- 本地套接字： `s`

权限位数字表示法（八进制）：最后连起来前面 `+0`:即0644

|权限|二进制|十进制|说明|
|---|---|---|---|
|rw-|110|6|用户位|
|r--|100|4|组权限位|
|r--|100|4|其他权限位|



### ln : 建立软硬链接

1. 建立硬链接
ln src xxx

2. 建立软链接
ln -s src xxx



### unlink : 删除软硬链接

- 硬链接数为0时，文件被删除



### 修改文件权限

一、chmod
`chmod [u|g|o|a] [+|-][r|w|x] filename`
- chmod u-x filename : 修改用户权限
- chmod 0664 filename: 修改所有权限
- 目录需要可执行权限才能进入

### 修改用户和组(root)

修改用户和组:
`sudo chown user:group file`  : 修改所有者和所属组
`sudo chown user file`        : 只修改所有者

修改组：
`sudo chgrp groupname file` : 修改文件所属组



## 查找和检索

### find
- find dir [option] 内容
    - `-name` : 按名字查找
        - find dir -name 
    - `-type` : 按类型查找
        - find ./ -type 
    - `-size` : 按大小查找
        - find ./ -size +1M -size -5M : 查找大于1M， 小于5M的文件
    - `-maxdepth` : 最深目录
        - find ./ -maxdepth 1 -size +1M : 当前目录下大于1M的文件
    - find ./ -maxdepth 2 -size +1M -exec ls -l {} \;
        - `-ok` : 相对安全模式，每一条指令都提示
        - `-exec` :
    - find ./ -type f | xargs grep "txt"
    - find ./ -type l | xargs ls -l

### xargs
- 将前一个目录的输出分成小块输入给后面的命令
    - find ./ -type l | xargs ls -l



### grep : 内容过滤

> `grep -r xxxx [file]` : 递归查找
- `grep xxxx file`
- `cat file | grep xxxx` : 查找文件中的xxxx内容
- `tail -f file | grep xxxx`
- grep -v xxxx : 过滤xxxx的内容
- grep -rn "main" * : 查找所有包含"main"的所有文件，并显示行号n



## 压缩包管理

### zip
- zip -r file.zip file : r代表递归子目录
- unzip file.zip

### tar
- tar -zcvf file.tar.gz filepath
    - -c : 压缩文件
    - -v : 显示信息
    - -f : 指定压缩包名
    - -z : gz格式压缩
- tar -zxvf file.tar.gz
- `bzip2` 格式：
- -j选项，其他与tar一致

### rar
- rar a -r filename dir : 打包
- rar x filename.rar    : 解压



## 虚拟机网络配置

- 桥接模式：虚拟机相当于另外一台电脆和本地连接同一个IP段
- NAT模式：本地主机通过VMINET8网卡连接到虚拟机，要求V/MINET8网卡与康拟机ip同一个网段
    - 静态IP配置

> 此处可查看静态Linux静态IP配置说明




## 软件安装和卸载
### apt-get
- sudo apt-get update          : 更新源
- sudo apt-get install tree
- sudo apt-get remove tree
- sudo apt-get clean


### dpkg
- sudo dpkg -i xxx.deb : 安装
- sudo dpkg -r xxx.deb : 移除



### 源码(非绝对)

1. 解压缩代码包
2. cd dir
3. ./configure         : 检测文件是否缺失，创建make file， 检测编译环境
4. make
5. sudo make install   : 把库和可执行程序，安装到系统路径下
6. sudo make distclean : 清除和卸载软件



## 磁盘管理



## 用户管理

### 创建用户
```
sudo useradd -s /bin/bash -g usergourp_name
```
- `-s` ：指定shell
- `-g` : 指定组
- `-d` : 用户家目录
- `-m` : 家目录不存在时，自动创建
- `sudo useradd s/bin/bash -g itcast -l /home/itcast -m itcast`

### 设置用户组
```
sudo groupadd usergourp_name
```

### 设置用户密码
```
sudo passwd user_name
```

### 切换用户
- su itcast  : 切换用户
- su -itcast : 切换用户并改变环境变量

### 切换root用户
- sudo
- su

### 删除用户
- sudo userdel itcast    : 删除用户
- sudo userdel -r itcast : 删除用户及其家目录



## 进程管理

### who : 查看登陆设备用户

### ps  : 查看进程信息
- ps aux
- ps ajx

### kill : 终结进程
- kill -9 pid

### env : 环境变量
- echo SSHELL 

### top : 查看系统信息



## 网络管理

### ifconfig : 查看ip信息
- etho : 代表本地第一课网卡
- `sudo ifconfig eth0 ip`

### ping：查看连接状态
- ping 域名
- ping -c 4 : 连接域名、IP 四次

### nslookup : 通过域名得到ip

### netstat : 查看网络连接状态
- netstat -an | grep port



## 其他命令

### date

### cal

### umask : 文件权限补码
- umask    : 显示八进制文件掩码
- 读写权限来由：
	- 1. umask 默认参数为：002, 取补码为：775
	- 2. 与默认权限666取交集：得到664，即wrxwrxwr-
- umask -S : 显示创建文件对应的读写权限

### echo : 输出变量或者字符串

### alias : 配置命令别名





### 重定向 `>` 和 `>>`

- Linux 允许将命令执行结果 **重定向**到一个 **文件**
- 将本应显示在**终端上的内容** **输出／追加** 到**指定文件中**

其中

- `>` 表示输出，会覆盖文件原有的内容
- `>>` 表示追加，会将内容追加到已有文件的末尾

### 管道 `|`

- Linux 允许将 **一个命令的输出** 可以**通过管道** 做为 **另一个命令的输入**

常用的管道命令有：

- `more`：分屏显示内容
- `grep`：在命令执行结果的基础上查询指定的文本



## 远程登录和复制文件

| 序号 | 命令                                              | 对应英文     | 作用           |
| ---- | ------------------------------------------------- | ------------ | -------------- |
| 01   | ssh 用户名@ip                                     | secure shell | 关机／重新启动 |
| 02   | scp 用户名@ip:文件名或路径 用户名@ip:文件名或路径 | secure copy  | 远程复制文件   |

### `ssh` 基础

在 Linux 中 SSH 是 **非常常用** 的工具，通过 **SSH 客户端** 我们可以连接到运行了 **SSH 服务器** 的远程机器上

- **SSH 客户端**是一种使用 `Secure Shell（SSH）` 协议连接到远程计算机的软件程序
- `SSH` 是目前较可靠，**专为远程登录会话和其他网络服务**提供安全性的协议
    - 利用 `SSH 协议` 可以有效**防止远程管理过程中的信息泄露**
    - 通过 `SSH 协议` 可以对所有传输的数据进行加密，也能够防止 DNS 欺骗和 IP 欺骗
- `SSH` 的另一项优点是传输的数据可以是经过压缩的，所以可以加快传输的速度

#### 1) 域名 和 端口号

##### 域名

- 由一串 **用点分隔** 的名字组成，例如：`www.itcast.cn`
- 是 **IP 地址** 的别名，方便用户记忆

##### 端口号

- **IP 地址**：通过 **IP 地址** 找到网络上的 **计算机**
- **端口号**：通过 **端口号** 可以找到 **计算机上运行的应用程序**
    - **SSH 服务器** 的默认端口号是 `22`，如果是默认端口号，在连接的时候，可以省略
- 常见服务端口号列表：

| 序号 | 服务       | 端口号 |
| ---- | ---------- | ------ |
| 01   | SSH 服务器 | 22     |
| 02   | Web 服务器 | 80     |
| 03   | HTTPS      | 443    |
| 04   | FTP 服务器 | 21     |

> 提示：有关 **端口号**的详细内容，在就业班会详细讲解！

#### 2) SSH 客户端的简单使用

```bash
ssh [-p port] user@remote
```

- `user` 是在远程机器上的用户名，如果不指定的话默认为当前用户
- `remote` 是远程机器的地址，可以是 **IP**／**域名**，或者是 **后面会提到的别名**
- `port` 是 **SSH Server 监听的端口**，如果不指定，就为默认值 `22`

> 提示：
>
> - 使用 `exit` 退出当前用户的登录
>
> 注意：
>
> - `ssh` 这个终端命令只能在 `Linux` 或者 `UNIX` 系统下使用
> - 如果在 `Windows` 系统中，可以安装 `PuTTY` 或者 `XShell` 客户端软件即可
>
> 提示：
>
> - 在工作中，SSH 服务器的端口号很有可能**不是 22**，如果遇到这种情况就需要使用 `-p` 选项，指定正确的端口号，否则无法正常连接到服务器

#### 3) Windows 下 SSH 客户端的安装

- XShell http://xshellcn.com
- WinSCP

> 建议从官方网站下载正式的安装程序



###  `scp`

- scp 就是 `secure copy`，是一个在 Linux 下用来进行 **远程拷贝文件** 的命令
- 它的**地址格式与 ssh 基本相同**，**需要注意的是**，在指定端口时用的是大写的 `-P` 而不是小写的



```bash
# 把本地当前目录下的 01.py 文件 复制到 远程 家目录下的 Desktop/01.py
# 注意：`:` 后面的路径如果不是绝对路径，则以用户的家目录作为参照路径
scp -P port 01.py user@remote:Desktop/01.py

# 把远程 家目录下的 Desktop/01.py 文件 复制到 本地当前目录下的 01.py
scp -P port user@remote:Desktop/01.py 01.py

# 加上 -r 选项可以传送文件夹
# 把当前目录下的 demo 文件夹 复制到 远程 家目录下的 Desktop
scp -r demo user@remote:Desktop

# 把远程 家目录下的 Desktop 复制到 当前目录下的 demo 文件夹
scp -r user@remote:Desktop demo
```

| 选项 | 含义                                                         |
| ---- | ------------------------------------------------------------ |
| -r   | 若给出的源文件是目录文件，则 scp 将递归复制该目录下的所有子目录和文件，目标文件必须为一个目录名 |
| -P   | 若远程 SSH 服务器的端口不是 22，需要使用大写字母 -P 选项指定端口 |

> 注意：
>
> - `scp` 这个终端命令只能在 `Linux` 或者 `UNIX` 系统下使用
> - 如果在 `Windows` 系统中，可以安装 `PuTTY`，使用 `pscp` 命令行工具或者安装 `FileZilla` 使用 `FTP` 进行文件传输

#### `FileZilla`

- 官方网站：https://www.filezilla.cn/download/client
- `FileZilla` 在传输文件时，使用的是 `FTP 服务` 而不是 `SSH 服务`，因此端口号应该设置为 `21`

### SSH 高级

- 免密码登录
- 配置别名

> 提示：有关 SSH 配置信息都保存在用户家目录下的 `.ssh` 目录下

#### 1）免密码登录

##### 步骤

- 配置公钥
    - 执行 `ssh-keygen` 即可生成 SSH 钥匙，一路回车即可
- 上传公钥到服务器
    - 执行 `ssh-copy-id -p port user@remote`，可以让远程服务器记住我们的公钥

##### 示意图

![003_SSH 免密码示意图](file:///E:/251%20Show%20me%20Code/%2310%20Python%E5%9F%BA%E7%A1%80/Linux%20%E5%9F%BA%E7%A1%80/media/14934132718311/003_SSH%20%E5%85%8D%E5%AF%86%E7%A0%81%E7%A4%BA%E6%84%8F%E5%9B%BE.png)

> 非对称加密算法
>
> - 使用 **公钥** 加密的数据，需要使用 **私钥** 解密
> - 使用 **私钥** 加密的数据，需要使用 **公钥** 解密

#### 2) 配置别名

每次都输入 `ssh -p port user@remote`，时间久了会觉得很麻烦，特别是当 `user`, `remote` 和 `port` 都得输入，而且还不好记忆

而 **配置别名** 可以让我们进一步偷懒，譬如用：`ssh mac` 来替代上面这么一长串，那么就在 `~/.ssh/config` 里面追加以下内容：

```
Host mac
    HostName ip地址
    User itheima
    Port 22
```

**保存之后，即可用 `ssh mac` 实现远程登录了，`scp` 同样可以使用**



## 配置软件源



## Vim 编辑器使用

### 常用命令

![vi](file:///E:/251%20Show%20me%20Code/%2310%20Python%E5%9F%BA%E7%A1%80/Linux%20%E5%9F%BA%E7%A1%80/media/14993340485745/vim.png)

- 查找单个单词: 光标移到单词上，按#(Shift + 3)
- 文件整理，调整格式：`gg=G`
- man 帮助查看： `K` 或者 `2K`
- 删除当前字母，变为插入模式：`s`
- 删除当前行，变为插入模式： `S`
- 保存退出：`ZZ` or `x`
- 分屏：`:vsp file` 

### Vim 配置
- 在系统环境设置当前shell环境下使用vim快捷键
    - `set -o vi`
- `/home/user/.vimrc` : 本用户的配置文件
    - 此处常用修改或者直接clone vimplus 
- `/etc/vim/vimrc`    : 系统vim配置文件


### Vim 插件
- mbbill /echofunc
- link: http://github.com/chxuan/vimplus





## c文件编译：gcc

### 编译过程
1. 预处理：gcc -E hello.c > hello.i
    - 头文件展开
    - 宏替换
2. 生成汇编： gcc -S hello.i hello.s
3. 编译成二进制文件: gcc -c hello.s hello.o
4. 链接：生成可执行文件: gcc -l hello.o hello
	- 调用ld

```c
#ifdef DEBUG
    printf("hello world");
#endif
```

### gcc 编译参数：

- `-I` : 包含头文件路径（可以绝对路径，可以相对路径）
- `-L` : 包含的库路径
- `-1` : 指定库名(通常libxx.so或者libxx.a : -lxxx)
    - gcc main.c -o app -I include/ -L lib/ -lxxx
- `-o` : 目标文件
- `-c` : 编译成.o文件
- `-g` : 用于gdb调试不加此意项不能gb调试
- `-Wall` :显示更多的警告
    - `w`   : 警告
    - `all` : 显示更多
- `gcc hello.c -D DEBUG` : 指定宏编译即
- `gcc hello.cpp -lstdc++` : 编译c+代码
- `-O` :优化选项，1-3越高优先级越高
- `-c` : 编译成`.o`文件
- `-E` : 输出到标准输出，宏替换，头文件展开
- `-S` : 编译成汇编语言

```
gcc add.c -I ./include/ -D DEBUG -o app -g -Wall -l 

gcc hello.cpp -lstdc++

```



## 静态库和共享库


![5e5876f0ffdcb1fc671773e3321ca852.png](:/c37c8a46bc55449b9de24e0bc1dea7ed)


### 库文件存在
- 商业目的
- 操作简单

### 制作静态库：
1. 编译成 `.o` 文件: `gcc -c hello.c`
2. 将`.o`文件打包为lib_name.a ：`ar rcs lib_name.a file1.o file2.o file3.o ....`
3. 将头文件与库一起发布

### 制作动态库
1. 编译 `.o` 文件，要求与位置无关，使用参数：`-fPIC`
2. 打包成 `.so`文件，参数：`-shared`
    - `gcc -shared -o libCalc.so *.o`
3. 发布库文件和头文件

### 使用：
- 编译 -L 指定路径， -l 指定库名，用法同静态库
- 执行的时候不能找到动态库的解决方法：
    - `ldd app` : 查看执行时库链接
    - 拷贝到系统的库路径下（不推荐）
    - 修改 `LD_LIBRARY_PATH` 环境变量，将库所在的路径添加到环境变量中，用冒号分割(新增环境变量不会影响原有环境变量)
    - `export LD_LIBRARY_PATH=/home/aaron/linux/cmd/Calc/lib/:$LD_LIBRARY_PATH` 执行一次，保留需要写入 `.bashrc`文件中。
    - 修改 `sudo vim /etc/ld.so.conf`, 添加库路径在该文件中, 执行`sudo ldconfig -v`

### 优缺点：
静态库：
- 执行快，发布应用时不需要发布库
- 体积大，库变更时需要重新编译应用
- 动态库与静态库优缺点相对互补，相对应。



## Makefile: c文件自动编译

### 一、好处：
- 一次编写，终身受益

### 二、命令规则：
- makefile
- Makefile

### 三、三要素：
- 目标
- 依赖
- 规则命令

### 四、写法：
```
目标：依赖
Tab键 + 规则命令
```

### 五、案例
第一版：
```
app: main.c add.c sub.c div.c mul.c
    gcc -o app -I ./include main.c add.c sub.c div.c mul.c
```
如果更改其中一个文件，所有的源码都重新编译。
- 可以考虑编译过程分解：先生成 `.o`文件，然后使用 `.o` 文件编译成结果

第二版：
```
# ObjFiles 定义目标文件
ObjFiles=main.o add.o sub.o div.o mul.o

# 目标文件用法：$(var)
app: $(ObjFiles)
    gcc -o app -I ./include main.o add.o sub.o div.o mul.o
    
main.o:main.c
    gcc -c main.c -I ./include

add.o:add.c
    gcc -c add.c -I ./include

sub.o:sub.c
    gcc -c sub.c -I ./include

div.o:div.c
    gcc -c div.c -I ./include

mul.o:mul.c
    gcc -c mul.c -I ./include
```
- makefile的隐含规则：默认处理第一个目标

递推规则：
依赖文件如果比目标文件新，则重新生成目标。

函数：
- wildcard : 可以进行文件匹配
- patsubst : 内容替换

变量：
- $@ ：代表目标
- $^ : 代表全部依赖
- $< : 第一个依赖
- $? : 第一个变化的依赖

第三版：
```
# get all .c files
SrcFiles=$(wildcard *.c)

# all .c files ---> .o files
ObjFiles=$(patsubst %.c, %.o, $(SrcFiles))

app: $(ObjFiles)
    gcc -o app -I ./include $(ObjFiles)
    
main.o:main.c
    gcc -c main.c -I ./include

add.o:add.c
    gcc -c add.c -I ./include

sub.o:sub.c
    gcc -c sub.c -I ./include

div.o:div.c
    gcc -c div.c -I ./include

mul.o:mul.c
    gcc -c mul.c -I ./include
    
test:
    echo $(SrcFiles)
```

第四版：
```
# get all .c files
SrcFiles = $(wildcard *.c)

# all .c files 2 o.files
ObjFiles = $(patsbust %.c, %.o, $(SrcFiles))

app:$(ObjFiles)
    gcc -o app -I ./include $(ObjFiles)

# 模式匹配规则： 变量$@ $< 等，只能在规则中出现
%.o:%.c
    gcc -c $< -I ./include -o $@

test:
    echo $(SrcFiles)
    echo $(ObjFiles)
```

第五版：增加清理功能
```
# get all .c files
SrcFiles = $(wildcard *.c)

# all .c files 2 o.files
ObjFiles = $(patsbust %.c, %.o, $(SrcFiles))

all:app

app:$(ObjFiles)
    gcc -o app -I ./include $(ObjFiles)

# 模式匹配规则： 变量$@ $< 等，只能在规则中出现
%.o:%.c
    gcc -c $< -I ./include -o $@

test:
    @echo $(SrcFiles)
    @echo $(ObjFiles)

# 定义伪目标，防止有歧义
.PHONY: clean, all

clean:
    # 
    -@rm -f *.o
    -@rm -f app
```

其他：
- `@` ：在规则前代表不输出该条规则的命令
- `-` : 规则前的`-`，代表该条规则报错，仍然继续执行
- `all` : 
- `.PHONY` : 定义伪目标，防止有歧义



## gdb 调试： c程序调试

### 一、使用gdb调试
- 编译时，加上 `-G`


### 启动gdb调试：
- `gdb app`
- `run`/`r` : 启动程序
- `start`   : 停留在main函数，分步调试
- `next`/`n`:继续执行
- `step`/`s` : 单步执行，
- `quit`/`q`: 退出gdb

### 设置启动参数：
- set args 10 6
- run 12 7

### 查看代码
- l(ist)      : 查看代码，默认显示10行
    - l ：显示主函数对应文件代码
    - l 文件名：行号

### 查看元素：
- p xxxxxxx : print xxxx 打印变量的值
- ptype xxx : print type xxx 打印变量的类型

### 设置断点：
- b(reak) 行号 : 主函数所在的文件行
- b 函数名
- b 文件名：行号

### 查看断点：
- info b       : 查看断点, 得到一个编号

### 删除断点：
- d(el) 编号   : 删除断点


### 跳转到一个断点:
- c(ontinue)   : 继续执行

### 设置变量的值
- set argc = 4
- set argv[1]="12"
- set argv[2]="7"

### 追踪变量：
- 显示变量的值，用于追踪，查看变量具体什么时候变化: display
- 删除显示变量: undisplay
- 查看编号: info display

### 设置条件断点：
- b line_num if i == 1

### gdb转移Core
设置生成Core : 
- ulimit -c unlimited


取消生成Core:
- ulimit -c 0


配置Core文件格式：
- 位置：`/proc/sys/kernel/core_pattern`
- `sudo echo "core-%e-%p-%t" > /proc/sys/kernel/core_pattern`
    - `su`
    - `echo "core-%e-%p-%t" > /proc/sys/kernel/core_pattern`



## 系统API与库函数的关系

FILE * stdout :
- fd : 文件描述符
- f_pos : 位置
- buffer : 8k
    - 何时刷新？
        - 手动刷新
        - fclose()
        - buffer 满了~

内核区：
- 虚拟文件系统
- 内存管理
- 进程管理
    - PCB进程控制块
    - ---> 结构体
    - ---> 文件描述符
        - 0 ： 标准输入 --- stdin
        - 1 :  标准输出 --- stdout
        - 2 ： 标准错误 --- stderr
        - 启动一个进程，系统默认打开上面三个文件描述符
- 设备管理


print("hello\n");
- >> write(1, "hello\n", 6)



## 文件IO

### open : man 2 open

一、函数原型: open, openat, creat - open and possibly create a file
```c
#includ <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int open(const char *pathname, int flags);
int open(const char *pathname, int flags, mode_t mode);

int creat(const char *pathname, mode_t mode);

int openat(int dirfd, const char *pathname, int flags);
int openat(int dirfd, const char *pathname, int flags, mode_t mode);
```

二、参数：
1. pathname
2. flags
- 必须参数(选一):
    - O_RDONLY : 只读
    - O_WRONLY : 只写
    - O_RDWR   : 读写
- 可选参数:
- O_APPEND : 追加
- O_CREAT  : 创建文件
- O_EXCL 与 O_CREAT 一起使用，如果文件存在，则报错
- mode 权限位，最终(mode & ~umask)
- O_NONBLOCK 非阻塞
- 返回值：返回最小的可用文件描述符, 失败返回`-1`, 设置errno


### close: man 2 close
一、函数原型: close a file descriptor
```c
#include <unistd.h>

int close(int fd);
```

二、参数
- 


### read: man 2 read
```c
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>

ssize_t_read(int fd, const void *buf, size_t_count);

```

二、参数
- fd: 文件描述符
- buf: 缓冲区
- size_t_count: 缓冲区大小
- 返回值：
    - 成功：返回读到的大小
    - 失败：返回-1，设置errno
    - 0   : 代表读到文件末尾
    - 非阻塞的情况下read返回-1，但是此时需要判断 `error`的值


### write: man 2 write

一、函数原型
```c
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>

```

二、参数
- fd: 文件描述符
- buf: 缓冲区
- size_t_count: 缓冲区大小
- 返回值：
    - 成功：返回读到的大小
    - 失败：返回-1，设置errno
    - 0   : 代表读到文件末尾
    - 非阻塞的情况下read返回-1，但是此时需要判断 `error`的值



三、实例：cat实现

```c
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>


int main(int argc, char *argv[)
{
    if(argc !== 2)
    {
        printf("./a.out filename\n")
        return -1;
    }
    
    int fd = open(argv[1], O_R)
}

```



## lseek

一、函数原型
```


```

二、参数
- fd : 文件描述符
- off_t : 
- whence
    - SEEk_SET: 开始位置
    - SEEk_CUR: 当前位置
    - SEEk_END: 结束位置
- 返回值：
    - 成功：返回当前位置到开始的长度
    - 失败：-1， 设置errno

三、作用
- 移动文件读写位置
- 计算文件大小
- 拓展文件


```
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main(int argc, char *argv{})
{
    if(argc != 2)
    {
        printf("./a.out filename\n");
        return -1;
    }
    
    // 1. open
    int fd = open(argv[1], O_RDONLY);
    
    // 2. lseek, get the return value 
    int ret = lseek(fd, 0, SEEK_END);
    printf("File size is %d\n", ret);
    
    // 3. close
    close(fd);
    return 0;
}
```



四、案例：创建文件并拓展文件

```
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/



```



## 阻塞的概念

一、概念：
- 函数在读取设备或者读取管道，或者读网络的时候，会产生阻塞
- 输入输出设备对应：`/dev/tty`

```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#incldue <fcntl.h>
#incldue <string.h>
#include <sys/types.h>


int main(int argc, char *argv[])
{
    # O_NONBLOCK 设置非堵塞状态
	int fd = open("/dev/tty", O_RDWR|O_NONBLOCK);

	char buf[256];
	int ret = 0;

	while(1)
	{
		ret = read(fd, buf, sizeof(buf));
		if(ret < 0)
		{
		    perror("read error;")
			printf("ret is %s\n", ret);
		}
		if(ret)
		{
			printf("buf is %s\n", buf);
		}
		printf("haha\n");
	}

	close(fd);
	return 0;
}
```



## fcntl 函数设置非阻塞

一、函数原型：manipulate file descriptor
```c
#include <unistd.h>
#include <fcntl.h>

int fcntl(int fd, int cmd, ... /* arg */ );
```

二、参数
- fd : 文件描述符
- cmd: 
    - F_GETFD(void)
    - F_SETFD(int): O_APPEND, O_ASYNC, O_DIRECT, O_NOATIME, and O_NONBLOCK flags

三、实现read()非阻塞功能
```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#incldue <fcntl.h>
#incldue <string.h>
#include <sys/types.h>


int main(int argc, char *argv[])
{
    # O_NONBLOCK 设置非堵塞状态
	int fd = open("/dev/tty", O_RDWR);
	
	int flags = fcntl(fd, F_GETFL);
	flags |= O_NONBLOCK;
	fcntl(fd, F_SETFL, flags);

	char buf[256];
	int ret = 0;

	while(1)
	{
		ret = read(fd, buf, sizeof(buf));
		
		
		if(ret < 0)
		{
		    perror("read error;")
			printf("ret is %s\n", ret);
		}
		if(ret)
		{
			printf("buf is %s\n", buf);
		}
		printf("haha\n");
	}

	close(fd);
	return 0;
}
```



四、作业：

1. 将静态库和动态库的制作写成makefile, wildcard通配时，也可以处理路径
2. 在一个目录创建两个C代码文件：hello.c world.c, 分别输出hello 和world, 要求编写makefile, 自动生成hello和world可执行文件
3. 实现mycp功能，拷贝一个文件（够大的文件,mp3文件）



## 虚拟地址空间



## stat() : man 2 stat
一、函数原型：
```
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int stat(const char *pathname, struct stat *buf);

// 接头体参数
struct stat{
    dev_t       st_dev;
    ino_t       st_ino;
    mode_t      st_mode;
    nlink_t     st_nlink;
    uid_t       st_uid;
    gid_t       st_gid;
    dev_t       st_rdev;
    off_t       st_size;
    blksize_t   st_blksize;
    blkcnt_t    st_blocks;
    
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
}

#define st_atime st_atim.tv_sec
#define st_mtime st_mtim.tv_sec
#define st_ctime st_ctim.tv_sev

struct timespec {
    __kernel_time_t tv_sec; //当前时间到1970.1.1.00:00:00的时间
    long tv_nsec; //纳秒
};

```

二、参数
- pathname      文件名
- buf           传出参数：定义一个结构体，传入其引用即可。
    - st_dev    设备ID
    - st_ino    索引节点编号
    - st_mode   文件类型权限：八进制
    - st_nlink  硬链接数
    - st_uid    用户ID
    - st_gid    组ID
    - st_rdev   特殊文件中的设备ID 
    - st_size   总尺寸
    - st_blksize块大小
    - st_blocks 块个数
    - st_atim   
    - st_mtim
    - st_ctim
- 返回值：
- 成功：返回0
- 失败：返回-1， 设置errno

st_mode:

1. 掩码处理：
- S_IFMT        0170000     bit mask for the file type bit field
- S_IFSOCK      0140000     socket
- S_IFLINK      0120000     symbolic link
- S_IFREG       0100000     regular file
- S_IFBLK       0060000     block device(设备文件)
- S_IFDIR       0040000     directory
- S_IFCHR       0020000     character device(字符设备)
- S_IFIFO       0010000     FIFO(管道)

> 0170000
- 0 : 八进制
- 17：

2. 宏处理：
- S_ISREG
- S_ISDIR
- S_ISCHR
- S_ISBLK
- S_ISFIFO
- S_ISLINK
- S_ISSOCK 



![b97c9a28fd6b96351a0c3e021624245e.png](:/64572fdb2f2c49b580a40a46f83882f4)





> 内容查找：
> grep -rn "struct timespec {" /usr/




### readlink
一、函数原型
```
#include <unistd.h>

z


```

二、参数
- 


三、






## 目录相关函数
### getcwd

一、函数原型
```
#include <unistd.h>


```

二、参数
- buf : 传出参数


### chdir : 
一、函数原型
```
#include <unistd.h>


```

二、参数
- path : 


三、实例

```
#include <stdio.h>
#include <unistd.h>


int main()
{
    // 切换工作目录
    chdir("bbb");
    
    int fd = open("temp", O_WRONLY|O_CREAT, 0666);
    write(fd, "dcociyiyou", 10);
    
    close(fd);
    // 显示当前工作目录
    char buf[256];
    getcwd(buf, sizeof(buf));
    
    printf("buf is [%s]\n", buf);
    return 0;
}

```

### mkdir: man 2 mkdir
一、函数原型: create a directory
```
#include <sys/stat.h>
#include <sys/types.h>

int mkdir(const char *pathname, mode_t mode);

```

二、参数
- pathname : 路径
- mode(mode && ~umask && 0777)
    - 注意权限：如果目录没有可执行权限，不可进入

三、实例
```
#include <sys/types.h>
#include <sys/stat.h>


int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        printf("./a.out dirname\n");
        return -1;
    }
    
    # 注意此处所给权限
    mkdir(argv[1], 0777);
    
    return 0;
}

```

### rmdir: man 2 rmdir

一、函数原型: delete a directory, which must be empty.
```
#include <unistd.h>

int rmdir(const char *pathname);

```

二、参数
- pathname : 
- 返回值：
    - 成功，返回0
    - 失败，返回-1

三、应用
&emsp;&emsp;统计一下指定目录下普通文件的个数，要求子目录递归统计。

bash shell:
```
find ./ -type f | wc -l
```
Program
```
#include <unistd.h>
#

int main()
{
    
}

```

### opendir: man 2 opendir
一、函数原型
```
#include <sys/types.h>
#include <dirent.h>

DIR *opendir(const char *name);
DIR *fdopendir(int fd);
```

二、参数
- name: 打开的目录
- 返回值：
    - 返回DIR* 的指针，指向目录项的信息


三、应用
```

```

### readdir: man readdir
一、函数原型
```
#include <dirent.h>

struct dirent *readdir(DIR *dirp);

int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result);
```

二、参数
- dirp : 传入参数，opendir 返回的指针
- 返回值
    - 读到目录项的内容
    - NULL 代表读到末尾或者错误


三、应用
```

```


### closedir: man closedir
一、函数原型
```
#include <unistd.h>



```

二、参数
- dirp : opendir


三、应用
```

```

### error 输出函数
一、函数原型
```
#include <string.h>

char *strerror(int errnum);
```

二、参数
- errnum : 错误代码
- 返回值：
- 

### dup2 :重定向
一、函数原型
功能：关闭 Newfd 对应的文件描述符，将newfd重新指向为oldfd对应的文件。
```
#include <unistd.h>

int dup(int oldfd);
int dup2(int oldfd, int newfd);

#define _GNU_SOURCE
#include <fcntl.h>
#incldue <unistd.h>

int dup3(int oldfd, int newfd, int flags);
```

二、参数
- oldfd: 旧文件描述符
- newfd: 新文件描述符
- 返回值：
    - 成功：新的文件描述符
    - 失败：-1, 并设置error

### dup: 复制文件描述符
一、函数原型: 
功能：新复制一个文件描述符指向oldfd对应的文件中。
```
#include <unistd.h>

int dup(int oldfd);
```

二、参数
- oldfd: 旧文件描述符
- 返回值：
    - 成功：新的文件描述符
    - 失败：-1, 并设置error


三、应用
实现突发奇想的功能，在代码中执行两次 `print("Hello world\n");`，一次输出到`hello`文件中，后一次输出到屏幕上。
```
#include <stdio.h>
#include <unistd.h>


int main()
{
    
    
    
    
    return 0;
}

```