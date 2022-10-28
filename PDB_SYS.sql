--사용자 계정 생성
--사용자를 생성하기 위해서는 DBA만 사용자를 생성할 수 있다. 그래서 최고권한자(SYSDBA)
--create user 사용자명 identified by 비밀번호; (비밀번호는 대소문자 구문합니다.)
create user javauser identified by java1234;

--사용자 권한 부여
--오라클은 사용자 생성시 어떠한 권한도 가지고 있지 않기에 권한 부여를 해 주어야 한다.
--grant 권한 to 사용자명;

grant create session to javauser;
grant connect, resource to javauser;
alter user javauser 
default tablespace users quota unlimited on users;
--sqlplus에서 하는거랑 같은거임.

--CONNECT  롤에 포함된 권한 --CREATE SESSION 권한이 없으면 해당 유저로 접속이 되지 않음
SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='CONNECT';

--RESOURCE 롤에 포함된 권한
SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE='RESOURCE';
--CREATE 트리거, 시퀀스, 타입, 프로시저, 테이블 등 8가지 권한이 부여되어있음

--먼저 JAVAUSER에게 부여된 롤 확인
SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE='JAVAUSER';

-- 혹시 계정이 잠기게 되면 확인하기 위한 쿼리문
select username, account_status, lock_date
from dba_users
where username='JAVAUSER';

--잠금해제
alter user javauser
account unlock;

--비밀번호 변경
alter user javauser identified by java1234;

