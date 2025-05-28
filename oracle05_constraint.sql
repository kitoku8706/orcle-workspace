==========================
/*===============================
테이블 구조 정의
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

자료형(datatype)
varchar2 - 가변길이 문자를 저장
char - 고정길이 문자를 저장
number(m)-정수저장
number(m,n)- 실수저장
date - 날짜 저장
===============================*/

CREATE TABLE student(
  name varchar2(20), --바이트(영문,특수문자- 1byte / 한글-3byte)
  age number(3),   --자릿수
  avg number(5,2), --5는 전체자릿수, 2은 소수점 자릿수
  hire date  
);

--- 정상삽입
INSERT INTO student(name,age,avg,hire)
VALUES ('홍길동',30,78.85,sysdate);

SELECT * FROM student;

INSERT INTO student(name,age,avg,hire)
VALUES ('박차고 나온 세상에',30,78.85,sysdate);

INSERT INTO student(name,age,avg,hire)
VALUES ('홍길동',4000,78.85,sysdate);

INSERT INTO student(name,age,avg,hire)
VALUES ('홍길동',30,921.8589,sysdate);
SELECT * FROM student;

INSERT INTO student(name,age,avg,hire)
VALUES ('홍길동',30,1921.8,sysdate);

INSERT INTO student(name,age,avg,hire)
VALUES ('홍길동',30,78.85,sysdate);





