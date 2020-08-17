# CentOS6.5 Installation Guide on VMware

## Preface

1. 本教程为个人总结笔记，原则上仅用于自我二次查询使用。
2. 本教程仅对重要步骤配图及说明，未说明的步骤请选择默认判断 **下一步** 即可。
3. 若您有缘参考本教程，那么希望您对于本教程有任何不同意见，欢迎同笔者交流。
4. 由于诸多因素，并不能保证对于步骤设置的百分白准确实用，读者请自行判断，同时笔者也会更新不当之处。



## Configuration

1. OS :  **Win10**
2. VMware version: **15.5**
3. CentOS version:  **CentOS-6.5-x86_64-minimal**



## Operating Procedure

### 1. New create virtual machine to install CentOS 6.5

![install centos 6.5](_resource/CentOS6.5%20installation%20guide/install%20centos%206.5.png)



### 2. Skip Testing

![skip testing](_resource/CentOS6.5%20installation%20guide/skip%20testing.png)



### 3. Recommand to install English Version

![setting language](_resource/CentOS6.5%20installation%20guide/setting%20language.png)



### 4. 这里的磁盘大小原则上越大越好，同时，建议将选择 将虚拟磁盘存储为单个文件

- 磁盘大小设置后，并非立即占用，而是用多少占用多少（当然，这里是可以设置成立即占用的。）
- 磁盘划分为单个文件便于管理，同时也有助于性能。只是，大文件移动耗时。

![setting size](_resource/CentOS6.5%20installation%20guide/setting%20size.png)

### 5. 这里选择默认基础存储设备即可。后面会有弹窗，选择 Discard any data 即可。

![setting storage devices](_resource/CentOS6.5%20installation%20guide/setting%20storage%20devices.png)



![setting discard any data](_resource/CentOS6.5%20installation%20guide/setting%20discard%20any%20data.png)

### 6. 自定义磁盘布局

![setting custom layout](_resource/CentOS6.5%20installation%20guide/setting%20custom%20layout.png)

#### 6.1 新建存储

![setting custom layout - create new](_resource/CentOS6.5%20installation%20guide/setting%20custom%20layout%20-%20create%20new.png)

#### 6.2 配置 /boot 空间 200M

![setting custom layout - layout01](_resource/CentOS6.5%20installation%20guide/setting%20custom%20layout%20-%20layout01.png)

#### 6.3 配置交换空间 swap 2G（2048M）

![setting custom layout - layout02](_resource/CentOS6.5%20installation%20guide/setting%20custom%20layout%20-%20layout02.png)

#### 6.4 配置剩余空间：根目录下

![setting custom layout - layout03](_resource/CentOS6.5%20installation%20guide/setting%20custom%20layout%20-%20layout03.png)

#### 6.5 汇总所有空间布局如下：

![setting custom layout - layout all in](_resource/CentOS6.5%20installation%20guide/setting%20custom%20layout%20-%20layout%20all%20in.png)



### 7. Default Step for Next....





