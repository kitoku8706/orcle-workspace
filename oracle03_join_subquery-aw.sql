/*=======================================================
join : 여러개의 테이블에서 원하는 테이블을 추출해주는 쿼리문이다.

join은 oracle제품에서 사용되는 oracle용 join이 있고
모든 제품에서 공통적으로 사용되는 표준(ANSI) join이 있다.
미국 국립 표준 협회(American National Standards Institute,ANSI)
========================================================*/
--1. carteian product(카티션 곱) 조인 : 
--   테이블 행의 갯수만큼 출력해주는 조인이다.
--1) oracle용 cartesian product
  SELECT e.department_id,  e.first_name,  e.job_id,   j.job_title
  FROM employees e, jobs  j;         --2,033
  
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
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id;
 
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e  inner join    departments d
ON e.department_id=d.department_id;

--employees와 jobs테이블에서 사원번호(employee_id),
--업무번호(job_id), 업무명(job_title)을 검색하시오.
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id;

SELECT e.employee_id, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id=j.job_id; 

 --job_id가 'FI_MGR'인 사원이 속한
 --급여(salary)의 최소값(min_salary), 최대값(max_salary)을 출력하시오. 
 SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id
   AND e.job_id = 'FI_MGR';


SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e  INNER JOIN jobs j
ON e.job_id = j.job_id
 WHERE e.job_id = 'FI_MGR';


--부서가 'Seattle'에 있는 부서에서 근무하는
--직원들의  first_name, hire_date, department_name, city
--출력하는 SELECT을 작성하시오.
SELECT e.first_name, e.hire_date, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id=d.department_id
 AND  d.location_id=l.location_id
 AND  l.city='Seattle';


SELECT e.first_name  , e.hire_date, d.department_name, l.city
FROM employees e   INNER JOIN    departments d   ON  e.department_id=d.department_id
                                      INNER JOIN  locations l  ON      d.location_id=l.location_id
WHERE  l.city='Seattle';

--20번 부서의 이름과 그 부서에 근무하는 사원의 이름(first_name)을 출력하시오.
SELECT d.department_id, d.department_name, e.first_name
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND d.department_id=20;

SELECT d.department_id, d.department_name, e.first_name
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
WHERE d.department_id=20;

--1400, 1500번 위치의 도시이름과 그 곳에 있는 부서의 이름을 출력하시오.
SELECT l.location_id, l.city, d.department_name
FROM locations l, departments d
WHERE l.location_id=d.location_id 
  AND l.location_id IN(1400, 1500);
  
SELECT l.location_id, l.city, d.department_name
FROM locations l INNER JOIN departments d
ON l.location_id=d.location_id 
WHERE l.location_id IN(1400, 1500);  

/*===================================
3. non-equi join (비등가조인)
  (=)동등비교연산자를 제외한 >=, <=, >, <등의 연산자를 
  이용해서 조건을 지정하는 조인방법이다.
=======================================*/
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
 
 
 --(2) ansi self join
 SELECT w.employee_id AS "사원번호",
        w.first_name AS "사원이름",
        w.manager_id  AS "관리자번호",
        m.first_name AS "관리자이름"
 FROM employees w  JOIN employees m
 ON w.manager_id=m.employee_id
 ORDER BY w.employee_id;
 
 
 /*----------------------------------------------
 문제
 ----------------------------------------------   */
--1)EMPLOYEES 테이블에서 입사한 달(hire_date) 별로 인원수를 조회하시오 . 
--  <출력: 월        직원수   >
 

--2)각 부서에서 근무하는 직원수를 조회하는 SQL 명령어를 작성하시오. 
--단, 직원수가 5명 이하인 부서 정보만 출력되어야 하며 부서정보가 없는 직원이 있다면 부서명에 “<미배치인원>” 이라는 문자가 출력되도록 하시오. 
--그리고 출력결과는 직원수가 많은 부서먼저 출력되어야 합니다.
 
 
--3)각 부서 이름 별로 2005년 이전에 입사한 직원들의 인원수를 조회하시오.
-- <출력 :    부서명		입사년도	인원수  >
 
 
 
--4)직책(job_title)에서 'Manager'가 포함이된 사원의 이름(first_name), 직책(job_title), 부서명(department_name)을 조회하시오.
  
  
--5)'Executive' 부서에 속에 있는 직원들의 관리자 이름을 조회하시오. 
--단, 관리자가 없는 직원이 있다면 그 직원 정보도 출력결과에 포함시켜야 합니다.
-- <출력 : 부서번호 직원명  관리자명  >
 
 
 
 
 