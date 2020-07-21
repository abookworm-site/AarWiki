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




create table STUDENT_SCORE
(
  name    VARCHAR2(20),
  subject VARCHAR2(20),
  score   NUMBER(4,1)
);
insert into student_score (NAME, SUBJECT, SCORE) values ('张三', '语文', 78.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('张三', '数学', 88.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('张三', '英语', 98.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('李四', '语文', 89.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('李四', '数学', 76.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('李四', '英语', 90.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('王五', '语文', 99.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('王五', '数学', 66.0);
insert into student_score (NAME, SUBJECT, SCORE) values ('王五', '英语', 91.0);

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


--case when


--join


--union all
