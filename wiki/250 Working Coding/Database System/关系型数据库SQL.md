# 关系型数据库SQL

## RDBMS

> 全称：Relational Database Management System

### 概念

建立在关系模型基础上的数据库，借助于集合代数等数学概念和方法来处理数据库中的数据



### RDBMS和数据库的关系

![image-20200720233540646](_resource/%E5%85%B3%E7%B3%BB%E5%9E%8B%E6%95%B0%E6%8D%AE%E5%BA%93SQL/image-20200720233540646.png)

## SQL 语句

> 全称：Structured Query Language

### 特点

- 结构化查询语言，是一种用来操作RDBMS的数据库语言

- 不区分大小写



### 分类

- **DQL：数据查询语言，用于对数据进行查询，如select**
- **DML：数据操作语言，对数据进行增加、修改、删除，如insert、udpate、delete**
- TPL：事务处理语言，对事务进行处理，包括begin transaction、commit、rollback
- DCL：数据控制语言，进行授权与权限回收，如grant、revoke
- **DDL：数据定义语言，进行数据库、表的管理等，如create、drop**
- CCL：指针控制语言，通过控制指针完成表的操作，如declare cursor



### 关系型数据库核心元素

- 数据行(记录)
- 数据列(字段)
- 数据表(数据行的集合)
- 数据库(数据表的集合)

