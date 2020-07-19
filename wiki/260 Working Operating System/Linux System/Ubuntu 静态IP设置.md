# Ubuntu 静态IP设置 on VMware

首先，请安装Ubuntu on VMware，之后再设置静态IP。



## 前言

对虚拟机进行配置静态IP之后，具备诸多好处。故此，一般而言都会直接配置成为静态IP。



## 操作步骤

在 VMware 使用虚拟机过程中遇到的三个问题：

1.  如何修改虚拟机为静态 IP 并且生效；
2.  设置完静态 IP 后，无法上网；
3.  设置完静态 IP 且能上网后，宿主机无法 ping 通虚拟机；

那么，能够实现虚拟机使用静态 IP，且虚拟机能够上网以及和宿主机通讯吗？  
答案是肯定的，下面是相关的解决过程。

### 1. 默认网络随意，确保可以联网

VMware 在默认安装完成之后，会创建三个虚拟的网络环境：

-   VMnet0 ：桥接网络
-   VMnet1 ：Host-only
-   VMnet8 ：NAT

其中，NAT 表示 VMWware 内安装的 Ubuntu 将会在一个子网中，VMware 通过网络地址转换，通过物理机的 IP 上网。此时，确保虚拟机可以联网。



### 2. 查看主机网络

```bash
# Windows平台查看主机网络地址，默认网关
ipconfig
#################################
# IPV4: 192.168.3.36
# 默认网关：192.168.3.1
# Mac平台查看主机网络地址，默认网关
ifconfig
```



### 3. 设置 VMware

1、打开 VMware，在顶部依次选择：`编辑 `> `虚拟网路编辑器`，打开虚拟网路编辑器，并以管理员特权运行。

![image-20200719160802592](_resource/Ubuntu%20%E9%9D%99%E6%80%81IP%E8%AE%BE%E7%BD%AE/image-20200719160802592.png)



2、选定 **VMnet8**，然后去掉如下图中的 “**使用本地 DHCP 服务奖 IP 地址分配给虚拟机**”，同时，移除其他网络模式。

![image-20200719161042292](_resource/Ubuntu%20%E9%9D%99%E6%80%81IP%E8%AE%BE%E7%BD%AE/image-20200719161042292.png)

- 设置 **VMnet8** 子网IP：`192.168.3.0`
    - 与步骤二查询到的IP地址为同一网段，最后一位为 `0`

- 子网掩码为：`255.255.255.0`
    - 默认

- 因此，Ubuntu 中设置 IP 地址可以设置为 `192.168.8.x`，x 可以为 1~255。



3、选择 “**NAT 设置**”，打开 NAT 设置面板：

![image-20200719162805163](_resource/Ubuntu%20%E9%9D%99%E6%80%81IP%E8%AE%BE%E7%BD%AE/image-20200719162805163.png)

- 查看并设置网关地址：`192.168.3.2`
    - 最后一位为默认。



4、最后，在 VMWare 的虚拟机管理界面，选择 Ubuntu 的 “**编辑虚拟机设置**”，打开 Ubuntu 这个虚拟的设置界面。

- 选择网络适配器，然后确定网络连接选中的是 “自定义” 中的 VMnet8(NAT 模式)：  
    ![image-20200719163202061](_resource/Ubuntu%20%E9%9D%99%E6%80%81IP%E8%AE%BE%E7%BD%AE/image-20200719163202061.png)

5， VMWare 设置完毕。



### 4.  `resolvconf` 配置永久DNS

应用 `resolvconfig` 可以实现DNS信息管理。

1， 安装此组件：

```bash
sudo apt install resolvconf
```



2， 设置永久修改 DNS

```bash
vim /etc/resolvconf/resolv.conf.d/base
```

- 此处修改是防止重启 Linux 后 DNS 重置
- 若未安装 `resolvconf` 应用，那么，`resolv.conf.d` 文件夹将不存在。



3， 修改内容如下：

```bash
# 阿里的DNS
nameserver 223.5.5.5
nameserver 223.6.6.6
nameserver 8.8.8.8
```



#### 这里，临时设置 DNS

命令如下：

```bash
sudo vi /etc/resolv.conf
```

在里面填入所需的 DNS 即可。

```bash
......
nameserver 223.5.5.5
......
```

- 此处修改后，重启 Linux，DNS 将会重置



### 5. 设置 Ubuntu 网络

1， 打开 Terminal，配置静态 ip，命令如下：

```bash
sudo vi  /etc/network/interfaces
```

内容改为如下：

```bash
# 默认
auto lo
iface lo inet loopback

# 新增
auto ens33
iface ens33 inet static
address 192.168.3.100
netmask 255.255.255.0
gateway 192.168.3.2

dns-nameservers 223.5.5.5 223.6.6.6 8.8.8.8
```

- 若需要恢复之前的网络，在此处 **删除新增的内容** 即可。



### 6. 添加默认网关

```bash
# 查看网关
netstat -rn
##################################################################################
# Kernel IP routing table
# Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
# 169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 ens33
# 192.168.3.0     0.0.0.0         255.255.255.0   U         0 0          0 ens33
##################################################################################

# 查看路由
route

# 添加默认网关
route add default gw 192.168.3.2

# 查看网关
netstat -rn
##################################################################################
# Kernel IP routing table
# Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
# 0.0.0.0         192.168.3.2     0.0.0.0         UG        0 0          0 ens33
# 169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 ens33
# 192.168.3.0     0.0.0.0         255.255.255.0   U         0 0          0 ens33
##################################################################################
```

- 网上资料没有这一步，但是，个人经验需要这里添加一下默认网关。and do not tell me why?



### 7. 重启网络/重启

重启网络命令如下：

```bash
sudo /etc/init.d/networking restart
```

- 若重启不成功，只要VMware改为 `桥接模式直接连接物理网络`，勾选`复制物理网络连接状态`，再执行即可。而后需要再进行切换回 `自定义NAT8模式`。
- 因此，最好方法是直接重启 `reboot`。



## 验证

1.  在实体机上 ping 虚拟机；
2.  在虚拟机上 ping 实体机；
    - 反正我的是不通的。也不关心通不通。。。
3.  在虚拟机上 ping 外网地址，如：`ping www.baidu.com`



## Reference

| 序号 | 引用                                                         | 说明        |
| ---- | ------------------------------------------------------------ | ----------- |
| 1    | [VMware 中设置 Ubuntu 静态 IP 并可上网](https://blog.csdn.net/cgs1999/article/details/91416055) | `Framework` |
| 2    | [Linux 虚拟机设置静态 IP](https://www.jianshu.com/p/2e5fecf2a7df) | `Debug`     |
| 3    | [vmware 中设置 ubuntu 静态 ip](https://www.cnblogs.com/shanhm1991/p/9902568.html) | `Reference` |

