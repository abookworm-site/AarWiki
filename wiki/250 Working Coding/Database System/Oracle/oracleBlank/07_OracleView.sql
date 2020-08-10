/* ��ͼ
-- ��ͼ�Ĵ���

-- CREATE [OR REPLACE] VIEW view_name
-- [(alias[, alias]...)]
-- AS subquery
-- [WITH READ ONLY];
*/

-- �����ͨ�û���һ�δ�����ͼ����ʾû��Ȩ�ޣ�ʹ�ù���Աȥ�޸�Ȩ��

-- $ sqlplus /nolog

-- SQL> conn sys/xxxx@orcl as sysdba;

-- SQL> grant create view to scott;

-- ������ͼ

select * from emp where deptno = 30;

create VIEW vemp as select * from emp where deptno = 30 with read only;

create view $v_emp as select * from emp;

create or replace view v$_emp_dept
as
select emp.deptno,ename,dname from emp
join dept on emp.deptno=dept.deptno
with read only;

-- ��ͼ��ʹ��
select * from vemp


-- ����ͼ���������,ִ�гɹ�֮����Ҫ�ύ������ɫ��ʾ�ύ������������Ч����ɫ��ʾ�ع����������ݻָ�ԭ״̬
insert into vemp(empno, ename) values(1111, 'Zhangsan');

select * from vemp;


-- ����������ͼ�Ƿ�ֻ����ͼ�Ļ�������ͨ����ͼ����в������ݣ������ֻ����ͼ���򲻿��Բ�������
create view vemp2 as select * from emp with read only;

select * from vemp2;

-- ֻ����ͼֻ�ṩ��ѯ�������޷�������ɾ�Ĳ���
--  Failed operation
insert into vemp2(empno, ename) values(2222, 'Lisi');

-- ɾ����ͼ
drop view v_deptno_30;

-- ��ɾ����ͼ�е����ݵ�ʱ�����������Դ�ڶ���������ʱ����ȫ������ɾ����ֻ��ɾ��һ�����е�����

-- ����
-- ��ƽ��нˮ�ĵȼ���͵Ĳ��ţ����Ĳ���������ʲô��Ҫ����ȫʹ���Ӳ�ѯ
-- 1����ƽ��нˮ
select deptno, avg(sal) av from emp group by deptno;

-- 2����ƽ��нˮ�ĵȼ�
select * from salgrade;


select t.deptno, sg.grade from salgrade sg, (select deptno, avg(sal) av from emp group by deptno) t where t.av between sg.losal and sg.hisal;


select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal;

-- 3����ƽ��нˮ�ĵȼ���͵Ĳ���
select min(grade) from (select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal) k;

select deptno from (select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal) k where k.grade = (select min(grade) from (select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal));


-- 4����ƽ��нˮ�ĵȼ���͵Ĳ��ŵĲ�������
select * from dept;

select dname from dept where deptno = (select deptno from (select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal) k where k.grade = (select min(grade) from (select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal)));

-- �鿴sql����ܹ����֣�sql���кܶ���ظ���sql�Ӳ�ѯ������ͨ����ͼ���ظ��������������
-- ������ͼ
create view dno_gd as select t.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) av from emp group by deptno) t on t.av between sg.losal and sg.hisal;

-- ʹ����ͼ�滻
select dname from dept where deptno = (select deptno from dno_gd k where k.grade = (select min(grade) from dno_gd));
