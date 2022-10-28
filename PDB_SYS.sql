--����� ���� ����
--����ڸ� �����ϱ� ���ؼ��� DBA�� ����ڸ� ������ �� �ִ�. �׷��� �ְ������(SYSDBA)
--create user ����ڸ� identified by ��й�ȣ; (��й�ȣ�� ��ҹ��� �����մϴ�.)
create user javauser identified by java1234;

--����� ���� �ο�
--����Ŭ�� ����� ������ ��� ���ѵ� ������ ���� �ʱ⿡ ���� �ο��� �� �־�� �Ѵ�.
--grant ���� to ����ڸ�;

grant create session to javauser;
grant connect, resource to javauser;
alter user javauser 
default tablespace users quota unlimited on users;
--sqlplus���� �ϴ°Ŷ� ��������.

--CONNECT  �ѿ� ���Ե� ���� --CREATE SESSION ������ ������ �ش� ������ ������ ���� ����
SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='CONNECT';

--RESOURCE �ѿ� ���Ե� ����
SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='RESOURCE';
--CREATE Ʈ����, ������, Ÿ��, ���ν���, ���̺� �� 8���� ������ �ο��Ǿ�����

--���� JAVAUSER���� �ο��� �� Ȯ��
SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE='JAVAUSER';

-- Ȥ�� ������ ���� �Ǹ� Ȯ���ϱ� ���� ������
select username, account_status, lock_date
from dba_users
where username='JAVAUSER';

--�������
alter user javauser
account unlock;

--��й�ȣ ����
alter user javauser identified by java1234;

