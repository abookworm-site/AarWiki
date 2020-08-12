/* ���У� 
-- ��Oracle�У� �����Ҫ���һ���е����������������Ҫʹ������
-- �﷨��
-- create sequence seq_name
--   increment by n  ÿ��������
--   start with n    ���ĸ�ֵ��ʼ����
--   maxvalue n|nomaxvalue 10^27 or -1  ���ֵ
--   minvalue n|no minvalue  ��Сֵ
--   cycle|nocycle           �Ƿ���ѭ��
--   cache n|nocache          �Ƿ��л���
*/
-- ��������
create sequence my_sequence increment by 2 start with 1;

create sequence seq increment by 2 start with 1;


-- ���ʹ�ã�
-- ע��: �������������֮��û�о����κε�ʹ�ã���ô���ܻ�ȡ��ǰ��ֵ������Ҫ��ִ�� nextval ֮����ܻ�ȡ��ǰֵ


-- 1. �״����б�������һ�� nextval ����ȡ���е���һ��ֵ����ʼֵ��
select my_sequence.nextval from dual;

-- 2. �鿴��ǰ���е�ֵ�����״�ֱ�Ӳ鿴����ôSQL�ᱨ��
select my_sequence.currval from dual;

-- �˴�������
select seq.currval from dual;

-- 3. ��ȡ���е���һ��ֵ
select my_sequence.nextval from dual;

-- 4. ʹ�ã���������
select * from psn;

-- ��������ʱ����Ҫֱ��ʹ��seq.nextval
insert into psn(id, name) values(seq.nextval, 1);

-- ɾ������
drop sequence my_sequence;


/* ���ݱ����﷨
--CREATE TABLE [schema.]table
--  (column datatype [DEFAULT expr] , ��
--  );
*/

-- ���Ҫ�󣺽���һ�������洢ѧ����Ϣ�ı����е��ֶΰ�����ѧ����ѧ�š����������䡢��ѧ���ڡ��꼶���༶��email����Ϣ��
-- ���� grade ָ����Ĭ��ֵΪ1������ڲ�������ʱ��ָ��grade��ֵ���ʹ�����һ�꼶��ѧ��

create table student(
id number(6),
name varchar2(20) not null unique,
gender number(1) not null,
age number(3),
co_date date,
grade number(1) default(1),
class number(4),
email varchar2(50)
);

insert into student values(123456, 'lisi', 1, 6,to_date('20200101', 'YYYY-MM-DD'), 2, 1234, 'chairej@gmail.com');

select * from student;

-- ����ı�ṹ�����Ҫʹ�õ��������� powerdesigner

-- ����ֶ�
-- ����ӱ���е�ʱ�򣬲����������ó�not null
alter table student add address varchar2(100);

-- ɾ���ֶ�
alter table student drop column address;

-- ����������/��ͼ
rename student to student1;

select * from student1;

drop table student1;

/* ɾ����
-- ��ɾ�����ʱ�򣬾����������������������������������ʱ��������ɾ������Ҫʹ�ü���ɾ��
-- restrict: 
-- cascade: �� A,B ���ű���� A �е�ĳһ���ֶθ� B ���е�ĳһ���ֶ�����������ô��ɾ���� A ��ʱ����Ҫ�Ƚ� ��B ɾ��
-- set null: ��ɾ����ʱ�򣬰ѱ�Ĺ����ֶ����óɿ�
*/
drop table student;


/* �������ʱ����Ը����е������������У�������Щ�����֮ΪԼ��

-- Լ����Ϊ�����
-- not null: �ǿ�Լ�����������ݵ�ʱ��ĳЩ�в�����Ϊ��
-- unique key: Ψһ��Լ���������޶�ĳһ���е�ֵ��Ψһ�ģ�Ψһ������һ�㱻���������С�
-- primary key: �������ǿ���Ψһ���κ�һ�ű�һ����������������������Ψһ�ı�ʶһ�м�¼��
-- foreign key: ������������֮���й�����ϵ��һ�����ĳ���е�ֵ��������һ�ű��ĳ��ֵ����ʱ����Ҫʹ�����
-- checkԼ��:���Ը����û��Լ�������ȥ�޶�ĳЩ�е�ֵ
*/
-- ���˽��飺�ٴ������ʱ��ֱ�ӽ��������Լ��������Ӻã�����������Լ���Ļ�������Ȱ������������������Ȳ���

create table student(
stu_id number(10) primary key,
name varchar2(20) not null,
age number(3) check(age>0 and age < 120),
hiredate date,
grade varchar2(10),
classes varchar2(10) default 1,
email varchar2(50), unique,
deptno number(2)
);

alter table student add constriaint fk_001 foreign key(deptno) reference dept(deptno);
