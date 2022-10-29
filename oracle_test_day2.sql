--1. 회원 정보를 저장하는 테이블을 MEMBER 란 이름으로 생성한다.
--   MEMBER 테이블은 다음과 같은 칼럼으로 구성된다. (PK: 기본키라고 한다. PRIMARY KEY)
create table MEMBER(
ID varchar2(20) primary key,
NAME varchar2(20) not null,
REGNO varchar2(8) not null,
HP varchar2(13),
ADDRESS varchar2(100)
);

desc member;

--2. 도시 정보를 저장하는 테이블을 BOOK이란 이름으로 생성한다. 테이블은 다음과 같은 칼럼으로 구성된다.
create table BOOK(
CODE number(4) primary key,
TITLE varchar2(50) not null,
COUNT number(6),
PRICE number(10),
PUBLISH varchar2(50)
);

desc book;

--3. 회원이 책을 주문하였을 때 이에 대한 정보를 저장하는 테이블로 이름은 BOOK_ORDER로 한다. 
create table BOOK_ORDER(
NO varchar2(10) primary key,
ID varchar2(20) not null,
CODE number(4) not null,
COUNT number(6),
OR_DATE date
);

desc book_order;