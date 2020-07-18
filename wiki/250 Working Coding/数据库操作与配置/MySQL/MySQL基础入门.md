# MySQL 基础入门
## 数据完整性

#### 数据类型

使用原则：

- **够用就行**，尽量使用取值范围小的，而不用大的，以节省更多的存储空间



常用数据类型：

- 整数：int，bit
- 小数：decimal
- 字符串：varchar,char
- 日期时间: date, time, datetime
- 枚举类型(enum)



特别说明：

- decimal表示浮点数，如decimal(5,2)表示共存5位数，小数占2位
- char表示固定长度的字符串，如char(3)，如果填充'ab'时会补一个空格为`'ab '`
- varchar表示可变长度的字符串，如varchar(3)，填充'ab'时就会存储'ab'
- 字符串text表示存储大文本，当字符大于4000时推荐使用
- 对于图片、音频、视频等文件，不存储在数据库中，而是上传到某个服务器上，然后在表中存储这个文件的保存路径



更全数据类型参考

- http://blog.csdn.net/anxpp/article/details/51284106



常用数据类型

| 类型        | 字节大小 | 有符号范围(Signed)                         | 无符号范围(Unsigned) |
| :---------- | :------- | :----------------------------------------- | :------------------- |
| TINYINT     | 1        | -128 ~ 127                                 | 0 ~ 255              |
| SMALLINT    | 2        | -32768 ~ 32767                             | 0 ~ 65535            |
| MEDIUMINT   | 3        | -8388608 ~ 8388607                         | 0 ~ 16777215         |
| INT/INTEGER | 4        | -2147483648 ~2147483647                    | 0 ~ 4294967295       |
| BIGINT      | 8        | -9223372036854775808 ~ 9223372036854775807 | 0 ~ 1844674407       |



**存储字符串**所用数据类型

| 类型    | 字节大小 | 示例                                                         |
| :------ | :------- | :----------------------------------------------------------- |
| CHAR    | 0-255    | 类型:char(3) 输入 'ab', 实际存储为'ab ', 输入'abcd' 实际存储为 'abc' |
| VARCHAR | 0-255    | 类型:varchar(3) 输 'ab',实际存储为'ab', 输入'abcd',实际存储为'abc' |
| TEXT    | 0-65535  | 大文本                                                       |



**存储日期**所用的日期时间类型

| 类型      | 字节大小 | 示例                                                  |
| :-------- | :------- | :---------------------------------------------------- |
| DATE      | 4        | '2020-01-01'                                          |
| TIME      | 3        | '12:29:59'                                            |
| DATETIME  | 8        | '2020-01-01 12:29:59'                                 |
| YEAR      | 1        | '2017'                                                |
| TIMESTAMP | 4        | '1970-01-01 00:00:01' UTC ~ '2038-01-01 00:00:01' UTC |



#### 约束

- 主键`primary key`：物理上存储的顺序
- 非空`not null`：此字段不允许填写空值
- 惟一`unique`：此字段的值不允许重复
- 默认`default`：当不填写此值时会使用默认值，如果填写时以填写为准
- 外键`foreign key`：对关系字段进行约束，当为关系字段填写值时，会到关联的表中查询此值是否存在，如果存在则填写成功，如果不存在则填写失败并抛出异常
    - 不推荐使用
    - 虽然外键约束可以保证数据的有效性，但是在进行数据的crud（增加、修改、删除、查询）时，都会降低数据库的性能
    - 那么数据的有效性怎么保证呢？答：可以在逻辑层进行控制



## 数据库 Navicat 操作



## 数据库命令行脚本操作

### 命令行连接

1，连接服务端数据库

```shell
mysql -u root -p mysql
```

2，退出

```
quit 或者 exit
```

- 按`ctrl+d`亦可退出

3，查看版本：

```
select version();
```

4， 显示当前时间：

```shell
select now();
```



### 数据库操作

- 查看所有数据库

```sql
show databases;
```

- 使用数据库

```sql
use 数据库名;
```

- 查看当前使用的数据库

```sql
select database();
```

- 创建数据库

```sql
create database 数据库名 charset=utf8;
```

- 删除数据库

```sql
drop database 数据库名;
```



### 数据表操作

1， 查看当前数据库中所有表

```sql
show tables;
```

2， 查看表结构

```sql
desc 表名;
```

3， 创建表

```sql
CREATE TABLE table_name(
    column1 datatype contrai,
    column2 datatype,
    column3 datatype,
    .....
    columnN datatype,
    PRIMARY KEY(one or more columns)
);
```

- auto_increment表示自动增长

4， 修改表 - 添加字段

```sql
alter table 表名 add 列名 类型;
例：
alter table students add birthday datetime;
```

5， 修改表 - 修改字段：重命名版*change*

```sql
alter table 表名 change 原名 新名 类型及约束;
例：
alter table students change birthday birth datetime not null;
```

6， 修改表 - 修改字段：不重命名版*modify*

```sql
alter table 表名 modify 列名 类型及约束;
例：
alter table students modify birth date not null;
```

7， 修改表-删除字段

```sql
alter table 表名 drop 列名;
```

8， 删除表

```sql
drop table 表名;
```

9， 查看表的创建语句

```sql
show create table 表名;
```



### 增删改查(CURD)

> 全称：创建（Create）、更新（Update）、读取（Retrieve）和删除（Delete）

#### 查询

1， 查询所有列

```sql
select * from 表名;
```

2， 查询指定列，并可使用`as`为列或表指定别名

```sql
select 列1,列2,... from 表名;
```



#### 增加

格式

```sql
INSERT [INTO] tb_name [(col_name,...)] {VALUES | VALUE} ({expr | DEFAULT},...),(...),...
```

- 主键列是自动增长，但是在全列插入时需要占位，通常使用0或者 default 或者 null 来占位，插入成功后以实际数据为准

    

全列插入：值的顺序与表中字段的顺序对应

```sql
insert into 表名 values(...)
```



部分列插入：值的顺序与给出的列顺序对应

```sql
insert into 表名(列1,...) values(值1,...)
```



全列多行插入：值的顺序与给出的列顺序对应

```sql
insert into 表名 values(...),(...)...;
```



#### 修改

格式

```sql
UPDATE tb_name SET col1={expr1|DEFAULT} [,col2={expr2|default}]...[where 条件判断]
```

详细：

```sql
update 表名 set 列1=值1,列2=值2... where 条件
```



#### 删除

格式：

```sql
DELETE FROM tbname [where 条件判断]
```

详细：

```sql
delete from 表名 where 条件
```



逻辑删除，本质就是修改操作

```sql
update students set isdelete=1 where id=1;
```



## 数据库备份和恢复

备份：

```bash
mysqldump -u root -p 数据库名 > 备份文件名.sql;

# 按提示输入mysql的密码
```



恢复：

1. 连接mysql，创建新的数据库
2. 退出连接，执行如下命令

```bash
mysql -uroot -p 新数据库名 < 备份文件名.sql;

# 按提示输入mysql的密码
```



## 数据库设计

#### 设计原则

关系型数据库建议在E-R模型的基础上，我们需要根据产品经理的设计策划，抽取出来模型与关系，制定出表结构，这是项目开始的第一步


范式(Normal Form)

 第一范式（1NF）：强调的是列的原子性，即列不能够再分成其他几列。

 第二范式（2NF）：首先是1NF，另外包含两部分内容：

 - 一是表必须有一个主键；
 - 二是没有包含在主键中的列必须完全依赖于主键，而不能只依赖于主键的一部分。

◆ 第三范式（3NF）：首先是 2NF，

- 另外非主键列必须直接依赖于主键，不能存在传递依赖。
- 即不能存在：非主键列 A 依赖于非主键列 B，非主键列 B 依赖于主键的情况。



### E-R模型

- E表示entry，实体，设计实体就像定义一个类一样，指定从哪些方面描述对象
    - 一个实体转换为数据库中的一个表
- R表示relationship，关系，关系描述两个实体之间的对应规则
    - 关系的类型包括包括一对一、一对多、多对多
    - 关系也是一种数据，需要通过一个字段存储在表中



#### 逻辑删除

删除方案：设置`isDelete`的列，类型为bit，表示逻辑删除，默认值为0



## MySQL 查询

### 消除重复行
- 在select后面列前使用distinct可以消除重复的行
```sql
select distinct 列1,... from 表名;
-- 例：
-- select distinct gender from students;
+--------+
| gender |
+--------+
| 女     |
| 男     |
| 保密   |
| 人妖   |
+--------+
4 rows in set (0.00 sec)
```




### 条件查询

where后面支持多种运算符，进行条件的处理
- 比较运算符
- 逻辑运算符
- 模糊查询
- 范围查询
- 空判断


比较运算符
- 等于: =
- 大于: >
- 大于等于: >=
- 小于: <
- 小于等于: <=
- 不等于: != 或 <>


逻辑运算符
- and
- or
- not

模糊查询
- `like`
- `%` 表示任意多个任意字符
- `_` 表示一个任意字符

范围查询
- `in` 表示在一个非连续的范围内
- `not in`


空判断
- 判空: `is null`
- 判非空: `is not null`
- 注意：null与''是不同的

优先级
- 优先级由高到低的顺序为：小括号，not，比较运算符，逻辑运算符
- `and`比`or`先运算，如果同时出现并希望先算or，需要结合()使用



### 排序

##### 语法：

```sql
select * from 表名 order by 列1 asc|desc [,列2 asc|desc,...]
```

- 将行数据按照列1进行排序，如果某些行列1的值相同时，则按照列2排序，以此类推
- 默认按照列值从小到大排列（asc）
- asc从小到大排列，即升序
- desc从大到小排序，即降序



### 聚合函数

#### 总数`count(*)`

- 计算总行数，括号中写星与列名，结果是相同的

#### 最大值`max(column)`

- 表示求此列的最大值

#### 最小值`min(column)`

- 表示求此列的最小值

#### 求和`sum(column)`

- 表示求此列的和

#### 平均值`avg(colum)`

- 表示求此列的平均值



### 分组

#### group by

1. 将查询结果按照1个或多个字段进行分组，字段值相同的为一组
2. group by可用于单个字段分组，也可用于多个字段分组



#### group by + group_concat()

1. group_concat(字段名)可以作为一个输出字段来使用，
2. 表示分组之后，根据分组结果，使用group_concat()来放置每一组的某字段的值的集合



#### group by + 集合函数

1. 通过group_concat()的启发，我们既然可以统计出每个分组的某字段的值的集合，那么我们也可以通过集合函数来对这个`值的集合`做一些操作



#### group by + having

1. having 条件表达式：用来分组查询后指定一些条件来输出查询结果
2. having作用和where一样，但having只能用于group by



#### group by + with rollup

1. with rollup的作用是：在最后新增一行，来记录当前列里所有记录的总和



### 分页

#### 获取部分行

#### 语法

```sql
select * from 表名 limit start,count
```

- 从 `start` 开始，获取 `count` 条数据



### 连接查询

当查询结果的列来源于多张表时，需要将多张表连接成一个大的数据集，再选择合适的列返回

MySQL支持三种类型的连接查询

- 内连接查询：查询的结果为两个表匹配到的数据

- 右连接查询：查询的结果为两个表匹配到的数据，右表特有的数据，对于左表中不存在的数据使用null填充

- 左连接查询：查询的结果为两个表匹配到的数据，左表特有的数据，对于右表中不存在的数据使用null填充

#### 语法

```sql
select * from 表1 inner或left或right join 表2 on 表1.列 = 表2.列
```



### 自关联

表中的某一列，关联了这个表中的另外一列，但是它们的业务逻辑含义是不一样的。那么这张表可称为自关联。



### 子查询

在一个 select 语句中，嵌入了另外一个 select 语句，那么被嵌入的 select 语句称之为子查询语句



#### 主查询

主要查询的对象，第一条 select 语句



#### 主查询和子查询的关系

- 子查询是嵌入到主查询中
- 子查询是辅助主查询的,要么充当条件,要么充当数据源
- 子查询是可以独立存在的语句，是一条完整的 select 语句



#### 子查询分类

- 标量子查询: 子查询返回的结果是一个数据(一行一列)
- 列子查询: 返回的结果是一列(一列多行)
- 行子查询: 返回的结果是一行(一行多列)



#### 子查询中特定关键字使用

- in 范围
    - 格式: 主查询 where 条件 in (列子查询)



## 总结

```sql
SELECT select_expr [,select_expr,...] [      
      FROM tb_name
      [WHERE 条件判断]
      [GROUP BY {col_name | postion} [ASC | DESC], ...] 
      [HAVING WHERE 条件判断]
      [ORDER BY {col_name|expr|postion} [ASC | DESC], ...]
      [ LIMIT {[offset,]rowcount | row_count OFFSET offset}]
]
```
完整的select语句
```sql
select distinct *
	from 表名
		where ....
		group by ... having ...
		order by ...
		limit start,count
```
执行顺序为：
```sql
from 表名
	where ....
	group by ...
	select distinct *
	having ...
	order by ...
	limit start,count
```

案例：

```sql
select * from xxxx where price > (select avg(price) from xxxx) order by price desc;


select * from goods where price is group by kind

select * from goods inner join （select cate_name, max(price) as ... from goods group by cate_name) as goods_new_info on 
```