-- all exericse for the power point.

-- ��ѯ���ݿ����б�
select * from tab;

--�������ע��
comment on table emp is 'employee';

--�������ע��
comment on column emp.ename is 'all name of employee';

/*sql����﷨��

SELECT [DISTINCT] {*,column alias,..}
FROM table alias
Where �������ʽ

*/

--��ѯ��Ա���в��ű����10��Ա��

--dinstinct ȥ���ظ�����

--ȥ��Ҳ������Զ���ֶΣ�����ֶ�ֵֻҪ��һ����ƥ������ǲ�ͬ�ļ�¼

--�ڲ�ѯ�Ĺ����п��Ը�����ӱ�����ͬʱҲ���Ը�����ӱ���

--���������ʱ�����Լ�as��Ҳ���Բ���

--���������ʱ����������а����ո���ô��Ҫ�����������á�����������

--��ѯ���е������ֶ�,����ʹ��*,��������Ŀ��ǧ��Ҫ���ʹ��*,�˷�IO��������������غ��


-- 

select * from dept;

select ename, sal, deptno
  from emp
 where deptno in (select deptno
                    from dept
                   where dname = 'SALES'
                      or dname = 'RESEARCH');

- ʹ�� exists ��ѯ
select ename, sal, deptno
  from emp e
 where exists (select deptno
          from dept d
         where (dname = 'SALES'
            or dname = 'RESEARCH')
            and e.deptno = d.deptno);



---------------����������-------------------
-- 1. create table tmp
create table tmp(rq varchar2(10),shengfu varchar2(5));

insert into tmp values('2005-05-09','ʤ');
insert into tmp values('2005-05-09','ʤ');
insert into tmp values('2005-05-09','��');
insert into tmp values('2005-05-09','��');
insert into tmp values('2005-05-10','ʤ');
insert into tmp values('2005-05-10','��');
insert into tmp values('2005-05-10','��');

/*
          ʤ ��
2005-05-09 2 2
2005-05-10 1 2

*/

select * from tmp;

select rq, decode(shengfu, 'ʤ', 1), decode(shengfu, '��', 2) from tmp;

select rq, count(decode(shengfu, 'ʤ',1)), count(decode(shengfu,'��', 2)) from tmp group by rq;


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
����   ����  ��ѧ  Ӣ��
����    89    56    89
*/
--����ʹ��4�з�ʽ��д��
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
