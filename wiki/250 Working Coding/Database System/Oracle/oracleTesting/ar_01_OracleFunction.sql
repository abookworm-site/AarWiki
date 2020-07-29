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
select 













-- ת������
---- ��oracle�д�����ֵ����ʽת������ʽת��
---- ��ʽת��ָ�����ַ�������ת��Ϊ��ֵ��������
--  ��ʽת����
    --  to_char: ������ֵ��������ת���ַ�����ʱ�򣬱���Ҫ�涨��ʽ


-- date ��to_char



--  number : to_char




-- to_date:ת��֮���ǹ̶��ĸ�ʽ


-- to_number:ת������


-- - ��Ԫ����Ƕ��-- -
-- ��ʾû���ϼ�����Ĺ�˾����


-- ��ʾԱ����Ӷ����6���º���һ�������������


-- -��������-- -
-- decode,case when

-- ����ͬ���ŵ���Ա��н��10������10%��20������20%��30������30%




-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- - �������£�
--  ������














/*
����: �������ʾת��Ϊ
����      �Ա�     ����
-- -- -- -- - -- -- -- --  -- -- 
����       ��        50
*/
--  ����ѯ





--  ���ȷ���
--  �ٹ��� null



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







--  ��Ҫʹ�� * 




--  group by: ����ĳЩ��ͬ��ֵȥ���з������
-- - group���з��������ʱ�򣬿���ָ��һ���л��߶���У�
-- - ����ʹ��groupby ֮��ѡ���б���ֻ�ܰ����麯����ֵ����group by ����ͨ�ֶ�
-- ��ÿ�����ŵ�ƽ��нˮ


-- ��ƽ���������2000�Ĳ���


-- �����¹�Ա�Ĺ���>2000 ����


-- ����нˮ���


-- �������� ������С���������ҳ���, �ҵ�Ա������

