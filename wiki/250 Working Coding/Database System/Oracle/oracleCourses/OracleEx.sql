-- all exericse for the power point.

-- 查询数据库所有表
select * from tab;

--给表添加注释
comment on table emp is 'employee';

--给列添加注释
comment on column emp.ename is 'all name of employee';

/*sql语句语法：

SELECT [DISTINCT] {*,column alias,..}
FROM table alias
Where 条件表达式

*/

--查询雇员表中部门编号是10的员工

--dinstinct 去除重复数据

--去重也可以针对多个字段，多个字段值只要有一个不匹配就算是不同的记录

--在查询的过程中可以给列添加别名，同时也可以给表添加别名

--给列起别名时，可以加as，也可以不加

--给列起别名时，如果别名中包含空格，那么需要将别名整体用“”包含起来

--查询表中的所有字段,可以使用*,但是在项目中千万不要随便使用*,浪费IO带宽，可能造成严重后果


-- 

select * from dept;

select ename, sal, deptno
  from emp
 where deptno in (select deptno
                    from dept
                   where dname = 'SALES'
                      or dname = 'RESEARCH');

- 使用 exists 查询
select ename, sal, deptno
  from emp e
 where exists (select deptno
          from dept d
         where (dname = 'SALES'
            or dname = 'RESEARCH')
            and e.deptno = d.deptno);



---------------经典面试题-------------------
-- 1. create table tmp
create table tmp(rq varchar2(10),shengfu varchar2(5));

insert into tmp values('2005-05-09','胜');
insert into tmp values('2005-05-09','胜');
insert into tmp values('2005-05-09','负');
insert into tmp values('2005-05-09','负');
insert into tmp values('2005-05-10','胜');
insert into tmp values('2005-05-10','负');
insert into tmp values('2005-05-10','负');

/*
          胜 负
2005-05-09 2 2
2005-05-10 1 2

*/

select * from tmp;

select rq, decode(shengfu, '胜', 1), decode(shengfu, '负', 2) from tmp;

select rq, count(decode(shengfu, '胜',1)), count(decode(shengfu,'负', 2)) from tmp group by rq;


--------------------------------------------------------
create table STUDENT_SCORE
(
  name    VARCHAR2(20),
  subject VARCHAR2(20),
  score   NUMBER(4,1)
);

insert into student_score (NAME, SUBJECT, SCORE) values ('Zhangsan', 'Chinese', 78.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Zhangsan', 'Math', 88.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Zhangsan', 'English', 98.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Lisi', 'Chinese', 89.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Lisi', 'Math', 76.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Lisi', 'English', 90.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Wangwu', 'Chinese', 99.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Wangwu', 'Math', 66.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('Wangwu', 'English', 91.0);

/*
姓名   语文  数学  英语
王五    89    56    89
*/
--至少使用4中方式下写出
--decode
select * from student_score;

select ss.name, decode(ss.subject, 'Chinese', ss.score) Chinese, decode(ss.subject, 'Math', ss.score) Math, decode(ss.subject, 'English', ss.score) English from student_score ss;

select ss.name,
       max(decode(ss.subject, 'Chinese', ss.score)) Chinese,
       max(decode(ss.subject, 'Math', ss.score)) Math,
       max(decode(ss.subject, 'English', ss.score)) English
  from student_score ss
 group by ss.name;

--case when
select ss.name,
       max(case ss.subject
         when 'Chinese' then
          ss.score
       end) Chinese,
       max(case ss.subject
         when 'Math' then
          ss.score
       end) Math,
       max(case ss.subject
         when 'English' then
          ss.score
       end) English
  from student_score ss group by ss.name;

--join
select ss.name, ss.score from student_score ss where ss.subject = 'Chinese';
select ss.name, ss.score from student_score ss where ss.subject = 'Math';
select ss.name, ss.score from student_score ss where ss.subject = 'English';

select ss01.name, ss01.score Chinese, ss02.score Math, ss03.score English
  from (select ss.name, ss.score
          from student_score ss
         where ss.subject = 'Chinese') ss01
  join (select ss.name, ss.score
          from student_score ss
         where ss.subject = 'Math') ss02
    on ss01.name = ss02.name
  join (select ss.name, ss.score
          from student_score ss
         where ss.subject = 'English') ss03
    on ss01.name = ss03.name;


--union all

select ss.name, ss.score Chinese, 0 Math, 0 English from student_score ss where ss.subject = 'Chinese' union all
select ss.name, 0 Chinese, ss.score Math, 0 English from student_score ss where ss.subject = 'Math' union all
select ss.name, 0 Chinese, 0 Math, ss.score English from student_score ss where ss.subject = 'English';


select t.name, max(t.Chinese), max(t.Math), max(t.English)
  from (select ss.name, ss.score Chinese, 0 Math, 0 English
          from student_score ss
         where ss.subject = 'Chinese'
        union all
        select ss.name, 0 Chinese, ss.score Math, 0 English
          from student_score ss
         where ss.subject = 'Math'
        union all
        select ss.name, 0 Chinese, 0 Math, ss.score English
          from student_score ss
         where ss.subject = 'English') t
 group by t.name;
