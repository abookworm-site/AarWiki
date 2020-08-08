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
