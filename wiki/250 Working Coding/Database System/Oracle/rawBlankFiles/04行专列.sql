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




create table STUDENT_SCORE
(
  name    VARCHAR2(20),
  subject VARCHAR2(20),
  score   NUMBER(4,1)
);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', '����', 78.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', '��ѧ', 88.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', 'Ӣ��', 98.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', '����', 89.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', '��ѧ', 76.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', 'Ӣ��', 90.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', '����', 99.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', '��ѧ', 66.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('����', 'Ӣ��', 91.0);

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


--case when


--join


--union all
