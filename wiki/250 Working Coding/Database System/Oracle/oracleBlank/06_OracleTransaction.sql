/* ����

-- ���壺��ʾ�������ϣ����ɷָҪôȫ���ɹ���Ҫôȫ��ʧ��

-- ���������Ҫ��Ŀ���� Ϊ������һ����
-- ���ͬһ�����ݣ���ͬһ��ʱ��ֻ����һ���˷��ʣ��Ͳ���������ݴ��ҵ����⣬���������ڵ���Ŀ�У�������ǲ�������
-- �������ʵ�ͬʱ�����ľ������ݵĲ���ȫ��Ҳ���ǲ�һ��
-- ���Ҫ��֤���ݵİ�ȫ������Ҫ�ķ�ʽ���Ǽ����ķ�ʽ��MVCC

-- ����Ŀ�ʼȡ����һ�� DML (Detelete, Modification, )���
-- ����Ľ���
  1�������� commit��ʹ�����޸���Ч������ rollback�������ݻָ�����һ��״̬��
  2���Զ��ύ������һ�������Ҫ���Զ��ύ���йرգ�(ÿ������ύ)Ч��̫��
  3���û��رջỰ֮�󣬻��Զ��ύ����
  4��ϵͳ�������߶ϵ��ʱ���ع�����Ҳ���ǽ����ݻָ�����һ��״̬
*/
-- commit:
-- Ĭ���ύ���������õ�oracle Ĭ��һ�����һ�������Զ��ύ







-- ����ͨ�����������ֹ��ύ����






-- rollback��
-- �ع��Զ��ύ�������ֹ��ύ�������ٻع�






-- �ع��ɹ�







-- �ع�ʧ��



-- savepoint  �����
-- ��һ�����������а�������SQL��䣬����ֻ��������ĳ���ֳɹ���ĳ����ʧ�ܣ���ʱ����ʹ�ñ����
-- ��ʱ�����Ҫ�ع���ĳһ��״̬�Ļ�ʹ�� rollback to sp1;








/* ������ĸ����ԣ�ACID -- AID-C
-- ԭ���ԣ���ʾ���ɷָһ����������Ҫôȫ���ɹ���Ҫôȫ��ʧ�ܣ������Դ��м����з�
-- һ���ԣ�������Ϊ�˱�֤���ݵ�һ���ԣ�������N�������֮�����ݵ�״̬����ı䣨ת�ˣ�
---- ��һ��һ����״̬����һ��һ����״̬��Ҳ�������ݲ����Է�������
-- �����ԣ���������֮����ز������Ӱ�죬�����뼶��
---- �ϸ�ĸ����Իᵼ��Ч�ʽ��ͣ���ĳЩ�����Ϊ����߳����ִ��Ч�ʣ���Ҫ���͸���ļ���
---- ���뼶��
---- - ��δ�ύ
---- - �����ύ
---- - ���ظ���
---- - ���л�
---- ���ݲ�һ�µ����⣺
---- - ���
---- - �����ظ���
---- - �ö�
-- �־��ԣ��������ݵ��޸Ķ�����Ҫ�־û����洢�����У�������ΪӦ�ó���Ĺرն��������ݶ�ʧ

-- �ĸ������У��ĸ�����ؼ��ģ�
---- ���е������ж���Ϊ�˱�֤���ݵ�һ���ԣ�����һ���������յ�׷��
---- �����е�һ������ͨ��ԭ���ԡ������ԡ��־�������֤��
-- 
-- ���Ļ��ƣ�
-- Ϊ�˽���ڲ������ʵ�ʱ�����ݲ�һ�µ����⣬��Ҫ�����ݼ���
-- ������ͬʱ��Ҫ���ǡ����ȡ������⣬���ݲ����Ķ���ͬ�������ࣺ
---- ���ݿ�
---- ��
---- ��

-- һ������£���������ԽС��Ч��Խ�ߣ�����Խ��Ч��Խ�� 
-- ��ʵ�ʵĹ��������У��󲿷ֵĲ��������м���
*/