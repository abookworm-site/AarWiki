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



## Oracle 基本表

Oracle 安装完成后有一张基础表可供操作。

### 表字段

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



## Oracle基本操作

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



### 注释

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

### 查询

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

- distinct必须放在开头
- 多字段：每个字段不一样才去重



### 条件比较





- ＝，！＝,<>，<,>,<=,>=,any,some,all
- is null,is not null
- between x and y
- in（list），not in（list）
- exists（sub－query）
- like _ ,%,escape ‘\‘ _\% escape ‘\’









## Oracle 索引



```sql

--查看某个数据表包含的索引
select * from user_indexes where table_name=upper('table_name');

-- 根据索引名查看索引包含的字段
select * from user_ind_columns where index_name = 'INDEXS_NAME';

```

























