--- Aar 02 Oracle ����---

-- �麯��, ���ۺϺ���
----  ������ֵ������ֻ�᷵��һ��ֵ
----  �麯����������ѡ���б���ѯ��having�Ӿ�
----  ���к����� ����һ��ֵ�����һ��ֵ

-- ��ѯ����Ա����нˮ�ܺ�
select sum(sal) from emp;

-- �鿴�����ж�������¼
select count(ename) from emp;

select count(*) from emp;

-- �鿴��ͬ���ŵ�������¼
select deptno, count(*) from emp group by deptno having count(*) > 3; 

-- �ַ�����
-- concat����ʾ�ַ���������  ��ͬ�� ||
select concat('My name: ', ename) from emp;

-- ���ַ���������ĸ��д
select initcap(ename) from emp;

-- ���ַ���ȫ��ת��Ϊ��д
select upper(ename) from emp;

-- ���ַ���ȫ��ת��ΪСд
select lower(ename) from emp;

-- ����ַ���
select lpad(ename, 10, '*') from emp;

select rpad(ename, 10, '*') from emp;

-- ȥ���ո�
select trim(ename) from emp;

select trim(ename) from emp;

select trim(ename) from emp;

-- ����ָ���ַ�����λ��
select instr('ABCD', 'C') from emp; 

-- �鿴�ַ����ĳ���
select ename, length(ename) "ename length" from emp;

-- ��ȡ�ַ����Ĳ���
select ename, substr(ename, 0, 2) from emp;

-- �滻����
select ename, replace(ename, 'A', 'AA') from emp;

-- -��ֵ����-- -
-- ��ȡ���ݣ���С�������������������ָ��С�����ֵ�λ��
select round(4.123) from dual;
select round(4.723) from dual;

-- �ض�����, ����λ��ȥ���н�ȡ�����ǲ��������������Ĳ���
select trunc(4.123) from dual;
select trunc(4.723) from dual;

-- ȡģ����
select mod(10, 4) from dual;
select mod(-10, 4) from dual;

-- ����ȡ��
select ceil(4.123) from dual;

-- ����ȡ��
select floor(4.723) from dual;

-- ȡ����ֵ
select abs(-4.123) from dual;

-- ��ȡ����ֵ
select sign(-4.123) from dual;

select sign(-10) from dual;

-- x��y����
select power(2, 3) from dual;

-- ���ں��� --
-- һ����ԣ���˾ҵ�������ڶ��嵽�롣
select sysdate from dual;

select current_date from dual;


---- ��ȡ��ǰ����ʱ���������ϵͳ������
select current_timestamp from dual;

-- add_months(): ���ָ�����·�
select hiredate, add_months(hiredate, 3) from emp;

-- �����������������·ݵ����һ��
select last_day(sysdate) from dual;

-- ���������������·�
select hiredate, sysdate, floor(months_between(sysdate, hiredate)) from emp;

-- ������������ĵ�һ��
select sysdate, round(sysdate, 'day') from dual;

-- �������ܵ����ڼ�
select next_day(sysdate, 3) from dual;

-- ��ȡ�����е�ʱ��
select current_timestamp,
extract(hour from current_timestamp) "Hours" ,
extract(minute from current_timestamp) "Minute",
extract(second from current_timestamp) "Second",
extract(day from current_timestamp) "Day",
extract(month from current_timestamp) "Month",
extract(year from current_timestamp) "Year"
 from dual;

select sysdate, extract(hour from timestamp(hiredate,'yyyy-mm-dd')) from emp;

-- �������ڵ�ʱ���
select localtimestamp from dual;

select current_timestamp from dual;

-- ��ָ����ʱ�䵥λ������ֵ
select trunc(sysdate)+(interval '1' DAY) from dual;

-- ��ָ����ʱ�䵥λ������ֵ����ָ��ʱ��
select trunc(sysdate)+(interval '1 01:02' day to minute) from dual;

-- ת������
---- ��oracle�д�����ֵ����ʽת������ʽת��
---- ��ʽת��ָ�����ַ�������ת��Ϊ��ֵ�������ڣ���֮Ҳ��
select * from emp where empno=to_number('8000');

select '999'-10 from dual;

-- ��ʽת����to_char: ������ֵ��������ת���ַ�����ʱ�򣬱���Ҫ�涨��ʽ
-- date ��to_char(), 
select to_char(sysdate, 'YYYY-MM-DD HH:MI') from dual;

select to_char(sysdate) from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD') from emp;

-- number : to_char()
select to_char(123.456789, '9999.99') from dual;
select to_char(123.456789, '999,999,999,999') from dual;

-- to_date(): ת��֮���ǹ̶��ĸ�ʽ
select to_date('2020/10/10 10:10:10', 'YYYY-MM-DD HH24:MI:SS') from dual;

-- to_number(): ת������
select to_number('123,456,789', '999,999,999') from dual;

-- ���к���Ƕ��
-- ��ʾû���ϼ�����Ĺ�˾����
-- û���ϼ��쵼�Ĺ�Ա mgr��ʾΪboss
select * from emp;

select ename from emp where mgr is null;

select ename, nvl(to_char(mgr), 'no manager') from emp where mgr is null;

-- ��ʾԱ����Ӷ����6���º���һ�������������

select ename, hiredate, add_months(hiredate, 6), to_char(next_day(add_months(hiredate, 6), 5), 'YYYY-MM-DD') "Review" from emp;

select ename, hiredate, add_months(hiredate, 6), next_day(add_months(hiredate, 6), '������') "Review" from emp;

-- ��������--
-- decode,case when

-- ����ͬ���ŵ���Ա��н��10������10%��20������20%��30������30%
---- decode
select ename, sal, decode(deptno, 10, sal*1.1, 20, sal*1.2, 30, sal*1.3) "Sal added" from emp;

---- case when
select ename, sal, case deptno when 10 then sal*1.1 when 20 then sal*1.2 when 30 then sal*1.3 end "Sal added" from emp;

-- ������ϰ��ϰ
-- 1. ��ѯ82��Ա��
select * from emp where to_char(hiredate, 'YY') = '82';

-- 2. ��ѯ38�깤�����Ա
select * from emp where floor(months_between(sysdate, hiredate)/12) = 38;

-- 3. ��ʾԱ����Ӷ�� 6 ���º���һ������һ������
select ename, next_day(add_months(hiredate, 6), '����һ') from emp;

-- 4. ��û���ϼ���Ա������mgr���ֶ���Ϣ���Ϊ "boss"
select ename, nvl(to_char(mgr), 'boss') "Mgt" from emp where mgr is null;

-- 5. Ϊ�����˳����ʣ���׼�ǣ�10���ų�10%��20���ų�15%��30���ų�20%�������ų�18%
select ename, decode(deptno, 10, sal*1.1, 20, sal*1.15, 30, sal*1.2, 40, sal*1.18) "Add sal" from emp;

-- ������
/*
create table CMCC(
   id number(10) primary key,
   type number(10) ,
   t_id number(10),
   value varchar2(5)
);
insert into CMCC values(100,1,1,'����');
insert into CMCC values(200,2,1,'��');
insert into CMCC values(300,3,1,'50');

insert into CMCC values(101,1,2,'����');
insert into CMCC values(201,2,2,'��');
insert into CMCC values(301,3,2,'30');

insert into CMCC values(102,1,3,'����');
insert into CMCC values(202,2,3,'Ů');
insert into CMCC values(302,3,3,'10');
*/

-- ���󷢲�
/* �������ʾת��Ϊ��
-- ����      �Ա�    ����
--------  -------  ----
-- ����       ��     50
*/

-- ����ѯ
select * from CMCC;

select decode(type, 1, value) ����,
       decode(type, 2, value) �Ա�,
       decode(type, 3, value) ����,
  from CMCC;

-- ���ȷ��飬�ٹ��� null
select max(decode(type, 1, value)) ����,
       max(decode(type, 2, value)) �Ա�,
       max(decode(type, 3, value)) ����,
  from CMCC group by t_id;


/* �麯�������麯�����߷��麯��
-- һ������£��麯����Ҫ�� group by ���ʹ��
-- �麯��һ������ѡ���б����having�����ж�

-- ���õ��麯����5��
---- avg()  ƽ��ֵ,ֻ������ֵ���͵�����
---- min()  ��Сֵ���������κ�����
---- max()  ���ֵ���������κ�����
---- sum()   ��ͣ�ֻ�ʺ���ֵ���͵�����
---- count() ��¼��, �����ʱ���������ֵ������ǿ�ֵ
------    count һ��������ȡ���еļ�¼������
------    ��ȡ����ʱ, ����ʹ��*����ĳһ���������, ��������ʹ�ô����������棬
------    ���Ǵ�����Ч�ʵĽǶȿ��ǣ�����ʹ�����ֻ���ĳһ���������, ����Ҫʹ�� *
*/
-- ��Ա��нˮ�������С��ƽ�����ܺ�
select max(sal), min(sal), sum(sal), avg(sal) from emp;


-- count() ��Ҫʹ�� * 
select count(*) from emp;
select count(comm) from emp;
select count(1) from emp;

select count(distinct deptno) from emp;

--  group by: ����ĳЩ��ͬ��ֵȥ���з������
-- - group���з��������ʱ�򣬿���ָ��һ���л��߶���У�
-- - ����ʹ��groupby ֮��ѡ���б���ֻ�ܰ����麯����ֵ����group by ����ͨ�ֶ�
-- ��ÿ�����ŵ�ƽ��нˮ
select deptno, avg(sal) from emp group by deptno;

-- ��ƽ����ˮ����2000�Ĳ���
select deptno, avg(sal) from emp group by deptno having avg(sal) > 2000;

-- �����¹�Ա�Ĺ��� >2000 ����
select deptno, count(sal) from emp where sal > 2000 group by deptno;


-- ����нˮ���
select deptno, max(sal) from emp group by deptno;

select max(sal), deptno, job from emp group by deptno, job;

-- �������� ������С���������ҳ���, �ҵ�Ա������
select deptno, max(hiredate), min(hiredate) from emp group by deptno;

select ename, hiredate from emp where hiredate in (select max(hiredate) from emp group by deptno) or hiredate in (select min(hiredate) from emp group by deptno);

select mm2.deptno, e1.ename, e1.hiredate
  from emp e1,
       (select min(e.hiredate) mind, max(e.hiredate) maxd, e.deptno
          from emp e
         group by e.deptno) mm2
 where e1.hiredate = mm2.mind
    or e1.hiredate = mm2.maxd;

-- ������ϰ
-- 1. ��ѯ10�Ų����б��������ְ��Ա�����������Ա���ĸ�����Ϣ��
select max(hiredate), min(hiredate) from emp where deptno = 10;

select * from emp where hiredate in (select max(hiredate) from emp where deptno = 10) or hiredate in (select min(hiredate) from emp where deptno = 10);

-- 2. ��'software'�ҵ�'f'��λ�ã���'*'�������䵽15λ��ȥ�����е�'a'��
select instr('software', 'f') from dual;

select lpad('software', 15, '*') from dual;

select replace('software', 'a', '') from dual;

-- 3. ��ѯԱ���Ľ����������ΪNULL��ʾ'�н���'��Ϊnull����ʾ�޽���
select * from emp;

select ename, decode(comm, null, '�޽���', '�н���') "Bouncs" from emp;

-- 4. дһ����ѯ��ʾ��ǰ���ڣ��б�����ʾΪDate������ʾ�����º�����ڣ���һ�������յ����ڣ��������һ������ڡ�
select sysdate "Date", add_months(sysdate, 6) "���º�", next_day(sysdate, '������') "������", last_day(sysdate) "����ĩ" from dual;

-- 5. ��ѯEMP�������߱���������У���������߱��Ϊ�����Ϊ�յ�����ǰ��ʾ
select * from emp order by mgr asc nulls first;

-- 6. ����ƽ��нˮ
select deptno, avg(sal) from emp group by deptno;

-- 7. ������������ʴ���1300��Ա�� ���ű�š�ƽ�����ʡ���СӶ�����Ӷ��,�������Ӷ�����100
select deptno, avg(sal), min(sal), max(sal) from emp where sal>1300 group by deptno having max(nvl(comm, 0)) > 100;

-- 8. �ҳ�ÿ�����ŵ�ƽ������С�����нˮ
select deptno, avg(sal), min(sal), max(sal) from emp group by deptno;

-- 9. ��ѯ����Ա������Ա���ڲ������ƣ����ʵȼ���
select * from emp;

select * from dept;

select * from salgrade;

select e.ename, d.dname, s.grade from emp e, dept d, salgrade s where e.deptno=d.deptno and e.sal between s.losal and s.hisal;


