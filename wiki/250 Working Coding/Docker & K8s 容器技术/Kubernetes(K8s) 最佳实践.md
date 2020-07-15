# Kubernetes(K8s) 最佳实践



## 一、容器编排及K8s介绍

容器编排：
- 在哪些宿主机上安装什么容器，以及这些容器以什么样的方式进行通讯和被管理

单机编排工具：
- docker compose

集群编排工具：
- docker swarm
- kubernetes

## Kubernetes 功能职责

- 自动化容器的部署和复制
- 随时扩展或收缩容器规模
- 容器分组Group，并且提供容器间的负载均衡
- 实时监控, 即时故障发现, 自动替换



## K8s 基本概念

![02a2478080477cf263c76ad4fed394ad.png](_resource/Kubernetes(K8s)%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/0b021a05b17c40b781939f945d41778a.png)



1. Kubernetes Master(K8s 主节点)
- 集群管理者，主服务器
- 向其他节点发送指令：创建容器，自动部署，自动发布...
- 接受外部请求，并分发到各个子节点

2. Node
- K8s 子节点，可是独立的物理机，也可是虚拟机
- 负责执行主节点发送过来的指令

3. POD
- K8s 控制的最小可部署单元,一个POD就是一个进程，拥有独立资源。
- POD 是”容器”的容器,可以包含多个”Container”
- POD 内部容器网络互通,每个POD都有独立虚拟IP，并由K8s统一管理
	- 其内部实现通过 Service 进行通讯实现
- 不同业务POD的分隔粒度不同
	- POD 部署完整的应用或模块
	- POD 部署某一个职能

4. Pause容器（POD内部)
- 提供共享匿名空间：
	- 而后应用访问之间可以直接采用 localhost:port 形式完成彼此访问
	- 不同应用之间仅有不同的端口加以区分
- 提供共享挂载数据卷 volume
	- 容器内部共享数据卷

5. Lable
- 说明性的标签
- 每一个POD的别名

6. Replication Controller 复制控制器
- Pod实施响应，并自动控制节点数量


7. 应用底层
- Kubernete： K8s 的核心指令控制
- kuber-proxy
	- 多主机之间的通讯
- docker


## Kubernetes 安装

国内安装的四种途径：
- 使用kubeadmin通过离线镜像安装 ---> 推荐
- 使用阿里公有云平台k8s,钞能力 ---> 购买
- 通过yum官方仓库安装,上古版本 ---> 版本旧
- 二进制包的形式进行安装,kubeasz (github) ---> 第三方，非官方


环境准备：
- Centos 7 Master * 1
   - Master: 192.168.163.132
- Centos 7 Node * 2
   - Node1: 192.168.163.133
   - Node2: 192.168.163.137


## 重启服务

kubeadm/kubelet/kubectl区别

- kubeadm 是kubernetes集群快速构建工具
- kubelet 运行在所有节点上,负责启动POD和容器,以系统服务形式出现
- kubectl: kubectl是kubenetes命令行工具,提供指令

启动节点命令
- 启动节点的K8S服务：`systemctl start kubelet`
- 设置开机启动：`systemctl enable kubelet`

## 启用Web UI Dashboard

配置文件：
- `kubernetes-dashboard.yaml`：仪表盘的配置，基础配置
- `admin-role.yaml`：管理员角色职能
- `kubernetes-dashboard-admin.rbao.yaml`：基于角色的访问控制

开启仪表盘
```
kubectl apply -f kubernetes-dashboard.yaml
kubectl apply -f admin-role.yaml
kubectl apply -f kubernetes-dashboard-admin.rbac.yaml

```

访问仪表盘控制台
```
kubectl -n kube-system get svc
```
- 访问地址：http://192.168.163.132:32000

## 案例：Dashboard部署Tomcat集群

1. 定义各个节点的阿里云镜像服务
2. 仪表盘工作负载：


## Deployment 脚本部署 Tomcat 集群

Deployment(部署)
- 部署是指Kubernetes向Node节点发送指令，创建容器的过程
- Kubernetes支持yml格式的部署脚本
```
#创建部署
kubectl create -f 部署yml文件
```

Deployment 部署脚本
```yml
apiVersion:extensions/vlbetal				# 版本，一般固定
kind:Deployment								# 用途：部署
metadata:
	name:tomcat-deploy						# 名称
spec:
	replicas:2								# 部署数量
	template:
		metadata:
		labels:
			app:tomcat-cluster
		spec:
			containers:
			- name:tomcat-cluster			# 一般与app同名
			  image:tomcat  				# 镜像来源
			  ports:
			  - containerPort:8080			# 暴露端口

```

部署相关命令：

```
# 创建部署
kubectl create -f 部署yml文件
# 更新部署配置
kubectl apply -f 部署yml文件
# 查看已部署pod
kubectl get pod [-o wide]
# 查看Pod详细信息
kubectl describe pod pod名称
# 查看pod输出日志
kubectl logs [-f] pod名称
```


> tomcat-deploy.yml
```yml
apiVersion: extensions/v1beta1
king:Deployment
metadata:
  name: tomcat-deploy
spec:
  replicas:2
  template:
    metadata:
      labels:
        app: tomcat-cluster
    spec:
      containers:
      - name: tomcat-cluster
        image: tomcat:latest
        ports:
        - containerPort: 8080
```

```
# 创建部署
kubectl create -f ./tomcat-deploy.yml

# 查看部署情况
kubectl get deployment

# 列出所有POD，
kebectl get pod -o wide

# 查看pod详细信息
kubectl describe pod pod_name

# 查看日志内容
kubectl logs po_name
```



## 外部访问Tomcat 集群

Service 服务用于对外暴露应用：

![5e2a3531f1df1f6fc7e11107c0df1435.png](_resource/Kubernetes(K8s)%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/6a3b395981b04ce9a2d2c6780f2ecbfc.png)

1. 使用集群对宿主机暴露的端口统一访问
2. 宿主机的IP访问，此时集群负载均衡功能失效

通过宿主机IP访问：
1. 创建YML脚本
> tomcat-service.yml
```yml
apiVersion: v1
kind: Service
metadata:
  name: tomcat-service				# 显示
  labels:
    app: tomcat-service 			# POD 选择
spec:
  type: NodePort
  selector:
    app: tomcat-cluster 			# 绑定部署的 tomcat-cluster 标签
  ports:
  - port: 8000						# 对外访问port
    targetPort: 8080				# 容器端口映射
    nodePort: 32500					# 宿主机node端口映射
```
2. 创建对应服务，并提供Node宿主机访问
```
kubectl create -f ./tomcat-service.yml

kubectl get service

kubectl describe service tomcat-service
```

### 基于NFS文件文件集群共享

NFS ：Network File System
- SUN 公司研发的文件传输协议
- 主要采用远程过程调用RPC机制实现文件传输

安装NFS
```
yum install -y nfs-utils rpcbind
```

集群文件共享

![a235bcaa28b5c2a5168577de88ba21f1.png](_resource/Kubernetes(K8s)%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/fe7dd4f26de14b29ab94cf4f1049806b.png)

共享宿主机设置

1. 设置对外共享文件夹
```
vim /etc/exports
```
> exports
```
# 设置共享文件夹位置，IP，权限，以及同步写
/usr/local/data/xxx IP/24(rw, sync)
```

2. 启动相应服务并设置开机启动
```
# 启动NFS服务
systemctl start nfs.service
# 启动RPC服务
systemctl start rpcbind.service
# 设置开机启动
systemctl enable nfs.service
systemctl enable rpcbind.service

# 查看共享文件夹设置内容：位置 + IP/port
exportfs
```

POD 节点共享文件夹设置

1. 安装nfs工具集
```
yum install -y nfs-utils
```

2. 查看可访问的共享文件夹
```
showmount -e 192.168.163.132
```
3. 挂在到 `/mnt`
```
mount 192.168.163.132:/usr/local/data/xxx /mnt
```
4. 设置开机启动
```
systemctl enable nfs.service
```

将 POD 节点文件夹映射到 NODE 节点文件夹

```
# 查看集群部署
kubectl get deployment

# 删除集群部署
kubectl delete deployment tomcat-deploy

# 查看节点信息
kubectl get pod

# 查看集群服务
kubectl get service

# 删除集群服务
kubectl delete service
```


> tomcat-deploy.yml
```
apiVersion: extension/v1beta1
kind: Deployment
metadata:
  name: tomcat-deploy
spce:
  replicas:2
  template:
    metadata:
      labels:
        app: tomcat-cluster
    spec:
      volumes:
      - name: web-app
        hostPath:
          path: /mnt
      containers:
      - name: tomcat-cluster
        image:tomcat:latest
        ports:
        - containerPort: 8080
        volumeMounts:
        - name: web-app
          mountPath: /usr/local/tomcat/webapps				# 挂载地址
```
部署主节点：
```
kubectl create -f tomcat-deploy.yml

kubectl get deloyment


kubectl get pod -o wide

```

验证是否部署成功：
1. 进入Node节点，并查看Node节点中挂在的文档
```
docker ps


docker exec -it image_id /bin/bash

ls

cd webapps/

ls

cat file.txt
```

2. 直接在 Master 中进入节点内容进行验证

```
# 获取pod_name
kubectl get pod -o wide

# 进入
kubectl exec -it pod_name /bin/bash
```


### 利用Rinetd实现Service 负载均衡

```
# 查看目前的服务
kubectl get service

# 
# kubectl delete service tomcat-service
```
> tomcat-service
```
apiVersion:v1
kind: Service
metadata:
  name: tomcat-service
  labels:
    app: tomcat-service
spec:
  # type: NodePort
  selector:
    app: tomcat-cluster
  ports:
  - port: 8000
    targetPort: 8080
    # nodePort:32500
```


```
kubectl create -f tomcat-service.yml


kubectl get service

kubectl describe service tomcat-service

curl IP:8000

kubectl get service
```

设置 端口 转发

端口转发工具 Rinetd

链接跳转：


### K8s 部署调整命令


```
# 更新集群配置
kubect apply -f yum文件路径

# 删除部署及服务
kubectl delete deployment/service
```

资源限定

```
containers:
  - name: tomcat-cluster
    image: tomcat:latest
    resources:
      requests:						# 最低需求
        cpu:1						# CPU资源可以为0.5，单位为核
        memory:500Mi
      limits:						# 最多使用资源
        cpu:2
        memory:1024Mi
```

更新
> tomcat-deploy.yml
```
apiVersion: extension/v1beta1
kind: Deployment
metadata:
  name: tomcat-deploy
spce:
  replicas:3
  template:
    metadata:
      labels:
        app: tomcat-cluster
    spec:
      volumes:
      - name: web-app
        hostPath:
          path: /mnt
      containers:
      - name: tomcat-cluster
        image:tomcat:latest
        resources:
          requests:
            cpu: 0.5
            memory: 200Mi
          limites:
            cpu: 1
            memory: 512Mi
        ports:
        - containerPort: 8080
        volumeMounts:
        - name: web-app
          mountPath: /usr/local/tomcat/webapps				# 挂载地址
```

更新配置
```
kubectl get deployment

kubectl apply -f tomcat-service.yml

kubectl get pod -o wide
```
- K8s在分配资源的时候，采用**可用资源优先**的原则。即那个服务器的负载低，就部署在那个POD上
- 当然，我们也可以制定在那个POD上分配容器


## 项目实战：K8s构建贝亲婴童商城

项目拓扑结构：

![d6b280c7a5d7bedaca9b62f6e7a8f648.png](_resource/Kubernetes(K8s)%20%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/edd31f2afc324570bc29c09c65b9448f.png)

### 1. 挂载共享文件



### 2. 部署并初始化数据库

> beiqin-db-deploy.yml
```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: beiqin-db-deploy
spec:
  replicas:1
  template:
    metadata:
      labels:
        app: beiqin-db-deploy
    spec:
      volumes:
      - name: beiqin-db-deploy
        hostPath:
          path: /usr/local/beiqin-sql
      containers:
      - name: beiqin-db-deploy
        image: mysql:5.7
        ports:
        - containerPort: 3306
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "root"
        volumeMounts:
        - name: beiqin-db-volume
          mountPath: /docker-entrypoint-initdb.d
```

```
kubectl create -f beiqin-db-deploy.yml

kubectl get pod

kubectl exec -it xxxx_name /bin/bash

# 进入数据库
mysql -uroot -p

show databases

use beinqin;

show tables;

....
##############
```

```
vim beiqin-db-service.yml
```

```
apiVersion: v1
kind: Service
metadata:
  name: beiqin-db-service
  label:
    app: beiqin-db-service
spec:
  selector:
    app: beiqin-db-deploy
  ports:
  - port: 3310
    targetPort: 3306
```

```
kubectl create -f beqin-db-service.yml

# kubectl get service
kubectl get svc

kubectl describe service beiqin-db-service
```


### 部署web应用

```
kubectl get service
```

```
vim beiqin-app-deploy.yml
```

```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: beiqin-app-deploy
spec:
  replicas:2
  template:
    metadata:
      labels:
        app: beiqin-app-deploy
    spec:
      volumes:
      - name: beiqin-app-deploy
        hostPath:
          path: /usr/local/beiqin-dist
      containers:
      - name: beiqin-app-deploy
        image: openjdk:8u222-jre
        command: ["/bin/sh"]
        args: ["-c", "cd /usr/local/beiqin-dist; java -jar beiqin-app.jar"]
        volumesMounts:
        - name: beiqin-app-volume
          mountPath: /usr/local/beiqin-dist
```

```
kubectl create -f beiqin-app-deploy.yml

kubectl get pod

kubectl logs xxxx_name
```

```
kubectl get pod -o wide

curl IP:88/goods?gid=1788

vim /usr/local/beiqin/dist/application.yml

```

```
server:
  port: 80
spring:
  datasource:
    driver-class-name: com.mysql.jdbc.Driver
    url: jdbc:mysql://beiqin-db-service:3310/beiqin?useUnicode=true&characterEncodeing=utf-8&useSSL=false
    username:root
    password:root
  mvc:
    favicon:
      enabled: false
mybatis:
  mapper-locations: classpath:/mapper/*.xml
  configuration:
    map-underscore-to-camel-case:true
```

```
kubectl delete deployment beiqin-app-deploy.yml

kubectl create -f beiqin-app-deploy.yml

kubectl get pod -o wide
```

## 配置 app service


```
vim beiqin-app-service.yml
```

> beiqin-app-serive.yml
```



```

```
kube create -f beiqin-app-service.yml


kubectl describe service beiqin-app-service

```
- 查看对外IP

## 配置 外部访问

```
vim /etc/rinetd.cnf
```

> rinetd.cnf
```
0.0.0.0 80 IP 80
```

