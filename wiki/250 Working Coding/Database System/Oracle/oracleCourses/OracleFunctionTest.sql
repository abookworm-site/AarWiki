---�����Ĳ���---

-- �麯��, ���ۺϺ���
  -- ������ֵ������ֻ�᷵��һ��ֵ
  -- �麯����������ѡ���б���ѯ��having�Ӿ�
  -- ���к����� ����һ��ֵ�����һ��ֵ

--��ѯ����Ա����нˮ�ܺ�
select sum(sal) from emp;

--�鿴�����ж�������¼
select count(*) from emp;
select deptno, count(*) from emp group by deptno having count(*) > 3;

--�ַ�����
--concat����ʾ�ַ���������  ��ͬ�� ||
select concat('my name is ', ename) from emp;


--���ַ���������ĸ��д
select initcap(ename) from emp;
--���ַ���ȫ��ת��Ϊ��д
select upper(ename) from emp;

--���ַ���ȫ��ת��ΪСд
select lower(ename) from emp;

--����ַ���
select lpad(ename, 10, '*') from emp;
select rpad(ename, 10, '*') from emp;

--ȥ���ո�
select trim(ename) from emp;
select ltrim(ename) from emp;
select rtrim(ename) from emp;

--����ָ���ַ�����λ��
select instr('ABCDEF'�� 'C') from emp;
select ename, instr(ename, 'A') from emp;

--�鿴�ַ����ĳ���
select ename, length(ename) from emp;

--��ȡ�ַ����Ĳ���
select ename, substr(ename, 0, 2) from emp;

--�滻����
select ename, replace(ename, 'A', 'AA') from emp;

---��ֵ����---
--��ȡ���ݣ���С�������������������ָ��С�����ֵ�λ��
select round(123.123, 2) from dual;
select round(123.28, 2) from dual;

--�ض�����, ����λ��ȥ���н�ȡ�����ǲ��������������Ĳ���
select trunc(123.123, 2) from dual;
select trunc(123.128, 2) from dual;

--ȡģ����
select mod(10, 4) from dual;
select mod(-10, 4) from dual;

--����ȡ��
select ceil(12.12) from dual;

--����ȡ��
select floor(13.99) from dual;

-- ȡ����ֵ
select abs(-100) from dual;

-- ��ȡ����ֵ
select sign(-100) from dual;

-- x��y����
select power(2, 3) from dual;

---���ں���---
--- һ����ԣ���˾ҵ�������ڶ��嵽�롣
select sysdate from dual;
select current_date from dual;

--add_months,���ָ�����·�
select add_months(hiredate, 2), hiredate from emp;

--�����������������·ݵ����һ��
select last_day(sysdate) from dual;

--���������������·�
select months_between(sysdate, hiredate) from emp;

--������������ĵ�һ��
select sysdate ��ǰ����,
round(sysdate) ����������,
round(sysdate, 'day') ���������,
round(sysdate, 'month') ����³�,
round(sysdate, 'q') �����������,
round(sysdate, 'year') ���������� from dual;

--�������ܵ����ڼ�
select next_day(sysdate, '����һ') from dual;

--��ȡ�����е�ʱ��
select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) Сʱ,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) ����,
extract(second from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) ��
 from dual;

--�������ڵ�ʱ���
select localtimestamp from dual;
select current_timestamp from dual;

--��ָ����ʱ�䵥λ������ֵ
select
trunc(sysdate)+(interval '1' second), --��1��(1/24/60/60)
trunc(sysdate)+(interval '1' minute), --��1����(1/24/60)
trunc(sysdate)+(interval '1' hour), --��1Сʱ(1/24)
trunc(sysdate)+(INTERVAL '1' DAY),  --��1��(1)
trunc(sysdate)+(INTERVAL '1' MONTH), --��1��
trunc(sysdate)+(INTERVAL '1' YEAR), --��1��
trunc(sysdate)+(interval '01:02:03' hour to second), --��ָ��Сʱ����
trunc(sysdate)+(interval '01:02' minute to second), --��ָ�����ӵ���
trunc(sysdate)+(interval '01:02' hour to minute), --��ָ��Сʱ������
trunc(sysdate)+(interval '2 01:02' day to minute) --��ָ������������
from dual;


-- ת������
     -- ��oracle�д�����ֵ����ʽת������ʽת��
     -- ��ʽת��ָ�����ַ�������ת��Ϊ��ֵ��������
-- ��ʽת����
    -- to_char: ������ֵ��������ת���ַ�����ʱ�򣬱���Ҫ�涨��ʽ


--date ��to_char
select '999' + 10 from dual;
select to_char(sysdate, 'YYYY-MM-DD HH:MI') from dual;

-- number : to_char
select to_char(123.456778, '9999.99') from dual;
select to_char(123.456778, '0000.000') from dual;
select to_char(123456789, '999,999,999,999') from dual;

--to_date:ת��֮���ǹ̶��ĸ�ʽ
select to_date('2020/10/10 10:10:10', 'YYYY-MM-DD HH24:MI:SS') from dual;

--to_number:ת������
select to_number('123,456,789', '999,999,999') from dual;

--- ��Ԫ����Ƕ��---
--��ʾû���ϼ�����Ĺ�˾����
select ename, nvl(to_char(mgr), 'boss') from emp where mgr is null;

--��ʾԱ����Ӷ����6���º���һ�������������
select hiredate,next_day(add_months(hiredate, 6), '������')  from emp;

---��������---
--decode,case when

--����ͬ���ŵ���Ա��н��10������10%��20������20%��30������30%
select ename,
       deptno,
       sal,
       decode(deptno, 10, sal * 1.1, 20, sal * 1.2, 30, sal * 1.3)
  from emp;

select ename,
       deptno,
       sal,
       case deptno
         when 10 then
          sal * 1.1
         when 20 then
          sal * 1.2
         when 30 then
          sal * 1.3
       end
  from emp;

------------------------------------------------
--- �������£�
-- ������
create table test(
   id number(10) primary key,
   type number(10) ,
   t_id number(10),
   value varchar2(5)
);
insert into test values(100,1,1,'����');
insert into test values(200,2,1,'��');
insert into test values(300,3,1,'50');

insert into test values(101,1,2,'����');
insert into test values(201,2,2,'��');
insert into test values(301,3,2,'30');

insert into test values(102,1,3,'����');
insert into test values(202,2,3,'Ů');
insert into test values(302,3,3,'10');

/*
����: �������ʾת��Ϊ
����      �Ա�     ����
--------- -------- ----
����       ��        50
*/
-- ����ѯ
select * from test;

select decode(type, 1, value) ����,
       decode(type, 2, value) �Ա�,
       decode(type, 3, value) ����,
  from test;

-- ���ȷ���
-- �ٹ��� null
select max(decode(type, 1, value)) ����,
       max(decode(type, 2, value)) �Ա�,
       max(decode(type, 3, value)) ����,
  from test group by t_id;


/*
�麯��,һ������£��麯����Ҫ�� group by ���ʹ��
�麯��һ������ѡ���б����having�����ж�

���õ��麯����5��
- avg()  ƽ��ֵ,ֻ������ֵ���͵�����
- min()  ��Сֵ���������κ�����
- max()  ���ֵ���������κ�����
- sum()   ��ͣ�ֻ�ʺ���ֵ���͵�����
- count() ��¼��, �����ʱ���������ֵ������ǿ�ֵ
    count һ��������ȡ���еļ�¼������
    ��ȡ����ʱ, ����ʹ��*����ĳһ���������, ��������ʹ�ô����������棬
    ���Ǵ�����Ч�ʵĽǶȿ��ǣ�����ʹ�����ֻ���ĳһ���������, ����Ҫʹ��*

*/

select avg(sal) from emp;
select min(sal) from emp;
select max(sal) from emp;
select count(sal) from emp;
select sum(sal) from emp;

-- ��Ҫʹ�� * 
select count(*) from emp;
select count(1) from emp;
select count(10000) from emp;

-- group by: ����ĳЩ��ͬ��ֵȥ���з������
--- group���з��������ʱ�򣬿���ָ��һ���л��߶���У�
--- ����ʹ��groupby ֮��ѡ���б���ֻ�ܰ����麯����ֵ����group by ����ͨ�ֶ�
--��ÿ�����ŵ�ƽ��нˮ
select deptno, avg(sal) from emp group by deptno;

--��ƽ���������2000�Ĳ���
select deptno, avg(sal) from emp group by deptno having avg(sal) > 2000;

--�����¹�Ա�Ĺ���>2000 ����
select deptno, count(1) from emp where sal > 2000 group by deptno;

--����нˮ���
select deptno, max(sal) from emp group by deptno;

--�������� ������С���������ҳ���, �ҵ�Ա������
select deptno, min(hiredate), max(hiredate) from emp group by deptno; 

select ename, deptno
  from emp
 where hiredate in (select min(hiredate) from emp group by deptno)
    or hiredate in (select min(hiredate) from emp group by deptno);
