# CentOS 静态IP 配置 on VMware

首先，请 [安装CentOS on VMware](CentOS6.5 installation guide.md)，之后再设置静态IP。



## 前言

对虚拟机进行配置静态IP之后，具备诸多好处。故此，一般而言都会直接配置成为静态IP。



## 操作步骤

### 1. 查看主机网络

```bash
# Windows平台查看主机网络地址，默认网关
ipconfig
#################################
# IPV4: 192.168.3.36
# 默认网关：192.168.3.1
# Mac平台查看主机网络地址，默认网关
ifconfig
```



### 2. 设置 VMware

1、打开 VMware，在顶部依次选择：`编辑 `> `虚拟网路编辑器`，打开虚拟网路编辑器，并以管理员特权运行。

![image-20200719160802592](_resource/CentOS%20%E9%9D%99%E6%80%81IP%E9%85%8D%E7%BD%AE/image-20200719160802592.png)



2、选定 **VMnet8**，然后去掉如下图中的 “**使用本地 DHCP 服务奖 IP 地址分配给虚拟机**”，同时，移除其他网络模式。

![image-20200719161042292](_resource/CentOS%20%E9%9D%99%E6%80%81IP%E9%85%8D%E7%BD%AE/image-20200719161042292.png)

- 设置 **VMnet8** 子网IP：`192.168.3.0`
    - 与步骤二查询到的IP地址为同一网段，最后一位为 `0`

- 子网掩码为：`255.255.255.0`
    - 默认

- 因此，Ubuntu 中设置 IP 地址可以设置为 `192.168.3.x`，x 可以为 1~255。



3、选择 “**NAT 设置**”，打开 NAT 设置面板：

![image-20200719162805163](_resource/CentOS%20%E9%9D%99%E6%80%81IP%E9%85%8D%E7%BD%AE/image-20200719162805163.png)

- 查看并设置网关地址：`192.168.3.2`
    - 最后一位为默认。



4、最后，在 VMWare 的虚拟机管理界面，选择 Ubuntu 的 “**编辑虚拟机设置**”，打开 Ubuntu 这个虚拟的设置界面。

- 选择网络适配器，然后确定网络连接选中的是 “自定义” 中的 VMnet8(NAT 模式)：  
  
    ![image-20200719163202061](_resource/CentOS%20%E9%9D%99%E6%80%81IP%E9%85%8D%E7%BD%AE/image-20200719163202061.png)

5， VMWare 设置完毕。



### 3. 配置静态IP地址 - `DEVICE=eth0`

1， 进入网络配置目录，并配置相应的静态IP地址等。


```bash
cd /etc/sysconfig/networks-scripts

# 编辑ifcfg-etho
vi ifcfg-eth0
```

> 默认的原始字符内容

```bash
DEVICE=eth0
HWADDR=08:0C:29:92:24:FC
TYPE=Ethernet
UUID=fb21c659-7b2f-45e5-966b-c80f729f584e
ONBO0T=no
NM_CONTROLLED=yes
BOOTPROTO=dhcp
```

> 编辑后的内容

```bash
DEVICE=eth0
# delete
# HWADDR=......
TYPE=Ethernet
# delete
# UUID=.....
# modify to yes
ONBOOT=yes
MM_CONTROLLED=yes
# modify to static
BOOTPROTO=static
# add blows contents
IPADDR=192.168.3.111
NETMASK=255.255.255.0
GATEWAY=192.168.3.2
DNS1=8.8.8.8
DNS2=114.114.144.114
```

- Delete字段
	- HWADDR
	- UUID
- Modify字段
	- ONBOOT
	- BOOTPROTO
- add contents增加的字段
	- `IPADDR` :  IP地址自行定义，网段依据本机的网段并修改
	- `NETMASH`：默认`255.255.255.0`
	- `GATEWAY`：依据步骤二进行设置网关。
	- `DNS1=8.8.8.8`：Google DNS
	- `DNS2=114.114.144.114`



### 4. 配置静态IP地址 - `ifcfg-en33`

> 此步骤与步骤三依据网络类型进行相应的修改。



1， 进入网络配置目录，并配置相应的静态IP地址等。

```bash
cd /etc/sysconfig/networks-scripts

# 编辑ifcfg-etho
vi ifcfg-eth0
```

> 修改后内容如下：

```bash
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="static"  # modify dhcp to static
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="ens33"
# UUID="f94a7719-74bd-420b-9845-d7fd96543039" # delete
DEVICE="ens33"
ONBOOT="yes"
# add blows contents
IPADDR=192.168.3.128
ENTMASK=255.255.255.0
GATEWAY=192.168.3.2
DNS1=8.8.8.8
DNS2=114.114.114.114

####################
PEERDNS=yes
PEERROUTES=yes
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes
```

- Delete字段
    - UUID
- Modify字段
    - BOOTPROTO
- add contents增加的字段
    - `IPADDR` :  IP地址自行定义，网段依据本机的网段并修改
    - `NETMASH`：默认`255.255.255.0`
    - `GATEWAY`：依据步骤二进行设置网关。
    - `DNS1=8.8.8.8`： Google DNS
    - `DNS2=114.114.144.114`



### 5. 重启网络服务

```
service network restart
```



## 验证

1.  在实体机上 ping 虚拟机；
2.  在虚拟机上 ping 实体机；
    - 反正我的不通的。也不关心通不通了。。。
3.  在虚拟机上 ping 外网地址，如：`ping www.baidu.com`



## 其他相关操作

### 6. 关闭防火墙

```
chkconfig iptables off
```



### 7.  删除物理地址

```
cd /etc/udev/rules.d

rm -rf 70-persistent-net.rules

shutdown 
```


