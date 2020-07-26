-- Aar_01_����������ϰ

-- ��ѯ��Ա���в��ű����10��Ա��
select * from emp where deptno = 10;

-- ��ѯ���е������ֶ�,����ʹ��*,��������Ŀ��ǧ��Ҫ���ʹ��*,�˷�IO����������������غ��
select e.empno, e.ename, e.job from emp e where deptno = 10;

-- distinct ȥ���ظ�����
select distinct deptno from emp;

-- ȥ��Ҳ������Զ���ֶΣ�����ֶ�ֵֻҪ��һ����ƥ������ǲ�ͬ�ļ�¼
select distinct deptno, job from emp;

-- �ڲ�ѯ�Ĺ����п��Ը������ӱ�����ͬʱҲ���Ը������ӱ���
select e.deptno departement from emp e;

-- ���������ʱ�����Լ�as��Ҳ���Բ���
select e.deptno as dapart from emp e;

-- ���������ʱ����������а����ո���ô��Ҫ�����������á�����������
select e.deptno "my department" from emp e;

-- ��ѯ���ݿ����б�
select * from tab;

-- ��ϸ��ѯ��ǰ�û��µ����б�
select * from user_tables;

-- �鿴��ǰ�û����б�������
select table_name from user_tables;

-- �鿴���ṹ�������
description emp;

-- �鿴���ṹ��mysql
desc emp;

-- �鿴���ṹ��'DEPT':�������д��
select dbms_metadata.get_ddl('TABLE', 'DEPT') from dual;


-- Ϊ������ע��


-- Ϊ������ע��


-- ��ȡ��ע�ͣ�
-- ��Ӧ�Ļ���dba_tab_comments��all_tab_comments. ��������user_tab_comments����ower�С� 


-- ��ȡ�ֶ�ע�ͣ�


-- �ֶ�ע�ͱ����ֶ�
-- user_col_comments��table_name,column_name,comments



/*sql����﷨��





*/



/*
������ѯ��ϰ��
��������,<>��<,>,<=,>=,any,some,all

is null,is not null

between x and y

in��list����not in��list��

exists��sub��query��

like  _ ,%,escape ��\��   _\% escape ��\��


*/
-- =
select * from emp where deptno = 20;

-- !=


-- <> ������


-- <,


-- >,


-- <=,


-- >=,


-- any,ȡ��������һ��
select sal from emp where sal > any(1000, 1500, 3000);

-- some,�� any ͬ����Ч����ֻҪ��������ĳһ��ֵ�������
select sal from emp where sal > some(1000, 1500, 3000);

-- all���������е�ֵ�Ż����
select sal from emp where sal > all(1000, 1500, 3000);


-- is null,��sql���﷨�У�null��ʾһ������ĺ��壬null != null
-- ����ʹ��=����=�жϣ���Ҫʹ��is ,is not
select * from emp where comm is null;

select * from emp where null is null;

--,is not null
select * from emp where comm is not null;


--between x and y,����x��y��ֵ
select * from emp sal between 1500 and 3000;


--����ĳЩֵ�ĵ�ֵ�жϵ�ʱ�����ʹ��in��not in
--in��list��
select * from emp where sal in (1500, 3000);
select * from emp where sal in 3000;

--not in��list��
select * from emp where deptno not in (1500, 3000);


--������and ��or�����Ĺؼ��֣�and�൱�����������or�൱���ǻ����
--and��or���ܳ�����ͬһ��sql����У���ʱ��Ҫע��and��or�����ȼ�
--and �����ȼ�Ҫ����or������һ��Ҫ��or����ز����ã�����������������ȼ�
select * from emp where deptno = 10 or deptno = 30;


-- 1����ѯ���ű��Ϊ10��Ա����Ϣ
select * from emp where deptno = 10;

-- 2����ѯ��н��ء3�����Ա�������벿�ű��
select e.ename, e.deptno from emp e where sal*12 > 30000; 

-- 3����ѯӶ��Ϊnull����Ա�����빤��
select ename, sal from emp where comm is null;

-- 4����ѯ���ʴ�ء1500 �� and ����Ӷ�����Ա����
select ename from emp where sal > 1500 and comm is not null;

-- 5����ѯ���ʴ�ء1500 �� or����Ӷ�����Ա����
select ename from emp where sal > 1500 or comm is not null;

-- 6����ѯ�������溬�� S Ա����Ϣ ���ʡ�����
select ename, sal from emp where ename like '%S%';


-- 7����������J��ͷ�ڶ����ַ�O��Ա�������빤��
select ename, sal from emp where ename like 'JO%';


-- 8�������%�Ĺ�Ա����
select * from emp where ename like '%\%%' escape '\';


-- 9��ʹ��in��ѯ��������Ϊ SALES �� RESEARCH �Ĺ�Ա���������ʡ����ű��
select * from emp where deptno in (select deptno from dept where dname in ('SALES', 'RESEARCH'));

-- 10��ʹ��exists��ѯ��������ΪSALES��RESEARCH �Ĺ�Ա���������ʡ����ű�š�
select * from emp e where exists (select deptno from dept d where dname in ('SALES', 'RESEARCH') and d.deptno = e.deptno); 


/* exists��sub��query��: �Ӳ�ѯ
--     ��exists�е��Ӳ�ѯ����ܲ鵽��Ӧ�����ʱ����ζ����������
--     �������ѯ�൱��˫��forѭ��
*/
-- ��ѯ���ű��Ϊ10��20��Ա����Ҫ��ʹ��existsʵ��
select * from emp where deptno = 10 or deptno = 20;

select *
  from emp
 where exists (select deptno
          from dept
         where deptno = 10
            or deptno = 20);


-- ͨ�����ѭ�����淶�ڲ�ѭ��
select * from emp e where exists (select deptno from dept d where (d.deptno = 10 or d.deptno = 20) and e.deptno = d.deptno);


/*
ģ����ѯ��like  _ ,%,escape ��\��   _\% escape ��\��

��like������У���Ҫʹ��ռλ������ͨ���
           _: ����ĳ���ַ��������ֽ�����һ��
           %�����������ַ������������
           escape: ʹ��ת���ַ�,�����Լ��涨ת���ַ�

- ʹ��like��ʱ��Ҫ���أ���Ϊlike��Ч�ʱȽϵ�
- ʹ��like���Բο�ʹ������������Ҫ������%��ͷ
- �漰�����ı��ļ�����ʱ�򣬿���ʹ��ĳЩ��� luence��solr��elastic search
  - IK �ִ�������Ϣ����ȡ����ǰ�ķ�����һ�仰�ķ�ֵ����֪ͨ��
*/
-- ��ѯ������S��ͷ���û�
select * from emp where ename like 'S%';

-- ��ѯ������S��ͷ�ҵ����ڶ����ַ�ΪT���û�
select * from emp where ename like 'S%T_';


-- ��ѯ�����д�%���û�
select * from emp where ename like '%.%%' escape '.';

/*
���� order by

ÿ����ִ��order by��ʱ���൱��������ȫ���򣬴�ʱ����ȽϺķ�ϵͳ����Դ�����ѡ����ҵ��̫��æ��ʱ�����
-- ȫ�����Ч�ʻ�Ƚϵͣ��п���Ӱ������ҵ��
*/

-- Ĭ���������ɵ�������Ĳ�����
-- asc:��Ĭ�ϵ�����ʽ����ʾ����
-- desc�����������ʽ
select * from emp order by sal;


-- �����ǰ�����Ȼ˳����������
-- �������ֵ����ô���մӴ�С
-- ������ַ�������ô�����ֵ�������
select * from emp order by ename;

-- �������ָ������ֶΣ����Ҷ���ֶο���ʹ�ò�ͬ������ʽ
select * from emp order by ename, sal desc;

-- ʹ�ü����ֶ�
-- �ַ������ӷ�
select 'my anme is ' || ename name from emp;
select concat('my name is ', ename) from emp;

-- ��������Ա������н
-- ��ʱ����������������н
select ename, (e.sal + e.comm) * 12 from emp e;

-- null�ǱȽ�����Ĵ��ڣ�null���κ����㶼����Ϊnull�����Ҫ���ս���ת��
-- ���뺯��nvl��nvl(arg1,arg2),���arg1�ǿգ���ô����arg2��������ǿգ��򷵻�ԭ����ֵ
select ename, (e.sal + nvl(e.comm, 0)) * 12 from emp e;

-- dual��oracle���ݿ��е�һ���������û��ʵ�ʵ����ݣ���������������
select 100 + null from dual;

-- A
-- select * from emp where dpetno = 30;

-- B
-- select * from emp where sal > 1000;


-- �����������������е��������ݶ�������ʾ�����ǲ������ظ�������
select * from emp where deptno = 30 union (select * from emp where sal > 1000);


-- ȫ����������������ȫ����ʾ���������ȥ�صĲ���(���������ظ�����)
select * from emp where deptno = 30 union all (select * from emp where sal > 1000);


-- ���������������н�������ݼ���ֻ��ʾһ��
select * from emp where deptno = 30 intersect (select * from emp where sal > 1000);


-- �,������A���϶���������B�����е����ݣ���A��B�ļ���˳�����
-- A �� B
select * from emp where deptno = 30 minus (select * from emp where sal > 1000);

-- B �� A
select * from emp where sal > 1000 minus (select * from emp where deptno = 30);

-- �ܽḴϰ��
-- 1��ʹ�û�����ѯ���.
-- (1)��ѯDEPT����ʾ���в�������.
select dname from dept;

-- (2)��ѯEMP����ʾ���й�Ա������ȫ������(������=����+����),����NULL��,��ָ���б���Ϊ"������"


-- (3)��ѯ��ʾ�����ڹ�Ա�����в��źš�


-- 2�����Ʋ�ѯ����
-- (1)��ѯEMP����ʾ���ʳ���2850�Ĺ�Ա�����͹��ʡ�
-- (2)��ѯEMP����ʾ����آ��1500��2850�Y������й�Ա�����ʡ�
-- (3)��ѯEMP����ʾ����Ϊ7566�Ĺ�Ա���������ڲ��Ŵ��롣
-- (4)��ѯEMP����ʾ����10��30�й��ʳ���1500�Ĺ�Ա�������ʡ�
-- (5)��ѯEMP����ʾ��2���ַ�Ϊ"A"�����й�Ա���乤�ʡ�
-- (6)��ѯEMP����ʾ���ӷǿյ����й�Ա�����䲹�ӡ�

-- 3����������
-- (1)��ѯEMP����ʾ���й�Ա�������ʡ���Ӷ���ڣ����Թ�Ա���������������
-- (2)��ѯEMP����ʾ��1981��2��1�յ�1981��5��1�ՁY���Ӷ�Ĺ�Ա������λ����Ӷ���ڣ����Թ�Ӷ���ڽ�������
-- (3)��ѯEMP����ʾ��ò��ӵ����й�Ա�������ʼ����ӣ����Թ�������Ͳ��ӽ�������