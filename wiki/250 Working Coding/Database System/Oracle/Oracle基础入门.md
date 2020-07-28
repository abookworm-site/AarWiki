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

Oracle 安装完成后，在 `scott` 用户下有几张基础表可供操作。以下是各表字段信息及数据：

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



**Table：`Emp`**

|      | EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL      | COMM    | DEPTNO |
| ---- | ----- | ------ | --------- | ---- | ---------- | -------- | ------- | ------ |
| 1    | 1234  | CAI%10 | ANALYST   | 7782 | 2020/6/1   | 12000.00 |         | 10     |
| 2    | 7369  | SMITH  | CLERK     | 7902 | 1980/12/17 | 800.00   |         | 20     |
| 3    | 7499  | ALLEN  | SALESMAN  | 7698 | 1981/2/20  | 1600.00  | 300.00  | 30     |
| 4    | 7521  | WARD   | SALESMAN  | 7698 | 1981/2/22  | 1250.00  | 500.00  | 30     |
| 5    | 7566  | JONES  | MANAGER   | 7839 | 1981/4/2   | 2975.00  |         | 20     |
| 6    | 7654  | MARTIN | SALESMAN  | 7698 | 1981/9/28  | 1250.00  | 1400.00 | 30     |
| 7    | 7698  | BLAKE  | MANAGER   | 7839 | 1981/5/1   | 2850.00  |         | 30     |
| 8    | 7782  | CLARK  | MANAGER   | 7839 | 1981/6/9   | 2450.00  |         | 10     |
| 9    | 7788  | SCOTT  | ANALYST   | 7566 | 1987/4/19  | 3000.00  |         | 20     |
| 10   | 7839  | KING   | PRESIDENT |      | 1981/11/17 | 5000.00  |         | 10     |
| 11   | 7844  | TURNER | SALESMAN  | 7698 | 1981/9/8   | 1500.00  | 0.00    | 30     |
| 12   | 7876  | ADAMS  | CLERK     | 7788 | 1987/5/23  | 1100.00  |         | 20     |
| 13   | 7900  | JAMES  | CLERK     | 7698 | 1981/12/3  | 950.00   |         | 30     |
| 14   | 7902  | FORD   | ANALYST   | 7566 | 1981/12/3  | 3000.00  |         | 20     |
| 15   | 7934  | MILLER | CLERK     | 7782 | 1982/1/23  | 1300.00  |         | 10     |

- 原始表格并没有第一列，第一列数据为手工添加。便于查询练习。



**Table：`Dept`**

| id   | DEPTNO | DNAME      | LOC      |
| ---- | ------ | ---------- | -------- |
| 1    | 10     | ACCOUNTING | NEW YORK |
| 2    | 20     | RESEARCH   | DALLAS   |
| 3    | 30     | SALES      | CHICAGO  |
| 4    | 40     | OPERATIONS | BOSTON   |



**Table：`salgrade`**

|      | GRADE | LOSAL | HISAL |
| ---- | ----- | ----- | ----- |
| 1    | 1     | 700   | 1200  |
| 2    | 2     | 1201  | 1400  |
| 3    | 3     | 1401  | 2000  |
| 4    | 4     | 2001  | 3000  |
| 5    | 5     | 3001  | 9999  |



### 基本查询

 `select ... from ...where` 语法

```sql
select [distinct] [*, column, alias, ...] 
	from table alias 
	where 表达式条件
```

别名命名方式 `alias`

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

字段数据去重 `distinct` 

- `distinct`必须放在开头
- 多字段：每个字段不一样才去重

```sql
/* SQL 语句语法：
-- SELECT [DISTINCT] {*,column alias,..}
--	FROM table alias
--	Where 条件表达式
*/
-- 查询雇员表中部门编号是10的员工
select * from emp where deptno = 10;

-- 查询表中的所有字段,可以使用 *,但是在项目中千万不要随便使用 *,浪费IO带宽，可能造成严重后果
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
/* 条件查询练习：
-- ＝，！＝,<>，<,>,<=,>=,any,some,all
-- is null,is not null
-- between x and y
-- in（list），not in（list）
-- exists（sub－query）
-- like  _ ,%,escape ‘\‘   _\% escape ‘\’
*/
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
-- and 相当于是 与操作，or相当于是 或操作
-- and 和 or 可能出现在同一个sql语句中，此时需要注意and和or的优先级
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

1. `union all` 全集：
    - 将两个集合中所有数据全部显示，不完成去重的操作(即：包含重复数据）。
2. `union` 并集（去重）：
    - 将两个集合中所有数据都进行显示，但是不包含重复的数据。
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



### 复习练习

```sql
-- 总结复习：
-- 1、使用基本查询语句.
-- (1) 查询DEPT表显示所有部门名称.
select dname from dept;

-- (2) 查询EMP表显示所有雇员名及其全年收入(月收入=工资+补助),处理NULL行,并指定列别名为"年收入"
select e.ename, (e.sal + nvl(e.comm, 0))*12 "year co" from emp e;

-- (3) 查询显示不存在雇员的所有部门号。***
select e.deptno from emp e;

select deptno from dept where deptno not in (select e.deptno from emp e);


-- 2、限制查询数据
-- (1) 查询EMP表显示工资超过2850的雇员姓名和工资。
select e.ename, e.sal from emp e where e.sal > 2850;

-- (2) 查询EMP表显示工资丌在1500～2850乊间的所有雇员及工资。
select e.ename, e.sal from emp e where e.sal > 1500 and e.sal < 2850;

-- (3) 查询EMP表显示代码为7566的雇员姓名及所在部门代码。
select e.ename, e.deptno from emp e where e.empno = 7566;

-- (4) 查询EMP表显示部门10和30中工资超过1500的雇员名及工资。
select e.ename, e.sal from emp e where (deptno = 10 or deptno = 30) and e.sal > 1500;

-- (5) 查询EMP表显示第2个字符为"A"的所有雇员名其工资。
select e.ename, e.sal from emp e where e.ename like '_A%';

-- (6) 查询EMP表显示补助非空的所有雇员名及其补助。
select e.ename, e.comm from emp e where e.comm is not null;


-- 3、排序数据
-- (1) 查询EMP表显示所有雇员名、工资、雇佣日期，幵以雇员名的升序进行排序。
select e.ename, e.sal, e.hiredate from emp e order by e.ename asc;

-- (2) 查询EMP表显示在1981年2月1日到1981年5月1日乊间雇佣的雇员名、岗位及雇佣日期，幵以雇佣日期进行排序。
select e.ename, e.job, e.hiredate from emp e where e.hiredate between to_date('1981-2-1', 'YYYY-MM-DD') and to_date('1981-5-1', 'YYYY-MM-DD') order by e.hiredate;

-- (3) 查询EMP表显示获得补助的所有雇员名、工资及补助，幵以工资升序和补助降序排序。
select e.ename, e.sal, e.comm from emp e where e.comm is not null order by e.sal asc, e.comm desc;
```

- 关于 `3. 排序数据` 中 **Oracle数据库日期范围查询**  介绍如下。



#### Oracle数据库日期范围查询

关于  **Oracle数据库日期范围查询** 有两种方式：**to_char()方式** 和 **to_date()方式**。这里查询1981-02-01到1981-05-01之间的数据，实现方式如下：

##### `to_date() ` 方式：

```sql
select * from emp where hiredate >= to_date('1981-02-01','yyyy-mm-dd') and hiredate <= to_date('1981-05-01','yyyy-mm-dd');
```

运行的结果是：可以显示02-01的数据，但是不能显示05-01的数据。

所有可以得出结论：

- ①如果想显示 `05-01` 的数据可以 `<to_date('1981-05-02','yyyy-mm-dd')` ，这样就能显示01号的了。即：**to_date() 多加一天**

- ②如果想要显示 `05-01` 的数据可以 `<=to_date('1981-05-01 23:59:59 999','yyyy-mm-dd hh24:mi:ss')` 也是可以查出来的。即：**添加具体小时时间**。

##### `to_char()`方式：

同样查询上面两个日期

```sql
select * from tablename where to_char(hiredate,'yyyy-mm-dd') >= '1981-02-01' and to_char(hiredate,'yyyy-mm-dd') <= '1981-05-01';
```

查询结果：可以同时显示05-02和05-30的数据。

##### Reference

- [Oracle数据库日期范围查询的两种实现方式](https://database.51cto.com/art/201108/288058.htm)



## Oracle 函数

### SQL 函数

#### 概念

函数一般是在数据上执行的，它给数据的转换和处理提供了方便。只是将取出的数据进行处理，**不会改变数据库中的值**。

#### 分类

- 单行函数：对单个数值进行操作，并返回一个值。
    - 字符函数
    - 数字函数
    - 日期函数
    - 转换函数
    - 其他函数
- 组函数
    - 即 **聚合函数**，用于对多行数据操作，并返回一个单一的结果。
    - 组函数仅可用于 **选择列表** 或 **查询的 `having` 子句**。



### 字符函数

字符函数：以字符作为参数，返回值分为两类：一类返回字符值，一类返回数字值

返回字符：

- `concat(string1，string2)`：连接两个字符串，同 `||`。
- `initcap(string)`：大写 `String` 每个单词的首字母。
- `lower(string)`：以小写形式返回string
- `upper(string)`：以大写形式返回string
- `lpad`，`rpad`：填充字符型数据
- `trim(A from B)`：去除空格
    - `ltrim/rtrim (string1,string2)`：
- `substr()`： 提取字符串的一部分 
    - `substr(string，1，2)`

返回数字：

- `instr()`：**返回** 字符串出现的位置, 
    - `instr(string, 'A')`：字符A在 `string` 中出现的位置
- `length()`：**返回** 字符串长度



实例：

```sql
--- Oracle 函数 ---
-- 组函数, 即聚合函数
  -- 输入多个值，最终只会返回一个值
  -- 组函数仅可用于选择列表或查询的having子句
  -- 单行函数： 输入一个值，输出一个值

-- 查询所有员工的薪水总和
select sum(sal) from emp;

-- 查看表中有多少条记录
select count(*) from emp;

-- 查看不同部门的人数记录
select deptno, count(*) from emp group by deptno having count(*) > 3;

-- 字符函数
-- concat：表示字符串的连接，等同于 `||`
select concat('my name is ', ename) from emp;

-- 将字符串的首字母大写
select initcap(ename) from emp;

-- 将字符串全部转换为大写
select upper(ename) from emp;

-- 将字符串全部转换为小写
select lower(ename) from emp;

-- 填充字符串
select lpad(ename, 10, '*') from emp;
select rpad(ename, 10, '*') from emp;

-- 去除空格
select trim(ename) from emp;
select ltrim(ename) from emp;
select rtrim(ename) from emp;

-- 查找指定字符串的位置
select instr('ABCDEF'， 'C') from emp;
select ename, instr(ename, 'A') from emp;

-- 查看字符串的长度
select ename, length(ename) from emp;

-- 截取字符串的操作
select ename, substr(ename, 0, 2) from emp;

-- 替换操作
select ename, replace(ename, 'A', 'AA') from emp;
```



### 数字函数

数字函数以 `NUMBER` 类型为参数，返回 `NUMBER` 值。
- `round(number，n)`：按照位数截取数据，返回四舍五入后的值。
	- `select round(23.652) from dual;`
	- `select round(23.652, 2) from dual;`
	- `select round(23.652, -1) from dual;`
- `trunc(number，n)`：按照位数截取数据，不会进行四舍五入。
	- `select trunc(23.652) from dual;`
	- `select trunc(23.652, 2) from dual;`
	- `select trunc(23.652, -1) from dual;`
- `mod(x，y)`：求余数，取模操作
	- `select mod(13,5) from dual;`
- `ceil()`：向上取整
    -  `select ceil(19.2) from dual;`
- `floor()`：向下取整 
    - `select floor(19.2) from dual;`

- `abs()`：取绝对值
- `sign()` ：获取正负值
- `power(x, y)`：`x` 的 `y` 次幂



实例：

```sql
---数值函数---
-- 截取数据，给小数进行四舍五入操作，指定小数部分的位数
select round(123.123, 2) from dual;
select round(123.28, 2) from dual;

-- 截断数据, 按照位数去进行截取，但是不会进行四舍五入的操作
select trunc(123.123, 2) from dual;
select trunc(123.128, 2) from dual;

-- 取模操作
select mod(10, 4) from dual;
select mod(-10, 4) from dual;

-- 向上取整
select ceil(12.12) from dual;

-- 向下取整
select floor(13.99) from dual;

-- 取绝对值
select abs(-100) from dual;

-- 获取正负值：+1 or 1
select sign(-100) from dual;

-- x的y次幂
select power(2, 3) from dual;
```



### 日期函数

一般而言，公司业务在日期定义到秒。

```sql
-- 以下都是获取 日期 & 时间
select sysdate from dual;
select current_date from dual;

-- 获取当前时间 only MySQL
select current_time from dual;

-- 获取时间戳
select current_timestamp from dual;
```



Oracle 内部数字格式存储日期：`世纪，年，月，日，小时，分钟，秒`。

- `sysdate/current_date`：以date类型返回当前的日期和时间

- `add_months(d,x)`：返回加上 `x月` 后的 `日期d` 的值
    - 可用于计算试用期等等预定后的日期
- `last_day(d)`：返回 `日期d` 所在月份的最后一天
- `months_between(date1,date2)`：返回 `date1` 和 `date2` 之间月的数目
    - 可用于计算在职日期，工作年限等等时间



从日期中加或减一个数值，以得当一个日期结果值

```sql
select sysdate+2 from dual;

select sysdate-2 from dual;
```



两个日期相减以便得到他们相差多少天

```sql
select ename, round((sysdate-hiredate)/7) weeks from emp where deptno = 10;
```



实例：

```sql
--- 日期函数 ---
--- 一般而言，公司业务在日期定义到秒。
select sysdate from dual;

select current_date from dual;

---- 获取当前日期时间戳（依据系统而定）
select current_timestamp from dual;

-- add_months(): 返回添加指定的月份后的日期
-- 可用于计算试用期等等预定的日期
select hiredate, add_months(hiredate, 3) "试用期结束" from emp;

-- last_day(): 返回输入日期所在月份的最后一天
---- 参数sysdate：将会返回本月最后一天，与此时相同的时间
select last_day(sysdate) from dual;

-- months_between(): 返回两个日期相间隔的月份，小数
-- 可用于计算在职日期：floor()向下取整
select hiredate, months_between(sysdate, hiredate) from emp;
select hiredate, floor(months_between(sysdate, hiredate)) from emp;

-- 返回四舍五入的第一天
select sysdate 当前日期,
round(sysdate) 最近零点日期,
round(sysdate, 'day') 最近星期日,
round(sysdate, 'month') 最近月初,
round(sysdate, 'q') 最近季初日期,
round(sysdate, 'year') 最近年初日期 from dual;

-- 返回下周的星期几
select next_day(sysdate, '星期一') from dual;

-- 提取日期中的时间
select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) 小时,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) 分钟,
extract(second from timestamp '2001-2-16 2:38:40 ' ) 秒,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) 日,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) 月,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) 年
 from dual;

-- 返回日期的时间戳
select localtimestamp from dual;
select current_timestamp from dual;

-- 给指定的时间单位增加数值
select
trunc(sysdate)+(interval '1' second), --加1秒(1/24/60/60)
trunc(sysdate)+(interval '1' minute), --加1分钟(1/24/60)
trunc(sysdate)+(interval '1' hour), --加1小时(1/24)
trunc(sysdate)+(INTERVAL '1' DAY),  --加1天(1)
trunc(sysdate)+(INTERVAL '1' MONTH), --加1月
trunc(sysdate)+(INTERVAL '1' YEAR), --加1年
trunc(sysdate)+(interval '01:02:03' hour to second), --加指定小时到秒
trunc(sysdate)+(interval '01:02' minute to second), --加指定分钟到秒
trunc(sysdate)+(interval '01:02' hour to minute), --加指定小时到分钟
trunc(sysdate)+(interval '2 01:02' day to minute) --加指定天数到分钟
from dual;
```



### 转换函数

标量数据可以有类型的转换，转换分为两种，隐式类型转换和显示类型转换。
- 隐式类型转换可用亍：
- 字符和数字的相互转换 &字符和日期的相互转换
- VARCHAR2 or char－－number
- VARCHAR2 or char －－date
- number－－varchar2
- date－－varchar2
- select * from emp where empno=to_number('8000')
- select * from emp where hiredate='20-2月-1981'

```sql
select * from emp where empno=to_number('8000');

select * from emp where hiredate='20-2月-1981';
```



- 尽管数据类型之间可以进行隐式转换，仍建议使用显示转换函数，以保持良好的设计风格。
- Select ‘999’-10 from dual;

```sql
Select ‘999’-10 from dual;
```







- to_char
- to_number
- to_date

|   Number   | ----------------->>> |   Character   | ----------------->>> |   Date   |
| :--------: | :------------------: | :-----------: | :------------------: | :------: |
|            |    `to_number()`     |               |     `to_date()`      |          |
| **Number** | <<<----------------- | **Character** | <<<----------------- | **Date** |
|            |     `to_char()`      |               |     `to_char()`      |          |



TO_CHAR 函数操作日期

| 格式元素 | 含义 |
| -------- | ---- |
|YYYY、YY|代表四位、两位数字的年份|
|MM|用数字表示的月份|
|MON|月份的缩写、对中文月份来说就是全称|
|DD|数字表示的日|
|DY|星期的缩写，对中文的星期来说就是全称|
|HH24，HH12|12小时或者24小时进制下的时间|
|MI|分钟数|
|SS|秒数|

- `to_char(date, ' fmt ')`
- 用于将日期或时间戳转换成 `varchar2` 类型字符串，如果指定了格式字符串，则用它控制结果的结果。
	- 格式控制串由格式元素构成。
	- 格式控制串必须用单引号括起来



```sql
select to_char(sysdate, 'dd-mon-yy hh24:mi:ss') "Rigth Now" from dual;

select ename, hiredate, to_char(hiredate,'yyyy/mm/dd') from emp;

select sysdate, to_char(sysdate,'yyyy-mon-dd hh12:mi:ss') from dual;
```



TO_CHAR 函数操作数字（A）

| 控制符 | 含义 |
| ------ | ---- |
|9|代表一位数字，如果该位没有数字则不进行显示，但对于小数点后面的部分仍会强制显示|
|0|代表一位数字，如果该位没有数字则强制显示0|
|$|显示美元符号|
|L|显示本地货币符号|
|.|显示小数点|
|,|显示千分位符号|

- `to_char(num,format)`
- 用于将 `Number类型` 参数转换为 `varchar2类型` ，如果指定了format，它会控制整个转换。



TO_CHAR 函数操作数字

```sql
select to_char(sal, „$99,999.9999‟) salary from emp where ename = "ALLEN";

select to_char(sal, „$00,000.0000‟) salary from emp where ename = "ALLEN";


select to_char(123456, '99,99,00') from dual;

```





to_number & to_date

- to_date (String,format)

- 将char戒varchar2类型的string转换为date类型

- Select to_date('04,05,19,10,23,40','yy,mm,dd,hh12,mi,ss') from dual;

- select to_date('2004-09-19','yyyy-mm-dd') from dual;

    

```sql
Select to_date('04,05,19,10,23,40','yy,mm,dd,hh12,mi,ss') from dual;

select to_date('2004-09-19','yyyy-mm-dd') from dual;
```





to_number(String,format)

- 将char戒varchar2类型的string转换为number类型
- select to_number('$39343.783','$99990.000') from dual;
- select to_number('11.231','999.999') from dual;



```sql
select to_number('$39343.783','$99990.000') from dual;

select to_number('11.231','999.999') from dual;

```







单行函数嵌套

- 单行函数可被嵌入到任何层
- 嵌套函数从最深层到最低层求值

```sql
-- 显示没有上级管理的公司首脑
-- 没有上级领导的雇员 mgr显示为boss
select ename,nvl(to_char(mgr),"no manager") from emp where mgr is null;

-- 显示员工雇佣期满6个月后下一个星期五的日期
Select to_char(next_day(add_months(hiredate,6),"Friday")," fmDay, Month ddth,YYYY") "review" from emp order by hiredate;
 


```









```sql

-- 转换函数
     -- 在oracle中存在数值的隐式转换和显式转换
     -- 隐式转换指的是字符串可以转换为数值或者日期
-- 显式转换：
    -- to_char: 当由数值或者日期转成字符串的时候，必须要规定格式


--date ：to_char
select '999' + 10 from dual;
select to_char(sysdate, 'YYYY-MM-DD HH:MI') from dual;

-- number : to_char
select to_char(123.456778, '9999.99') from dual;
select to_char(123.456778, '0000.000') from dual;
select to_char(123456789, '999,999,999,999') from dual;

--to_date:转换之后都是固定的格式
select to_date('2020/10/10 10:10:10', 'YYYY-MM-DD HH24:MI:SS') from dual;

--to_number:转成数字
select to_number('123,456,789', '999,999,999') from dual;

--- 单元函数嵌套---
--显示没有上级管理的公司首脑
select ename, nvl(to_char(mgr), 'boss') from emp where mgr is null;

--显示员工雇佣期满6个月后下一个星期五的日期
select hiredate,next_day(add_months(hiredate, 6), '星期五')  from emp;

---条件函数---
--decode,case when

--给不同部门的人员涨薪，10部门涨10%，20部门涨20%，30部门涨30%
select ename,
       deptno,
       sal,
       decode(deptno, 10, sal * 1.1, 20, sal * 1.2, 30, sal * 1.3)
  from emp;

select ename,
       deptno,
       sal,
       case deptno
         when 10 then
          sal * 1.1
         when 20 then
          sal * 1.2
         when 30 then
          sal * 1.3
       end
  from emp;

------------------------------------------------
--- 案例如下；
-- 表单创建
create table test(
   id number(10) primary key,
   type number(10) ,
   t_id number(10),
   value varchar2(5)
);
insert into test values(100,1,1,'张三');
insert into test values(200,2,1,'男');
insert into test values(300,3,1,'50');

insert into test values(101,1,2,'刘二');
insert into test values(201,2,2,'男');
insert into test values(301,3,2,'30');

insert into test values(102,1,3,'刘三');
insert into test values(202,2,3,'女');
insert into test values(302,3,3,'10');

/*
需求: 将表的显示转换为
姓名      性别     年龄
--------- -------- ----
张三       男        50
*/
-- 表单查询
select * from test;

select decode(type, 1, value) 姓名,
       decode(type, 2, value) 性别,
       decode(type, 3, value) 年龄,
  from test;

-- 首先分组
-- 再过滤 null
select max(decode(type, 1, value)) 姓名,
       max(decode(type, 2, value)) 性别,
       max(decode(type, 3, value)) 年龄,
  from test group by t_id;


/*
组函数,一般情况下，组函数都要和 group by 组合使用
组函数一般用于选择列表或者having条件判断

常用的组函数有5个
- avg()  平均值,只用于数值类型的数据
- min()  最小值，适用于任何类型
- max()  最大值，适用于任何类型
- sum()   求和，只适合数值类型的数据
- count() 记录数, 处理的时候会跳过空值而处理非空值
    count 一般用来获取表中的记录条数，
    获取条数时, 可以使用*或者某一个具体的列, 甚至可以使用纯数字来代替，
    但是从运行效率的角度考虑，建议使用数字或者某一个具体的列, 而不要使用*

*/

select avg(sal) from emp;
select min(sal) from emp;
select max(sal) from emp;
select count(sal) from emp;
select sum(sal) from emp;

-- 不要使用 * 
select count(*) from emp;
select count(1) from emp;
select count(10000) from emp;

-- group by: 按照某些相同的值去进行分组操作
--- group进行分组操作的时候，可以指定一个列或者多个列，
--- 但是使用groupby 之后，选择列表中只能包含组函数的值或者group by 的普通字段
--求每个部门的平均薪水
select deptno, avg(sal) from emp group by deptno;

--求平均新书大于2000的部门
select deptno, avg(sal) from emp group by deptno having avg(sal) > 2000;

--部门下雇员的工资>2000 人数
select deptno, count(1) from emp where sal > 2000 group by deptno;

--部门薪水最高
select deptno, max(sal) from emp group by deptno;

--部门里面 工龄最小和最大的人找出来, 找到员工姓名
select deptno, min(hiredate), max(hiredate) from emp group by deptno; 

select ename, deptno
  from emp
 where hiredate in (select min(hiredate) from emp group by deptno)
    or hiredate in (select min(hiredate) from emp group by deptno);
```



### 其他函数

decode
case when



```sql

```







### 课堂练习

```sql
-- 1. 查询82年员工
-- 2. 查询37年工龄的人员
-- 3. 显示员工雇佣期 6 个月后下一个星期一的日期
-- 4. 找没有上级的员工，把mgr的字段信息输出为 "boss"
-- 5. 为所有人长工资，标准是：10部门长10%；20部门长15%；30部门长20%其他部门长18%
```































## Oracle 索引



```sql

--查看某个数据表包含的索引
select * from user_indexes where table_name=upper('table_name');

-- 根据索引名查看索引包含的字段
select * from user_ind_columns where index_name = 'INDEXS_NAME';

```





Oracle 不支持 limit():
- 限时输出
- 在前面过滤的时候依然会有大数量的操作，仍然会可能挂机
- 



















