/*=======================================================
join : 여러개의 테이블에서 원하는 테이블을 추출해주는 쿼리문이다.

join은 oracle제품에서 사용되는 oracle용 join이 있고
모든 제품에서 공통적으로 사용되는 표준(ANSI) join이 있다.
========================================================*/

--1. carteian product(카티션 곱) 조인 : 
--   테이블 행의 갯수만큼 출력해주는 조인이다.
--1) oracle용 cartesian product
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j; --2,033
  
  SELECT *
  FROM employees; --107
  SELECT *
  FROM jobs;  --19
  
--(2) ANSI용 cross join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title
 FROM employees e cross join jobs  j; 

 /*
 2. equi join
    가장 많이 사용되는 조인방법으로 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이
    일치되는 행을 연결하여 결과를 생성하는 방법이다.
 */
 --(1) oracle용 equi join
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j
  WHERE e.job_id=j.job_id;
 
--(2) ansi용 inner join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title  
  FROM employees e inner join jobs  j  
  ON e.job_id=j.job_id;

--employees와 departments테이블에서 사원번호(employee_id),
--부서번호(department_id), 부서명(department_name)을 검색하시오.

 --(1) oracle용 equi join
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id;

--(2) ansi용 inner join
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e inner join departments d
ON e.department_id=d.department_id;

--employees와 jobs테이블에서 사원번호(employee_id),
--업무번호(job_id), 업무명(job_title)을 검색하시오.


SELECT e.employee_id,e.job_id,j.job_id,j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id;

SELECT e.employee_id,e.job_id,j.job_id,j.job_title
FROM employees e inner join jobs j
ON e.job_id=j.job_id;


 --job_id가 'FI_MGR'인 사원이 속한
 --급여(salary)의 최소값(min_salary), 최대값(max_salary)을 출력하시오. 

SELECT e.first_name,e.JOB_ID,j.MIN_SALARY,j.max_salary
FROM employees e, jobs j
WHERE e.job_id=j.job_id 
    AND e.job_id='FI_MGR';

SELECT e.first_name,e.JOB_ID,j.MIN_SALARY,j.max_salary
FROM employees e inner join jobs j
ON e.job_id=j.job_id 
WHERE e.job_id='FI_MGR';



--부서가 'Seattle'에 있는 부서에서 근무하는
--직원들의  first_name, hire_date, department_name, city
--출력하는 SELECT을 작성하시오.

SELECT e.first_name, e.hire_date, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
    AND d.location_id=l.location_id
    AND l.city='Seattle';

SELECT e.first_name, e.hire_date, d.department_name, l.city
FROM employees e inner join departments d 
ON e.department_id=d.department_id
inner join locations l 
ON d.location_id=l.location_id
WHERE l.city='Seattle';

--20번 부서의 이름과 그 부서에 근무하는 사원의 이름(first_name)을 출력하시오.
SELECT d.department_id,d.department_name,e.first_name
FROM employees e, departments d
WHERE e.department_id=d.department_id and e.department_id='20';


SELECT d.department_id,d.department_name,e.first_name
FROM employees e inner join departments d
ON e.department_id=d.department_id 
WHERE e.department_id='20';

-- 1400,1500번 위치의 도시이름과 그 곳에 있는 부서의 이름을 출력하시오
SELECT l.location_id,l.city,d.department_name
FROM departments d, locations l
WHERE l.location_id = d.location_id
--AND l.location_id = '1400' OR l.location_id = '1500';
AND l.location_id IN(1400,1500);


/*
3.non-equi join (비등가조인)
(=)동등비교연산자를 제외한 >=,<=,>,<등의 연산자를 
이용하해서 조건을 지정하는 조인방법이다.
*/

--(1) oracle용 non-equi join
SELECT e.first_name, e.salary, j.min_salary,
               j.max_salary, j.job_title
FROM employees e, jobs j               
WHERE  e.job_id=j.job_id
  AND e.salary>=j.min_salary
       AND e.salary<=j.max_salary;
       

--(2) ansi용 non-equi join
SELECT e.first_name, e.salary, j.min_salary,
       j.max_salary, j.job_title
FROM employees e JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary>=j.min_salary
AND e.salary<=j.max_salary;


/*=================================================================
4. outer join
  한 테이블에는 데이터가 있고 다른 반대쪽에는 데이터가 없는 경우에
  데이터가 있는 테이블의 내용을 모두 가져오는 조건이다.
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
 ORDER BY e.employee_id;


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
 하나의 테이블을 두개의 테이블로 설정해서 사용하는 조인방법이다.
 하나의 테이블에 같은데이터가 두개의 컬럼에 다른 목적으로 저장되여 있는 경우
 employees, employee_id, manager_id
====================================================*/
 --(1) oracle self join
 SELECT w.employee_id AS "사원번호",
               w.first_name AS "사원이름",
              w.manager_id  AS "관리자번호",
             m.first_name AS "관리자이름"
 FROM employees w, employees m
 WHERE w.manager_id=m.employee_id
 ORDER BY w.employee_id;
 
 /*
 SELECT employee_id AS "사원번호",
               first_name AS "사원이름",
              manager_id  AS "관리자번호",
             first_name AS "관리자이름"
 FROM employees;
 */
 
 
 --(2) ansi self join
 SELECT w.employee_id AS "사원번호",
        w.first_name AS "사원이름",
        w.manager_id  AS "관리자번호",
        m.first_name AS "관리자이름"
 FROM employees w  JOIN employees m
 ON w.manager_id=m.employee_id
 ORDER BY w.employee_id;

----------------------------------------
--USING :두 테이블 간 조인 조건에 사용되는 컬럼명이 동일한 경우 USING을 사용한다.
--       하지만 다른 경우도 많으므로 USING 대신 ON 절을 사용하는 것이 일반적이다.
SELECT department_id, first_name, job_id, job_title  
FROM employees  
INNER JOIN jobs USING(job_id);
   
SELECT first_name, hire_date, department_name, city
FROM employees 
INNER JOIN departments USING(department_id)
INNER JOIN locations USING(location_id)
WHERE  city='Seattle';











/*----------------------------------------------
 문제
 ----------------------------------------------   */
1)EMPLOYEES 테이블에서 입사한 달(hire_date) 별로 인원수를 조회하시오 . 
  <출력: 월        직원수   >
 SELECT sum(decode(to_char(hire_date,'mm'),'01',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'02',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'03',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'04',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'05',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'06',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'07',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'08',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'09',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'10',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'11',1,0))AS "직원수",
        sum(decode(to_char(hire_date,'mm'),'12',1,0))AS "직원수"
 FROM employees
 GROUP BY to_char(hire_date,'mm');
 

2)각 부서에서 근무하는 직원수를 조회하는 SQL 명령어를 작성하시오. 
단, 직원수가 5명 이하인 부서 정보만 출력되어야 하며 부서정보가 없는 직원이 있다면 부서명에 “<미배치인원>” 이라는 문자가 출력되도록 하시오. 
그리고 출력결과는 직원수가 많은 부서먼저 출력되어야 합니다.
 SELECT d.department_id,d.department_name, e.department_id
 FROM employees e, departments d
 WHERE d.department_id = e.department_id
 GROUP BY d.department_id;

 
 
 

3)각 부서 이름 별로 2005년 이전에 입사한 직원들의 인원수를 조회하시오.
 <출력 :    부서명		입사년도	인원수  >
SELECT d.department_id, d.department_name, e.first_name, 
FROM DEPARTMENTS d, employees e
WHERE d.DEPARTMENT_ID=e.DEPARTMENT_ID;


 
 --sum(decode(to_char(hire_date,'yyyy'),'2005',1,0))AS "2005년이전")
 
4)직책(job_title)에서 'Manager'가 포함이된 사원의 이름(first_name), 직책(job_title), 부서명(department_name)을 조회하시오.
  
  
5)'Executive' 부서에 속에 있는 직원들의 관리자 이름을 조회하시오. 
단, 관리자가 없는 직원이 있다면 그 직원 정보도 출력결과에 포함시켜야 합니다.
 <출력 : 부서번호 직원명  관리자명  >
 



/*-----------------------------------------------------------------------------------------
서브쿼리(subquery)
 하나의 SQL문안에 포함되어 있는 또 다른 SQL문을 말한다.
 서브쿼리는 알려지지 않은 기준을 이용한 검색을 위해 사용한다.
 서브쿼리는 메인쿼리가 서브쿼리를 포함하는 종속적인 관계이다.
 서브쿼리는 메인쿼리의 컬럼을 모두 사용할 수 있지만 메인쿼리는 서브쿼리의 컬럼을 사용할 수 없다. 
 질의 결과에 서브쿼리 컬럼을 표시해야 한다면 조인방식으로 
    변환하거나 함수, 스칼라 서브쿼리(scarar subquery)등을 사용해야 한다. 
 조인은 집합간의 곱(Product)의 관계이다. 
 
외부 쿼리 (메인쿼리)
 :일반 쿼리를 의미합니다.
스칼라 서브쿼리
 :SELECT 절에 쿼리가 사용되는 경우로, 함수처럼 레코드당 정확히 하나의 값만을 반환하는 서브쿼리입니다.
인라인 뷰
 :FROM 절에 사용되는 쿼리로, 원하는 데이터를 조회하여 가상의 집합을 만들어 조인을 수행하거나 가상의 집합을 다시 조회할 때 사용합니다.



서브쿼리를 사용할 때 다음 사항에 주의
  서브쿼리를 괄호로 감싸서 사용한다. 
  서브쿼리는 단일 행(Single Row) 또는 복수 행(Multiple Row) 비교 연산자와 함께 사용 가능하다. 
  단일 행 비교 연산자는 서브쿼리의 결과가 반드시 1건 이하이어야 하고 복수 행 비교 연산자는 서브쿼리의 결과 건수와 상관 없다. 
  서브쿼리에서는 ORDER BY를 사용하지 못한다. 
  ORDER BY절은 SELECT절에서 오직 한 개만 올 수 있기 때문에 ORDER BY절은 메인쿼리의 마지막 문장에 위치해야 한다.
  

서브 쿼리 사용가능한 위치
SELECT, FROM, WHERE, HAVING,ORDER BY 
INSERT문의 VALUES,
UPDATE문의 SET, 
CREATE문

서브쿼리의 종류는 동작하는 방식이나 반환되는 데이터의 형태에 따라 분류할 수 있다.
1 동작하는 방식에 따른 서브쿼리 분류
  Un-Correlated(비연관) : 서브쿼리가 메인쿼리 컬럼을 가지고 있지 않는 형태의 서브쿼리이다.
          메인쿼리에 값(서브쿼리가 실행된 결과)를 제공하기 위한 목적으로  주로 사용한다.
  Correlated(연관) : 서브쿼리가 메인쿼리 칼럼을 가지고 있는 형태의 서브쿼리이다.
          일반적으로 메인쿼리가 먼저 수행되어 읽혀진 데이터를 서브쿼리에서 조건이 맞는지 확인
	  하고자 할 때 주로 사용된다.  (EXISTS서브쿼리는 항상 연관 서브쿼리로 사용된다. 조건을 만족하는 1건만 찾으면
	  추가 검색을 하지 않는다.)
2 반환되는 데이터의 형태에 따른 서브쿼리 종류
  Single Row(단일행 서브쿼리) : 서브쿼리의 실행결과가 항상 1건 이하인 서브쿼리를 의미한다. 
          단일행 서브쿼리는 단일 행 비교 연산자와 함께 사용된다.
	  단일 행 비교 연산자는 =, <, <=, >, >=, <>이 있다.
  Multi Row(다중행 서브쿼리) : 서브쿼리의 실행 결과가 여러 건인 서브쿼리를 의미한다. 
          다중 행 서브쿼리는 다중 행 비교 연산자와 함께 사용된다. 
	  다중 행 비교 연산자에는 in, all, any, some, exists가 있다.
	      in : 메인쿼리의 비교조건('='연산자로 비교할 경우)이 서브쿼리의 결과 중에서
               하나라도 일치하면 참이다.
           any,some : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상이 일치하면
                참이다.
           all : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참이다.
           exists : 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 만족하는 값이 하나라도
               존재하면 참이다.
  Multi Column(다중칼럼 서브쿼리) : 서브쿼리의 실행 결과로 여러 컬럼을 반환한다.
          메인쿼리의 조건절에 여러 컬럼을 동시에 비교할 수 있다. 
	  서브쿼리와 메인쿼리에서 비교하고자 하는 컬럼 갯수와 컬럼의 위치가 동일해야 한다.
https://www.w3resource.com/sql/subqueries/correlated-subqueries-using-aliases.php	  
--------------------------------------------------------------------------------- */ 

--90번 부서에 근무하는 Lex의 부서명을 출력하시오

SELECT department_name
FROM departments
WHERE department_id=90;

--Lex가 근무하는 부서명을 출력하시오.

SELECT department_id
FROM employees
WHERE first_name='Lex';

SELECT department_name
FROM departments
WHERE department_id=90;

SELECT e.department_id, d.department_name
FROM employees e, departments d
WHERE  d.department_id=e.department_id AND e.first_name='Lex';

SELECT department_name
FROM departments
WHERE department_id=(
    SELECT department_id
    FROM employees
    WHERE first_name='Lex'
);

 --'Lex'와 동일한 업무(job_id)를 가진 사원의 이름(first_name), 
 -- 업무명(job_title), 입사일(hire_date)을 출력하시오.   

SELECT e.first_name,j.job_title,e.hire_date
FROM employees e, jobs j
WHERE e.job_id=j.job_id
AND e.job_id=(
        SELECT job_id
        FROM employees
        WHERE first_name='Lex'
);

-- 'IT'에 근무하는 사원이름(first_name), 부서번호을 출력하시오. 

SELECT first_name,department_id
FROM employees
WHERE department_id=(
    SELECT department_id
    FROM departments
    WHERE department_name='IT'
);


--'Bruce'보다 급여를 많이 받은 사원이름(first_name), 부서명, 급여를 출력하시오.

SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id=d.department_id
And e.salary>(
    SELECT salary
    FROM employees
    WHERE first_name = 'Bruce'
)
ORDER BY e.salary;


--Steven와 같은 부서에서 근무하는 사원의 이름, 급여, 입사일을 출력하시오.(in)

SELECT first_name,salary,hire_date
FROM employees
WHERE department_id IN(
    SELECT department_id
    FROM employees
    WHERE first_name='Steven'   /*2row 이므로 IN연산자를 사용해서 서브쿼리를 작성한다.*/
);

--부서별로 가장 급여를 많이 받는 사원이름, 부서번호, 급여를 출력하시오.(in)
 SELECT department_id, max(salary)
    FROM employees
    GROUP BY department_id 



SELECT first_name,department_id,salary
FROM employees
WHERE (department_id, salary) IN(
    SELECT department_id, max(salary)
    FROM employees
    GROUP BY department_id
    );
    
--부서명에 IT가 포함이된 사람이 속한 사원명(first_name), 
--부서번호(department_id), 부서명(department_name)을 출력하시오.(in)

SELECT department_name
FROM departments
WHERE department_name LIKE '%IT%';

SELECT e.first_name, d.department_id, d.department_name  
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND d.department_name IN(
    SELECT department_name
FROM departments
WHERE department_name LIKE '%IT%'
);

--30소속된 사원들 중에서 급여를 가장 받은 사원보다 더 많은 급여를 받는
--사원이름, 급여, 입사일을 출력하시오. (ALL)
--(서브쿼리에서 max()함수를 사용하지 않는다);

SELECT
FROM
WHERE


SELECT 
FROM
WHERE     (
    SELECT
    FROM
    WHERE
)
