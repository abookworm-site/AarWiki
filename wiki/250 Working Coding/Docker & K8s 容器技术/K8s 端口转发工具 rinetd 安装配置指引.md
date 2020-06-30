# Rinetd 安装配置指引

## Rinetd 安装
```
cd/usr/local

wget http://www.boutell.com/rinetd/http/rinetd.tar.gz

tar -zxvf rinetd.tar.gz

cd rinetd

# 修改端口文件
sed -i 's/65536/65535/g' rinetd.c

mkdir -p /usr/man/

# 安装C编译工具，此步骤对未安装的Linux使用
yum install -y gcc
# 编译并安装
make && make install
```
- `wget`: 失败后，可以直接使用 tar.gz 进行解压安装



## 配置转发IP端口

1. 编辑配置文件
```
vim /etc/rinetd.conf
```
> rinetd.conf
```
0.0.0.0 8000 10.100.22.231 8000
```
- 表示将所有的IP：8000端口映射到内部的IP网络8000端口
- `0.0.0.0`: 表示所有发送的IP
- `10.100.22.231`: 表示内部IP地址

2. 执行生效
```
# 执行配置文件
rinetd -c /etc/rinetd.conf

# 查看网络端口映射
netstat -tulpn
```