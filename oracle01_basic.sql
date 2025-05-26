select first_name from employees;

SELECT *  FROM tab;

SELECT salary, salary*10 
FROM employees;

SELECT salary, salary*10  AS 보너스
FROM employees;

DESC employees;

SELECT salary, salary*10  AS “b o n u s”
FROM employees;


SELECT last_name || ‘님의 급여는’ || salary ||  ‘입니다.’
FROM employees;

SELECT DISTINCT first_name
FROM employees;

? employees테이블에서 salary이 3000미만일때의
? first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;


? employees테이블에서 first_name컬럼의 값이 'David' 일때의
? first_name, salary을 출력하라.
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
--employees테이블에서 salary이 3000, 9000, 17000일때
--first_name, hire_date, salary을 출력하라.

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


employees테이블에서 salary이 3000부터 5000까지 일때의
first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

employees테이블에서 salary이 3000부터 5000까지 일때의
first_name, hire_date, salary을 출력하라.

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
WHERE first_name LIKE '%der%';  --der% 시작하는 %der 끝나는 %der% 포함하는

SELECT first_name, salary, email
FROM employees
WHERE first_name NOT LIKE '%der%';

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';  --_(언더바): 임의문자 1개



 /////////////////////////////////////
////--문제--
////////////////////////////////////// 
-- 1) employees테이블에서 급여가 17000이하인 사원의 사원번호, 사원명(first_name), 급여를 출력하시오.
-- SELECT employee_id, first_name, salary
SELECT employee_id, first_name, salary
FROM employees
WHERE salary <= 17000 ;

--2) employees테이블에서 2005년 1월 1일 이후에 입사한 사원을 출력하시오.
SELECT *
FROM employees 
WHERE hire_date >= '2005-01-01';

--3) employees테이블에서 급여가 5000이상이고 업무(job_id)이 'IT_PROG'이 사원의 사원명(first_name), 급여, 
--   업무을 출력하시오.
SELECT first_name, salary, job_id
FROM employees
WHERE salary >=5000 AND job_id ='IT_PROG';

--4) employees테이블에서 부서번호가 10, 40, 50 인 사원의 사원명(first_name), 부서번호, 이메일(email)을 출력하시오.
SELECT first_name, departments_id, email
FROM employees
WHERE department_id IN(10,40,50);

--5) employees테이블에서 사원명(first_name)이 even이 포함된 사원명,급여,입사일을 출력하시오.
SELECT first_name, salary, hire_date
FORM employees
WHERE first_name LIKE '%even%';
--6) employees테이블에서 사원명(first_name)이 teve앞뒤에 문자가 하나씩 있는 사원명,급여,입사일을 출력하시오.
SELECT first_name, salary, hire_date
FORM employees
WHERE first_name LIKE '_teve_';

--7) employees테이블에서 급여가 17000이하이고 커미션이 null이 아닐때의 사원명(first_name), 급여, 
--  커미션을 출력하시오.
 SELECT first_name,salary, commission_pct
 FORM employees
 WHERE salary <= 17000 AND commission_pct IS NOT NULL;
  
--8) 2005년도에 입사한 사원의 사원명(first_name),입사일을 출력하시오.
 SELECT first_name, hire_date
 FROM employees
 WHERE to_char(hire_date, 'yyyy')='2005';


--9) 커미션 지급 대상인 사원의 사원명(first_name), 커미션을 출력하시오.
 SELECT first_name, cmommission_pct
 FROM employees
 WHERE commission_pct IS NOT NULL;

--10) 사번이 206인 사원의 이름(first_name)과 급여를 출력하시오.
SELECT first_name, 

--11) 급여가 3000이 넘는 업무(job_id),급여(salary)를 출력하시오.


--12)'ST_MAN'업무을 제외한 사원들의 사원명(first_name)과 업무(job_id)을 출력하시오.
SELECT first_name, job_id
FROM employees
WHERE job_id != 'ST_MAN';


--13) 업무이 'PU_CLERK' 인 사원 중에서 급여가 10000 이상인 사원명(first_name),업무(job_id),급여(salary)을 출력하시오.
SELECT first_name,job_id,dalary
FROM employees
WHERE job_id='PU_clerk' AND salary >= 10000;

--14) commission을 받는 사원명(first_name)을 출력하시오.
SELECT first_name
FROM employees
WHERE commission_pct IS NOT NULL;


--15) 20번 부서와 30번 부서에 속한 사원의 사원명(fist_name), 부서를 출력하시오.
SELECT frist_name, department_id
FROM employees
WHERE department_id IN(20, 30);

--16) 급여가 많은 사원부터 출력하되 급여가 같은 경우 사원명(first_name) 순서대로 출력하시오.
SELECT *
FROM employees
ORDER BY salary DESC first_name ASC;


--17) 업무이 'MAN' 끝나는 사원의 사원명(first_name), 급여(salary), 업무(job_id)을 출력하시오.
SELECT first_name, salary, job_id
FROM employees
WHERE job_id LIKE '%MAN%';




/*=========================================
집합연산자(Set Operations)
===========================================*/
/*
-둘 이상의 query결과를 하나의 결과로 조합한다.
-select의 인자 갯수가 같아야 한다.
  첫번째 select가 2개이면 두번째 select도 2개여야 한다.
-타입이 일치해야 한다.  
 예를 들어 character이면 character이여야 한다.

집합연산자 종류
union(합집합)- 중복행이 제거된 두 query
union all(합집합)-중복행이 포함된 두 query행
intersect(교집합)-두 query에 공통적인 행
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
 */

--union(합집합)
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










