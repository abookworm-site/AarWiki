# MySQL重置密码 on Ubuntu

## Background

- 无意中遗忘 MySQL 密码
- 无意中设置 MySQL `root` 用户安全保护



## 操作步骤

### 1. 修改配置，绕过MySQL密码登录验证

进入 MySQL 的配置目录 `/etc/mysql/mysql.conf.d/mysqld.cnf` ，添加 `skip-grant-tables` 设置以绕过密码登录验证。

```bash
$ cd /etc/mysql/mysql.conf.d

# 编辑mysql配置文件
$ vim /mysqld.cnf
```

> mysqld.cnf

```
[mysqld_safe]										# raw line
socket      = /var/run/mysqld/mysqld.sock			# raw line
nice        = 0										# raw line

[mysqld]											# raw line
skip-grant-tables									# add new line             
#
# * Basic Settings
#
character_set_server = utf8							# raw line
```



### 2. 重启 `mysql `服务生效

    service mysql restart



### 3. 无需密码登录 `mysql`

```sql
-- 连接mysql，直接回车即可，不需要输入密码
mysql -u root -p

-- 更新root用户密码
update mysql.user set authentication_string=password('mysql') where user='root' and Host = 'localhost';
-- 或者以下语句
alter user 'root'@'localhost' identified by 'mysql';

-- 刷新权限
flush privileges;

-- 退出
exit
```



### 4. 恢复密码验证

```bash
$ cd /etc/mysql/mysql.conf.d

# 编辑mysql配置文件
$ vim /mysqld.cnf

# 删除 skip-grant-tables 行
```



### 5. 重启 `mysql`

    # 重启mysql
    service mysql restart
    
    # 键入新设的密码，从而进入数据库
    mysql -u root -p



### 6. 使用管理员权限进入数据库

若在第五步后，仍让无法进入数据库。那么请以管理员身份进入。因为在 Ubuntu 中有可能默认采用了 **[UNIX auth_socket plugin](https://dev.mysql.com/doc/mysql-security-excerpt/5.5/en/socket-pluggable-authentication.html)**。导致普通用户无法使用 `root` 用户进入数据库。

```bash
# 使用管理员用户进入数据库
sudo mysql -u root -p
```



## Reference

| 序号 | 链接                                                         | 说明        |
| ---- | ------------------------------------------------------------ | ----------- |
| 1    | [Mysql 之重置密码、忘记密码 - yellowcong](https://blog.csdn.net/yelllowcong/article/details/79641313) | `Tur`       |
| 2    | [MYSQL5.7：Access denied for user ‘root’@’localhost’ (using password:YES) 解决方法](http://blog.csdn.net/wzhedward/article/details/71036689) | `Reference` |
| 3    | [ERROR 1698 (28000): Access denied for user 'root'@'localhost'](https://stackoverflow.com/questions/41645309/mysql-error-access-denied-for-user-rootlocalhost) | `Debug`     |







