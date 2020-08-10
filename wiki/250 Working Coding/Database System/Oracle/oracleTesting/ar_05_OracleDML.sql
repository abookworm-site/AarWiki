/* DML：数据库操作语言： 增、删、改

-- 在实际项目中，使用最多的是读取操作，但是插入数据和删除数据同等重要，而修改操作相对较少
*/

/* 插入操作：
---- 元组值的插入
---- 查询结果的插入
*/

-- 最基本的插入方式 2 种：
-- 向部分列插入数据的时候，不是想向哪个列插入就插入的，要遵循创建表的时候定义的规范(约束)
-- 第一种：完全插入
-- insert into tablename values(val1,val2,....) 如果表名之后没有列，那么只能将所有的列都插入



insert into student values();
-- 第二种：部分插入
-- insert into tablename(col1,col2,...) values(val1,val2,...) 可以指定向哪些列中插入数据
insert into student(std_id, name) values();

-- before and after this to check the table
select * from emp;


-- 创建表的其他方式
-- 复制表同时复制表数据，不会复制约束
create tables std as select * from student;

-- 复制表结构但是不复制表数据，不会复制约束
create table std2 as select * from student where 1=2;

-- 一般在实际的操作中，很少一条条插入，更多的是批量插入


/* 删除操作：
-- delete from tablename where condition
*/
-- 删除满足条件的数据
delete from student where name = 'zhangsan';

-- 把整张表的数据全部清空
delete from student;


-- truncate: 跟delete有所不同，delete在进行删除的时候经过事务，而truncate不经过事务，一旦删除就是永久删除，不具备回滚的操作
-- 效率比较高，但是容易发生误操作，所以不建议使用
truncate table student;

/* 修改操作：
-- update tablename set col = val1,col2 = val2 where condition;
-- 可以更新或者修改满足条件的一个列或者多个列
*/
-- 更新单列
update student set name = 'HeiHei' where std_id = 1;

-- 更新多个列的值
update student set grade=2, classes=3 where std_id = 2;

/*
-- 增删改是数据库的常用操作，在进行操作的时候都需要《事务》的保证， 也就是说每次在 pl/sql 中执行sql语句之后都需要完成 commit 的操作
-- 事务变得非常关键：
--     最主要的目的是为了数据一致性
--     如果同一份数据，在同一个时刻只能有一个人访问，就不会出现数据错乱的问题，但是在现在的项目中，更多的是并发访问
--     并发访问的同时带来的就是数据的不安全，也就是不一致
--     如果要保证数据的安全，最主要的方式就是加锁的方式，MVCC
--     
--     事务的延申：
--         最基本的数据库事务
--         声明式事务
--         分布式事务
--     
--     为了提高效率，有可能多个操作会在同一个事务中执行，那么就有可能部分成功，部分失败，基于这样的情况就需要事务的控制。
--     select * from emp where id = 7902 for update
--     select * from emp where id = 7902 lock in share mode.
--     
--     如果不保证事务的话，会造成脏读，不可重复读，幻读。
*/
