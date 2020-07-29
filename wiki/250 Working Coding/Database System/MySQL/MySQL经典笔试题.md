# MySQL 经典笔试题

## 数据重排

中国移动SQL面试题：使用SQL语句创建的数据完成要求。

### 创建数据

```sql
create table CMCC(
   id number(10) primary key,
   type number(10) ,
   t_id number(10),
   value varchar2(5)
);

insert into CMCC values(100,1,1,'张三');
insert into CMCC values(200,2,1,'男');
insert into CMCC values(300,3,1,'50');

insert into CMCC values(101,1,2,'刘二');
insert into CMCC values(201,2,2,'男');
insert into CMCC values(301,3,2,'30');

insert into CMCC values(102,1,3,'刘三');
insert into CMCC values(202,2,3,'女');
insert into CMCC values(302,3,3,'10');
```

### 题目


请写出一条查询语句结果如下：

| 姓名 | 性别 | 年龄 |
| ---- | ---- | ---- |
|张三|男|50|

### 解答

```mysql
-- 表单查询
select * from CMCC;

select decode(type, 1, value) 姓名,
       decode(type, 2, value) 性别,
       decode(type, 3, value) 年龄,
  from CMCC;

-- 首先分组，再过滤 null
select max(decode(type, 1, value)) 姓名,
       max(decode(type, 2, value)) 性别,
       max(decode(type, 3, value)) 年龄,
  from CMCC group by t_id;
```



## 关于 `group by` 的SQL面试题

### 表内容
```
2005-05-09 胜
2005-05-09 胜
2005-05-09 负
2005-05-09 负
2005-05-10 胜
2005-05-10 负
2005-05-10 负
```

### 题目
如果要生成下列结果, 该如何写sql语句?

| 日期 | 胜   | 负   |
| ---- | ---- | ---- |
|2005-05-09|2|2|
|2005-05-10|1|2|

### 1. 创建数据

```sql
create table group(
	rq varchar2(10),
	shengfu varchar2(5)
);

insert into group values('2005-05-09','胜');
insert into group values('2005-05-09','胜');
insert into group values('2005-05-09','负');
insert into group values('2005-05-09','负');
insert into group values('2005-05-10','胜');
insert into group values('2005-05-10','负');
insert into group values('2005-05-10','负');
```









 ## 编写SQL语句完成要求

### 创建数据

```sql
create table STUDENT_SCORE
(
  name    VARCHAR2(20),
  subject VARCHAR2(20),
  score   NUMBER(4,1)
);

insert into student_score (NAME, SUBJECT, SCORE) values ('张三', '语文', 78.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('张三', '数学', 88.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('张三', '英语', 98.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('李四', '语文', 89.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('李四', '数学', 76.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('李四', '英语', 90.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('王五', '语文', 99.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('王五', '数学', 66.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('王五', '英语', 91.0);
```


### 题目

1， 得到类似下面的结果

| 姓名 | 语文 | 数学 | 英语 |
| ---- | ---- | ---- | ---- |
|王五|89|56|89|



2， 有一张表，里面有3个字段：语文，数学，英语。其中有3条记录分别表示语文70分，数学80分，英语58分，请用一条sql语句查询出这三条记录并按以下条件显示出来（并写出您的思路）：  

按照分数分级
- 大于或等于80表示优秀
- 大于或等于60表示及格
- 小于60分表示不及格

显示格式：

| 语文 | 数学 | 英语 |
| ---- | ---- | ---- |
|及格|优秀|不及格|



## 请用一句SQL得出结果

### 题目

从 `table1`, `table2` 中取出如 `table3` 所列格式数据。注意提供的数据及结果不准确，这里只是作为一个格式向大家请教。

**Table1**

| 月份Mon | 部门Dep | 业绩yj |
| ------- | ------- | ------ |
|一月份|01|10|
|一月份|02|10|
|一月份|03|5|
|二月份|02|8|
|二月份|04|9|
|三月份|03|8|

**Table2**

| 部门Dep | 部门名称dname |
| ------- | ------------- |
|01|国内业务一部|
|02|国内业务二部|
|03|国内业务三部|
|04|国际业务部|

**Ttable3 （result）**

| 部门Dep | 一月份 | 二月份 | 三月份 |
| ------- | ------ | ------ | ------ |
|01|10| | |
|02|10|8| |
|03|  |5|8|
|04|  | |9|



### 1. 创建数据

```sql
create table yj01(
       month varchar2(10),
       deptno number(10),
       yj number(10)
);

insert into yj01(month,deptno,yj) values('一月份',01,10);
insert into yj01(month,deptno,yj) values('二月份',02,10);
insert into yj01(month,deptno,yj) values('二月份',03,5);
insert into yj01(month,deptno,yj) values('三月份',02,8);
insert into yj01(month,deptno,yj) values('三月份',04,9);
insert into yj01(month,deptno,yj) values('三月份',03,8);

create table yjdept(
       deptno number(10),
       dname varchar2(20)
);

insert into yjdept(deptno,dname) values(01,'国内业务一部');
insert into yjdept(deptno,dname) values(02,'国内业务二部');
insert into yjdept(deptno,dname) values(03,'国内业务三部');
insert into yjdept(deptno,dname) values(04,'国际业务部');
```
