# Docker 最佳实践

## Content

- 讲解Docker原理与执行命令
- 讲解Docker-Compose快速部署Docker应用



## 一、容器化技术

历史演化： 物理机时代 ---> 虚拟机时代 ---> 容器化时代

### 1. 物理机时代

![e47b53614e5ca362c93f4270dc98efce.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/c313996ec5c046f09ab19b0b57550649.png)

- 部署非常慢
- 成本很高
- 资源浪费
- 难于扩展与迁移
- 受制于硬件



### 2. 虚拟化时代

![6b507c744054d0ef1a11134cf614d8d1.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/392c83f3f9fe4293bd9e166b0b8e8772.png)

优点：
- 多部署
- 资源池：硬件资源
- 资源隔离
- 很容易扩展

问题：
- VM需要安装操作系统：在操作系统层面浪费了资源



### 3. 容器化时代

![35db00d9b04989b8a9d9cf753a5ff2d4.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/ad0ab581112243efa7c2221c33e2f0be.png)

所解决的问题
- 打破开发与运维之间的资源配置链接
- 标准化地应用打包

应用场景
- 标准化的迁移方式
- 统一的参数配置
- 自动化部署
- 应用集群监控
- 开发与运维之间的沟通桥梁

阿里云/腾讯云的容器化应用

![f76c4b0cb374dafd071e4a1d957e53ee.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/b92d1f2f6e8c4dfe9da521604a45cc9f.png)



## 二、初识Docker

### 1. 基本介绍
- 开源的应用容器引擎，基于 Go 语言开发
- 容器是完全使用沙箱机制,容器开销极低
- Docker就是容器化技术的代名词	
- Docker也具备一定虚拟化职能

### 2. 发展过程

。。。



### 3. 基于 CentOS 的安装

#### 安装步骤
1. 安装工具包及必要组建
```
yum install -y yum-utils device-mapper-persistent-data lvm2
```
- `yum-utils`: yum工具安装包，简化安装过程中安装源的配置过程
- `device-mapper-persistent-data` && `lvm2`: Docker 所使用的数据存储驱动。

2. 设置安装软件源信息
```
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-cn/linux/centos/docker-ce.repo
```
- `yum-config-manager`: `yum-utils`所提供的修改安装源工具

3. 快速缓存下载
```
yum makecache fast
```
4. 安装Docker
```
yum -y install docker-ce
```
5. Docker 服务启动
```
service docker start
```
6. 查看版本
```
docker version
```
7. 参考文档
	- [阿里云 Docker CE 镜像](https://developer.aliyun.com/mirror/docker-ce?spm=a2c6h.13651102.0.0.3e221b11MoovBQ)



#### 配置阿里云加速服务

一、登录阿里云，进入**容器镜像服务 - 管理控制台**。


二、镜像加速器
```
https://16yagsawkrt.mirror.aliyuncs.com
```
- 每个人的镜像加速器不同，请不要出示
- 此处已进行混淆处理，请勿使用该字符

三、操作文档 CentOS

1. 安装/升级Docker客户端
2. 配置镜像加速器

```
# 创建文件夹
sudo mkdir -p /etc/docker

# 写入加速器地址
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://16yagsawkrt.mirror.aliyuncs.com"]
}
EOF
# 重载
sudo systemctl daemon-reload
sudo systemctl restart docker
```



#### 网络测试

```
# 拉取
docker pull hello-world

# 运行
docker run hello-world
```



## 三、Docker 基本概念


### 1. 容器化平台

Docker 提供应用打包，部署与运行应用的容器化平台

1. 应用程序
2. Docker Engine
3. 可用资源（物理机/虚拟机）

### 2. Docker 系统结构

1. Server - docker daemon
2. REST API
3. Clent - docker CLI
	- 2 && 3 采用标准http协议
	- CS 优势



容器与镜像

- 镜像：镜像是只读的文件。提供了运行程序完整的软硬件资源，是应用程序的“集装箱”。
- 容器：容器是镜像的实例。由Docker负责创建，容器之间彼此隔离。



### 3. Docker 执行流程

![4947b0623fb035b81c3e993b11ed2317.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/b3f612e530084ad7b85ad5e93e566ffd.png)

- docker client: 发送命令
- docker host: 接受命令并处理
- docker registry: 注册中心提供大量地镜像

- `docker pull`: 拉取镜像到本地
- `docker run`:创建并运行容器



## 四、Dcoker 常用命令

```
# 从远程仓库抽取镜像
docker pull image_name<:tags>
# 查看本地镜像
docker images
# 创建容器，启动应用（如果本地仓库没有镜像，那么会从远程仓库拉取后再运行应用)
docker run image_name<:tags>
# 查看正在运行的镜像
docker ps
# 删除容器
docker rm <-f> container_id
# 删除镜像
docker rmi <-f> image_name<:tags>
```

1. 在官方远程镜像仓库：[hub.docker.com](http://hub.docker.com)搜索镜像
	- Supported tags and respective `Dockerfile` links
	- Quick reference
	- What is xxx?
	- How to use this image?
	- License

2. 获取镜像，运行应用
```
# 查看本地镜像
docker images
# 拉取
docker pull tomcat
# 官网查看需要的版本
docker pull tomcat:xxx

docker run tomcat

docker run tomcat:xxx

docker run -p 8000:8080 tomcat
# 查看网络
netstat -tulpn
# -d 后台运行
docker run -p 8000:8080 -d tomcat
# 查看正在运行的镜像
docker ps

docker stop container_id

docker rm container_id

docker rm -f container_id

docker rmi image_name
```

### Docker 宿主机与容器通讯

使用端口映射：
1. 使用宿主机 8000 port 映射容器应用 tomcat Expose 8080
2. 对外始终暴露 宿主机IP & 8000 port



## 五、容器内部结构

1. 查看官方镜像信息
2. 内部结构

Tomcat:lastest
- Linux(Red Hat 4.8.5-28)
- Jdk(1.8.0-222)
- Apache Tomcat/8.5.46

在容器中执行命令
```
docker exec [-it] container_id 命令
```
- `exec`: 在对应容器中执行命令
- `-it`: 采用交互式方式执行命令
- 实例：`docker exec -it  /bin/bash`

```
# 查看本地文件
ls

# 查看Linux 版本
cat /proc/version

# 查看Java 版本
java -version

...
```

所有本地景象和容器存储目录：
```
/var/lib/docker
```



## 六、容器生命周期

![e7d2b9dab0a1573fc01d3fc8c8919397.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/593ba6c0acdd47a191353e1e2efddae7.png)

- 

```
# 拉取
docker pull hello-world

# 创建
docker create hello-world

# 查看所有镜像状态
docker ps -a

docker start xxx_id  # status: Up about ...

docker pause xxx_id  # status: Up about a minute(Paused)

docker unpause xxx_id  # status: Up about ...

docker stop xxx_id  # status: Exited 2 seconds ago

docker rm -f xxx_id
```



## 七、Dockerfile 构件镜像

### 1. Dockerfile镜像描述文件

- Dockerfile是一个包含用于组合镜像的命令的文本文档
- Docker通过读取Dockerfile中的指令按步自动生成镜像

命令：
```
docker build -t 机构/镜像名<:tags> Dockerfile目录
```
> 注意： Dockerfile文件名一定是`Dockerfile`.

案例：自定义构建tomcat webapp
```
# 设置基准镜像
FROM tomcat:lastest

# 说明机构
MAINTAINER abookworm.site

# 设置工作目录, 不存在则创建
WORKDIR /usr/local/tomcat/webapps

# 复制本地文件到远程文件
ADD docker-web ./docker-web
```

查看基准镜像工作目录
```
# 查看工作目录
docker ps

# 交互式运行
docker exec -it xxx_id /bin/bash

# 查看内部结构
ls
# 定位自定义目录
cd webapps
```

构建安装
```
# 切换目录
cd Dockerfile_dir

# 使用Dockerfile构建镜像 
docker build -t abookworm.site/mywebapp:1.0 .

# 运行
docker run abookworm.site/mywebapp:1.0
```
- docker build
	- `-t`: 机构名称 + 应用名称 + 版本号
	- `.`: 构建所定位的目录



### 2. 镜像分层（Layer)概念

层级
1. 镜像层：只读
2. 容器层：可读可写

Dockerfile执行过程分析
1. 按层堆叠执行
2. 构建临时容器，即保存快照



### 3. Dockerfile 基础命令

FROM - 基于基准景象

- `FROM centos`：制作基准镜像（基于centos:lastest)
- `FROM scratch`：不依赖任何基准镜像base image
- `FROM tomcat:9.0.22-jadk8-openjdk`

> 注意：尽量使用官方提供的 Base Image

LABEL & MAINTAINER - 说明信息
- `MAINTAINER abookworm.site`
- `LABEL version = "1.0"`
- `LABEL description = "壹书吊"`

WORKDIR - 设置工作目录
- `WORKDIR /usr/local`
- `WORKDIR /usr/local/newdir`：自动创建

> 注意：尽量使用绝对路径

ADD & COPY - 复制文件

- `ADD hello /` ：复制到根路径
- `ADD test.tar.gz /` ：添加根目录，并自动解压
- ADD 除了复制，还具备添加远程文件功能

ENV - 设置环境变量
- `ENV JAVA_HOME /usr/local/openjdk8`
- `RUN ${JAVA_HOME}/bin/java - java test.jar`

> 注意：尽量使用环境变量，可提高程序维护性



### 4. Dockerfile 执行命令

1. `RUN`: 在 Build 构建时执行命令
2. `ENTRYPOINT`: 容器启动时执行命令
3. `CMD`: 容器启动后执行默认的命令或参数

三命令执行时机不同：
| 执行时机              | 执行命令                               |
| --------------------- | -------------------------------------- |
| docker build 创建镜像 | RUN 执行，在构建镜像时执行命令         |
| docker run 创建容器   | CMD & ENTRYPOINT，在容器创建时执行命令 |



#### RUN - 构建时运行

两种运行方式格式：
- Shell 命令格式： `RUN yum install -y vim`
- Exec 命令格式：  `RUN ["yum", "install", "-y", "vim"]`

Shell运行方式：
- 使用Shell执行时，当前shell是父进程，生成一个子shell进程
- 在子shell中执行脚本。脚本执行完毕，退出子shell，回到当前shell。


Exec 运行方式：
- 使用Exec方式，会用Exec进程替换当前进程，并且保持PID不变
- 执行完毕，直接退出，并不会退回之前的进程环境



#### ENTRYPOINT 启动命令

- `ENTRYPOINT`(入口点)用于在容器启动时执行命令
- Dockerfile中只有最后一个ENTRYPOINT会被执行
- `ENTRYPOINT ["ps"]`：推荐使用Exec格式



#### CMD 默认命令

- CMD用于设置默认执行的命令
- 如Dockerfile中出现多个CMD,则只有最后一个被执行
- 如容器启动时附加指令,则CMD被忽略
- `CMD ["ps" , "-ef"]`: 推荐使用Exec格式



案例1：

1. 创建文件
```
FROM centos
RUN ["echo", "Image building..."]
CMD ["echo", "container starting... "]
```

2. 构建镜像
```
docker build -t abookworm.site/docker_run_cmd .
```
- print Out: Image building...

3. 启动容器 + 仅镜像名
```
docker run abookworm.site/docker_run_cmd
```
- print out:container starting...

4. 启动容器 + 执行命令
```
docker run abookworm.site/docker_run_cmd ls
```
- print Out: 当前文件夹内的所有内容，即`ls`内容



案例2:

```
FROM centos
RUN ["echo", "Image building..."]
ENTRYPOINT ["echo", "container starting... "]
```
- 此文件操作后，效果同案例1.



案例3:

1. 创建文件
```
FROM centos
RUN ["echo", "Image building..."]
ENTRYPOINT ["echo", "container starting... "]
ENTRYPOINT ["ps"]
CMD ["-ef"]
```

2. 构建镜像
```
docker build -t abookworm.site/docker_cmd_entrypoint .
```
- print Out: Image building...

3. 启动容器 + 仅镜像名
```
docker run abookworm.site/docker_cmd_entrypoint
```
- print out:`ps -ef`命令效果
- entrypoint 命令为命令入口，两行命令仅会执行最后一行命令

4. 启动容器 + 执行命令
```
docker run abookworm.site/docker_cmd_entrypoint -aux
```
- print Out: `ps -aux`命令效果
- 此时，cmd 命令所携带的参数被替换。



## 八、案例：构建Redis镜像

1. 创建文件
```
FROM centos
RUN ["yum", "install", "-y", "gcc", "gcc-c++", "net-tools", "make"]
WORKDIR /usr/local
ADD redis-4.0.14.tar.gz
WORKDIR /usr/local/redis-4.0.14/src
RUN make && make install
WORKDIR /usr/local/redis-4.0.14
ADD redis-7000.cnf
EXPOSE 7000
CMD ["redis-server", "redis-7000.conf"]
```

2. 创建镜像
```
docker build -t abookworm.site/myredis:4.0.14 .
```

3. 运行
```
docker run -p 7000:7000 abookworm.site/myredis:4.0.14
```

4. 验证端口检测
```
netstat -tulpn
```
- 7000 端口：docker-proxy

5. 验证内部执行
```
docker exec -it contain_id /bin/bash
```



## 九、 容器间通讯

### 1. 容器间Link单向通讯

容器间的单向访问：
- 虚拟IP
- 容器名称

```
# 运行 databases
docker run -d --name database -it centos /bin/bash

# 运行 web 并连接database
docker run -d --name web --link database tomcat

# 查看运行状态
docker ps

# 查看单个容器信息
docker inspect 9814e5509196
docker inspect 426dcefc5dc2

# 此时可以直接互相ping ipaddress

# 进入 web 内部交互
docker exec -it 426dcefc5dc2 /bin/bash

# 查看是否连接, 既web单向通讯database
ping database
```
- `docker inspect container_id`： 查看运行容器的相关信息
	- NetworkSettings: IPADDRESS



### 2. Bridge网桥双向通信

![bb1ee00051d9aa05714eb02b4a237649.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/e6ecbf93ba2e4faeb055af46ce683c61.png)


```
# 运行 databases
docker run -d --name database -it centos /bin/bash

# 运行 web 并连接database
docker run -d --name web tomcat

# 查看运行状态
docker ps

# 查看单个容器信息
docker inspect 9814e5509196
docker inspect b33aebe5a67a

# 查看容器网络状态
docker network ls

# 创建子定义网桥
docker network create -d bridge my-bridge

# 查看子定义网桥
docker network ls

# 创建互通网桥
docker network connect my-bridge web
docker network connect my-bridge database

# 进入 web 内部交互
docker exec -it b33aebe5a67a /bin/bash
# 查看是否连接, 既web单向通讯database
ping database

# 进入 database 内部交互
docker exec -it 9814e5509196 /bin/bash
# 查看是否连接
ping web
```



#### 网桥实现原理

![41754e918434b1c4185872ef5c29b924.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/b1066a21b532442a92233b15abb5b770.png)



### 3. Volume 容器间共享数据

#### 数据共享的需要

#### Volume 挂载操作

![86d474890662ea539ba98599a0e609f9.png](_resource/Docker%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/2217dccfdc8c44c5863e6ea8997e31d7.png)

1. 设置 `-v` 挂载宿主机目录
```
docker run --name container_name -v 宿主机目录：容器内挂载路径 镜像名
```
- `docker run --name t1 -v /usr/webapps:/usr/local/tomcat/webapps tomcat`

2. 设置 `--volumes-from` 共享容器内挂载点
```
# 创建共享容器
docker create --name webpage -v /webapps:/tomcat/webapps tomcat /bin/true

# 共享容器挂载点
docker run --volumes-from webpage ==name t1 -d tomcat
```