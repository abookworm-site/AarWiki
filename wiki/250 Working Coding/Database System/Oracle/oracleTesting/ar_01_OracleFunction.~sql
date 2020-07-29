--- Aar 02 Oracle 函数---

-- 组函数, 即聚合函数
----  输入多个值，最终只会返回一个值
----  组函数仅可用于选择列表或查询的having子句
----  单行函数： 输入一个值，输出一个值

-- 查询所有员工的薪水总和
select sum(sal) from emp;

-- 查看表中有多少条记录
select count(ename) from emp;

select count(*) from emp;

-- 查看不同部门的人数记录
select deptno, count(*) from emp group by deptno having count(*) > 3; 

-- 字符函数
-- concat：表示字符串的连接  等同于 ||
select concat('My name: ', ename) from emp;

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

select trim(ename) from emp;

select trim(ename) from emp;

-- 查找指定字符串的位置
select instr('ABCD', 'C') from emp; 

-- 查看字符串的长度
select ename, length(ename) "ename length" from emp;

-- 截取字符串的操作
select ename, substr(ename, 0, 2) from emp;

-- 替换操作
select ename, replace(ename, 'A', 'AA') from emp;

-- -数值函数-- -
-- 截取数据，给小数进行四舍五入操作，指定小数部分的位数
select round(4.123) from dual;
select round(4.723) from dual;

-- 截断数据, 按照位数去进行截取，但是不会进行四舍五入的操作
select trunc(4.123) from dual;
select trunc(4.723) from dual;

-- 取模操作
select mod(10, 4) from dual;
select mod(-10, 4) from dual;

-- 向上取整
select ceil(4.123) from dual;

-- 向下取整
select floor(4.723) from dual;

-- 取绝对值
select abs(-4.123) from dual;

-- 获取正负值
select sign(-4.123) from dual;

select sign(-10) from dual;

-- x的y次幂
select power(2, 3) from dual;

-- 日期函数 --
-- 一般而言，公司业务在日期定义到秒。
select sysdate from dual;

select current_date from dual;


---- 获取当前日期时间戳（依据系统而定）
select current_timestamp from dual;

-- add_months(): 添加指定的月份
select hiredate, add_months(hiredate, 3) from emp;

-- 返回输入日期所在月份的最后一天
select last_day(sysdate) from dual;

-- 两个日期相间隔的月份
select hiredate, sysdate, floor(months_between(sysdate, hiredate)) from emp;

-- 返回四舍五入的第一天
select sysdate, round(sysdate, 'day') from dual;

-- 返回下周的星期几
select next_day(sysdate, 3) from dual;

-- 提取日期中的时间
select current_timestamp,
extract(hour from current_timestamp) "Hours" ,
extract(minute from current_timestamp) "Minute",
extract(second from current_timestamp) "Second",
extract(day from current_timestamp) "Day",
extract(month from current_timestamp) "Month",
extract(year from current_timestamp) "Year"
 from dual;

select sysdate, extract(hour from timestamp(hiredate,'yyyy-mm-dd')) from emp;

-- 返回日期的时间戳
select localtimestamp from dual;

select current_timestamp from dual;

-- 给指定的时间单位增加数值
select trunc(sysdate)+(interval '1' DAY) from dual;

-- 给指定的时间单位增加数值，并指定时间
select trunc(sysdate)+(interval '1 01:02' day to minute) from dual;

-- 转换函数
---- 在oracle中存在数值的隐式转换和显式转换
---- 隐式转换指的是字符串可以转换为数值或者日期，反之也可
select * from emp where empno=to_number('8000');

select '999'-10 from dual;

-- 显式转换：to_char: 当由数值或者日期转成字符串的时候，必须要规定格式
-- date ：to_char(), 
select to_char(sysdate, 'YYYY-MM-DD HH:MI') from dual;

select to_char(sysdate) from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD') from emp;

-- number : to_char()
select to_char(123.456789, '9999.99') from dual;
select to_char(123.456789, '999,999,999,999') from dual;

-- to_date(): 转换之后都是固定的格式
select to_date('2020/10/10 10:10:10', 'YYYY-MM-DD HH24:MI:SS') from dual;

-- to_number(): 转成数字
select to_number('123,456,789', '999,999,999') from dual;

-- 单行函数嵌套
-- 显示没有上级管理的公司首脑
-- 没有上级领导的雇员 mgr显示为boss
select * from emp;

select ename from emp where mgr is null;

select ename, nvl(to_char(mgr), 'no manager') from emp where mgr is null;

-- 显示员工雇佣期满6个月后下一个星期五的日期

select ename, hiredate, add_months(hiredate, 6), to_char(next_day(add_months(hiredate, 6), 5), 'YYYY-MM-DD') "Review" from emp;

select ename, hiredate, add_months(hiredate, 6), next_day(add_months(hiredate, 6), '星期五') "Review" from emp;

-- 条件函数--
-- decode,case when

-- 给不同部门的人员涨薪，10部门涨10%，20部门涨20%，30部门涨30%
---- decode
select ename, sal, decode(deptno, 10, sal*1.1, 20, sal*1.2, 30, sal*1.3) "Sal added" from emp;

---- case when
select ename, sal, case deptno when 10 then sal*1.1 when 20 then sal*1.2 when 30 then sal*1.3 end "Sal added" from emp;

-- 函数复习练习
-- 1. 查询82年员工
select * from emp where to_char(hiredate, 'YY') = '82';

-- 2. 查询38年工龄的人员
select * from emp where floor(months_between(sysdate, hiredate)/12) = 38;

-- 3. 显示员工雇佣期 6 个月后下一个星期一的日期
select ename, next_day(add_months(hiredate, 6), '星期一') from emp;

-- 4. 找没有上级的员工，把mgr的字段信息输出为 "boss"
select ename, nvl(to_char(mgr), 'boss') "Mgt" from emp where mgr is null;

-- 5. 为所有人长工资，标准是：10部门长10%；20部门长15%；30部门长20%其他部门长18%
select ename, decode(deptno, 10, sal*1.1, 20, sal*1.15, 30, sal*1.2, 40, sal*1.18) "Add sal" from emp;

-- 表单创建
/*
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
*/

-- 需求发布
/* 将表的显示转换为：
-- 姓名      性别    年龄
--------  -------  ----
-- 张三       男     50
*/

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



--  不要使用 * 




--  group by: 按照某些相同的值去进行分组操作
-- - group进行分组操作的时候，可以指定一个列或者多个列，
-- - 但是使用groupby 之后，选择列表中只能包含组函数的值或者group by 的普通字段
-- 求每个部门的平均薪水


-- 求平均新书大于2000的部门


-- 部门下雇员的工资>2000 人数


-- 部门薪水最高


-- 部门里面 工龄最小和最大的人找出来, 找到员工姓名

