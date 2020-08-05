/*������ѯ
-- select t1.c1,t2.c2 
-- from t1,t2 
-- where t1.c3 = t2.c4
*/
-- �ѿ����������������ű����ǲ�ָ������������ʱ�򣬻���еѿ�������
-- ��������ܼ�¼����Ϊ M*n��һ�㲻Ҫʹ��
select * from emp;

select * from dept;

select * from emp e, dept d;

-- where �ڽ������ӵ�ʱ�򣬿���ʹ�õ�ֵ���ӣ�����ʹ�÷ǵ�ֵ����
-- ��ֵ���ӣ��������а�����ͬ������
-- ��ѯ��Ա�����ƺͲ��ŵ�����
select e.ename, d.dname from emp e, dept d where e.deptno = d.deptno;

-- �ǵ�ֵ���ӣ���������û����ͬ������������ĳһ��������һ�ű���еķ�Χ֮��
-- ��ѯ��Ա�����Լ��Լ���нˮ�ȼ�
select * from salgrade;

select e.ename, s.grade from emp e, salgrade s where e.sal between s.losal and s.hisal;


-- ������
---- ���õ�ֵ���ӵĻ�ֻ��ѹ�������������ʾ��û�й����������ݲ�����ʾ
---- ����Ҫ����Ա���е��������ݶ�������ʾ����ʱ��Ҫ������


-- ���ࣺ�������ӣ�������ȫ��������ʾ�����������ӣ����ұ��ȫ��������ʾ��
-- �������ӣ�������ȫ��������ʾ�����������ӣ����ұ��ȫ��������ʾ��
-- �����Ӳ�ѯ�����ʾ���� `from table1, table2` ���ĵ�һλ�ý�����ʾ��
-- ͬʱ�����Ӳ�ѯ���� `(+)` : �����е�һ���Ǳ����Ӷ��󣬼��������ҷ����෴��
-- ��������: ���emp, �ұ� dept
select * from emp e, dept d where e.deptno = d.deptno(+);

-- �������ӣ����dept, �ұ� emp
select * from emp e, dept d where e.deptno(+) = d.deptno;


-- ��������
select e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+);

-- ��������
select e.ename, d.deptno, d.dname
from emp e, dept d
where e.deptno(+)=d.deptno;


-- �����ӣ���һ�ű��ɲ�ͬ�ı����������Լ������Լ�
-- ����Ա������������Ʋ����
select * from emp;

select e.ename, m.ename from emp e, emp m where e.empno = m.mgr;


-- 92�ı������﷨��ʲô���⣿������
-- ��92�﷨�У����ű�����������᷽��where�Ӿ��У�ͬʱwhere��Ҫ�Ա������������
-- ��ˣ��൱�ڽ��������������������ൽһ��̫���ˣ���˳�����99�﷨

/* 99�﷨
-- CROSS��JOIN
-- NATURAL JOIN
-- USING �Ӿ�
-- ON�Ӿ�
-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- FULL OUTER JOIN
-- Inner join
*/
-- cross join ��ͬ��92�﷨�еĵѿ�����
select * from emp cross join dept;

-- natural join �൱���ǵ�ֵ���ӣ�����ע�⣬����Ҫд����������������ű����ҵ���ͬ����������
-- �����ű��в�������ͬ��������ʱ�򣬻���еѿ���������,��Ȼ���Ӹ�92�﷨��������û���κι�ϵ
-- ��ˣ�ʹ�� natural join һ��Ҫȷ��������ͬ�����������ӡ�
select * from emp natural join dept;


-- on�Ӿ䣬����������������������
-- ����������� �൱��92�﷨�еĵ�ֵ����
select * from emp e join dept d on e.deptno = d.deptno;

-- �൱��92�﷨�еķǵ�ֵ���ӣ�
select * from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;

-- left outer join ... on,�������е�ȫ������������ʾ���ұ�û�ж�Ӧ������ֱ����ʾ�ռ���
select * from emp e left outer join dept d on e.deptno = d.deptno;

-- right outer join ... on ,����ұ��е�ȫ������������ʾ�������û�ж�Ӧ�ļ�¼�Ļ���ʾ�ռ���
select * from emp e right outer join dept d on e.deptno = d.deptno;

-- full outer join ... on,�൱���������Ӻ��������ӵĺϼ�
select * from emp e full outer join dept d on e.deptno = d.deptno;

-- inner join ... on�����ű�����Ӳ�ѯ��ֻ���ѯ����ƥ���¼������
select * from emp e inner join dept d on e.deptno = d.deptno;


-- using,���˿���ʹ��on��ʾ��������֮�⣬Ҳ����ʹ��using��Ϊ��������,
-- ��ʱ�����������в��ٹ������κ�һ�ű�, ��Ϊ�������ж����ڡ�

select * from emp e join dept d using (deptno);


select e.ename, d.dname, e.sal, deptno, d.loc
from emp e join dept d using (deptno)
where deptno=20;

-- �ܽ�: �����﷨��SQL���û���κ����ƣ��ڹ�˾�п�������ʹ�ã����ǽ���ʹ��99�﷨����Ҫʹ��92�﷨��SQL�Ե��������


--------------------------------------------
-- ������Ա���֡����ڵ�λ��нˮ�ȼ�
select * from dept;

select e.ename, d.dname, sg.grade from emp e, dept d, salgrade sg where e.deptno = d.deptno and (e.sal between sg.losal and sg.hisal);

select e.ename, d.dname, sg.grade from emp e join dept d on e.deptno = d.deptno join salgrade sg on e.sal between sg.losal and sg.hisal;


/* �Ӳ�ѯ��
-- Ƕ��������sql����е�����sql��䣬���Գ�֮Ϊ�Ӳ�ѯ
-- ���ࣺ
---- �����Ӳ�ѯ
---- �����Ӳ�ѯ
*/
-- ����Щ�˵�нˮ����������Ա��ƽ��нˮ֮�ϵ�
-- 1������ƽ��нˮ
select avg(sal) from emp;

-- 2���������˵�нˮ��ƽ��нˮ�Ƚ�
select e.ename, e.sal from emp e where e.sal> (select avg(sal) from emp);

-- ��ѯ�ڹ�Ա������Щ���Ǿ�����
-- 1����ѯ���еľ����˱��
select distinct mgr from emp;

-- 2���ڹ�Ա���й�����Щ��ż���
select e.ename, e.mgr from emp e where e.empno in (select distinct mgr from emp);

-- ÿ������ƽ��нˮ�ĵȼ�
--1����������ŵ�ƽ��нˮ
select deptno, avg(sal) avg from emp group by deptno;

--2����нˮ�ǼǱ������������ƽ��нˮ�ĵȼ�
select t.deptno, sg.grade from (select deptno, avg(sal) avg from emp group by deptno) t join salgrade sg on t.avg  between sg.losal and sg.hisal;

--- �Ӳ�ѯ��ϰ-----
-- 1����ƽ��нˮ��ߵĲ��ŵĲ��ű��
-- ���ŵ�ƽ��нˮ
select deptno, avg(sal) from emp group by deptno;

-- ��ƽ��нˮ��ߵĲ���
select max(ag) from (select deptno, avg(sal) ag from emp group by deptno);

-- ���ű��
select deptno from (select deptno, avg(sal) ag from emp group by deptno) tb where tb.ag = (select max(ag) from (select deptno, avg(sal) ag from emp group by deptno));

-- 2������ƽ��нˮ�ĵȼ�
-- ����ƽ��нˮ
select deptno, avg(sal) avg from emp group by deptno;

-- нˮ�ȼ�
select tb.deptno, sg.grade from salgrade sg join (select deptno, avg(sal) avg from emp group by deptno) tb on tb.avg between sg.losal and sg.hisal;

-- 3������ƽ����нˮ�ȼ�
-- ����ÿ���˵�нˮ�ȼ�
select e.ename, sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;

-- ���ղ�����ƽ���ȼ�
select avg(grade) from (select e.ename, sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal);

-- �������: limit �� MySQL ��������������ģ�����oracle�в���
-- oracle�У������Ҫʹ����������ͷ�ҳ�Ĺ��ܵĻ�������Ҫʹ�� rownum��
-- ����rownum����ֱ��ʹ�ã���ҪǶ��ʹ��
-- 4����нˮ��ߵ�ǰ5����Ա
-- ����нˮ��������
select ename, sal from emp order by sal desc;

select * from (select ename, sal from emp order by sal desc) where rownum <= 5;

-- 5����нˮ��ߵĵ�6��10����Ա
-- ��ѯ 1-10 (����Ҳ���Բ����ƣ� �����rownum)
select t1.*, rownum from (select * from emp e order by e.sal desc) t1;

-- �ٴβ�ѯ 6 - 10
-- ʹ��rownum��ʱ�����Ҫ��������Ƕ�ף���ʱ���ܽ�rownum��Ϊ���е�һ���У�Ȼ���ٽ����������
select * from (select t1.*, rownum rn from (select * from emp e order by e.sal desc) t1) where rn > 5 and rn <=10;

-- ʹ��99�﷨������Ӧ��ҵ��
-- 1. �г����й�Ա�����������ϼ���������


-- 2. �г���ְ������ء��ֱ���ϼ������й�Ա��


-- 3. �г����в������Ƽ���Ա


-- 4. �г����� 'CLERK'������Ա�����������䲿�����ơ�


-- 5. �г����� 'SALES'�����ۣ������Ĺ�Ա���������ٶ�آ֪�����۲��Ĳ��ű�š�

-- 6. �г���ÿ�����Ź����Ĺ�Ա�������Լ�������Ϣ��

-- 7. �г����й�Ա�Ĺ�Ա���ơ��������ƺ�н��

-- 8. ������ű��Ϊ20�Ĺ�Ա������������нˮ�ȼ�
