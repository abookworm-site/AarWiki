/*
CREATE [OR REPLACE] VIEW view
[(alias[, alias]...)]
AS subquery
[WITH READ ONLY];

*/
--如果普通用户第一次创建视图，提示没有权限，要使用管理员去修改权限
sqlplus /nolog

conn sys/xxxx@orcl as sysdba;

grant create view to scott;

--创建视图
select * from emp where deptno = 30;
create view vemp as select * from emp where deptno = 30;

--视图的使用
select * from vem;

--向视图中添加数据,执行成功之后，需要提交事务，绿色表示提交事务，让数据生效，红色表示回滚事务，让数据恢复原状态
insert into vemp(empno, ename) values(1111, 'Zhangsan');
select * from vemp;

--如果定义的视图是非只读视图的话，可以通过视图向表中插入数据，如果是只读视图，则不可以插入数据
create view vemp2 as select * from emp with read only;
select * from vemp2;

--只读视图只提供查询的需求，无法进行增删改操作
-- Failed operation
insert into vemp2(empno, ename) values(1234, 'Lisi');

--删除视图
drop view vemp2;

--当删除视图中的数据的时候，如果数据来源于多个基表，则此时不能全部进行删除，只能删除一个表中的数据



--我们要求平均薪水的等级最低的部门，它的部门名称是什么，我们完全使用子查询
--1、求平均薪水
select deptno, avg(sal) from emp e group by e.deptno;

--2、求平均薪水的等级
select t.deptno, grade from salgrade sg join (select deptno, avg(sal) vsal from emp e group by e.deptno) t on t.vsal between losal and hisal;

--3、求平均薪水的等级最低的部门
select min(tt.grade) from (select t.deptno, grade from salgrade sg join (select deptno, avg(sal) vsal from emp e group by e.deptno) t on t.vsal between losal and hisal) tt;

--4、求平均薪水的等级最低的部门的部门名称
select d.dname, d.deptno
  from dept d
  join (select t.deptno, grade
          from salgrade sg
          join (select deptno, avg(sal) vsal from emp e group by e.deptno) t
            on t.vsal between losal and hisal) ttt
    on ttt.deptno = d.deptno
 where ttt.grade =
       (select min(tt.grade)
          from (select t.deptno, grade
                  from salgrade sg
                  join (select deptno, avg(sal) vsal
                         from emp e
                        group by e.deptno) t
                    on t.vsal between losal and hisal) tt);


--查看sql语句能够发现，sql中有很多的重复的sql子查询，可以通过视图将重复的语句给抽象出来
--创建视图
create view v_deptno_grade as (select t.deptno, grade from salgrade sg join (select deptno, avg(sal) vsal from emp e group by e.deptno) t on t.vsal between losal and hisal);


--使用视图替换
select d.dname, d.deptno
  from dept d
  join (v_deptno_grade) ttt
    on ttt.deptno = d.deptno
 where ttt.grade =
       (select min(tt.grade)
          from (v_deptno_grade) t
                    on t.vsal between losal and hisal) tt);
