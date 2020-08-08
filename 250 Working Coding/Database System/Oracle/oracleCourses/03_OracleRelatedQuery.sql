--������ѯ
/*
select t1.c1,t2.c2 
from t1,t2 
where t1.c3 = t2.c4

-- where �ڽ������ӵ�ʱ�򣬿���ʹ�õ�ֵ���ӣ�����ʹ�÷ǵ�ֵ����
*/
--��ѯ��Ա�����ƺͲ��ŵ�����
select * from emp, dept where emp.deptno = dept.deptno;

-- ��ѯ��Ա�����Լ��Լ���нˮ�ȼ�
select e.ename, sg.grade from emp e, salgrade sg where e.sal between sg.losal and sg.hisal;

-- ��ֵ���ӣ��������а�����ͬ������
select * from emp e, dept d where e.deptno = d.deptno;

-- �ǵ�ֵ���ӣ���������û����ͬ������������ĳһ��������һ�ű���еķ�Χ֮��

-- ������
select * from emp;
select * from dept;

--��Ҫ����Ա���е��������ݶ�������ʾ,���õ�ֵ���ӵĻ�ֻ��ѹ�������������ʾ��
select * from emp e, dept d where e.deptno = d.deptno; 

--û�й����������ݲ�����ʾ����ʱ��Ҫ������
--���ࣺ�������ӣ�������ȫ��������ʾ�����������ӣ����ұ��ȫ��������ʾ��
-- ���Ӳ�ѯ����(+): �����е�һ�����Ǳ����Ӷ���
-- ��������: ���empt, �ұ�dept
select * from emp e, dept d where e.deptno = d.deptno(+);

-- �������ӣ����empt, �ұ�dept
select * from emp e, dept d where e.deptno(+) = d.deptno;

--  ���dept, �ұ�emp
select * from dept d, emp e where e.deptno = d.deptno(+);
-- ��������
select * from dept d, emp e where d.deptno = e.deptno(+);

select * from dept d, emp e where e.deptno(+) = d.deptno;


--�����ӣ���һ�ű��ɲ�ͬ�ı����������Լ������Լ�
--����Ա������������Ʋ����
select e.ename, m.ename from emp e, emp m where e.mgr = m.empno;

-- �ѿ����������������ű����ǲ�ָ������������ʱ�򣬻���еѿ�������
-- ��������ܼ�¼����ΪM*n��һ�㲻Ҫʹ��
select * from emp e, dept d;


-- 92�ı������﷨��ʲô���⣿������
-- ��92�﷨�У����ű�����������᷽��where�Ӿ��У�ͬʱwhere��Ҫ�Ա������������
-- ��ˣ��൱�ڽ��������������������ൽһ��̫���ˣ���˳�����99�﷨

--99�﷨
/*
CROSS��JOIN
NATURAL JOIN
USING �Ӿ�
ON�Ӿ�
LEFT OUTER JOIN
RIGHT OUTER JOIN
FULL OUTER JOIN
Inner join
*/

--cross join ��ͬ��92�﷨�еĵѿ�����
select * from emp cross join dept;

--natural join  �൱���ǵ�ֵ���ӣ�����ע�⣬����Ҫд����������������ű����ҵ���ͬ����������
--�����ű��в�������ͬ��������ʱ�򣬻���еѿ���������,��Ȼ���Ӹ�92�﷨��������û���κι�ϵ
-- ��ˣ�ʹ��nature join һ��Ҫȷ��������ͬ�����������ӡ�
select * from emp e natural join dept d;

select * from emp e natural join salgrade sg;

--on�Ӿ䣬����������������������
--����������� �൱��92�﷨�еĵ�ֵ����
select * from emp e join dept d on e.deptno = d.deptno;

--�൱��92�﷨�еķǵ�ֵ���ӣ�
select * from emp e join salgrade sg on e.sal between sg.losal and hisal;

--left outer join ,�������е�ȫ������������ʾ���ұ�û�ж�Ӧ������ֱ����ʾ�ռ���
select * from emp e left outer join dept d on e.deptno = d.deptno;

--right outer join ,����ұ��е�ȫ������������ʾ�������û�ж�Ӧ�ļ�¼�Ļ���ʾ�ռ���
select * from emp e right outer join dept d on e.deptno = d.deptno;

--full outer join ,�൱���������Ӻ��������ӵĺϼ�
select * from emp e full outer join dept d on e.deptno = d.deptno;

--inner outer join�����ű�����Ӳ�ѯ��ֻ���ѯ����ƥ���¼������
select * from emp e inner join dept d on e.deptno = d.deptno; 

-- using,���˿���ʹ��on��ʾ��������֮�⣬Ҳ����ʹ��using��Ϊ��������,
-- ��ʱ�����������в��ٹ������κ�һ�ű�, ��Ϊ�������ж����ڡ�
select * from emp e join dept d using(deptno);

select * from emp e join dept d on e.deptno = d.deptno;

--�ܽ�:�����﷨��SQL���û���κ����ƣ��ڹ�˾�п�������ʹ�ã����ǽ���ʹ��99�﷨����Ҫʹ��92�﷨��SQL�Ե��������


--------------------------------------------
--------------------------------------------
--������Ա���֡����ڵ�λ��нˮ�ȼ�
select e.ename, d.loc, sg.grade
  from emp e
  join dept d
    on e.deptno = d.deptno
  join salgrade sg
    on e.sal between sg.losal and sg.hisal;


/*
�Ӳ�ѯ��
    -- Ƕ��������sql����е�����sql��䣬���Գ�֮Ϊ�Ӳ�ѯ
���ࣺ
    �����Ӳ�ѯ
    �����Ӳ�ѯ
*/
--����Щ�˵�нˮ����������Ա��ƽ��нˮ֮�ϵ�
--1������ƽ��нˮ
select avg(e.sal) from emp e;

--2���������˵�нˮ��ƽ��нˮ�Ƚ�
select * from emp where sal > (select avg(sal) from emp);

--����Ҫ���ڹ�Ա������Щ���Ǿ�����
--1����ѯ���еľ����˱��
select * from emp;
select distinct e.mgr from emp e;

--2���ڹ�Ա���й�����Щ��ż���
select * from emp where empno in (select distinct mgr from emp);

--ÿ������ƽ��нˮ�ĵȼ�
--1����������ŵ�ƽ��нˮ
select deptno, avg(sal) from emp e group by e.deptno;

--2����нˮ�ǼǱ������������ƽ��нˮ�ĵȼ�
select * from salgrade;

select t.deptno, sg.grade
  from salgrade sg
  join (select deptno, avg(sal) vsal from emp e group by e.deptno) t
    on t.vsal between sg.losal and hisal;

--- �Ӳ�ѯ��ϰ-----
--1����ƽ��нˮ��ߵĲ��ŵĲ��ű�� -- ���ű��
--���ŵ�ƽ��нˮ
select e.deptno,avg(e.sal) vsal from emp e group by e.deptno;

--��ƽ��нˮ��ߵĲ���
select max(vsal) from (select avg(e.sal) vsal from emp e group by e.deptno);

--���ű��
select t.deptno
  from (select e.deptno, avg(e.sal) vsal from emp e group by e.deptno) t
 where t.vsal =
       (select max(vsal)
          from (select avg(e.sal) vsal from emp e group by e.deptno));

--2������ƽ��нˮ�ĵȼ�
-- ����ƽ��нˮ
select e.deptno, avg(e.sal) vsal from emp e group by e.deptno;

-- нˮ�ȼ�
select t.deptno, sg.grade from salgrade sg join (select e.deptno, avg(e.sal) vsal from emp e group by e.deptno) t on t.vsal between sg.losal and sg.hisal;

--3������ƽ����нˮ�ȼ�
-- ����ÿ���˵�нˮ�ȼ�
select * from emp;

select e.deptno, sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal;

-- ���ղ�����ƽ���ȼ�
select t.deptno, avg(t.grade) from (select e.deptno, sg.grade from emp e join salgrade sg on e.sal between sg.losal and sg.hisal) t group by t.deptno;

-- �������: limit �� MySQL ��������������ģ�����oracle�в���
--oracle�У������Ҫʹ����������ͷ�ҳ�Ĺ��ܵĻ�������Ҫʹ��rownum��
--����rownum����ֱ��ʹ�ã���ҪǶ��ʹ��
--4����нˮ��ߵ�ǰ5����Ա
-- ����нˮ��������
select * from emp e order by e.sal desc;

select * from (select * from emp e order by e.sal desc) where rownum <= 5;


-- 5����нˮ��ߵĵ�6��10����Ա
-- ��ѯ 1-10 (����Ҳ���Բ����ƣ� �����rownum)
select t.*, rownum rn from (select * from emp e order by e.sal desc) t where rownum <=10;

select t.*, rownum rn from (select * from emp e order by e.sal desc) t;

-- �ٴβ�ѯ 6 - 10
-- ʹ��rownum��ʱ�����Ҫ��������Ƕ�ף���ʱ���ܽ�rownum��Ϊ���е�һ���У�Ȼ���ٽ����������
select * from (select t.*, rownum rn from (select * from emp e order by e.sal desc) t where rownum <=10) where rn >5 and rn <= 10;
