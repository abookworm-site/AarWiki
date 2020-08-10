/* 视图
-- 视图的创建

-- CREATE [OR REPLACE] VIEW view_name
-- [(alias[, alias]...)]
-- AS subquery
-- [WITH READ ONLY];
*/

-- 如果普通用户第一次创建视图，提示没有权限，使用管理员去修改权限

-- $ sqlplus /nolog

-- SQL> conn sys/xxxx@orcl as sysdba;

-- SQL> grant create view to scott;

-- 创建视图

select * from emp where deptno = 30;

create VIEW dno as select * from emp where deptno = 30;


-- 视图的使用


-- 向视图中添加数据,执行成功之后，需要提交事务，绿色表示提交事务，让数据生效，红色表示回滚事务，让数据恢复原状态



-- 如果定义的视图是非只读视图的话，可以通过视图向表中插入数据，如果是只读视图，则不可以插入数据



-- 只读视图只提供查询的需求，无法进行增删改操作
--  Failed operation


-- 删除视图


-- 当删除视图中的数据的时候，如果数据来源于多个基表，则此时不能全部进行删除，只能删除一个表中的数据



-- 我们要求平均薪水的等级最低的部门，它的部门名称是什么，我们完全使用子查询
-- 1、求平均薪水


-- 2、求平均薪水的等级


-- 3、求平均薪水的等级最低的部门


-- 4、求平均薪水的等级最低的部门的部门名称


-- 查看sql语句能够发现，sql中有很多的重复的sql子查询，可以通过视图将重复的语句给抽象出来
-- 创建视图



-- 使用视图替换

