/*==========================================================
����Ŭ���� �����Ǵ� ��ɾ�
1 DML(Data Manipulation Language ������ ���۾�) : 
  �����ʹ� �߰�, ����, ����, �˻�, �������ִ� ��ɾ���̴�.
  (insert, update, delete, select, merge)
2 DDL(Data Definition Language ������ ���Ǿ� ) : 
  ���̺��� ������ ����, �������ִ� ��ɾ���̴�.
  (create, drop, alter, truncate)
3 DCL(Data Control Language ������ �����) : 
  ������� ������ �ο�,�������ִ� ��ɾ���̴�.(grant ,revoke)
4 TCL(Transaction Control Language Ʈ����� ó����) : 
  Ʈ����� ����,����� ó�����ִ� ��ɾ���̴�
  (commit, rollback, savepoint)
==========================================================*/

DROP TABLE emp01;

-���̺� ������ ����
CREATE TABLE emp01
AS
SELECT first_name, salary
FROM employees
WHERE 1=0;

SELECT* FROM EMP01;
DESC EMP01;'

/*--���̺� ���ڵ带 ����
INSERT INTO ���̺��(column1,column2)
VALUES(��1, ��2);
*/

INSERT INTO EMP01(FIRST_NAME,SALARY)
VALUES('candy',5000);

SELECT* FROM EMP01;

INSERT INTO EMP01
VALUES('Stevan',4000);

SELECT* FROM EMP01;

--����� NULL ����
INSERT INTO EMP01(FIRST_NAME,SALARY)
VALUES('Lex',null);


SELECT* FROM EMP01;

--������ NULL ����
INSERT INTO EMP01(FIRST_NAME)
VALUES('Paran');

SELECT* FROM EMP01;

/*=======================================
���̺��� ������ �����ϴ� ��ɾ��̴�.
UPDATE ���̺�� 
SET �÷�1=��1, �÷�2=��2 
WHERE �÷�=��;
=========================================*/
--emp01���̺� first_name�÷��� ���� 'candy'�� ��
--salary�÷��� ���� 8000���� ������Ʈ�϶�.

UPDATE EMP01
SET salary=8000
WHERE first_name='candy';

SELECT* FROM EMP01;


/*=============================================
���̺��� ������ �����ϴ� ��ɾ��̴�.
DELETE
DELETE FROM table_name WHERE column_name = value;
===============================================*/

DELETE FROM EMP01
WHERE FIRST_NAME='candy';

SELECT* FROM EMP01;


/*======================================
Ʈ�����(Transaction)
1 Ʈ����� ����
  -�ѹ��� ����Ǿ�� �� �����ͺ��̽��� �Ϸ��� Read��
   Write ������ �����ϴ� ����
  -�ϳ��� ���� ����� �����ϱ� ���� �۾��� �����μ�
  �����ͺ��̽��� �ϰ��� ���¸� �� �ٸ� �ϰ��� ���·�
  ��ȯ��Ŵ
  
  Ʈ����ǽ���-> ����->����->���� -> Ʈ���������
  �ϳ��� �۾��� �����ؼ� ���������� ����ɶ������� ������ ���Ѵ�.
  (������ �۾�����)
  
  ����(ATM)->��� ī�����-> ��谡 ī�带 ����->
  ����ݾ� �Է�-> ��й�ȣ �Է�-> ��迡�� ��ݾ� ó��
  -> ��ݱݾ� ����-> ī������
  
  <Ʈ����� ����>
  -�����ͺ��̽��� ó�� �������� ��
  -�ϳ� �Ǵ� ���� ���� DML���� ������� commit �Ǵ� rollback
   ���� ����� ����
  
   <Ʈ����� ����>
  - commit �Ǵ� rollback���� ����ɶ�
  - DDL �Ǵ� DCL���� ����� ��
  - ���������� �����ͺ��̽��� �����Ҷ�
  - ������������ �����ͺ��̽��� �����Ҷ�
  
2 Ʈ����� ������ Ȯ���� ���� ACID
  1) ACID���� 
     -�����ͺ��̽����� ������ �۾������� Ʈ�������
       �����ϰ� ����Ǵ� ���� �����ϴ� Ư������
  2) ACID�� �ʿ伺
     -���� ����� ȯ�� ���� :���ϵ�����-�����۾�ȯ�濡����
          ������ ó�� ��Ȯ�� ����
     -������ Ʈ����� ������ ���� �����ͺ��̽� ���Ἲ ����
  3) Ʈ���輺 �������   
    Atomicity(���ڼ�):
     -Ʈ������� �� �� �̻��� ������ �������� �� ����
      �۾�����(single unit of work)�μ� ���ذ�
      �Ұ����� �ּ��� ����
     -���� ��ü�� ���������� ó���ǰų� �Ǵ� �� ������
      ������ ��� ��ü�� ��ҵǾ� ���Ἲ�� ����
      (All or Nothing)
    Consistency(�ϰ���):
    -Ʈ������� ������ ���������� �Ϸ��ϸ� ������ ��� ����
     �ϰ��� �ִ� �����ͺ��̽� ���¸� ������
    - ���̺��� ����Ÿ�� ���ŵǰ� �׿� ���� �ε����� ���ŵ��� �ʴ� ���� �������� �־ �ʵȴ�.
    Isolation(����,������):
    -Ʈ������� ���� �߿� �����ϴ� ������ �߰� �����
     �ٸ� Ʈ������� ������ �� ����
   -Ŀ�Ե� Ʈ������� ��ְ� �߻��ص� ����Ÿ�� �����ǿ��� �Ѵٴ� Ư��.
   Durability(���Ӽ�,���Ӽ�,������):
    -������ �Ϸ�� Ʈ������� ����� ���������� �����ͺ��̽���
     �����
========================================================================================*/
/*�ڵ�Ŀ�� ���� Ȯ��(SQL Developer)
����>ȯ�漳��>�����ͺ��̽�>��ü���> �ຯ��� ��������, �ڵ�Ŀ�� ���� üũ ���� */

SELECT*FROM EMP01;
COMMIT;

INSERT INTO EMP01
VALUES('Beta',7000);

SELECT*FROM EMP01;

INSERT INTO EMP01
VALUES('John',2000);

SELECT*FROM EMP01;

SAVEPOINT sp; /*�߰���*/

DELETE FORM EMP01
WHERE FIRST_NAME='Beta';
SELECT*FROM EMP01;

commit;

ROLLBACK TO sp;

CREATE TABLE emp02(
  emp_id  number primary key,       /* NOT NULL + UNIQUE */
  first_name varchar2(50),
  salary number
);

SELECT table_name FROM user_tables;

SELECT * FROM emp02;

INSERT INTO emp02
VALUES(1,'park',9000);

SELECT * FROM emp02;

commit;

--B����
-- A������ COMMIT�� �Ǹ� B������ �ش� �࿡ ���� LOCK���°� ������ �Ǹ鼭 �����޼��� ���
--ORA-00001: unique constraint (HR.SYS_C006997) violated

SELECT table_name FROM user_tables;

--A����
INSERT INTO emp02
VALUES(1, 'park', 9000);

SELECT * FROM emp02;

--B����
INSERT INTO emp02
VALUES(1, 'park', 9000);

--A����
commit;

--B����
-- A������ COMMIT�� �Ǹ� B������ �ش� �࿡ ���� LOCK���°� ������ �Ǹ鼭 �����޼��� ���
--ORA-00001: unique constraint (HR.SYS_C006997) violated

--B����
INSERT INTO emp02
VALUES(2,'dong',8000);

--A����
SELECT * FROM emp02;
INSERT INTO emp02
VALUES(2,'dong',8000);

--B����  conn hr/a1234
ROLLBACK; /*���*/

--A����
commit;

UPDATE emp02
SET first_name='min'
WHERE emp_id=2;

SELECT * FROM emp02;
--B����
DELETE FROM emp02
WHERE emp_id=2;

--A����
commit;
SELECT * FROM emp02;


    
    
