

# MySQL5.7 安装教程 on CentOS

## 安装准备

### 更换yum源, 加速下载

> 此处设置选择的是阿里云镜像，如果可以建议使用测试工具测试以下最好的Linux镜像地址。
>
> - 按照之前的经验，阿里云镜像使用的是国内电信运营商，速度很快
> - 而在家里面的联通运营商使用阿里云镜像速度一般，相反选择xx镜像（忘了>__<）速度很快。

1、打开 [mirrors.aliyun.com](http://mirrors.aliyun.com)，选择centos的系统，点击帮助

2、执行命令：`yum install wget -y`

3、改变某些文件的名称

```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```

4、执行更换yum源的命令

```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
```

5、更新本地缓存，并更新库文件

```bash
# clean all
yum clean all
yum makecache

# update yum source
yum update -y
```



## 安装步骤

### 1、查看系统中是否自带安装mysql

```shell
yum list installed | grep mysql
```



### 2、删除系统自带的mysql及其依赖（防止冲突）

```shell
yum -y remove mysql-libs.x86_64
```

- 需要删除步骤一所查询到的所有结果
- 一般系统都会自带有MySQL服务



### 3、使用 `rpm` 文件安装

#### 安装wget命令

```
yum install wget -y 
```



#### 给CentOS添加rpm源，并且选择较新的源

```
wget dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
```



#### 安装下载好的rpm文件

```
 yum install mysql-community-release-el6-5.noarch.rpm -y
```

- 安装成功之后，会在 `/etc/yum.repos.d/` 文件夹下增加两个文件
    - `mysql-community.repo`
    - `mysql-community-source.repo`



#### 修改 `mysql-community.repo` 文件

原文件：

![1570542415955](_resource/Linux%20MySQL5.7%20%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B/1570542415955.png)

修改之后：

![1570542471948](_resource/Linux%20MySQL5.7%20%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B/1570542471948.png)



### 4、使用yum安装mysql

```
yum install mysql-community-server -y
```



> 步骤三和步骤四任选其一即可。

### 5、启动mysql服务并设置开机启动

```shell
#启动之前需要生成临时密码，需要用到证书，可能证书过期，需要进行更新操作
yum update -y
#启动mysql服务
service mysqld start
####################################################################
#Initializing MySQL database:                               [  OK  ]
#Starting mysqld:                                           [  OK  ]
####################################################################
#设置mysql开机启动
chkconfig mysqld on
```

- `service mysqld start` : 
    - 若直接开启服务，有可能启动失败。此时可以查看 `/var/log/mysqld.log` 文件以确认错误
    - `TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option`：
        - 此时在 `/etc/my.conf` 文件中添加一行：`explicit_defaults_for_timestamp = 1` 即可。
    - `Could not generate RSA private key required for X509 certificate.`  
        - 此时需要更新证书：`yum update -y`
    - `--initialize specified but the data directory has files in it. Aborting.`
        - 此时需要删除 `/var/lib/mysql` 中所有的文件：`rm -rf /var/lib/mysql/*`



### 6、获取mysql的临时密码

```shell
grep "password" /var/log/mysqld.log
```



### 7、使用临时密码登录

```shell
mysql -uroot -p
# 输入密码
```



### 8、修改密码

```sql
set global validate_password_policy=0;
set global validate_password_length=1;
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
```



### 9、修改远程访问权限

```sql
grant all privileges on *.* to 'root'@'%' identified by '123456' with grant option;
flush privileges;
```



### 10、设置字符集为utf-8

```shell
#在[mysqld]部分添加：
character-set-server=utf8
#在文件末尾新增[client]段，并在[client]段添加：
default-character-set=utf8
```

