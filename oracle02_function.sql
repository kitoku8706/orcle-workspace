/*=====================================================
SQL(structured query language)�Լ�
1. �������Լ� : �� �ϳ��� �ϳ��� ����� ����Ѵ�
              (�����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, �Ϲ��Լ�)
2. �������Լ� : �� �������� �ϳ��� ����� ����Ѵ�
               (�հ�, ���, �ִ�, �ּ�, ����)  
====================================================== 
--SELECT�������� �ݵ�� ���̺���� ����ؾ� �Ѵ�.
--�׷��� SELECT���� ���̳� Ư���Լ��� �̿��ؼ� ������� �����ö�
-- ����� �� �ִ� DUAL�̶�� ���̺��� �����ϰ� �ִ�. */


SELECT 3+1
FROM dual;

SELECT SYSDATE
FROM dual;


SELECT substr('korea',1,3)
FROM dual;

///////////////

/*---------------
�����Լ�
--------------*/
--�ܾ��� ù���ڸ� �빮�ڷ� �������ִ� �Լ��̴�.
SELECT initcap('korea hello')
FROM dual;

--��� ���ڸ� �빮�ڷ� �������ִ� �Լ��̴�.
SELECT UPPER('korea')
FROM dual;

SELECT first name, upper(first_name),
    last_name, upper(last_name)
FROM dual;

--��� ���ڸ� �ҹ��ڷ� �������ִ� �Լ��̴�.
SELECT lower('KOREA')
FROM dual;

SELECT first_name, lower(first_name),
    last_name, lower(last_name)
FROM dual;

--employees���̺� first_name���� ��ҹ��� ���о���
--'Ja'�� ������ �� first_name, salary�� ����϶�.
SELECT first_name, slaary
FROM employees
WHERE upper(first_name) LIKE upper('%Ja%');

--������ ���̸� �������ִ� �Լ��̴�.
SELECT length('korea')
FROM dual;

SELECT length('�ѱ�')
FROM dual;

--������ ���̸� ����Ʈ�� ���ؼ� �������ִ� �Լ��̴�.
SELECT lengthb('korea')
FROM dual;

SELECT length('�ѱ�')
FROM dual;
 
 
 CREATE TABLE user1(
 data carchar2(5)
 );
 
 SELECT*FROM user1;
 
 INSERT INTO user1(data)
 VALUES('south korea');
 
 INSERT INTO user1(data)
 VALUES('�ѱ�'); 