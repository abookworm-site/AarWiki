/* 索引
-- 目的：加快数据的检索
*/

-- 创建索引, 若该字段已经有了索引，则会创建失败。
select * from emp;

create index emp_name on emp(ename);

-- 删除索引
drop index emp_name;

-- 索引原理：
---- 局部性原理：
---- 磁盘预读：

-- 回表： 走两次索引， 首先走 ename 索引，而后依据 ID 索引查询字段
-- 覆盖索引
-- 组合索引
-- 最左匹配
