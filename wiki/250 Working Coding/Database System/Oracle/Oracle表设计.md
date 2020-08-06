# Oracle 表设计


- 视图
- 序列
- Insert delete update
    - 事物
    - acid
- 建表
    - 三范式
- 约束
- 做练习
    - 设计表



## 视图`View`

### 视图的定义

视图(view)，也称 **虚表**，是从一个或多个存储在数据库中的实际表中获得地一种不占用物理空间的逻辑定义表。

- 视图本身的定义语句存储在数据字典里的。每次使用的时候重新执行 `SQL`。而与此定义相关的数据并没有再存一份于数据库中。
- 用于产生视图的表叫做该视图的 **基表**。通过视图看到的数据存放在基表中。同时，一个视图也可以从另一个视图中产生。

- 对视图的操作同物理表一样，当通过视图修改数据时，实际上是改变基表中的数据；同时，基表数据的修改也会自动反映在相关视图中。
- 最后，由于逻辑上的原因，有些 Oracle视图可以修改对应的基表，有些则不能（仅仅能查询）。



### 创建视图

- 在 `CREATE VIEW` 语句后加入子查询

```plsql
-- 创建视图格式
CREATE [OR REPLACE] VIEW view
[(alias[, alias]...)]
AS subquery
[WITH READ ONLY];

-- 案例1
create or replace view v$_emp_dept
as
select emp.deptno,ename,dname from emp
join dept on emp.deptno=dept.deptno
with read only

-- 案例2
create or replace view v_test01
as
select * from emp;
```



### 使用视图

- 查询时，直接从视图中查询的语句相应的结果即可。

```plsql
select * from v$_emp_dept;
```



查找用户视图

```plsql
SELECT *
FROM user_views
WHERE view_name ='V_TEST01';
```



修改视图里面的数据

```plsql
insert into v_test01(ename, EMPNO, job, DEPTNO) values('cai30',9921,'SALESMAN',10)
```



#### 修改视图对应基表数据

```plsql
update view_name set ...
```

- 若一个视图依赖于多个基本表, 则一次修改该视图只能修改一个基本表的数据.



#### 删除数据

```plsql
delete from view_name where ...
```

- 当视图依赖多个基表时, 不能使用此语句来删除基表中的数据. 只能删除依赖一个基表的数据.
```plsql
insert into v_test01(ename, EMPNO, job, DEPTNO) values('cai30',9921,'SALESMAN',10);

delete from v_test01 where ename='cai30';

update v_test01 set ename='cai10' where ename='cai30';
```


### 删除视图

当视图不再需要的时候，用“drop view” 撤销。删掉视图不会导致数据的丢失，因为视图是基于数据库的表之上的一个查询定义。

```plsql
drop view v$_emp_dept;

drop view v_test01;
```



### 只读视图

- 创建视图

```plsql
create or replace view v_test01 
as 
(select * from emp)
with read only
```



- 测试插入数据

```plsql
insert into v_test01(ename, EMPNO, job, DEPTNO)
values('cai30',9921,'SALESMAN',10);
```



### 案例练习

求平均薪水的等级最低的部门的部门名称，要求完全使用子查询

#### 题目分析

```plsql
select dname, grade 
from
  (select deptno, avg_sal, grade 
   from (select deptno, avg(sal) avg_sal from emp group by deptno) t,
	salgrade s
   where
	t.avg_sal between s.losal and s.hisal) t1,
  dept
where t1.deptno = dept.deptno and

t1.grade =
(select min(grade) 
from 
   (select deptno, avg_sal, grade 
   from (select deptno, avg(sal) avg_sal from emp group by deptno) t,
		salgrade s
where
t.avg_sal between s.losal and s.hisal);
```



#### 创建视图

```plsql
create view v$_temp as
(select deptno, avg_sal, grade from
(select deptno, avg(sal) avg_sal from emp group by
deptno) t,
salgrade s
where
t.avg_sal between s.losal and s.hisal );
```



#### 使用视图

```plsql
select dname from dept, v$_temp where
v$_temp.deptno = dept.deptno
and grade = (select min(grade) from v$_temp);
```



### 授权视图

- 使用 `system` 用户为 `scott` 增加权限：`grant create view, create table to scott;`
- 使用 `system` 用户为 `scott `解锁：`alter user scott account unlock;`

```plsql
-- 使用 system 用户为 scott 增加权限
grant create view, create table to scott;

-- 使用 system 用户为 scott 解锁
alter user scott account unlock;
```



## 用户管理

### 账户锁定与解锁

使用 `scott` 用户登录，第一次登录的时候会显示账户锁定，需要将账户解锁：

1. 运行命令行工具，使用DBA登录

    ```sql
    sqlplus /nolog;
    
    conn sys/*****@orcl as sysdba;
    ```

    - `sys`：系统管理员账户
    - `*****` ：这里表示系统管理员密码
    - `orcl`：全局数据库实例名称

    

2. 解锁命令：

    ```sql
    alter user scott account unlock|lock;
    ```

    

3. 测试：

    ```sql
    conn scott/****@orcl;
    ```

    - `xxxx`：为对应用户的密码。
    
        

4. 设置用户密码登录后失效，并要求修改密码

```shell
$ alter user 用户名 password expire;
```

- 要求重新输入密码，确认你自己的密码即可





### 创建用户

```shell
# 管理员账户登录
$ sqlplus /nolog;

$ conn sys/xxxx@orcl as sysdba;

# 创建用户语法
$ create user username identified by password;

$ create user aaron identified by xxxx;

# 查看用户是否创建
$ select username from dba_users;
```

- 必须使用管理员账号 `sys` 或者 `system` 才能创建用户



### 用户授权

```shell
# 管理员账户登录
$ sqlplus /nolog;
$ conn sys/xxxx@orcl as sysdba;

# 账户授权语法
$ grant privileges [ON object_name] to username;

# 将权限privileges授予用户username
$ grant create session to aaron;
```



#### 授权：连接权限

```shell
# 用户登录：
$ conn aaron/xxxx@test;

# 将scott用户的emp表所有权限授予 aaron
$ grant all on scott.emp to aaron;

# 查询数据表
$ select * from scott.emp

# 收回授予用户 Aaron 的scott用户表emp的所有权限
$ revoke all on scott.emp from aaron;
```



#### 总结

```shell
# 管理员账户登录
$ sqlplus /nolog;
$ conn sys/xxxx@orcl as sysdba;

# 创建用户
$ Create user 用户名 identified by 密码

# 链接登录
$ Grant create session to 用户名

# 授予表的权限
$ Grant all on scott.emp to 用户名

# 收回权限
$ Revoke all on scott.emp from 用户名
```



#### 修改用户密码

```shell
# 将 aaron 用户的口令修改为 newpsw
$ alter user John identified by newpsw;
```



#### 删除用户

1. 使用 `drop user`删除用户，关键字 `cascade` 删除用户模式中包含的数据对象。
2. 删除用户aaron，并同时删除aaron拥有的所有表、索引等对象。



```shell
# 切换为system账户登录
$ conn system/xxx@orcl;

# 删除 aaron 操作
$ drop user aaron cascade;

# 测试 aaron 是否存在
$SQL> conn aaron/newpsw@orctl;

# 查看自己的权限
$SQL> select * from user_sys_privs;
```

- `xxx`：为系统管理员账户密码



### `GRANT` 赋于权限

2. 常用的系统权限集合有以下三个:
   
    - `CONNECT` (基本的连接)
    - `RESOURCE` (程序开发)
    - `DBA` (数据库管理)
    
    
    
2. 常用的数据对象权限有以下五个:

    - ALL ON 数据对象名
    - SELECT ON 数据对象名
    - UPDATE ON 数据对象名
    - DELETE ON 数据对象名
    - INSERT ON 数据对象名
    - ALTER ON 数据对象名

    

3. 语法规则

```shell
GRANT CONNECT, RESOURCE TO 用户名;
GRANT SELECT ON 表名 TO 用户名;
GRANT SELECT, INSERT, DELETE ON表名 TO 用户名1, 用户名2;
```



### `REVOKE` 回收权限

```shell
$ REVOKE CONNECT, RESOURCE FROM 用户名;

$ REVOKE SELECT ON 表名 FROM 用户名;

$ REVOKE SELECT, INSERT, DELETE ON 表名 FROM 用户名1, 用户名2;
```



## 序列 `sequence`

- 序列是oracle专有的对象，它用来产生一个自动递增的数列



创建序列的语法

```plsql
create sequence seq_name
increment by n
start with n
maxvalue n|nomaxvalue 10^27 or -1
minvalue n|no minvalue
cycle|nocycle
cache n|nocache
```



序列的使用语法

```plsql
create sequence 序列名称 start with 1 increment by 1;
```

- `序列.nextval`：序列下个值
- `序列.currval`：序列当前值



删除序列

```plsql
drop sequence 序列名;
```



实际使用

```plsql
-- 序列使用语法
create sequence 序列名称 start with 1 increment by 1;

-- 序列.nextval： 下个值
select seq_score_id.nextval from dual;

-- 序列.currval： 当前值
-- 查看当前序列状态
select seq_score_id.currval from dual;

-- 删除序列
drop sequence 序列名;

-- 案例
-- 
create sequence seq_empcopy_id start with 1 increment by 1;

insert into tb_course values(seq_course.nextval,'dsaf','dsaf);
```



使用序列

```plsql
-- 使用序列
select seq_empcopy_id.nextval from dual

insert into empcopy(empno, ename) values (seq_empcopy_id.nextval, ‘TEST’);

-- 查看序列状态
select seq_empcopy_id.currval from dual

-- 删除序列
drop sequence seq_empcopy_id;
```



```plsql
-- 序列： 
-- 在Oracle中， 如果需要完成一个列的自增操作，则必须要使用序列
-- 语法：
/*
create sequence seq_name
  increment by n  每次增长几
  start with n    从哪个值开始增长
  maxvalue n|nomaxvalue 10^27 or -1  最大值
  minvalue n|no minvalue  最小值
  cycle|nocycle           是否有循环
  cache n|nocache          是否有缓存
*/
create sequence my_sequence increment by 2 start with 1;
 

-- How 如何使用？
-- 注意:如果创建好序列之后，没有经过任何的使用，那么不能获取当前的值，必须要先执行 nextval 之后才能获取当前值
-- dual是oracle中提供的一张虚拟表，不表示任何意义，在测试的时候可以随意使用

-- 1/3. 首次运行必须运行一次 nextval ，获取序列的下一个值（初始值）
select my_sequence.nextval from dual;

-- 2. 查看当前序列的值
select my_sequence.currval from dual;

-- 1/3. 获取序列的下一个值
select my_sequence.nextval from dual;

-- 4. 使用：插入数据
insert into emp(empno, ename) values(my_sequence.nextval, 'Hello Oracle');


```





































## SQL数据更新 `DML`

SQL的数据更新包括 **数据插入**， **删除** 和 **修改** 三个操作。



### `Insert`语句

 `insert语句` 是往表中插入数据的语句，方式有两种：一种是元组值的插入，一种是查询结果的插入。



元组值的插入语法如下：

```plsql
INSERT INTO table[( column [ , column... ])] VALUES (value [ , value... ]);
```

- 一次插入操作只插入一行



```plsql
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) values (1111,'gao','clerk',7902,sysdate,10000,3000,40);
```

- 此处插入的元组中列的个数、顺序与emp的结构完全一致，因此表名之后的列名可以省略不写



```plsql
insert into emp values(2222,'gaohs','clerk',7902,sysdate,10000,3000,40)

-- 可以只插入部分列
insert into emp(empno, ename) values (3333,'xiaozhang');
```



- 可以只插入部分列

```plsql
insert into emp(empno, ename) values (3333,'xiaozhang');
```



- 但要求省略的列必须满足下面的条件：
1. 该列定义为允许 `Null`值。
2. 在表定义中给出默认值，这表示如果不给出值，将使用默认值。

- 如果不符合上面两个条件，将会报错。不能成功插入。



可以用 `insert` 语句把一个 `select` 语句的查询结果插入到一个基本表中，语法如下：

```plsql
Insert into tablename(column,...) select * from tablename2
```



案例

```plsql
-- 创建一个临时表
create table temp
as
select * from emp
where 1 = 2;

-- 执行插入
insert into ss select * from emp;
```


例子

```plsql
create table test02 
as
select * from emp where 1=2;

create table test01 
as
select * from emp where 1=1

insert into test02;

select * from emp where emp.deptno=10;
```



### `DELETE` 语句

SQL的删除操作是指从基本表中删除元组，语法如下：

```plsql
DELETE [FROM] table [WHERE condition];
```

- 其语义是从基本表中删除满足条件表达式的元组
- `Delete from table` 表示从表中删除一切元组



`truncate table` 删除所有行：

- 如果想从表中删除所有的行，**不要使用**  `delete from table;`
- 可使用 `truncate table` 语句，完成相同的工作，但是 **速度更快（没有事务）**。



### `UPDATE` 语句

Update语句用于修改基本表中元组的某些列，其语法如下：

```plsql
UPDATE table 
SET column = value [, column = value ] …
[WHERE condition ];
```

- 语义是：修改基本表中满足条件表达式的那些元组的列值，需修改的列值在set子句中指出。



```plsql
--DML：数据库操作语言
--  增  --  删  --  改

-- 在实际项目中，使用最多的是读取操作，但是插入数据和删除数据同等重要，而修改操作相对较少

/*
插入操作：
  元组值的插入
  查询结果的插入

*/
-- 最基本的插入方式 2 种：
--向部分列插入数据的时候，不是想向哪个列插入就插入的，要遵循创建表的时候定义的规范(约束)

--insert into tablename values(val1,val2,....) 如果表名之后没有列，那么只能将所有的列都插入
insert into emp values(2222, 'Hello', 'Cleark', '7902', to_date('2019-01-23', 'YYYY-MM-dd'), 1002, 500, 10);

--insert into tablename(col1,col2,...) values(val1,val2,...) 可以指定向哪些列中插入数据
insert into emp(empno, ename) values(3333, 'Wangwu');

-- check it
select * from emp;


-- 创建表的其他方式
-- 复制表同时复制表数据，不会复制约束
create table emp2 as select * from emp;

--复制表结构但是不复制表数据，不会复制约束
create table emp3 as select * from emp where 1=2;

--如果有一个集合的数据，把集合中的所有数据都挨条插入的话，效率如何？一般在实际的操作中，很少一条条插入，更多的是批量插入

/*
删除操作：
delete from tablename where condition

*/
--删除满足条件的数据
delete from emp2 where deptno = 10;

--把整张表的数据全部清空
delete from emp2;

--truncate: 跟delete有所不同，delete在进行删除的时候经过事务，而truncate不经过事务，一旦删除就是永久删除，不具备回滚的操作
--效率比较高，但是容易发生误操作，所以不建议使用
truncate table emp2;

/*
修改操作：
   update tablename set col = val1,col2 = val2 where condition;
   可以更新或者修改满足条件的一个列或者多个列
*/
--更新单列
update emp set ename = 'HeiHei' where ename = 'Hello';

--更新多个列的值
update emp set jobs='teacher', mgr=7902 where empno = 15;

/*
增删改是数据库的常用操作，在进行操作的时候都需要《事务》的保证， 也就是说每次在pl/sql中执行sql语句之后都需要完成commit的操作
事务变得非常关键：
    最主要的目的是为了数据一致性
    如果同一份数据，在同一个时刻只能有一个人访问，就不会出现数据错乱的问题，但是在现在的项目中，更多的是并发访问
    并发访问的同时带来的就是数据的不安全，也就是不一致
    如果要保证数据的安全，最主要的方式就是加锁的方式，MVCC
    
    事务的延申：
        最基本的数据库事务
        声明式事务
        分布式事务
    
    为了提高效率，有可能多个操作会在同一个事务中执行，那么就有可能部分成功，部分失败，基于这样的情况就需要事务的控制。
    select * from emp where id = 7902 for update
    select * from emp where id = 7902 lock in share mode.
    
    如果不保证事务的话，会造成脏读，不可重复读，幻读。
*/

```







## 事务处理

事务（Transaction）是一个操作序列。这些操作要么都做，要么都不做，是一个不可分割的工作单位，是数据库环境中的逻辑工作单位。

- 事务是可保证数据库的完整性
- 事务不能嵌套



在oracle中，没有事务开始的语句。一个`Transaction`起始于一条DML(Insert、Update和Delete )语句，结束于以下的几种情况：

- 用户显式执行 `Commit` 语句提交操作或 `Rollback` 语句回退。

- 当执行 `DDL(Create、Alter、Drop)` 语句事务自动提交。

- 用户正常断开连接时，`Transaction` 自动提交。

- 系统崩溃或断电时，事务自动回退 。

  

`DDL` 语句执行自动提交事物

```plsql
insert into test02;

select * from emp where emp.deptno=10;

create table test04 as select * from emp where 1=2;
```



### `Commit` & `Rollback`

`Commit` 表示事务成功地结束，此时告诉系统，数据库要进入一个新的正确状态，该事务对数据库的所有更新都以交付实施。每个Commit语句都可以看成是一个事务成功的结束，同时也是另一个事务的开始。

`Rollback`表示事务不成功的结束，此时告诉系统，已发生错误，数据库可能处在不正确的状态，该事务对数据库的更新必须被撤销，数据库应恢复该事务到初始
状态。每个Rollback语句同时也是另一个事务的开始。

- 一旦执行了commit语句，将目前对数据库的操作提交给数据库（实际写入DB），以后就不能用rollback进行撤销。
- 执行一个 DDL/DCL语句或从 SQL*Plus 正常退出，都会自动执行 `commit` 命令。



`commit` & `rollback` 语法：

```plsql
-- 保存
savepoint transaction_name;

-- 回滚
rollback to transaction_name;
```



事物测试案例

```plsql
insert into test02(ename, empno, deptno ) values('cai10',1010,10);
insert into test02(ename, empno, deptno ) values('cai20',1010,10);

select * from test02;

savepoint sp01

insert into test02(ename,empno,deptno ) values('cai30',1010,10);
insert into test02(ename,empno,deptno ) values('cai40',1010,10);
select * from test02;
rollback to sp01
commit;
```



### 事务的ACID属性

事务有四大特征：**原子性，一致性，隔离性和持久性**。



1， 原子性（Atomicity）

- 一个原子事务要么完整执行，要么干脆不执行。这意味着，工作单元中的每项任务都必须正确执行。如果有任一任务执行失败，则整个工
作单元或事务就会被终止。即此前对数据所作的任何修改都将被撤销。如果所有任务都被成功执行，事务就会被提交，即对数据所作的修改将
会是永久性的。



2， 一致性（Consistency）

- 一致性代表了底层数据存储的完整性。它必须由事务系统和应用开发人员共同来保证。事务系统通过保证事务的原子性，隔离性和持久性
来满足这一要求; 应用开发人员则需要保证数据库有适当的约束(主键，引用完整性等)，并且工作单元中所实现的业务逻辑不会导致数据的不
一致(即，数据预期所表达的现实业务情况不相一致)。例如，在一次转账过程中，从某一账户中扣除的金额必须与另一账户中存入的金额相等。
支付宝账号100 你读到余额要取，有人向你转100 但是事物没提交（这时候你读到的余额应该是100，而不是200） 这种就是一致性



3， 隔离性（Isolation）

- 隔离性意味着事务必须在不干扰其他进程或事务的前提下独立执行。换言之，在事务或工作单元执行完毕之前，其所访问的数据不能受系
统其他部分的影响。



4， 持久性（Durability）

- 持久性表示在某个事务的执行过程中，对数据所作的所有改动都必须在事务成功结束前保存至某种物理存储设备。这样可以保证，所作的
  修改在任何系统瘫痪时不至于丢失。

  

提交或回滚前数据的状态

- 以前的数据可恢复
- 当前的用户可以看到DML操作的结果
- 其他用户不能看到DML操作的结果
- 被操作的数据被锁住,其他用户不能修改这些数据



提交后数据的状态

- 数据的修改被永久写在数据库中.
- 数据以前的状态永久性丢失.
- 所有的用户都能看到操作后的结果.
- 记录锁被释放,其他用户可操作这些记录.



回滚后数据的状态

语句将放弃所有的数据修改

- 修改的数据被回退.
- 恢复数据以前的状态.
- 行级锁被释放.





```plsql
--事务：表示操作集合，不可分割，要么全部成功，要么全部失败

--事务的开始取决于一个DML (Detelete, Modification, )语句
/*
事务的结束
  1、正常的commit（使数据修改生效）或者rollback（将数据恢复到上一个状态）
  2、自动提交，但是一般情况下要将自动提交进行关闭，(每条语句提交)效率太低
  3、用户关闭会话之后，会自动提交事务
  4、系统崩溃或者断电的时候会回滚事务，也就是将数据恢复到上一个状态
*/
insert into emp2(empno, ename) values(3333, 'Zhangsan');
insert into emp2(empno, ename) values(4444, 'Zhangsan')
commit;
--commit;
--rollback;
select * from emp2;


--savepoint  保存点
-- 当一个操作集合中包含多条SQL语句，但是只想让其中某部分成功，某部分失败，此时可以使用保存点
-- 此时如果需要回滚到某一个状态的话使用 rollback to sp1;
delete from emp2 where empno = 3333;
delete from emp2 where empno = 4444;
savepoint sp1;
delet from emp2 where empno = 1234;
rollback to sp1;

/*
事务的四个特性：ACID -- AID-C
-- 原子性：表示不可分割，一个操作集合要么全部成功，要么全部失败，不可以从中间做切分
-- 一致性：最终是为了保证数据的一致性，当经过N多个操作之后，数据的状态不会改变（转账）
          从一个一致性状态到另一个一致性状态，也就是数据不可以发生错乱
-- 隔离性：各个事务之间相关不会产生影响，（隔离级别）
          严格的隔离性会导致效率降低，在某些情况下为了提高程序的执行效率，需要降低隔离的级别
          隔离级别：
            -- 读未提交
            -- 读已提交
            -- 可重复读
            -- 序列化
          数据不一致的问题：
            -- 脏读
            -- 不可重复读
            -- 幻读
-- 持久性：所有数据的修改都必须要持久化到存储介质中，不会因为应用程序的关闭而导致数据丢失

  四个特性中，哪个是最关键的？
     -- 所有的特性中都是为了保证数据的一致性，所以一致性是最终的追求
     -- 事务中的一致性是通过原子性、隔离性、持久性来保证的

     锁的机制：
     为了解决在并发访问的时候，数据不一致的问题，需要给数据加锁
     加锁的同时需要考虑《粒度》的问题：
         操作的对象
           -- 数据库
           -- 表
           -- 行
     一般情况下，锁的粒度越小，效率越高，粒度越大，效率越低 
            在实际的工作环境中，大部分的操作都是行级锁  

*/

```









## 常用数据类型



| 数据类型 | 说明 |
| -------- | ---- |
|`number(x,y)` |数字类型，最长x位，y位小数。|
|`varchar2(maxlength)`|变长字符串，这个参数的上限是32767字节|
|`char(max_length)`|定长字符串，最大2000字节。|
|`DATE`|日期类型 (只能精确到秒。)|
|`TIMESTAMP`|时间戳 (精确到微秒)|
|`long`|长字符串，最长2GB|
|`CLOB`|最大长度4G。<br/>大对象很少使用：如果存在大对象，一般的解决方案存入文件地址（地址为程序所在应用服务器的相对路径）。 (了解类型)|
|`BLOB`|存二进制文件。(了解类型)|

- `varchar2(maxlength)`：声明方式为：`varchar2(L)`，其中，L为字符串长度，没有缺省值。



数据库的对象

| 对象名称 | 描述 |
| -------- | ---- |
|表|基本的数据存储对象，以行和列的形式存在，列也就是字段，行也就是记录|
|约束|执行数据校验，保证了数据完整性的|
|视图|一个或者多个表数据的逻辑显示|
|索引|用于提高查询的性能|
|Sequence|自增序列|



数据库对象的命名规则

- 必须以字母开头
- 可包括数字和三个特殊字符`（# _ $）`
- 不能使用oracle的保留字
- 同一用户下的对象不能同名



ORACLE常用数据类型

| 数据类型 | 含义 |
| -------- | ---- |
|Varchar2(n)|变长字符串，存储空间等与实际空间的数据大小，最大为4K，长度以字节为单位指定（注意中文字符）|
|Char(n)|定长字符串，存储空间大小固定|
|Number(p,s)|整数或小数，p是精度（所有数字位的个数，最大38），s是刻度范围（小数点右边的数字位个数，最大127）|
|Date/timestamp|年、月、日、时、分、秒|



## 表的创建 `DDL`

### 标准的建表语法：

```plsql
CREATE TABLE [ schema .] table
( column datatype [DEFAULT expr ] , …
);
```

- 在创建新表时，指定的表名必须不存在，否则将出错。
- 使用默认值：当插入行时如果不给出值，dbms将自动采用默认值。
- 在用 `create语句` 创建基本表时，最初只是一个空的框架，用户可以使用 `insert命令` 把数据插入表中。



案例

- 设计要求：建立一张用来存储学生信息的表，表中的字段包含了学生的学号、姓名、年龄、入学日期、年级、班级、email等信息，并且为grade指定了默认值为1，如果在插入数据时不指定grade得值，就代表是一年级的学生。

```plsql
create table stu
(id number(6),
name varchar2(20) not null unique,
sex number(1) not null,
age number(3),
sdate date,
grade number(2) default 1,
class number(4),
email varchar2(50)
);
```



### 使用子查询创建表的语法

```plsql
CREATE TABLE table [ column (, column ...)]
AS subquery ;
```

- 新表的字段列表必须与子查询中的字段列表匹配
- 字段列表可以省略：`create table emp2 as select * from emp;`



### 表结构的修改

在基本表建立并使用一段时间后，可以根据实际需要对基本表的结构进行修改。

1，增加新的列：`alter table … add … ` 语句

```plsql
alter table emp add address varchar(20)
```

- 新增加的类不能定义为“`not null`”, 基本表在增加一列后，原有元组在新增加的列上的值都定义为空值。



2， 删除原有的列：`alter table 表名 drop column 列名`

```plsql
alter table emp drop column address
```



3， 修改字段：`alter table...modify...`

```plsql
alter table emp modify(job varchar(50))
```



4， 在基本表不需要时，可以使用“drop table”语句撤消。在一个基本表撤消后，所有的数据都丢弃。所有相关的索引被删除

```plsql
drop table emp cascade constraints;
```



5， 可以使用 `RENAME语句` 改变表名（视图），要求必须是表（视图）的所有者

```plsql
RENAME old_name TO new_name
```



```plsql
/*

CREATE TABLE [schema.]table
  (column datatype [DEFAULT expr] , …
  );

*/

-- 设计要求：建立一张用来存储学生信息的表，表中的字段包含了学生的学号、姓名、年龄、入学日期、年级、班级、email等信息，
-- 并且为grade指定了默认值为1，如果在插入数据时不指定grade得值，就代表是一年级的学生

create table student
(
stu_id number(10),
name varchar2(20),
age number(3),
hiredate date,
grade varchar2(10),
classes varchar2(10) default 1,
email varchar2(50)
)

insert into student values(2020601, 'zhangsan', 22, to_date('20200101', 'YYYY-MM-DD'), '2', '1', '12334235@qq.com');

select * from student;

-- 正规的表结构设计需要使用第三方工具 powerdesigner
-- 再添加表的列的时候，不能允许设置成not null
alter table student add address varchar2(100);
-- 删除字段
alter table student drop column address;
alter table student modify(email varchar2(100));

--重新命名表
rename student to stu;

--删除表
/*
在删除表的时候，经常会遇到多个表关联的情况，多个表关联的时候不能随意删除，需要使用级联删除
restrict: 
cascade: 有A,B两张表，如果 A 中的某一个字段跟B表中的某一个字段做关联，那么再删除表A的时候，需要先将表B删除
set null: 在删除的时候，把表的关联字段设置成空
*/
drop table stu;


-- 创建表的时候可以给表中的数据添加数据校验规则，这些规则称之为约束
 /*
 约束分为五大类
 -- not null: 非空约束，插入数据的时候某些列不允许为空
 -- unique key: 唯一键约束，可以限定某一个列的值是唯一的，唯一键的列一般被用作索引列。
 -- primary key: 主键：非空且唯一，任何一张表一般情况下最好有主键，用来唯一的标识一行记录，
 -- foreign key: 外键，当多个表之间有关联关系（一个表的某个列的值依赖与另一张表的某个值）的时候，需要使用外键
 -- check约束:可以根据用户自己的需求去限定某些列的值
 */
 --个人建议：再创建表的时候直接将各个表的约束条件添加好，如果包含外键约束的话，最好先把外键关联表的数据优先插入
 
 create table student
(
stu_id number(10) primary key ,
name varchar2(20) not null,
age number(3) check(age>0 and age < 120),
hiredate date,
grade varchar2(10),
classes varchar2(10) default 1,
email varchar2(50) unique
deptno number(2)
);

alter table student add constraint fk_0001 foreign key(deptno) reference dept(deptno);

```









## 约束 `constraint`

### 约束简介

约束用于确保数据库数据满足特定的商业逻辑或者企业规则，如果定义了约束，并且数据不符合约束，那么DML操作（INSERT、UPDATE、DELETE）将不能成功执行。

- 创建表时，指定插入数据的规则。
- 约束是在表上强制执行的数据校验规则。
- Oracle 支持下面五类完整性约束:

1. `NOT NULL`非空
2. `UNIQUE Key` 唯一键
3. `PRIMARY KEY` 主键
4. `FOREIGN KEY` 外键
5. `CHECK` 自定义检查约束



- Oracle使用 `SYS_Cn`格式命名约束，也可以由用户命名。



创建约束的时机

- 在建表的同时创建
- 建表后创建



约束从作用上分类，可以分成两大类：

- 表级约束：可以约束表中的任意一列或多列。可以定义除了Not Null以外的任何约束。

- 列级约束：只能约束其所在的某一列。可以定义任何约束。



- 

  

### 定义约束

```plsql
-- 列级约束
column [CONSTRAINT constraint_name] constraint_type

-- 表级约束：
column ,..., [CONSTRAINT constraint_name] constraint_type (column,...)
```



### `NOT NULL` 约束

- 确保字段值不允许为空

- **只能在列级定义**，不能在表级定义

```plsql
-- 定义列级 not null 约束
CREATE TABLE emp01(
	eno INT NOT NULL,
	name VARCHAR2(10) CONSTRAINT nn_name2 NOT NULL,
	salary NUMBER(6,2)
);

-- 
CREATE TABLE employees(
employee_id NUMBER(6),
name VARCHAR2(25) NOT NULL,
salary NUMBER(8,2),
hire_date DATE CONSTRAINT emp_hire_date_nn NOT NULL
);
```



列级约束和表级约束

- 列级约束: 从形式上看，在每列字段定义完后马上定义的约束即是列级约束。

```plsql
create table parent(c1 number primary key );

create table child(c number primary key, c2 number references parent(c1));
```
- 表级约束: 从形式上看，在每列字段定义后，再次补充附加的约束即是表级约束

```plsql
create table child(c number, c2 number, primary key (c2), foreign key(c2) references parent(c1));
```
- 有些时候，列级约束无法实现某种约束的定义，比如 **联合主键的定义**，就要用到表级约束:
```plsql
create table test(id1 number , id2 number, primary key(id1, id2));
```




### 主键约束 `PRIMARY KEY`

主键约束是数据库中最重要的一种约束。在关系中，主键值不可为空，也不允许出现重复，即关系要满足实体完整性规则。

- 主键从功能上看相当于非空且唯一
- 一个表中只允许一个主键
- 主键是表中能够唯一确定一个行数据的字段
- 主键字段可以是单字段或者是多字段的组合
- Oracle为主键创建对应的 **唯一性索引**



主键定义形式

1. 主键子句：在表的定义中加上如下子句： `primary key(列)`
2. 主键短语：在主属性的定义之后加上 `primary key` 字样。



```plsql
create table t3(
id number(4),
constraint t3_pk primary key(id)
);
```

- 上述形式Oracle会 **自动命名约束**，可自己给约束起名

- 约束建议命名
    - `约束_表名_字段` 可以保证唯一性。 如果太长，可用缩写。
    - 同一字段可以有多个约束，但是约束之间不要冲突



### 唯一性约束 `UNIQUE`

- 唯一性约束条件确保所在的字段或者字段组合 **不出现重复值**
- 唯一性约束条件的字段 **允许出现空值**
- **Oracle 将为唯一性约束条件创建对应的唯一性索引**


```plsql
CREATE TABLE employees(
id NUMBER(6),
name VARCHAR2(25) NOT NULL UNIQUE,
email VARCHAR2(25),
salary NUMBER(8,2),
hire_date DATE NOT NULL,
CONSTRAINT emp_email_uk UNIQUE(email)
);
```



### `CHECK` 约束

- Check约束用于对一个属性的值加以限制
- Check约束中定义检查的条件表达式，那么，数据就需要符合设置的条件

```plsql
create table emp3
(id number(4) primary key,
age number(2) check(age > 0 and age < 100),
salary number(7,2),
sex char(1),
constraint salary_check check(salary > 0)
);
```

- 在 Check 约束下，插入记录或修改记录时，系统要测试新的记录的值是否满足条件



### 外键约束 `FOREIGN KEY`

- 外键是表中的一个列，其值必须在另一表的主键或者唯一键中列出
- 作为主键的表称为“主表”，作为外键的关系称为“依赖表”
- 外键参照的是主表的主键或者唯一键
- 对于主表的删除和修改主键值的操作，会对依赖关系产生影响，以删除为例：当要删除主表的某个记录（即删除一个主键值，那么对依赖的影响可采取下列3种做法：
1. RESTRICT方式：只有当依赖表中没有一个外键值与要删除的主表中主键值相对应时，才可执行删除操作。
2. CASCADE方式：将依赖表中所有外键值与主表中要删除的主键值相对应的记录一起删除
3. SET NULL方式：将依赖表中所有与主表中被删除的主键值相对应的外键值设为空值
FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
[ON DELETE [CASCADE|SET NULL]] 如省略on短语，缺省为第一中处理方式。



### 约束的添加和撤销

可增加或删除约束，但不能直接修改

```plsql
-- 可增加或删除约束，但不能直接修改
-- alter table tablename

-- 增加
add constraint con_name unique(col)

-- 删除
drop constraint com_name [cascade]
```



查询constraint

```plsql

select constraint_name,constraint_type
from user_constraints
where table_name=upper('sxtstu05')
或者 where owner=‘SCOTT’ 大写


select constraint_name,constraint_type
from user_constraints
where owner='SCOTT'

select constraint_name,column_name from user_cons_columns
where table_name=upper(‘tablename')

```





## 索引

索引是为了加快对数据的搜索速度而设立的。索引是方案（schema）中的一个数据库对象，与表独立存放.

索引的作用

- 在数据库中用来加速对表的查询,通过使用快速路径访问方法快速定位数据,减少了磁盘的I/O操作



非显示索引

- SQL中的索引是非显示索引
- 在索引创建以后，在用户撤销它之前，不会再用到该索引的名字，但是索引在用户查询时会自动起作用。



索引的创建有两种情况

1. 自动: 当在表上定义一个`PRIMARY KEY` 或者 `UNIQUE` 约束条件时,Oracle数据库自动创建一个对应的唯一索引.
2. 手动: 用户可以创建索引以加速查询



开发中使用索引的要点：

1. 索引改善检索操作的性能，**但降低数据插入、修改和删除的性能**。在执行这些操作时，DBMS必须动态地更新索引。

2. 索引数据可能 **要占用大量的存储空间**。

3. 并非所有的数据都适合于索引。**唯一性不好的数据（如省）** 使用索引到的好处不比具有更多可能值的数据（如姓名）从索引得到的好处多。

4. 索引用于 **数据过滤和数据排序**。如果你经常以某种特定的顺序排序数据，则该数据可能是索引的备选。

5. 可以 **在索引中定义多个列（如省加城市）**，这样的索引只在以省加城市的顺序排序时有用。如果想按城市排序，则这种索引没有用处。



索引的使用

- 在一列或者多列上 **创建索引**：`CREATE INDEX index ON table ( column [, column ]...);`
- **删掉索引**：`DROP INDEX index_name`

```plsql
-- 在一列或者多列上创建索引
CREATE INDEX index ON table ( column [, column ]...);

-- 建立 EMP 表对 ename 字段的索引，有助与对该字段的查询速度
-- 下面的索引将会提高对EMP表基于 ENAME 字段的查询速度
CREATE INDEX emp_last_name_idx ON emp (ename);

-- 通过DROP INDEX 命令删掉一个索引
DROP INDEX index ;

-- 删掉 UPPER_LAST_NAME_IDX 索引
DROP INDEX upper_last_name_idx;
```



```plsql
--索引：加快数据的检索
--创建索引
create index i_ename on emp(ename);

--删除索引
drop index i_ename;

select * from emp where ename = 'SMITH';

-- 局部性原理：
-- 磁盘预读：

-- 回表： 走两次索引， 首先走 ename 索引，而后依据 ID 索引查询字段
-- 覆盖索引
-- 组合索引
-- 最左匹配

```







