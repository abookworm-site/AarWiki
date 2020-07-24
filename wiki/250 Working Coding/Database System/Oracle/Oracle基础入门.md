# Oracle 基础入门

## SQL语言

### 基本概念 

SQL：即结构化查询语言 (Structured Query Language)，具有定义、查询、更新和控制等多种功能，是关系数据库的标准语言。



### SQL分类

- 数据操纵语言DML：`Data Manipulation Language` 
    - `SELECT`
    - `INSERT`
    - `UPDATE`
    - `DELETE`
- 数据定义语言DDL：`Data definition language` 
    - `CREATE`
    - `ALTER`
    - `DROP`
    - `RENAME`
    - `TRUNCATE`
- 数据控制语言DCL： `Data Control Language` 
    - `GRANT`
    - `REVOKE`
- Transaction：
    - `commit`
    - `rollback`
    - `savepoint`



## Oracle基本操作

### `SCOTT` 基础表

Oracle 安装完成后，在 `scott` 用户下有几张基础表可供操作。以下是各表字段信息：

Table：`emp`雇员表(employee)

- `Empno`： 雇员工号
- `Ename`： 雇员名字
- `Job`：工作（秘书、销售、经理、分析员、保管）
- `Mgr`(manager)：经理的工号
- `Hiredate`：雇用日期
- `Sal`：工资 
- `Comm`：津贴 
- `Deptno`：所属部门号



Table：`dept`部门表（department）

- `Deptno`：部门号
- `Dname`：部门名字
- `Loc`：地址



Table：`salgrade`薪资等级表：一个公司是有等级制度，用此表表示一个工资的等级

- `grade`：等级
- `losal`：最低工资
- `hisal`：最高工资



Table：`bonus`奖金表：表示一个雇员的工资及奖金。

- `Ename`：雇员名字
- `job`：工作
- `sal`：工资 
- `comm`：津贴



### 基本查询

 `select ... from ...where` 语法

```sql
select [distinct] [*, column, alias, ...] 
	from table alias 
	where 表达式条件
```

alias

- Column alias
- Column “alias”
- Column as alias

检索

- 检索单个列：`select col from tableName;`
- 检索多个列：`select col1, col2,col3 from tableName;`
- 检索所有列：`select * from tableName;`
    - 使用通配符优点：书写方便、可检索未知列
    - 使用通配符缺点：降低检索性能

- 给检索出的列起个别名
    - `select job "gong zuo" from emp;`
    - `select job as "gong zuo" from emp;`

`distinct` 去重

- `distinct`必须放在开头
- 多字段：每个字段不一样才去重

```sql
-- 查询雇员表中部门编号是10的员工
select * from emp where deptno = 10;

-- 查询表中的所有字段,可以使用*,但是在项目中千万不要随便使用*,浪费IO带宽，可能造成严重后果
select empno,ename,job from emp where deptno = 10;

-- distinct 去除重复数据
select distinct deptno from emp;

-- 去重也可以针对多个字段，多个字段值只要有一个不匹配就算是不同的记录
select distinct deptno,sal from emp;

-- 在查询的过程中可以给列添加别名，同时也可以给表添加别名
select e.empno 雇员编号,e.ename 雇员名称,e.job 雇员工作 from emp e where e.deptno = 10;

-- 给列起别名时，可以加as，也可以不加
select e.empno as 雇员编号,e.ename  as 雇员名称,e.job as 雇员工作 from emp e where e.deptno = 10;

-- 给列起别名时，如果别名中包含空格，那么需要将别名整体用“”包含起来
select e.empno as "雇员 编号",e.ename  as "雇员 名称",e.job as "雇员 工作" from emp e where e.deptno = 10;
```

- 这里的中文汉字需要特别设置，若Oracle安装后不支持汉字，那么请直接使用英文。



#### 表结构认知

```sql
-- 查看用户下的所有表
select * from tab;

-- 详细查询当前用户下的所有表
select * from user_tables;

-- 查看所有表名称
select table_name from user_tables;

-- 查看表结构：命令窗口
describe dept;

-- 查看表结构：mysql
desc 表名;

-- 查看表结构：'DEPT':表必须大写。
select dbms_metadata.get_ddl('TABLE','DEPT') from dual;
--output------------------------------------------------------------
-- CREATE TABLE "SCOTT"."DEPT" 
--   ("DEPTNO" NUMBER(2,0), 
--	"DNAME" VARCHAR2(14), 
--	"LOC" VARCHAR2(13), 
--	 CONSTRAINT "PK_DEPT" PRIMARY KEY ("DEPTNO")
--  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "USERS"  ENABLE
--   ) SEGMENT CREATION IMMEDIATE 
--  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "USERS" 
---------------------------------------------------------------------

-- 获取表
-- 当前用户的表
select table_name from user_tables;

-- 查看所有用户的表  
select table_name from all_tables;

-- 查看所有系统表 
select table_name from dba_tables;

-- 查看某用户的表
select table_name from dba_tables where owner='用户名';

-- 表user_tables：字段
-- user_tables： table_name,tablespace_name,last_analyzed等

-- 表dba_tables：字段
-- dba_tables： ower,table_name,tablespace_name,last_analyzed等

-- 表all_tables：字段
-- all_tables： ower,table_name,tablespace_name,last_analyzed等

-- 表all_objects：字段
-- all_objects： ower,object_name,subobject_name,object_id,created,last_ddl_time,timestamp,status等  


-- 获取表字段：

select * from user_tab_columns where Table_Name='用户表'; 

select * from all_tab_columns where Table_Name='用户表';

select * from dba_tab_columns where Table_Name='用户表'; 

-- 表user_tab_columns：字段
-- user_tab_columns： table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等 

-- 表all_tab_columns：字段
-- all_tab_columns ： ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等 

-- 表dba_tab_columns：字段
-- dba_tab_columns： ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等

```



#### 注释

添加和获取注释

```sql
-- 为表添加注释
comment on table emp is ‘雇员表';

-- 为列添加注释
comment on column emp.Empno is '雇员工号';

-- 获取表注释：
-- 相应的还有dba_tab_comments，all_tab_comments. 这两个比user_tab_comments多了ower列。 
select * from user_tab_comments user_tab_comments：table_name,table_type,comments 

-- 获取字段注释：
select * from user_col_comments;
-- 字段注释表：字段
-- user_col_comments：table_name,column_name,comments
```

查看注释

![image-20200723143945167](_resource/Oracle%E5%9F%BA%E7%A1%80%E5%85%A5%E9%97%A8/image-20200723143945167.png)



### 条件查询 `where`

- `＝`，`!＝`，`<>`，`<`，`>`， `<=`，`>=`
- `any`，`some`，`all`
- `is null`，`is not null`
    - SQL的语法中，`null` 表示一个特殊的含义，`null != null`
    - 因此，不能使用 `=`，`!= ` 判断，需要使用 `is` ，`is not`
- `between x and y` 
    - 逻辑判断区间
-  `and`，`or`
    - 逻辑判断与操作，逻辑或操作
    - 同时出现时，注意有限级：`and` > `or`。
    - 因此，**对于计算次序问题，最好添加括号分组处理**。
    - 语句 **优化**
        - **`and` 把检索结果较少的条件放前面**
        - **`or` 把检索结果较多的条件放前面**
- `in（list）`，`not in（list）`
    - `in` or `not in` 可以跟区间，也可以单个值。
- `exists（sub-query）`
    - 子查询：当 `exists` 中的子查询语句能查到对应结果时，意味着条件满足
- `like '_/%'` & `like '\_\%' escape '\'`
    - `like` 语句中，需要使用占位符或者通配符
        - 通配符`_` : 代表某个字符或者数字仅出现一次
        - 通配符`%`：代表任意字符出现任意次数
        - `escape`: 使用转义字符,可以自己规定转义字符
    - 使用 `like` 语言要慎重，因为效率比较低
        - 若其他操作符可以达到目录，那么 就不要使用通配符
    - 使用 `like` 语句可以参考使用索引，但语句要求不能以 `%` 开头
        - 此时，此种通配符搜索模式特别慢
        - `select ename from emp where ename like '%ALL%';`
    - 涉及到大文本检索的时候，可借用某些框架 `luence`，`solr`，`elastic search`。
      - IK 分词器：信息的提取，提前的反馈，一句话的分值进行通知。



案例：

```sql
-- =
select * from emp where deptno = 20;

-- !=
select * from emp where deptno != 20;

-- <> 不等于
select * from emp where deptno <> 20;

-- <,
select * from emp where deptno < 20;

-- >,
select * from emp where deptno > 20;

-- <=,
select * from emp where deptno <= 20;

-- >=,
select * from emp where deptno >= 20;

-- any,取其中任意一个
select sal from emp where sal > any(1000, 1500, 3000);

-- some,跟 any 同样的效果，只要大于其中某一个值都会成立
select sal from emp where sal > some(1000, 1500, 3000);

-- all，大于所有的值才会成立
select sal from emp where sal > all(1000, 1500, 3000);

-- is null
-- SQL的语法中，null表示一个特殊的含义，null != null
-- 因此，不能使用=，！=判断，需要使用is ,is not
select * from emp where comm == null; -- 查询结果为空
select * from emp where comm is null;

-- is not null
select * from emp where comm is not null;
select * from emp where null is null;

-- between x and y,包含x和y的值
select * from emp where sal between 1500 and 3000;
select * from emp where sal >= 1500 and sal <= 3000;

-- 进行某些值的等值判断的时候可以使用in和not in
-- in（list）
select * from emp where deptno in (10, 20);

-- 关键字 and 和 or
-- and相当于是 与操作，or相当于是 或操作
-- and和or可能出现在同一个sql语句中，此时需要注意and和or的优先级
-- and 的优先级要高于or，所以一定要将or的相关操作用（）括起来，提高优先级
select * from emp where deptno = 10 or deptno = 20;

-- not in（list）
select * from emp where deptno not in (10, 20);
select * from emp where deptno != 10 and deptno != 20;

/* exists（sub－query）: 子查询
--     当exists中的子查询语句能查到对应结果的时候，意味着条件满足
--     即整体查询相当于双层for循环
*/
-- 查询部门编号为10和20的员工，要求使用 exists 实现
select * from emp where deptno = 10 or deptno = 20;
select *
  from emp
 where exists (select deptno
          from dept
         where deptno = 10
            or deptno = 20);

-- 通过外层循环来规范内层循环
select *
  from emp e
 where exists (select deptno
          from dept d
         where (d.deptno = 10 or d.deptno = 20)
           and e.deptno = d.deptno);

/*
模糊查询：like  _ ,%,escape ‘\‘   _\% escape ‘\’

在like的语句中，需要使用占位符或者通配符
           _: 代表某个字符或者数字仅出现一次
           %：代表任意字符出现任意次数
           escape: 使用转义字符,可以自己规定转义字符

-- 使用like的时候要慎重，因为like的效率比较低
-- 使用like可以参考使用索引，但是要求不能以%开头
-- 涉及到大文本的检索的时候，可以使用某些框架 luence，solr，elastic search
  - IK 分词器：信息的提取，提前的反馈，一句话的分值进行通知。
*/
-- 查询名字以S开头的用户
select * from emp where ename like ('S%');

-- 查询名字以S开头且倒数第二个字符为T的用户
select * from emp where ename like ('S%T_');

-- 查询名字中带%的用户
-- 此处，需要自行插入一列数据：ename = CAI%KK
select * from emp where ename like ('%.%%') escape('.');


```



### 排序 `order by`

选择 **业务不太繁忙时** 进行排序

- 执行 `order by` 的时候相当于是做了全排序，会比较耗费系统的资源

- 全排序的效率会比较低，有可能影响正常业务

默认情况下，进行升序排序：

- `asc` ：默认排序方式，表升序
- `desc` ：降序排序方式

排序按照自然顺序进行

- 数值：按照从大到小
- 字符串：按照字典序排序

实例：

```sql
/* 排序： order by
-- 每次在执行order by的时候相当于是做了全排序，此时，会比较耗费系统的资源，因此选择在业务不太繁忙的时候进行
-- 全排序的效率会比较低，有可能影响正常业务

-- 默认情况下完成的是升序的操作，
-- asc:是默认的排序方式，表示升序
-- desc：降序的排序方式
*/
-- 按照销售额进行升序排序、降序排序。
select * from emp order by sal;
select * from emp order by sal desc;

-- 排序是按照自然顺序进行排序的
-- 如果是数值，那么按照从大到小
-- 如果是字符串，那么按照字典序排序
select * from emp order by ename;

-- 排序可以指定多个字段，而且多个字段可以使用不同的排序方式
select * from emp order by sal desc, ename desc;


```



### 计算字段

为什么需要计算字段？
需要直接从数据库中检索出转换、计算或格式化过的数据；而不是检索出数据，然后再在客户机应用程序中重新格式化。

- 计算字段并不实际存在数据库表中
- SQL允许 `select` 子句中出现 `+/-/*//` 以及列名和常数的表达式
- 拼接字段(`||`, `+`)：这里首选 `||` 
    - MySQL 中 `||` 表示 `or` ，因此一般用 `concat()` 。
    - 字符串连接符：`||` or `concat()`

实例：

```sql
-- 使用计算字段
-- 字符串连接符
select 'my name is ' || ename name from emp;
select concat('my name is ', ename) from emp;
```



#### 通用函数 `nvl()`

why `nvl()`?

- SQL中允许列值为空，空值用保留字 `NULL` 表示。

- `null` 就是代表了一个不确定的内容。
- 任何含有 `null` 值的数学表达式最后的结果都为空值 `null`，因此需要转换
    - `select 100 + null from dual;`



`nvl()` 函数：

- 作用：将 `NULL` 转换成为一个实际值 `actual value`
- `nvl(arg1,arg2)`
    - 如果 `arg1` 是空，那么 **返回**  `arg2`
    - 如果不是空，则 **返回** 原来的值



实例：

```sql
-- 计算所有员工的年薪
-- 此时，仅有少数人有年薪
select ename , (e.sal + e.comm)*12 from emp e;

-- null是比较特殊的存在，null做任何运算都还是为null，因此要将空进行转换
-- 引入函数nvl，nvl(arg1,arg2),如果arg1是空，那么返回arg2，如果不是空，则返回原来的值
select ename, (e.sal + nvl(e.comm, 0))*12 from emp e;

-- dual是oracle数据库中的一张虚拟表，没有实际的数据，可以用来做测试
select 100 + null from dual;
```

- **dual 表** 是Oracle 数据库中一张虚拟表，没有实际数据。可用来做测试。



### 并集，全集，交集，差集

1. `union all` 全集：将两个集合中所有数据全部显示，不完成去重的操作(即：包含重复数据）。

2. `union` 并集（去重）：将两个集合中所有数据都进行显示，但是不包含重复的数据。

3. `intersect` 交集：将两个集合中交叉的数据集显示一次。

4. `minus` 差集：跟A和B的集合顺序相关
    - A 差 B： 包含在A集合而不包含在B集合中的数据
    - B 差 A： 包含在B集合而不包含在A集合中的数据，



实例：

```sql
-- A
select * from emp where deptno = 30;
-- B
select * from emp where sal > 1000;

--并集，将两个集合中的所有数据都进行显示，但是不包含重复的数据
select * from emp where deptno = 30 union
select * from emp where sal > 1000;

-- 全集，两个集合数据全部显示，不会完成去重的操作(即：包含重复数据)
select * from emp where deptno = 30 union all
select * from emp e where sal > 1000;

-- 交集，两个集合中交叉的数据集，只显示一次
select * from emp where deptno = 30 intersect
select * from emp where sal > 1000;

-- 差集,包含在A集合而不包含在B集合中的数据，跟A和B的集合顺序相关
-- A 差 B： A - B
select * from emp where deptno = 30 minus
select * from emp where sal > 1000;
-- B 差 A： B - A
select * from emp where sal > 1000 minus
select * from emp where deptno = 30;
```





















































## Oracle 索引



```sql

--查看某个数据表包含的索引
select * from user_indexes where table_name=upper('table_name');

-- 根据索引名查看索引包含的字段
select * from user_ind_columns where index_name = 'INDEXS_NAME';

```

























