# SQL 教程 - 廖雪峰的官方网站

本文档为笔记文档，原创教程为：[廖雪峰的官方网站 SQL教程](https://www.liaoxuefeng.com/wiki/1177760294764384)



## 1. [关系数据库概述](https://www.liaoxuefeng.com/wiki/1177760294764384/1179613436834240)

#### 1.1.1. 为什么需要数据库？
- 如何管理大数据？
    - 读写文件并解析出数据需要大量重复代码；
    - 从成千上万的数据中快速查询出指定数据需要复杂的逻辑。
- 通过数据库软件提供的接口来统一读写数据
    - 数据存储直接采用数据库软件，应用程序只需专注自身业务，而不用自己管理数据

#### 1.1.2. 数据模型
- 数据库按照数据结构来组织、存储和管理数据，实际上，数据库一共有三种模型：
  - 层次模型
  - 网状模型
  - 关系模型

#### 1.1.3. SQL
- 什么是SQL？SQL是结构化查询语言的缩写，用来访问和操作数据库系统。

- SQL语言定义了这么几种操作数据库的能力：

    - **DDL：Data Definition Language**
      DDL允许用户定义数据，也就是创建表、删除表、修改表结构这些操作。通常，DDL由数据库管理员执行。

    - **DML：Data Manipulation Language**
      DML为用户提供添加、删除、更新数据的能力，这些是应用程序对数据库的日常操作。

    - **DQL：Data Query Language**
      DQL允许用户查询数据，这也是通常最频繁的数据库日常操作。



## 2. 安装MySQL



## 3. [关系模型](https://www.liaoxuefeng.com/wiki/1177760294764384/1218728991649984)

- 二维表结构：
    - 表的每一行称为记录（Record），记录是一个逻辑意义上的数据。
    - 表的每一列称为字段（Column），同一个表的每一行记录都拥有相同的若干字段。
- 在关系数据库中，关系是通过*主键*和*外键*来维护的。

### 3.1. 主键

- 能够通过某个字段唯一区分出不同的记录，这个字段被称为*主键*。
- 选取主键的一个基本原则是：不使用任何业务相关的字段作为主键。
- 使用一种全局唯一的字符串作为主键，常见下面两种类型：
    - 自增整数类型
    - 全局唯一GUID类型：
    GUID算法通过网卡MAC地址、时间戳和随机数保证任意计算机在任意时间生成的字符串都是不同的，大部分编程语言都内置了GUID算法，可以自己预算出主键。

#### 3.1.1. 联合主键

- 关系数据库实际上还允许通过多个字段唯一标识记录，即两个或更多的字段都设置为主键，这种主键被称为联合主键。
    - 对于联合主键，允许一列有重复，只要不是所有主键列都重复即可。

总结：
- 主键是关系表中记录的唯一标识。主键的选取非常重要：主键不要带有业务含义，而应该使用BIGINT自增或者GUID类型。主键也不应该允许`NULL`。
- 可以使用多个列作为联合主键，但联合主键并不常用。

### 3.2. 外键

- 外键既可以通过数据库来约束，也可以不设置约束，仅依靠应用程序的逻辑来保证。
- 删除外键约束并没有删除外键这一列
- 把一个大表拆成两个一对一的表
    - 目的是把经常读取和不经常读取的字段分开，以获得更高的性能

### 3.3. 索引

- 索引是关系数据库中对某一列或多个列的值进行预排序的数据结构。
- 对于主键，关系数据库会自动对其创建主键索引。使用主键索引的效率是最高的，因为主键会保证绝对唯一。
- 唯一索引
    - 通过对数据库表创建索引，可以提高查询速度。
    - 通过创建唯一索引，可以保证某一列的值具有唯一性。



## .4. 查询数据

### 4.1. 基本查询

- 不带`FROM`子句的`SELECT`语句有一个有用的用途
    - 就是用来判断当前到数据库的连接是否有效。
    - 许多检测工具会执行一条`SELECT 1;`来测试数据库连接。

### 4.2. 条件查询

### 4.3. 投影查询

- 使用`SELECT *`表示查询表的所有列，使用`SELECT 列1, 列2, 列3`则可以仅返回指定列，这种操作称为投影。
- `SELECT`语句可以对结果集的列进行重命名。

### 4.4. 排序

- 默认的排序规则是`ASC`：“升序”，即从小到大。`ASC`可以省略，
- 使用`ORDER BY`可以对结果集进行排序；

### 4.5. 分页查询

- 分页查询的关键在于，首先要确定每页需要显示的结果数量`pageSize`（这里是3），然后根据当前页的索引`pageIndex`（从1开始），确定`LIMIT`和`OFFSET`应该设定的值：
    - `LIMIT`总是设定为`pageSize`；
    - 使用`LIMIT  OFFSET `分页时，随着`N`越来越大，查询效率也会越来越低。
    - `OFFSET`计算公式为`pageSize * (pageIndex - 1)`。
    - `OFFSET`超过了查询的最大数量并不会报错，而是得到一个空的结果集。


### 4.6. 聚合查询

- 除了`COUNT()`函数外，SQL还提供了如下聚合函数：
    - SUM计算某一列的合计值，该列必须为数值类型
    - AVG计算某一列的平均值，该列必须为数值类型
    - MAX计算某一列的最大值
    - MIN计算某一列的最小值
- 如果聚合查询的`WHERE`条件没有匹配到任何行，`COUNT()`会返回0，
- 而`SUM()`、`AVG()`、`MAX()`和`MIN()`会返回`NULL`：

### 4.7. 多表查询

- SQL还允许给表设置一个别名，
- 使用多表查询可以获取M x N行记录；

### 4.8. 连接查询

- JOIN查询需要先确定主表，然后把另一个表的数据“附加”到结果集上；
- INNER JOIN是最常用的一种JOIN查询，它的语法是`SELECT ... FROM <表1> INNER JOIN <表2> ON <条件...>`；
- JOIN查询仍然可以使用`WHERE`条件和`ORDER BY`排序。



## 5. 修改数据

### 5.1. INSERT

- INSERT INTO <表名> (字段1, 字段2, ...) VALUES (值1, 值2, ...);

### 5.2. UPDATE

- UPDATE <表名> SET 字段1=值1, 字段2=值2, ... WHERE ...;
- 在`UPDATE`语句中，更新字段时可以使用表达式。
- 最好先用`SELECT`语句来测试`WHERE`条件是否筛选出了期望的记录集，然后再用`UPDATE`更新。
- 在使用MySQL这类真正的关系数据库时，`UPDATE`语句会返回更新的行数以及`WHERE`条件匹配的行数。

### 5.3. DELETE

## 6. MySQL
### 6.1. 管理MySQL
```
# 查看表的结构
DESC students;
# 增加表列的结构
ALTER TABLE students ADD COLUMN birth VARCHAR(10) NOT NULL;
# 修改表列的结构
ALTER TABLE students CHANGE COLUMN birth birthday VARCHAR(20) NOT NULL;
```

### 6.2. 实用SQL语句

插入或替换
- 若`id=1`的记录不存在，`REPLACE`语句将插入新记录，否则，当前`id=1`的记录将被删除，然后再插入新记录。
`replace into students (id, class_id, name, gender, score) values (1, 1, '小明', 'F', 99);`

插入或更新
- 如果记录已经存在，则更新，若不存在，则新增
`INSERT INTO students (id, class_id, name, gender, score) VALUES (1, 1, '小明', 'F', 99) ON DUPLICATE KEY UPDATE name='小明', gender='F', score=99;`

插入或忽略
- 如果我们希望插入一条新记录（INSERT），但如果记录已经存在，就啥事也不干直接忽略
`insert ignore into students (id, class_id, name, gendar, score) values (1, 1, '小花', 'F', 100);`

快照
- 如果想要对一个表进行快照，即复制一份当前表的数据到一个新表，可以结合`CREATE TABLE`和`SELECT`：
`create table students_of_class1 select * from students where class_id = 1;`

写入查询结果集
`INSERT INTO statistics (class_id, average) SELECT class_id, AVG(score) FROM students GROUP BY class_id;`

强制使用指定索引
- 在查询的时候，数据库系统会自动分析查询语句，并选择一个最合适的索引。但是很多时候，数据库系统的查询优化器并不一定总是能使用最优索引。如果我们知道如何选择索引，可以使用`FORCE INDEX`强制查询使用指定的索引。例如：
`SELECT * FROM students FORCE INDEX (idx_class_id) WHERE class_id = 1 ORDER BY id DESC;`
    - 指定索引的前提是索引`idx_class_id`必须存在。



## 7. [事务](https://www.liaoxuefeng.com/wiki/1177760294764384/1179611198786848)

- 数据库事务具有ACID这4个特性：
  - A：Atomic，原子性，将所有SQL作为原子工作单元执行，要么全部执行，要么全部不执行；
  - C：Consistent，一致性，事务完成后，所有数据的状态都是一致的，即A账户只要减去了100，B账户则必定加上了100；
  - I：Isolation，隔离性，如果有多个事务并发执行，每个事务作出的修改必须与其他事务隔离；
  - D：Duration，持久性，即事务完成后，对数据库数据的修改被持久化存储。
- 隐式事务
    - 对于单条SQL语句，数据库系统自动将其作为一个事务执行，这种事务被称为*隐式事务*。
- 显式事务
    - 要手动把多条SQL语句作为一个事务执行，使用`BEGIN`开启一个事务，使用`COMMIT`提交一个事务，这种事务被称为*显式事务*
- 四种隔离级别
    - Read uncommitted
    - Read committed
    - Repeatable read
    - Serializable

### 7.1. Read Uncommitted

- Read Uncommitted是隔离级别最低的一种事务级别。在这种隔离级别下，一个事务会读到另一个事务更新后但未提交的数据，如果另一个事务回滚，那么当前事务读到的数据就是脏数据，这就是脏读（Dirty Read）。
    - 在Read Uncommitted隔离级别下，一个事务可能读取到另一个事务更新但未提交的数据，这个数据有可能是脏数据。



### 7.2. Read Committed

- 在Read Committed隔离级别下，一个事务可能会遇到不可重复读（Non Repeatable Read）的问题。
- 在Read Committed隔离级别下，事务不可重复读同一条记录，因为很可能读到的结果不一致。



### 7.3. Repeatable Read

- 在Repeatable Read隔离级别下，一个事务可能会遇到幻读（Phantom Read）的问题。
- 幻读是指，在一个事务中，第一次查询某条记录，发现没有，但是，当试图更新这条不存在的记录时，竟然能成功，并且，再次读取同一条记录，它就神奇地出现了。



### 7.4. Serializable

- Serializable是最严格的隔离级别。在Serializable隔离级别下，所有事务按照次序依次执行，因此，脏读、不可重复读、幻读都不会出现。
- 默认隔离级别
    如果没有指定隔离级别，数据库就会使用默认的隔离级别。在MySQL中，如果使用InnoDB，默认的隔离级别是Repeatable Read。