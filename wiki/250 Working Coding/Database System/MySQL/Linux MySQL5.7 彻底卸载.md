# MySQL彻底卸载 on CentOS

## 卸载步骤

### 1、查看mysql的安装情况

```
rpm -qa | grep -i mysql
```



### 2、删除上图安装的软件

```
rpm -ev mysql-community-libs-5.7.27-1.el6.x86_64 --nodeps
```



### 3、都删除成功之后，查找相关的mysql的文件

```
find / -name mysql
```



### 4、删除全部文件

```
rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/mysql
rm -rf /etc/logrotate.d/mysql
rm -rf /usr/share/mysql
rm -rf /usr/bin/mysql
rm -rf /usr/lib64/mysql
```

- 此处所示的文件夹为第三步所查找到的文件

    

### 5、再次执行命令

```shell
rpm -qa | grep -i mysql
```

- 没有显示则表示卸载完成