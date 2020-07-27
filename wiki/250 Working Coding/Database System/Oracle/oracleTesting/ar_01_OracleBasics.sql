-- Aar_01_基础入门练习

/* SQL 语句语法：
-- SELECT [DISTINCT] {*,column alias,..}
--  FROM table alias
--	Where 条件表达式
*/
-- 查询雇员表中部门编号是10的员工
select * from emp where deptno = 10;

-- 查询表中的所有字段,可以使用*,但是在项目中千万不要随便使用*,浪费IO带宽，可能造成严重后果
select e.empno, e.ename, e.job from emp e where deptno = 10;

-- distinct 去除重复数据
select distinct deptno from emp;

-- 去重也可以针对多个字段，多个字段值只要有一个不匹配就算是不同的记录
select distinct deptno, job from emp;

-- 在查询的过程中可以给列添加别名，同时也可以给表添加别名
select e.deptno departement from emp e;

-- 给列起别名时，可以加as，也可以不加
select e.deptno as dapart from emp e;

-- 给列起别名时，如果别名中包含空格，那么需要将别名整体用“”包含起来
select e.deptno "my department" from emp e;

-- 查询数据库所有表
select * from tab;

-- 详细查询当前用户下的所有表
select * from user_tables;

-- 查看当前用户所有表的名称
select table_name from user_tables;

-- 查看表结构：命令窗口
description emp;

-- 查看表结构：mysql
desc emp;

-- 查看表结构：'DEPT':表必须大写。
select dbms_metadata.get_ddl('TABLE', 'DEPT') from dual;


-- 为表添加注释


-- 为列添加注释


-- 获取表注释：
-- 相应的还有dba_tab_comments，all_tab_comments. 这两个比user_tab_comments多了ower列。 


-- 获取字段注释：


-- 字段注释表：字段
-- user_col_comments：table_name,column_name,comments


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


-- <> 不等于


-- <,


-- >,


-- <=,


-- >=,


-- any,取其中任意一个
select sal from emp where sal > any(1000, 1500, 3000);

-- some,跟 any 同样的效果，只要大于其中某一个值都会成立
select sal from emp where sal > some(1000, 1500, 3000);

-- all，大于所有的值才会成立
select sal from emp where sal > all(1000, 1500, 3000);


-- is null,在sql的语法中，null表示一个特殊的含义，null != null
-- 不能使用=，！=判断，需要使用is ,is not
select * from emp where comm is null;

select * from emp where null is null;

--,is not null
select * from emp where comm is not null;


--between x and y,包含x和y的值
select * from emp sal between 1500 and 3000;


--进行某些值的等值判断的时候可以使用in和not in
--in（list）
select * from emp where sal in (1500, 3000);
select * from emp where sal in 3000;

--not in（list）
select * from emp where deptno not in (1500, 3000);


--可是用and 和or这样的关键字，and相当于是与操作，or相当于是或操作
--and和or可能出现在同一个sql语句中，此时需要注意and和or的优先级
--and 的优先级要高于or，所以一定要将or的相关操作用（）括起来，提高优先级
select * from emp where deptno = 10 or deptno = 30;


-- 1、查询部门编号为10的员工信息
select * from emp where deptno = 10;

-- 2、查询年薪大亍3万的人员的姓名与部门编号
select e.ename, e.deptno from emp e where sal*12 > 30000; 

-- 3、查询佣金为null的人员姓名与工资
select ename, sal from emp where comm is null;

-- 4、查询工资大亍1500 且 and 含有佣金的人员姓名
select ename from emp where sal > 1500 and comm is not null;

-- 5、查询工资大亍1500 戒 or含有佣金的人员姓名
select ename from emp where sal > 1500 or comm is not null;

-- 6、查询姓名里面含有 S 员工信息 工资、名称
select ename, sal from emp where ename like '%S%';


-- 7、求姓名以J开头第二个字符O的员工姓名与工资
select ename, sal from emp where ename like 'JO%';


-- 8、求包含%的雇员姓名
select * from emp where ename like '%\%%' escape '\';


-- 9、使用in查询部门名称为 SALES 和 RESEARCH 的雇员姓名、工资、部门编号
select * from emp where deptno in (select deptno from dept where dname in ('SALES', 'RESEARCH'));

-- 10、使用exists查询部门名称为SALES和RESEARCH 的雇员姓名、工资、部门编号。
select * from emp e where exists (select deptno from dept d where dname in ('SALES', 'RESEARCH') and d.deptno = e.deptno); 


/* exists（sub－query）: 子查询
--     当exists中的子查询语句能查到对应结果的时候，意味着条件满足
--     即整体查询相当于双层for循环
*/
-- 查询部门编号为10和20的员工，要求使用exists实现
select * from emp where deptno = 10 or deptno = 20;

select *
  from emp
 where exists (select deptno
          from dept
         where deptno = 10
            or deptno = 20);


-- 通过外层循环来规范内层循环
select * from emp e where exists (select deptno from dept d where (d.deptno = 10 or d.deptno = 20) and e.deptno = d.deptno);


/*
模糊查询：like  _ ,%,escape ‘\‘   _\% escape ‘\’

在like的语句中，需要使用占位符或者通配符
           _: 代表某个字符或者数字仅出现一次
           %：代表任意字符出现任意次数
           escape: 使用转义字符,可以自己规定转义字符

- 使用like的时候要慎重，因为like的效率比较低
- 使用like可以参考使用索引，但是要求不能以%开头
- 涉及到大文本的检索的时候，可以使用某些框架 luence，solr，elastic search
  - IK 分词器：信息的提取，提前的反馈，一句话的分值进行通知。
*/
-- 查询名字以S开头的用户
select * from emp where ename like 'S%';

-- 查询名字以S开头且倒数第二个字符为T的用户
select * from emp where ename like 'S%T_';


-- 查询名字中带%的用户
select * from emp where ename like '%.%%' escape '.';

/*
排序： order by

每次在执行order by的时候相当于是做了全排序，此时，会比较耗费系统的资源，因此选择在业务不太繁忙的时候进行
-- 全排序的效率会比较低，有可能影响正常业务
*/

-- 默认情况下完成的是升序的操作，
-- asc:是默认的排序方式，表示升序
-- desc：降序的排序方式
select * from emp order by sal;


-- 排序是按照自然顺序进行排序的
-- 如果是数值，那么按照从大到小
-- 如果是字符串，那么按照字典序排序
select * from emp order by ename;

-- 排序可以指定多个字段，而且多个字段可以使用不同的排序方式
select * from emp order by ename, sal desc;

-- 使用计算字段
-- 字符串连接符
select 'my anme is ' || ename name from emp;
select concat('my name is ', ename) from emp;

-- 计算所有员工的年薪
-- 此时，仅有少数人有年薪
select ename, (e.sal + e.comm) * 12 from emp e;

-- null是比较特殊的存在，null做任何运算都还是为null，因此要将空进行转换
-- 引入函数nvl，nvl(arg1,arg2),如果arg1是空，那么返回arg2，如果不是空，则返回原来的值
select ename, (e.sal + nvl(e.comm, 0)) * 12 from emp e;

-- dual是oracle数据库中的一张虚拟表，没有实际的数据，可以用来做测试
select 100 + null from dual;

-- A
-- select * from emp where dpetno = 30;

-- B
-- select * from emp where sal > 1000;


-- 并集，将两个集合中的所有数据都进行显示，但是不包含重复的数据
select * from emp where deptno = 30 union (select * from emp where sal > 1000);


-- 全集，两个集合数据全部显示，不会完成去重的操作(即：包含重复数据)
select * from emp where deptno = 30 union all (select * from emp where sal > 1000);


-- 交集，两个集合中交叉的数据集，只显示一次
select * from emp where deptno = 30 intersect (select * from emp where sal > 1000);


-- 差集,包含在A集合而不包含在B集合中的数据，跟A和B的集合顺序相关
-- A 差 B
select * from emp where deptno = 30 minus (select * from emp where sal > 1000);

-- B 差 A
select * from emp where sal > 1000 minus (select * from emp where deptno = 30);

-- 总结复习：
-- 1、使用基本查询语句.
-- (1)查询DEPT表显示所有部门名称.
select dname from dept;

-- (2)查询EMP表显示所有雇员名及其全年收入(月收入=工资+补助),处理NULL行,并指定列别名为"年收入"
select e.ename, (e.sal + nvl(e.comm, 0))*12 "year co" from emp e;

-- (3)查询显示不存在雇员的所有部门号。***
select e.deptno from emp e;

select deptno from dept where deptno not in (select e.deptno from emp e);

-- 2、限制查询数据
-- (1)查询EMP表显示工资超过2850的雇员姓名和工资。
select e.ename, e.sal from emp e where e.sal > 2850;

-- (2)查询EMP表显示工资丌在1500～2850乊间的所有雇员及工资。
select e.ename, e.sal from emp e where e.sal > 1500 and e.sal < 2850;

-- (3)查询EMP表显示代码为7566的雇员姓名及所在部门代码。
select e.ename, e.deptno from emp e where e.empno = 7566;

-- (4)查询EMP表显示部门10和30中工资超过1500的雇员名及工资。
select e.ename, e.sal from emp e where (deptno = 10 or deptno = 30) and e.sal > 1500;

-- (5)查询EMP表显示第2个字符为"A"的所有雇员名其工资。
select e.ename, e.sal from emp e where e.ename like '_A%';

-- (6)查询EMP表显示补助非空的所有雇员名及其补助。
select e.ename, e.comm from emp e where e.comm is not null;


-- 3、排序数据
-- (1)查询EMP表显示所有雇员名、工资、雇佣日期，幵以雇员名的升序进行排序。
select e.ename, e.sal, e.hiredate from emp e order by e.ename asc;

-- (2)查询EMP表显示在1981年2月1日到1981年5月1日乊间雇佣的雇员名、岗位及雇佣日期，幵以雇佣日期进行排序。
select e.ename, e.job, e.hiredate from emp e where e.hiredate between to_date('1981-2-1', 'YYYY-MM-DD') and to_date('1981-5-1', 'YYYY-MM-DD') order by e.hiredate;

-- (3)查询EMP表显示获得补劣的所有雇员名、工资及补劣，幵以工资升序和补劣降序排序。
select e.ename, e.sal, e.comm from emp e where e.comm is not null order by e.sal asc, e.comm desc;
