--索引：加快数据的检索
--创建索引
create index i_ename on emp(ename);

--删除索引
drop index i_ename;

select * from emp where ename = 'SMITH';

-- 局部性原理：
-- 磁盘预读：

-- 回表： 走两次索引， 首先走 ename 索引，而后依据 ID 索引查询字段
-- 覆盖索引
-- 组合索引
-- 最左匹配
