/* DML�����ݿ�������ԣ� ����ɾ����

-- ��ʵ����Ŀ�У�ʹ�������Ƕ�ȡ���������ǲ������ݺ�ɾ������ͬ����Ҫ�����޸Ĳ�����Խ���
*/

/* ���������
---- Ԫ��ֵ�Ĳ���
---- ��ѯ����Ĳ���
*/

-- ������Ĳ��뷽ʽ 2 �֣�
-- �򲿷��в������ݵ�ʱ�򣬲��������ĸ��в���Ͳ���ģ�Ҫ��ѭ�������ʱ����Ĺ淶(Լ��)
-- ��һ�֣���ȫ����
-- insert into tablename values(val1,val2,....) �������֮��û���У���ôֻ�ܽ����е��ж�����
insert into emp values(2222, 'Hello', 'Cleark', '7902', to_date('2019-01-23', 'YYYY-MM-dd'), 1002, 500, 10);

-- �ڶ��֣����ֲ���
-- insert into tablename(col1,col2,...) values(val1,val2,...) ����ָ������Щ���в�������
insert into student(std_id, name) values();

-- before and after this to check the table
select * from emp;


-- �������������ʽ
-- ���Ʊ�ͬʱ���Ʊ����ݣ����Ḵ��Լ��
create tables std as select * from student;

-- ���Ʊ�ṹ���ǲ����Ʊ����ݣ����Ḵ��Լ��
create table std2 as select * from student where 1=2;

-- һ����ʵ�ʵĲ����У�����һ�������룬���������������


/* ɾ��������
-- delete from tablename where condition
*/
-- ɾ����������������
delete from student where name = 'zhangsan';

-- �����ű������ȫ�����
delete from student;


-- truncate: ��delete������ͬ��delete�ڽ���ɾ����ʱ�򾭹����񣬶�truncate����������һ��ɾ����������ɾ�������߱��ع��Ĳ���
-- Ч�ʱȽϸߣ��������׷�������������Բ�����ʹ��
truncate table student;

/* �޸Ĳ�����
-- update tablename set col = val1,col2 = val2 where condition;
-- ���Ը��»����޸�����������һ���л��߶����
*/
-- ���µ���
update student set name = 'HeiHei' where std_id = 1;

-- ���¶���е�ֵ
update student set grade=2, classes=3 where std_id = 2;


-- �ܽ᣺
-- ��ɾ�������ݿ�ĳ��ò������ڽ��в�����ʱ����Ҫ�����񡷵ı�֤�� Ҳ����˵ÿ���� pl/sql ��ִ��sql���֮����Ҫ��� commit �Ĳ���
-- ��������÷ǳ��ؼ�

