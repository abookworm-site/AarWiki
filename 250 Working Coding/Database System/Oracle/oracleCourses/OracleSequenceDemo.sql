/* 序列： 
-- 在Oracle中， 如果需要完成一个列的自增操作，则必须要使用序列
-- 语法：
-- create sequence seq_name
--   increment by n  每次增长几
--   start with n    从哪个值开始增长
--   maxvalue n|nomaxvalue 10^27 or -1  最大值
--   minvalue n|no minvalue  最小值
--   cycle|nocycle           是否有循环
--   cache n|nocache          是否有缓存
*/
-- 创建序列
create sequence my_sequence increment by 2 start with 1;

create sequence seq increment by 2 start with 1;


-- 如何使用？
-- 注意: 如果创建好序列之后，没有经过任何的使用，那么不能获取当前的值，必须要先执行 nextval 之后才能获取当前值


-- 1. 首次运行必须运行一次 nextval ，获取序列的下一个值（初始值）
select my_sequence.nextval from dual;

-- 2. 查看当前序列的值，若首次直接查看，那么SQL会报错
select my_sequence.currval from dual;

-- 此处，报错
select seq.currval from dual;

-- 3. 获取序列的下一个值
select my_sequence.nextval from dual;

-- 4. 使用：插入数据
select * from psn;

-- 插入数据时，需要直接使用seq.nextval
insert into psn(id, name) values(seq.nextval, 1);

-- 删除序列
drop sequence my_sequence;

