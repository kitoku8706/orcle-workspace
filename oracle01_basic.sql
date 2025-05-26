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











