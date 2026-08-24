--1. 전체 사원 중 3번째로 빠르게 입사한 사원의 이름과 입사일을 연-월-일 포멧으로 조회하시오.
-- 1: 1 row
SELECT FIRST_NAME
     , h_date
  FROM (SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') h_date
             , FIRST_NAME
             , ROW_NUMBER() OVER(ORDER BY HIRE_DATE ASC) rnk
          FROM EMPLOYEES)
 WHERE rnk = 3
;
--2. 전체 사원 중 11번째로 늦게 입사한 사원의 이름과 입사일을 연-월-일 포멧으로 조회하시오.
-- 2: 1 row
SELECT FIRST_NAME
     , h_date
  FROM (SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') h_date
             , FIRST_NAME
             , ROW_NUMBER() OVER(ORDER BY HIRE_DATE DESC) rnk
          FROM EMPLOYEES)
 WHERE rnk = 11
;
--3. 2006년에 입사한 사원 중 2번째로 빠르게 입사한 사원의 이름과 입사일을 연-월-일 포멧으로 조회하시오.
-- 3: 1 row
SELECT FIRST_NAME 
     , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') h_date
  FROM (SELECT FIRST_NAME
             , HIRE_DATE
             , ROW_NUMBER() OVER(ORDER BY HIRE_DATE asc) rnk
          FROM (SELECT TO_CHAR(HIRE_DATE, 'YYYY') h_year
                     , FIRST_NAME
                     , HIRE_DATE
                  FROM EMPLOYEES)
         WHERE H_YEAR = '2006')
 WHERE rnk = 2
;
--4. 3번째로 많은 사원이 수행중인 직무의 이름과 사원 수를 조회하시오.
-- 4: 1 row
SELECT JOB_TITLE
     , e_cnt
  FROM JOBS j 
 INNER JOIN (SELECT JOB_ID 
                  , e_cnt
                  , ROW_NUMBER() OVER(ORDER BY e_cnt DESC) rnk
               FROM (SELECT JOB_ID 
                          , COUNT(EMPLOYEE_ID ) AS e_cnt
                       FROM EMPLOYEES
                      GROUP BY JOB_ID)) e
    ON j.JOB_ID = e.JOB_ID 
 WHERE e.rnk = 3
;