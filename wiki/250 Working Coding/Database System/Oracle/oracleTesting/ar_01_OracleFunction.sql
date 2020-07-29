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
select 













-- 转换函数
---- 在oracle中存在数值的隐式转换和显式转换
---- 隐式转换指的是字符串可以转换为数值或者日期
--  显式转换：
    --  to_char: 当由数值或者日期转成字符串的时候，必须要规定格式


-- date ：to_char



--  number : to_char




-- to_date:转换之后都是固定的格式


-- to_number:转成数字


-- - 单元函数嵌套-- -
-- 显示没有上级管理的公司首脑


-- 显示员工雇佣期满6个月后下一个星期五的日期


-- -条件函数-- -
-- decode,case when

-- 给不同部门的人员涨薪，10部门涨10%，20部门涨20%，30部门涨30%




-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- - 案例如下；
--  表单创建














/*
需求: 将表的显示转换为
姓名      性别     年龄
-- -- -- -- - -- -- -- --  -- -- 
张三       男        50
*/
--  表单查询





--  首先分组
--  再过滤 null



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

