# MongoDB

## Why MongoDB? 

- not only sql
- 跨平台，开源
- 分布式数据库
- 面向文档、集合存储：
	- 文档：json, 键值对，对应关系型数据库的一行
	- 集合：文档的集合，多个文档组合在一起，对应关系型数据库的表
- 最像关系型数据库的非关系型数据库


## mongoDB 优势

- **易扩展**： NoSQL数据库种类繁多， 但是⼀个共同的特点都是去掉关系数据库的关系型特性。 数据之间⽆关系， 这样就⾮常容易扩展
- **⼤数据量， ⾼性能**： NoSQL数据库都具有⾮常⾼的读写性能， 尤其在⼤数据量下， 同样表现优秀。 这得益于它的⽆关系性， 数据库的结构简单
- **灵活的数据模型**： NoSQL⽆需事先为要存储的数据建⽴字段， 随时可以存储⾃定义的数据格式。 ⽽在关系数据库⾥， 增删字段是⼀件⾮常麻烦的事情。 如果是⾮常⼤数据量的表， 增加字段简直就是⼀个噩梦


## 关系型数据库：

- 外键
- 表数据的存储由行和列固定组成
- 支持事务


## mongDB 安装

```bash
sudo apt-get install mongodb
```

## mongo 服务端

- 查看帮助： `mongod –help`
- 启动：`sudo service mongod start`
- 停止：`sudo service mongod stop`
- 重启：`sudo service mongod restart`
- 查看是否启动成功：`ps ajx | grep mongod`
- 配置
	- 默认端⼝：27017
	- 配置文件位置：`/etc/mongod.conf`
	- 日志位置： `/var/log/mongodb/mongod.log`


## mongo 客户端

- 启动本地客户端: `mongo`
- 查看帮助：`mongo –help`
- 退出：`exit` or `quit()` or `ctrl+c`


## 数据库基本命令

- 查看当前的数据库：`db`
- 查看所有的数据库：`show dbs` or `show databases`
- 切换数据库：`use db_name`
	- 若 `db_name` 不存在，那么在新建数据库 `db_name`
- 删除当前的数据库：`db.dropDatabase()`
	- 使用命令前一定要确认当前使用的数据库为需要删除的数据库。

## 集合基础命令

1. 不手动创建集合：
	- 向不存在的集合中第⼀次加⼊数据时，集合会被创建出来

2. 手动创建结合：
```
db.createCollection(name,options)

db.createCollection("stu")

db.createCollection("sub", { capped : true, size : 10 } )
```
- 参数`capped`： 默认值为false表示不设置上限,值为true表示设置上限
- 参数`size`： 当capped值为true时， 需要指定此参数，
	- 含义: 表示上限⼤⼩,当⽂档达到上限时， 会将之前的数据覆盖
	- 单位: 字节

3. 查看集合：`show collections`
4. 删除集合：`db.collection_name.drop()`

## 数据类型

- `ObjectID`： ⽂档ID
	- 每个文档都有一个属性：`_id`
	- 为保证每个文档的唯一性，可自己设置`_id`，
	- 如果没有提供，那么默认会提供一个独特的`_id`，类型为 `objectID`
	- `objectID`是一个12字节的十六进制数
		- 前4字节：当前时间戳
		- 再3字节：机器ID
		- 再2字节：MongoDB的服务进程ID
		- 后3字节：简单的增值值
- `String`： 字符串， 最常⽤， 必须是有效的UTF-8
- `Boolean`： 存储⼀个布尔值， true或false
- `Integer`： 整数可以是32位或64位， 这取决于服务器
- `Double`： 存储浮点值
- `Arrays`： 数组或列表， 多个值存储到⼀个键
- `Object`： ⽤于嵌⼊式的⽂档， 即⼀个值为⼀个⽂档
- `Null`： 存储Null值
- `Timestamp`： 时间戳， 表示从1970-1-1到现在的总秒数
- 
- `Date`： 存储当前⽇期或时间的UNIX时间格式
	- 创建语法：`new Date('2020-05-13')
	- 参数格式：YYYY-MM-DD


## 数据库备份

```bash
mongodump -h dbhost -d dbname -o dbdirectory
```
- `-h`： 服务器地址， 也可以指定端⼝号
- `-d`： 需要备份的数据库名称
- `-o`： 备份的数据存放位置， 此⽬录中存放着备份出来的数据

> `mongodump -h 192.168.196.128:27017 -d test1 -o ~/Desktop/test1bak`


## 数据库恢复

```bash
mongorestore -h dbhost -d dbname --dir dbdirectory
```
- `-h`： 服务器地址
- `-d`： 需要恢复的数据库实例
- `--dir`： 备份数据所在位置

> `mongorestore -h 192.168.196.128:27017 -d test2 --dir ~/Desktop/test1bak/test1`


## 基本操作

### 插入
```
db.collection_name.insert(document)
```
- 若不指定`_id`, 那么默认分配唯一的一个 `ObjectId`

```
db.stu.insert({name:'gj',gender:1})

db.stu.insert({_id:"20170101",name:'gj',gender:1})
```


### 保存
```
db.collection_name.save(document)
```
- 如果文档 `_id` 已经存在则修改，如果不存在则添加

### 简单查询
```
db.collection_name.find()
```

### 更新
```sql
db.集合名称.update(<query> ,<update>,{multi: <boolean>})
```
- 参数query:查询条件
- 参数update:更新操作符
- 参数multi:可选，
	- 默认是false，表示只更新找到的第⼀条记录
	- 值为true表示把满⾜条件的⽂档全部更新

```
# 更新一条，直接将后面的字段替换调整条信息
db.stu.update({name:'hr'},{name:'mnc'})  

# 更新一条, 且仅更新 name 字段内容
db.stu.update({name:'hr'},{$set:{name:'hys'}})  

# 更新全部
db.stu.update({},{$set:{gender:0}},{multi:true})  
```

> 注意："multi update only works with $ operators"

### 删除

```sql
db.collection_name.remove(<query>,{justOne: <boolean>})
```

- 参数`query`: 可选，删除的⽂档的条件

- 参数`justOne`: 可选，
    - 如果设为true或1， 则只删除⼀条
    - 默认false， 表示删除多条
