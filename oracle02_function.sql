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
 
 --Ư�������� ������ �ִ� �Լ��̴�.
 --substr(����,������ġ,����)
SELECT substr('oracle test',1,4)
FROM dual;
 
SELECT substr('oracle test',-3,4)
FROM dual;
 
 SELECT substr('����Ŭ �׽�Ʈ',3,4)
FROM dual;
 
SELECT substr('����Ŭ �׽�Ʈ',-3,4)
FROM dual; 

--Ư�������� �ε����� �����ϴ� �Լ��̴�.
SELECT instr('korea','or')
FROM dual;

SELECT instr('�ѱ��ڹ�','�ڹ�')
FROM dual;

--�־��� ���ڿ����� �������� Ư�����ڸ� ä��� �Լ��̴�.
SELECT lpad('korea',8,'*')
FROM dual;

SELECT rpad('korea',8,'*')
FROM dual;

--�־��� ���ڿ����� ������ Ư�����ڸ� �����ϴ� �Լ��̴�.
SELECT ltrim('***korea**','*')
FROM dual;   --korea**


--�־��� ���ڿ����� �������� Ư�����ڸ� �����ϴ� �Լ��̴�.
SELECT rtrim('***korea**','*')
FROM dual;    --***korea

--�־��� ���ڿ����� ������ Ư�����ڸ� �����ϴ� �Լ��̴�.
SELECT trim('*'from '***korea**')
FROM dual;    

--�־��� ���ڿ����� ������ ��������

SELECT '     korea',length('     korea'),ltrim('     korea'),length(ltrim('     korea'))
FROM dual; 

--�־��� ���ڿ����� �������� ��������
SELECT 'korea   ', length('korea   '), rtrim('korea   '), length(rtrim('korea   ')) 
FROM dual;

--�־��� ���ڿ����� ������ ��������
SELECT  trim(' ' from '  korea   ' ), length(trim(' ' from '  korea   ' ))
FROM dual;

--�־��� ������ �ƽ�Ű �ڵ尪�� ���ϴ� �Լ��̵�.
SELECT ASCII(A),--ascii(a),ascii('0')
FROM dual;

--�־��� �ƽ�Ű �ڵ尪�� ���ڸ� ���ϴ� �Լ��̴�.
SELECT chr(65)
FROM dual;

--�־��� ���ڸ� �����ϴ� �Լ��̴�.
SELECT concat('java','wo')
FROM dual;

/*----------------------------
 �����Լ�
-------------------------------*/
--3.55�� �Ҽ��� 1�� �ڸ����� ���Ͻÿ�(�ݿø�)
SELECT round(3.55, 1)
FROM dual;

SELECT round(42523.55, -1)
FROM dual;

SELECT round(42523.55, 0)
FROM dual;

--256.78�� ������ �ø��Ѵ�.(�ø�)
SELECT ceil(256.78)
FROM dual;

--289.78���� �Ҽ����ϴ� ������ ������.(����)
SELECT floor(289.78)
FROM dual;         /*289*/

--2�� 3�� (�ŵ�����)
SELECT power(2,3)
FROM dual;

--25�� ������
SELECT sqrt(25)
FROM dual;

--������
SELECT mod(10,3)
FROM dual;


/*-------------------------------
 ��¥�Լ�
-------------------------------*/
--���� �ý��ۿ��� �������ִ� ������ ��¥ ���ϴ� �Լ�
SELECT sysdate
FROM dual;


SELECT sysdate + 1
FROM dual;

-- ù��° ������ �޿� �ι�° ���ڰ��� ���� ��¥�� ��ȯ
SELECT add_months(sysdate, 10)
FROM dual;



/*==============================================
 ��ȯ�� �Լ�
   ����                ����            ��¥
 to_number()  <-> to_char( ) <-> to_date( )
==============================================*/
--1 ����->����
--ù��° ���ڰ��� �ι�° ���ڰ��� �������� ��ȯ���ִ� �Լ�
SELECT to_char(2532, '999,999.99')  /*2,532.00*/
FROM dual;

SELECT to_char(2532, '000,000.00')
FROM dual;                       /* 002,532.00*/

--�� ������ ��ȭ�� ǥ���� �� �� L��ȣ�� ����Ѵ�.
SELECT to_char(2532,'L999,999.99')
FROM dual;                    /*��2,532.00*/

--2. ��¥ -> ����
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day')  /* 12�ð�  */ 
FROM dual;                        /* 2025-05-27 10:48:26 ȭ����*/

SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy')
FROM dual;               /* 2025-05-27 10:48:42 ȭ*/

SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day')  /* 24�ð�  */ 
FROM dual;

/*===============================
to_number( )
����->����
==================================*/
SELECT '253' || '12'
FROM dual;  --25312

SELECT concat('253','12')
FROM dual;  --25312

SELECT '253' + '12'
FROM dual;   --265

SELECT to_number('253') + to_number('12')
FROM dual;   --265


/*===============================
to_date()
 ����->��¥
=================================*/
SELECT to_date('2013-10-14')
FROM dual;



-------------------------
SELECT first_name, hire_date
FROM employees;

-- hire_date(�Ի���)�� �̿��ؼ� 
--'ȫ�浿���� 2003�� 1�� 3�Ͽ� �Ի��߽��ϴ�'��
--����ϴ� query�� �ۼ��Ͻÿ�.

SELECT first_name||'���� '||TO_CHAR(hire_date,'yyyy')||'��'
||ltrim(TO_CHAR(hire_date,'mm'),'0')||'��'
||ltrim(TO_CHAR(hire_date,'dd'),'0')||'�Ͽ� �Ի��߽��ϴ�.' AS "���"
FROM employees;



/*====================================================================
�Ϲ��Լ�
nvl(�÷�, ��ü��) : ù��° ���ڰ��� null�̸� ��ü������ ��ü�ؼ� ����Ѵ�.
nvl2(�÷�, ��ü1, ��ü2) : �÷��� ���� null�ƴϸ� ��ü1��, null�̸� ��ü2�� ����Ѵ�. 
nullif(ǥ����1, ǥ����2 ) : ǥ����1�� ǥ����2�� ������ NULL, �ٸ��� ǥ����1�� ����Ѵ�.

--��ü�� ���� �����̸� �ι�° ���ڰ��� ���ڸ� �����Ѵ�.
--��ü�� ���� �����̸� �ι�° ���ڰ��� ���ڸ� �����Ѵ�.
--��ü�� ���� ��¥�̸� �ι�° ���ڰ��� ��¥�� �����Ѵ�. 
=======================================================================*/

SELECT commission_pct, nvl(commission_pct,0)
FROM employees;

SELECT first_name, manager_id,nvl(TO_CHAR(manager_id),'CEO')
FROM employees;

SELECT commission_pct, nvl2(commission_pct,1,0)
FROM employees;

SELECT sum(nvl2(commission_pct,1,0))
FROM employees;


SELECT commission_pct, nullif(commission_pct,0.4)
FROM employees
WHERE commission_pct IN (0.4,0.3);



/*======================================================
decode(�÷�,��1, ó��1, ��2, ó��2,  �׹��� ó��)
java�� switch_case���� ��� 
======================================================*/

--department_id�� 10�̸� 'ACCOUNTING', 20�̸� 'RESEARCH', 
--                 30�̸� 'SALES', 40�̸� 'OPERATIONS', 'OTHERS'

SELECT first_name, department_id,
        decode(department_id,10,'ACCOUNTING',
        20,'RESEARCH',
        30,'SALES',
        40,'OPERATIONS','OTHERS')
FROM employees
ORDER BY department_id ASC;


--������ 'PR_REP' �� ����� 5%, 'SA_MAN'�� ����� 10%, 
--'AC_MGR'�� ����� 15%, 'PU_CLERK' �� ����� 20% �� �λ� 

SELECT job_id, salary,
        decode(job_id,'PR_REP',salary*1.05,
        'SA_MAN', salary*1.1,
                       'AC_MGR', salary*1.15,
                       'PU_CLERK',salary*1.2,salary)
FROM employees;

/*================================
case when ����1 then ���1
     when ����2 then ���2
     when ����3 then ���3
     else ���n
end AS alias;
�ڹٿ��� if-else�� ����� �ǹ�
==================================*/

--�Ի��Ͽ��� ���� 1-3�̸� '1��б�', 4-6�̸� '2��б�', 
--             7-9�̸� '3��б�', 10-12�̸� '4��б�'
--�� ó���� �ϰ� �����(first_name), 
--�Ի���(hire_date), �б�� ����Ͻÿ�.

SELECT first_name, hire_date,
        case when to_char(hire_date,'mm')<=3 then '1��б�'
            when to_char(hire_date,'mm')<=6 then '2��б�'
            when to_char(hire_date,'mm')<=9 then '3��б�'
            when to_char(hire_date,'mm')<=12 then '4��б�' 
            end
FROM employees;




/*=================================================
�����Լ�(Aggregate Function), �׷��Լ�(Group Function)
===================================================*/

--min(�÷�) : �ּҰ�
SELECT min(salary)
FROM employees;

--count(�÷�) : ����
SELECT count(salary)
FROM employees;

SELECT count(*)
FROM employees;

SELECT count(commission_pct)
FROM employees;   --null ����

--sum(�÷�) : �հ�
SELECT sum(salary)
FROM employees;

--avg(�÷�) : ���
SELECT avg(salary)
FROM employees;


--�����Լ��� �ܼ��÷��� �Բ� ��� �� �� ����.(��µǴ� ���ڵ���� �ٸ��� �����̴�)
--ORA-00937: not a single-group group function
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
SELECT first_name, count(*)
FROM employees;


--�׷��Լ��� �ܼ��÷��� ����ϱ� ���ؼ��� �ܼ��÷��� �׷�ȭ �ؾ� �Ѵ�.(GROUP BY)
SELECT department_id, count(*)
FROM employees
GROUP BY department_id   -- department_id �� �׷�ȭ
ORDER BY department_id;  -- department_id �� ��������

--50������ �μ��� ���ؼ� NULL�� �ƴ� �μ����� �������� ����Ͻÿ�.
SELECT department_id, count(*)
FROM employees
WHERE department_id<=50 AND department_id IS NOT NULL
GROUP BY department_id   
ORDER BY department_id;


SELECT department_id, count(*)
FROM employees
GROUP BY department_id  
HAVING department_id<=50 AND department_id IS NOT NULL
ORDER BY department_id;


SELECT department_id, count(*)
FROM employees
GROUP BY department_id  
HAVING department_id<=50 AND department_id IS NOT NULL AND count(*)<=5
ORDER BY department_id;


--������(job_id) �޿��հ踦 ����Ͻÿ�.
SELECT job_id, sum(salary)
FROM employees
GROUP BY job_id;

--�μ��� �ּұ޿�, �ִ�޿���  �ּҰ��� �ִ밪�� ���� ���� ��쿡�� �μ��� ������������ ����Ͻÿ�.

SELECT department_id,min(salary),max(salary),max(salary)-min(salary) AS cha
FROM employees
GROUP BY department_id
HAVING min(salary)!=max(salary)
ORDER BY department_id;

/*------------------------------
����
------------------------------*/
--1) ��������Դ� ���(Manager)�� �ִ�. ������ employees���̺� �����ϰ� �����
--   ���� �ο찡 �ִµ� �� ���(CEO)�� manager_id�÷����� NULL�̴�. ����� ���� �����
--   ����ϵ� manager_id�÷��� NULL ��� CEO�� ����Ͻÿ�.
 SELECT manager_id,nvl(TO_CHAR(manager_id),'CEO')
 FROM employees
 WHERE manager_id IS NULL;

--2) �����ֱٿ� �Ի��� ����� �Ի��ϰ� ��������� ����� �Ի����� ���Ͻÿ�.
SELECT first_name,hire_date    
 FROM employees
 ORDER BY hire_date  ;
 
 SELECT max(hire_date),min(hire_date)
 FROM employees;
 

 
 
--3) �μ����� Ŀ�̼��� �޴� ����� ���� ���Ͻÿ�.
   SELECT department_id,count(commission_pct)
   FROM employees
   WHERE commission_pct IS NOT NULL
   GROUP BY department_id;
   
--4) �μ��� �ִ�޿��� 10000�̻��� �μ��� ����Ͻÿ�.   
  SELECT department_id,MAX(salary) AS big
   FROM employees
  GROUP BY department_id
HAVING max(salary)>=10000
ORDER BY MAX(salary);

--5) employees ���̺��� ������ 'IT_PROG'�� ������� �޿������ ���ϴ� SELECT������ ����Ͻÿ�.
  SELECT job_id,avg(salary)
   FROM employees
  GROUP BY job_id
HAVING job_id='IT_PROG';

SELECT job_id,avg(salary)
   FROM employees
   WHERE job_id='IT_PROG'
  GROUP BY job_id;


 
--6) employees ���̺��� ������ 'FI_ACCOUNT' �Ǵ� 'AC_ACCOUNT' �� ����� �� �ִ�޿���  ���ϴ�    SELECT������ ����Ͻÿ�.   
   SELECT job_id,MAX(salary)
   FROM employees
  GROUP BY job_id
HAVING job_id = 'FI_ACCOUNT' or job_id = 'AC_ACCOUNT';

SELECT MAX(salary)
   FROM employees
   --WHERE job_id = 'FI_ACCOUNT' or job_id = 'AC_ACCOUNT'
WHERE job_id IN('FI_ACCOUNT','AC_ACCOUNT');
  

--7) employees ���̺��� 50�μ��� �ּұ޿��� ����ϴ� SELECT������ ����Ͻÿ�.
SELECT department_id,min(salary)
   FROM employees
  GROUP BY department_id
HAVING department_id =50;

SELECT min(salary)
FROM employees
WHERE department_id =50;    
    
--8) employees ���̺��� �Ʒ��� ���ó�� �Ի��ο��� ����ϴ� SELECT������ ����Ͻÿ�.
--   <���:  2001		   2002		       2003
 --  	     1          7                6   >
SELECT sum(decode(to_char(hire_date,'yyyy'),'2001',1,0))AS "2001",
        sum(decode(to_char(hire_date,'yyyy'),'2002',1,0))AS "2002",
        sum(decode(to_char(hire_date,'yyyy'),'2003',1,0))AS "2003"
FROM employees;


   
--9) employees ���̺��� �� �μ��� �ο��� 10�� �̻��� �μ��� �μ��ڵ�,
--  �ο���,�޿��� ���� ���ϴ�  SELECT������ ����Ͻÿ�.
  SELECT department_id,count(department_id),sum(salary)
  FROM employees
 GROUP BY department_id
 HAVING count(department_id)>=10;
 
 SELECT department_id,count(*),SUM(salary) "Total"
 FROM employees
  GROUP BY department_id
  HAVING count(*)>=10
  ORDER BY department_id;
  
--10) employees ���̺��� �̸�(first_name)�� ����° �ڸ��� 'e'�� ������ �˻��Ͻÿ�.

SELECT first_name,instr(first_name,'e')
FROM employees
WHERE instr(first_name,'e')=3;

SELECT first_name,instr(first_name,'e')
FROM employees
WHERE instr(first_name,'e',3,1)=3;

SELECT first_name
FROM employees
WHERE substr(first_name,3,1)='e';





































