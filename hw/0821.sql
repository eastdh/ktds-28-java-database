--1. 대륙, 국가, 도시, 부서, 직무별 사원의 수, 사원들의 평균 급여를 조회하세요.
-- 1. 11 rows
SELECT r.REGION_NAME 
     , c.COUNTRY_NAME 
     , l.CITY 
     , d.DEPARTMENT_NAME
     , COUNT(e.DEPARTMENT_ID ) AS e_cnt
     , AVG(e.SALARY ) AS s_avg
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 INNER JOIN COUNTRIES c 
    ON l.COUNTRY_ID = c.COUNTRY_ID
 INNER JOIN REGIONS r 
    ON c.REGION_ID = r.REGION_ID
 GROUP BY r.REGION_NAME , c.COUNTRY_NAME , l.CITY , d.DEPARTMENT_NAME 
;
--2. 각 부서장 사원번호별 사원의 수를 조회하고 사원의 수로 오름차순 정렬하세요.
-- 2. 11 rows
SELECT d.MANAGER_ID 
     , COUNT(e.EMPLOYEE_ID ) AS e_count
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 GROUP BY d.MANAGER_ID 
 ORDER BY e_COUNT ASC
;
--3. 직무가 받을 수 있는 평균 급여(MAX_SALARY, MIN_SALARY)보다 많은 급여를 받는 사원들을 직무별 사원의 수로 조회하세요.
-- 3: 9 rows
SELECT j.JOB_TITLE 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 WHERE e.SALARY > (j.MAX_SALARY + j.MIN_SALARY ) / 2
 GROUP BY j.JOB_TITLE 
;
--4. 모든 부서장들의 부하직원들을 계층 조회하세요.
-- 4: 147 rows
 SELECT DISTINCT e.EMPLOYEE_ID 
      , e.FIRST_NAME || ' ' || e.LAST_NAME AS NAME
      , e.MANAGER_ID 
      , LEVEL
   FROM EMPLOYEES e 
  START WITH e.EMPLOYEE_ID IN (SELECT DISTINCT d.MANAGER_ID
                                 FROM DEPARTMENTS d)
CONNECT BY PRIOR e.EMPLOYEE_ID = e.MANAGER_ID                                 
;