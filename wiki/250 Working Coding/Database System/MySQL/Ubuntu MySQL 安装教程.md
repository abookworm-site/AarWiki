# Ubuntu MySQL 安装

## MySQL服务端安装

安装服务端

```shell
sudo apt-get install mysql-server
```



查看mysql服务进程

```shell
ps ajx|grep mysql
```



启动服务

```shell
sudo service mysql start
```



停止服务

```shell
sudo service mysql stop
```



重启服务

```shell
sudo service mysql restart
```



## MySQL服务端配置

- 配置文件目录为`/etc/mysql/mysql.cnf`



- 进入conf.d目录，打开mysql.cnf，发现并没有配置
- 进入mysql.conf.d目录，打开mysql.cnf，可以看到配置项



- 主要配置项如下

```
bind-address表示服务器绑定的ip，默认为127.0.0.1

port表示端口，默认为3306

datadir表示数据库目录，默认为/var/lib/mysql

general_log_file表示普通日志，默认为/var/log/mysql/mysql.log

log_error表示错误日志，默认为/var/log/mysql/error.log
```



## MySQL客户端安装

### 命令行客户端

1. 安装MySQL客户端

```shell
sudo apt-get install mysql-client
```



2. 连接服务端数据库

```shell
mysql -u root -p mysql
```



3. 退出

```
quit 或者 exit
```

- 按`ctrl+d`亦可退出



4. 查看帮助文档

```
mysql --help
```



### 图形化界面客户端Navicat