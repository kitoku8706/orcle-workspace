select first_name from employees;

SELECT *  FROM tab;

SELECT salary, salary*10 
FROM employees;

SELECT salary, salary*10  AS ���ʽ�
FROM employees;

DESC employees;

SELECT salary, salary*10  AS ��b o n u s��
FROM employees;


SELECT last_name || ������ �޿��¡� || salary ||  ���Դϴ�.��
FROM employees;

SELECT DISTINCT first_name
FROM employees;

? employees���̺��� salary�� 3000�̸��϶���
? first_name, salary�� ����϶�.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;


? employees���̺��� first_name�÷��� ���� 'David' �϶���
? first_name, salary�� ����϶�.
SELECT first_name, salary
FROM employees
WHERE first_name= 'David';

SELECT first_name, salary
FROM employees
WHERE first_name!= 'David';

SELECT first_name, salary
FROM employees
WHERE first_name<> 'David';

--&&(and), ||(or)
--employees���̺��� salary�� 3000, 9000, 17000�϶�
--first_name, hire_date, salary�� ����϶�.

SELECT first_name, hire_date, salary
FROM employees
WHERE  salary=3000 OR salary=9000 OR salary=17000;


SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 1700);

SELECT * FROM tab;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 1700);


employees���̺��� salary�� 3000���� 5000���� �϶���
first_name, hire_date, salary�� ����϶�.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

employees���̺��� salary�� 3000���� 5000���� �϶���
first_name, hire_date, salary�� ����϶�.

SELECT first_name, email, job_id
FROM employees
WHERE job_id !='IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id ^='IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT (job_id ='IT_PROG');

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%';  --der% �����ϴ� %der ������ %der% �����ϴ�

SELECT first_name, salary, email
FROM employees
WHERE first_name NOT LIKE '%der%';

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';  --_(�����): ���ǹ��� 1��



 /////////////////////////////////////
////--����--
////////////////////////////////////// 
-- 1) employees���̺��� �޿��� 17000������ ����� �����ȣ, �����(first_name), �޿��� ����Ͻÿ�.
-- SELECT employee_id, first_name, salary
SELECT employee_id, first_name, salary
FROM employees
WHERE salary <= 17000 ;

--2) employees���̺��� 2005�� 1�� 1�� ���Ŀ� �Ի��� ����� ����Ͻÿ�.
SELECT *
FROM employees 
WHERE hire_date >= '2005-01-01';

--3) employees���̺��� �޿��� 5000�̻��̰� ����(job_id)�� 'IT_PROG'�� ����� �����(first_name), �޿�, 
--   ������ ����Ͻÿ�.
SELECT first_name, salary, job_id
FROM employees
WHERE salary >=5000 AND job_id ='IT_PROG';

--4) employees���̺��� �μ���ȣ�� 10, 40, 50 �� ����� �����(first_name), �μ���ȣ, �̸���(email)�� ����Ͻÿ�.
SELECT first_name, departments_id, email
FROM employees
WHERE department_id IN(10,40,50);

--5) employees���̺��� �����(first_name)�� even�� ���Ե� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
FORM employees
WHERE first_name LIKE '%even%';
--6) employees���̺��� �����(first_name)�� teve�յڿ� ���ڰ� �ϳ��� �ִ� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
FORM employees
WHERE first_name LIKE '_teve_';

--7) employees���̺��� �޿��� 17000�����̰� Ŀ�̼��� null�� �ƴҶ��� �����(first_name), �޿�, 
--  Ŀ�̼��� ����Ͻÿ�.
 SELECT first_name,salary, commission_pct
 FORM employees
 WHERE salary <= 17000 AND commission_pct IS NOT NULL;
  
--8) 2005�⵵�� �Ի��� ����� �����(first_name),�Ի����� ����Ͻÿ�.
 SELECT first_name, hire_date
 FROM employees
 WHERE to_char(hire_date, 'yyyy')='2005';


--9) Ŀ�̼� ���� ����� ����� �����(first_name), Ŀ�̼��� ����Ͻÿ�.
 SELECT first_name, cmommission_pct
 FROM employees
 WHERE commission_pct IS NOT NULL;

--10) ����� 206�� ����� �̸�(first_name)�� �޿��� ����Ͻÿ�.
SELECT first_name, 

--11) �޿��� 3000�� �Ѵ� ����(job_id),�޿�(salary)�� ����Ͻÿ�.


--12)'ST_MAN'������ ������ ������� �����(first_name)�� ����(job_id)�� ����Ͻÿ�.
SELECT first_name, job_id
FROM employees
WHERE job_id != 'ST_MAN';


--13) ������ 'PU_CLERK' �� ��� �߿��� �޿��� 10000 �̻��� �����(first_name),����(job_id),�޿�(salary)�� ����Ͻÿ�.
SELECT first_name,job_id,dalary
FROM employees
WHERE job_id='PU_clerk' AND salary >= 10000;

--14) commission�� �޴� �����(first_name)�� ����Ͻÿ�.
SELECT first_name
FROM employees
WHERE commission_pct IS NOT NULL;


--15) 20�� �μ��� 30�� �μ��� ���� ����� �����(fist_name), �μ��� ����Ͻÿ�.
SELECT frist_name, department_id
FROM employees
WHERE department_id IN(20, 30);

--16) �޿��� ���� ������� ����ϵ� �޿��� ���� ��� �����(first_name) ������� ����Ͻÿ�.
SELECT *
FROM employees
ORDER BY salary DESC first_name ASC;


--17) ������ 'MAN' ������ ����� �����(first_name), �޿�(salary), ����(job_id)�� ����Ͻÿ�.
SELECT first_name, salary, job_id
FROM employees
WHERE job_id LIKE '%MAN%';




/*=========================================
���տ�����(Set Operations)
===========================================*/
/*
-�� �̻��� query����� �ϳ��� ����� �����Ѵ�.
-select�� ���� ������ ���ƾ� �Ѵ�.
  ù��° select�� 2���̸� �ι�° select�� 2������ �Ѵ�.
-Ÿ���� ��ġ�ؾ� �Ѵ�.  
 ���� ��� character�̸� character�̿��� �Ѵ�.

���տ����� ����
union(������)- �ߺ����� ���ŵ� �� query
union all(������)-�ߺ����� ���Ե� �� query��
intersect(������)-�� query�� �������� ��
minus(������)-ù��° query�� �ִ� �� �� �ι�° query�� ���� ��ǥ��

���տ����� �������
-���� �ٸ� ���̺��� ������ ������ ����� ��ȯ�ϱ� ���ؼ�
-���� ���� ���̺��� ���� �ٸ� ���Ǹ� �����Ͽ� ����� ��ġ�� ���ؼ�
 */

--union(������)
SELECT department_id, first_name,last_name
FROM employees
WHERE department_id=20 OR department_id=40
UNION ALL
SELECT department_id, first_name,last_name
FROM employees
WHERE department_id=20 OR department_id=60;


--intersect
SELECT department_id, first_name,last_name
FROM employees
WHERE department_id=20 OR department_id=40
INTERSECT
SELECT department_id, first_name,last_name
FROM employees
WHERE department_id=20 OR department_id=60;

--minus
SELECT department_id, first_name,last_name
FROM employees
WHERE department_id=20 OR department_id=40
MINUS
SELECT department_id, first_name,last_name
FROM employees
WHERE department_id=20 OR department_id=60;










