/*=======================================================
join : �������� ���̺��� ���ϴ� ���̺��� �������ִ� �������̴�.

join�� oracle��ǰ���� ���Ǵ� oracle�� join�� �ְ�
��� ��ǰ���� ���������� ���Ǵ� ǥ��(ANSI) join�� �ִ�.
�̱� ���� ǥ�� ��ȸ(American National Standards Institute,ANSI)
========================================================*/
--1. carteian product(īƼ�� ��) ���� : 
--   ���̺� ���� ������ŭ ������ִ� �����̴�.
--1) oracle�� cartesian product
  SELECT e.department_id,  e.first_name,  e.job_id,   j.job_title
  FROM employees e, jobs  j;         --2,033
  
  SELECT *
  FROM employees; --107
  
  SELECT *
  FROM jobs;  --19
  
--(2) ANSI�� cross join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title
 FROM employees e cross join jobs  j; 
 
  /*
 2. equi join
    ���� ���� ���Ǵ� ���ι������ ���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ����
    ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ����̴�.
 */
 --(1) oracle�� equi join
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j
  WHERE e.job_id=j.job_id;
 
--(2) ansi�� inner join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title  
  FROM employees e inner join jobs  j  
  ON e.job_id=j.job_id;


--employees�� departments���̺��� �����ȣ(employee_id),
--�μ���ȣ(department_id), �μ���(department_name)�� �˻��Ͻÿ�.
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id;
 
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e  inner join    departments d
ON e.department_id=d.department_id;

--employees�� jobs���̺��� �����ȣ(employee_id),
--������ȣ(job_id), ������(job_title)�� �˻��Ͻÿ�.
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id;

SELECT e.employee_id, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id=j.job_id; 

 --job_id�� 'FI_MGR'�� ����� ����
 --�޿�(salary)�� �ּҰ�(min_salary), �ִ밪(max_salary)�� ����Ͻÿ�. 
 SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id
   AND e.job_id = 'FI_MGR';


SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e  INNER JOIN jobs j
ON e.job_id = j.job_id
 WHERE e.job_id = 'FI_MGR';


--�μ��� 'Seattle'�� �ִ� �μ����� �ٹ��ϴ�
--��������  first_name, hire_date, department_name, city
--����ϴ� SELECT�� �ۼ��Ͻÿ�.
SELECT e.first_name, e.hire_date, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id=d.department_id
 AND  d.location_id=l.location_id
 AND  l.city='Seattle';


SELECT e.first_name  , e.hire_date, d.department_name, l.city
FROM employees e   INNER JOIN    departments d   ON  e.department_id=d.department_id
                                      INNER JOIN  locations l  ON      d.location_id=l.location_id
WHERE  l.city='Seattle';

--20�� �μ��� �̸��� �� �μ��� �ٹ��ϴ� ����� �̸�(first_name)�� ����Ͻÿ�.
SELECT d.department_id, d.department_name, e.first_name
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND d.department_id=20;

SELECT d.department_id, d.department_name, e.first_name
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
WHERE d.department_id=20;

--1400, 1500�� ��ġ�� �����̸��� �� ���� �ִ� �μ��� �̸��� ����Ͻÿ�.
SELECT l.location_id, l.city, d.department_name
FROM locations l, departments d
WHERE l.location_id=d.location_id 
  AND l.location_id IN(1400, 1500);
  
SELECT l.location_id, l.city, d.department_name
FROM locations l INNER JOIN departments d
ON l.location_id=d.location_id 
WHERE l.location_id IN(1400, 1500);  

/*===================================
3. non-equi join (������)
  (=)����񱳿����ڸ� ������ >=, <=, >, <���� �����ڸ� 
  �̿��ؼ� ������ �����ϴ� ���ι���̴�.
=======================================*/
--(1) oracle�� non-equi join
SELECT e.first_name, e.salary, j.min_salary,
               j.max_salary, j.job_title
FROM employees e, jobs j               
WHERE  e.job_id=j.job_id
  AND e.salary>=j.min_salary
       AND e.salary<=j.max_salary;

--(2) ansi�� non-equi join
SELECT e.first_name, e.salary, j.min_salary,
       j.max_salary, j.job_title
FROM employees e JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary>=j.min_salary
AND e.salary<=j.max_salary;

/*=================================================================
4. outer join
  �� ���̺��� �����Ͱ� �ְ� �ٸ� �ݴ��ʿ��� �����Ͱ� ���� ��쿡
  �����Ͱ� �ִ� ���̺��� ������ ��� �������� �����̴�.
  https://dataschool.com/how-to-teach-people-sql/left-right-join-animated/
  ===============================================================*/
--(1) oracle outer join
  SELECT e.employee_id, e.first_name, e.employee_id, e.department_id, 
          d.department_id, d.department_name 
  FROM employees e, departments d
  WHERE e.department_id=d.department_id(+)
  ORDER BY e.employee_id;  /* LEFT OUTER JOIN*/

 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e, departments d
 WHERE e.department_id(+)=d.department_id; /* RIGHT OUTER JOIN */
 
 
 
 --(2) ansi outer join
  SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e LEFT OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e RIGHT OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e FULL OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 /*=================================================
5. self join
 �ϳ��� ���̺��� �ΰ��� ���̺�� �����ؼ� ����ϴ� ���ι���̴�.
 �ϳ��� ���̺� ���������Ͱ� �ΰ��� �÷��� �ٸ� �������� ����ǿ� �ִ� ���
 employees, employee_id, manager_id
====================================================*/
 --(1) oracle self join
 SELECT w.employee_id AS "�����ȣ",
               w.first_name AS "����̸�",
              w.manager_id  AS "�����ڹ�ȣ",
             m.first_name AS "�������̸�"
 FROM employees w, employees m
 WHERE w.manager_id=m.employee_id
 ORDER BY w.employee_id;
 
 
 --(2) ansi self join
 SELECT w.employee_id AS "�����ȣ",
        w.first_name AS "����̸�",
        w.manager_id  AS "�����ڹ�ȣ",
        m.first_name AS "�������̸�"
 FROM employees w  JOIN employees m
 ON w.manager_id=m.employee_id
 ORDER BY w.employee_id;
 
 
 /*----------------------------------------------
 ����
 ----------------------------------------------   */
--1)EMPLOYEES ���̺��� �Ի��� ��(hire_date) ���� �ο����� ��ȸ�Ͻÿ� . 
--  <���: ��        ������   >
 

--2)�� �μ����� �ٹ��ϴ� �������� ��ȸ�ϴ� SQL ��ɾ �ۼ��Ͻÿ�. 
--��, �������� 5�� ������ �μ� ������ ��µǾ�� �ϸ� �μ������� ���� ������ �ִٸ� �μ��� ��<�̹�ġ�ο�>�� �̶�� ���ڰ� ��µǵ��� �Ͻÿ�. 
--�׸��� ��°���� �������� ���� �μ����� ��µǾ�� �մϴ�.
 
 
--3)�� �μ� �̸� ���� 2005�� ������ �Ի��� �������� �ο����� ��ȸ�Ͻÿ�.
-- <��� :    �μ���		�Ի�⵵	�ο���  >
 
 
 
--4)��å(job_title)���� 'Manager'�� �����̵� ����� �̸�(first_name), ��å(job_title), �μ���(department_name)�� ��ȸ�Ͻÿ�.
  
  
--5)'Executive' �μ��� �ӿ� �ִ� �������� ������ �̸��� ��ȸ�Ͻÿ�. 
--��, �����ڰ� ���� ������ �ִٸ� �� ���� ������ ��°���� ���Խ��Ѿ� �մϴ�.
-- <��� : �μ���ȣ ������  �����ڸ�  >
 
 
 
 
 