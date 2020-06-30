# Kubernetes 安装指引



## 一、环境准备

### 1. 设置主机名与时区

```
timedatectl set-timezone Asia/Shanghai  #都要执行

hostnamectl set-hostname master   #132执行
hostnamectl set-hostname node1    #133执行
hostnamectl set-hostname node2    #137执行
```

### 2. 添加hosts网络主机配置,三台虚拟机都要设置
```
vim /etc/hosts
192.168.163.132 master
192.168.163.133 node1
192.168.163.137 node2
```
### 3. 关闭防火墙，三台虚拟机都要设置，生产环境跳过这一步

```
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
systemctl disable firewalld
systemctl stop firewalld

# 互相检查节点之间的网络联通
ping node1
ping node2
ping master
```
- SELinux 为Linux系统提供的安全增强模块



## 二、安装Kubeadmin加载K8S镜像

### 1. 将镜像包上传至服务器每个节点
```
mkdir /usr/local/k8s-install
cd /usr/local/k8s-install

# XFTP上传安装文件 kubernetes-1.14
```


Kubernetes 安装包说明：

使用集群化管理工具对k8s镜像进行自动化部署

- Kube114-rmp.tar.gz: 集群管理工具
- docker-ce-18.09.tar.gz: docker 安装压缩包
- k8s-114-images.tar.gz: k8s 镜像

- flannel-dashboard.tar.gz: 监控集群状态



### 2. 在每个CentOS上安装Docker

```
# 解压：docker
tar -zxvf docker-ce-18.09.tar.gz
cd docker 
yum localinstall -y *.rpm

systemctl start docker
systemctl enable docker
```


### 3. 确保从cgroups均在同一个从groupfs

```
# 查看cgroups
docker info | grep cgroup

# Cgroup Driver: cgroupfs
```
- cgroups 是control groups的简称，它为Linux内核提供了一种任务聚集和划分的机制，通过一组参数集合将一些任务组织成一个或多个子系统。
- cgroups是实现IaaS虚拟化(kvm、lxc等)，PaaS容器沙箱(Docker等)的资源管理控制部分的底层基础。
- 子系统是根据cgroup对任务的划分功能将任务按照一种指定的属性划分成的一个组，主要用来实现资源的控制。
- 在cgroup中，划分成的任务组以层次结构的形式组织，多个子系统形成一个数据结构中类似多根树的结构。cgroup包含了多个孤立的子系统，每一个子系统代表单一的资源

如果不是groupfs,执行下列语句
```
cat << EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=cgroupfs"]
}
EOF

systemctl daemon-reload && systemctl restart docker
```

### 4. 安装kubeadm

- kubeadmin是集群部署工具
```
cd /usr/local/k8s-install/kubernetes-1.14

tar -zxvf kube114-rpm.tar.gz

cd kube114-rpm
yum localinstall -y *.rpm
```

### 5. 关闭交换区

```
swapoff -a
vi /etc/fstab

# swap 一行注释
```


### 6. 配置网桥

```
cat << EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
```

### 7. 通过镜像安装k8s

```
cd /usr/local/k8s-install/kubernetes-1.14

docker load -i k8s-114-images.tar.gz
docker load -i flannel-dashboard.tar.gz
```
k8s-114-images 镜像组件：

- kube-proxy： 容器间通讯的代理应用
- kube-apiserver：API服务端
- kube-controller-manager： 集群控制器
- kube-scheduler： 任务调度
- coredns： 每个节点的DNS组件
- etcd: 数据的存储模块
- pause：  每个POD中的独特容器



## 三、利用Kubeadm部署K8S集群

### 1. master主服务器配置
```
kubeadm init --kubernetes-version=v1.14.1 --pod-network-cidr=10.244.0.0/16

# to start using your cluster, you need to run the following as a regular user:
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

```
kubeadm 初始化：
- `--kubernetes-version`: 指明K8s版本
- `--pod-network-cidr`: 指明POD所生成虚拟IP范围（决定虚拟IP的边界）

`/etc/kubernetes/admin.conf`:
- 当前集群的核心配置文件， 包含了集群信息
- 授权信息
- master 节点的重要信息（IP...）



### 2. 检查配置：确保所有组建状态全部处于：**Running Status** 

```
# 查看所有节点信息
kubectl get nodes
# 查看存在问题的pod
kubectl get pod --all-namespaces
# 设置全局变量
# 安装flannel网络组件
kubectl create -f kube-flannel.yml
```
namespaces 节点状态：
CrashLoopBackOff:
- 一般而言，等待一会儿即可成功 to Running...
- 如长时间反复出现CrashLoopBackOff，代表硬件不够，增加CPU与内存资源即可。

flannel网络组件
- 通过此协议，解决底层跨主机，跨POD之间的传输问题



### 3. 加入NODE节点

```
kubeadm join 192.168.4.130:6443 --token 911xit.xkp2gfxbvf5wuqz7 \
    --discovery-token-ca-cert-hash sha256:23db3094dc9ae1335b25692717c40e24b1041975f6a43da9f43568f8d0dbac72
```
- 本语句由master 在初始化 `kebeadm init` 时，自动生成。
- 如果忘记，则需要执行以下操作：

1. 在master 上执行 `kubeadm token list` 查看 **Token**: `aoeout.9k0ybvrfy09q1jf6`
2. 在node 上运行:
```
kubeadm join 192.168.163.132:6443 --token aoeout.9k0ybvrfy09q1jf6 --discovery-token-unsafe-skip-ca-verification
```
- `discovery-token-unsafe-skip-ca-verification`: 不进行Token的安全校验。



### 4. 检测节点是否添加成功：

```
# 在 master 主机中查看节点状态
kubectl get nodes
```



***

至此，已经全部安装完成。以下为应用配置。

***



## 四、K8s 仪表盘

### 1. 开启仪表盘

```
kubectl apply -f kubernetes-dashboard.yaml
kubectl apply -f admin-role.yaml
kubectl apply -f kubernetes-dashboard-admin.rbac.yaml
```
### 2. 访问仪表盘

```
kubectl -n kube-system get svc
```

此时，可以访问仪表盘：http://192.168.3.128:32000