==========================
/*===============================
���̺� ���� ����
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

�ڷ���(datatype)
varchar2 - �������� ���ڸ� ����
char - �������� ���ڸ� ����
number(m)-��������
number(m,n)- �Ǽ�����
date - ��¥ ����
===============================*/

CREATE TABLE student(
  name varchar2(20), --����Ʈ(����,Ư������- 1byte / �ѱ�-3byte)
  age number(3),   --�ڸ���
  avg number(5,2), --5�� ��ü�ڸ���, 2�� �Ҽ��� �ڸ���
  hire date  
);

--- �������
INSERT INTO student(name,age,avg,hire)
VALUES ('ȫ�浿',30,78.85,sysdate);

SELECT * FROM student;

INSERT INTO student(name,age,avg,hire)
VALUES ('������ ���� ����',30,78.85,sysdate);

INSERT INTO student(name,age,avg,hire)
VALUES ('ȫ�浿',4000,78.85,sysdate);

INSERT INTO student(name,age,avg,hire)
VALUES ('ȫ�浿',30,921.8589,sysdate);
SELECT * FROM student;

INSERT INTO student(name,age,avg,hire)
VALUES ('ȫ�浿',30,1921.8,sysdate);

INSERT INTO student(name,age,avg,hire)
VALUES ('ȫ�浿',30,78.85,sysdate);





