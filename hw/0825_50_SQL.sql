-- 1. 모든 사원의 모든 정보를 조회한다.
-- 1: 107 rows
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , HIRE_DATE
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
;

-- 2. 부서가 없는 사원의 모든 정보를 조회한다.
-- 2: 1 row
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , HIRE_DATE
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL
;

-- 3. 직무가 없는 사원의 모든 정보를 조회한다.
-- 3: 0 row
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , HIRE_DATE
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE JOB_ID IS NULL
;
-- 4. 부서와 직무가 모두 있는 사원의 모든 정보를 조회한다.
-- 4: 106 rows
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , HIRE_DATE
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL
   AND JOB_ID IS NOT NULL
;
-- 5. 부서장이 없는 모든 부서의 모든 정보를 조회한다.
-- 5: 16 rows
SELECT DEPARTMENT_ID 
      , DEPARTMENT_NAME
      , MANAGER_ID 
      , LOCATION_ID 
  FROM DEPARTMENTS
 WHERE MANAGER_ID IS NULL
;
-- 6. 부서장이 있는 모든 부서의 모든 정보를 조회한다.
-- 6: 11 rows
SELECT DEPARTMENT_ID 
      , DEPARTMENT_NAME
      , MANAGER_ID 
      , LOCATION_ID 
  FROM DEPARTMENTS
 WHERE MANAGER_ID IS NOT NULL
;
-- 7. 부서장의 모든 사원 정보를 조회한다.
-- 7: 11 rows
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , HIRE_DATE
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID 
                         FROM DEPARTMENTS)
;
-- 8. 사원의 이름만 조회한다.
-- 8: 107 rows
SELECT FIRST_NAME
  FROM EMPLOYEES 
;
-- 9. 사원의 이름이 7자리인 사원의 모든 정보를 조회한다.
-- 9: 23 rows
SELECT EMPLOYEE_ID 
     , FIRST_NAME
     , LAST_NAME
     , EMAIL
     , PHONE_NUMBER
     , HIRE_DATE
     , JOB_ID
     , SALARY 
     , COMMISSION_PCT 
     , MANAGER_ID 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE FIRST_NAME IN (SELECT FIRST_NAME
                       FROM (SELECT LENGTH(FIRST_NAME ) AS len
                                  , FIRST_NAME   
                               FROM EMPLOYEES)
                      WHERE LEN = 7)
;

-- 10. 사원의 이메일이 6자리인 사원의 모든 정보를 조회한다.
-- 10: 25 rows
SELECT EMPLOYEE_ID 
     , FIRST_NAME
     , LAST_NAME
     , EMAIL
     , PHONE_NUMBER
     , HIRE_DATE
     , JOB_ID
     , SALARY 
     , COMMISSION_PCT 
     , MANAGER_ID 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE EMAIL IN (SELECT EMAIL 
                   FROM (SELECT LENGTH(EMAIL) AS len
                              , EMAIL   
                           FROM EMPLOYEES)
                  WHERE LEN = 6)
;

-- 11. 모든 지역의 모든 정보를 조회한다.
-- 11: 23 rows
SELECT LOCATION_ID 
     , STREET_ADDRESS 
     , POSTAL_CODE 
     , CITY 
     , STATE_PROVINCE 
     , COUNTRY_ID 
  FROM LOCATIONS
;
-- 12. 지역이 없는 모든 부서의 정보를 조회한다.
-- 12: 0 row
SELECT DEPARTMENT_ID 
      , DEPARTMENT_NAME
      , MANAGER_ID 
      , LOCATION_ID 
  FROM DEPARTMENTS
 WHERE LOCATION_ID IS NULL
;
-- 13. 지역이 있는 모든 부서의 정보와 도시 정보를 조회한다.
-- 13: 27 rows
SELECT d.DEPARTMENT_ID 
     , d.DEPARTMENT_NAME
     , d.MANAGER_ID 
     , d.LOCATION_ID
     , l.CITY
  FROM DEPARTMENTS d
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
;
-- 14. 모든 사원의 모든 정보와 부서명을 조회한다.
-- 14: 107 rows
SELECT e.EMPLOYEE_ID 
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.PHONE_NUMBER
     , e.HIRE_DATE
     , e.JOB_ID
     , e.SALARY 
     , e.COMMISSION_PCT 
     , e.MANAGER_ID 
     , e.DEPARTMENT_ID
     , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e
  LEFT JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
;
-- 15. 111번 사원의 모든 정보와 부서명을 조회한다.
-- 15: 1 row
SELECT e.EMPLOYEE_ID 
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.PHONE_NUMBER
     , e.HIRE_DATE
     , e.JOB_ID
     , e.SALARY 
     , e.COMMISSION_PCT 
     , e.MANAGER_ID 
     , e.DEPARTMENT_ID
     , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e
 INNER JOIN DEPARTMENTS d 
    ON e.EMPLOYEE_ID = 111
   AND e.DEPARTMENT_ID = d.DEPARTMENT_ID
;
-- 16. 115번의 사원의 모든 정보와 부서명, 직무명을 조회한다.
-- 16: 1 row
SELECT e.EMPLOYEE_ID 
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.PHONE_NUMBER
     , e.HIRE_DATE
     , e.JOB_ID
     , e.SALARY 
     , e.COMMISSION_PCT 
     , e.MANAGER_ID 
     , e.DEPARTMENT_ID
     , d.DEPARTMENT_NAME 
     , j.JOB_TITLE
  FROM EMPLOYEES e
 INNER JOIN DEPARTMENTS d 
    ON e.EMPLOYEE_ID = 115
   AND e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
;
-- 17. 100번 사원의 모든 정보와 부서명, 직무명, 도시명을 조회한다.
-- 17: 1 row
SELECT e.EMPLOYEE_ID 
     , e.FIRST_NAME
     , e.LAST_NAME
     , e.EMAIL
     , e.PHONE_NUMBER
     , e.HIRE_DATE
     , e.JOB_ID
     , e.SALARY 
     , e.COMMISSION_PCT 
     , e.MANAGER_ID 
     , e.DEPARTMENT_ID
     , d.DEPARTMENT_NAME 
     , j.JOB_TITLE
     , l.CITY
  FROM EMPLOYEES e
 INNER JOIN DEPARTMENTS d 
    ON e.EMPLOYEE_ID = 100
   AND e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
;
-- 18. 부서아이디별 사원의 평균급여를 조회한다.
-- 18: 11 rows
SELECT DEPARTMENT_ID 
     , AVG(SALARY )
  FROM EMPLOYEES  
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID 
;
-- 19. 직무아이디별 사원의 최고급여를 조회한다.
-- 19: 19 rows
SELECT JOB_ID
     , MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID 
 ORDER BY JOB_ID 
;


-- 20. 부서명별 사원의 수를 조회한다.
-- 20: 11 rows
SELECT d.DEPARTMENT_NAME 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 GROUP BY d.DEPARTMENT_NAME 
;

-- 21. 직무명별 사원의 평균급여를 조회한다.
-- 21: 19 rows
SELECT j.JOB_TITLE
     , AVG(e.SALARY)
  FROM EMPLOYEES e 
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 GROUP BY j.JOB_TITLE 
;

-- 22. 부서명, 직무명별 사원의 수와 평균급여를 조회한다.
-- 22: 19 rows
SELECT d.DEPARTMENT_NAME 
     , j.JOB_TITLE 
     , COUNT(e.EMPLOYEE_ID )
     , AVG(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 GROUP BY d.DEPARTMENT_NAME , j.JOB_TITLE 
;

-- 23. 커미션을 안받는 사원의 모든 정보를 조회한다.
-- 23: 72 rows
SELECT *
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IS NULL
;

-- 24. 커미션을 받는 사원의 부서아이디를 중복없이 조회한다.
-- 24: 2 rows
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IS NOT NULL
;
-- 25. 커미션을 받는 사원의 직무아이디를 중복없이 조회한다.
-- 25: 2 rows
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IS NOT NULL
;

-- 26. 사원이 있는 부서의 지역아이디를 조회한다.
-- 26: 7 rows
SELECT DISTINCT LOCATION_ID 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID  
                           FROM EMPLOYEES
                          WHERE DEPARTMENT_ID IS NOT NULL)
;

-- 27. 사원이 없는 부서의 부서명을 조회한다.
-- 27: 16 rows
SELECT DEPARTMENT_NAME  
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID NOT IN (SELECT DISTINCT DEPARTMENT_ID  
                               FROM EMPLOYEES
                              WHERE DEPARTMENT_ID IS NOT NULL)
;

-- 28. 도시별 부서의 수를 조회한다. (부서가 없으면 부서의 수는 0으로 조회한다.)
-- 28: 23 rows
SELECT l.CITY
     , COUNT(d.DEPARTMENT_ID)
  FROM LOCATIONS l 
  LEFT JOIN DEPARTMENTS d 
    ON l.LOCATION_ID = d.LOCATION_ID
 GROUP BY l.CITY 
;

-- 29. 도시별 사원의 평균급여를 조회한다. (사원이 없으면 평균급여는 0으로 조회한다.)
-- 29: 23 rows
SELECT l.CITY 
     , COALESCE(AVG(e.SALARY ), 0)
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 RIGHT JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 GROUP BY l.CITY 
;

-- 30. Seattle의 부서 아이디를 조회한다.
-- 30: 21 rows
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE LOCATION_ID = (SELECT LOCATION_ID
                        FROM LOCATIONS 
                       WHERE CITY = 'Seattle')
;

-- 31. Seattle에서 근무중인 사원의 모든 직무명을 중복없이 조회한다.
-- 31: 9 rows
SELECT JOB_TITLE
  FROM JOBS 
 WHERE JOB_ID IN (SELECT DISTINCT JOB_ID
                    FROM EMPLOYEES
                   WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                                             FROM DEPARTMENTS
                                            WHERE LOCATION_ID = (SELECT LOCATION_ID
                                                                   FROM LOCATIONS 
                                                                  WHERE CITY = 'Seattle')))
;

-- 32. 사원이 한명도 없는 도시를 조회한다.
SELECT CITY
  FROM (SELECT l.CITY 
             , COUNT(e.EMPLOYEE_ID ) e_cnt
          FROM EMPLOYEES e 
         INNER JOIN DEPARTMENTS d 
            ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         RIGHT JOIN LOCATIONS l 
            ON d.LOCATION_ID = l.LOCATION_ID
         GROUP BY l.CITY) 
 WHERE E_CNT = 0
;
    

-- 33. 사원이 한명이라도 있는 도시를 조회한다.
-- 33: 7 rows
SELECT CITY
  FROM LOCATIONS
 WHERE LOCATION_ID IN (SELECT DISTINCT LOCATION_ID 
                         FROM DEPARTMENTS
                        WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID 
                                                  FROM EMPLOYEES))
;

-- 34. 모든 사원의 정보를 급여로 오름차순 정렬하여 조회한다.
-- 34: 107 rows
SELECT EMPLOYEE_ID 
     , FIRST_NAME
     , LAST_NAME
     , EMAIL
     , PHONE_NUMBER
     , HIRE_DATE
     , JOB_ID
     , SALARY 
     , COMMISSION_PCT 
     , MANAGER_ID 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 ORDER BY SALARY ASC
;

-- 35. 부서명별 평균급여를 부서명으로 내림차순 정렬하여 조회한다.
-- 35: 11 rows
SELECT d.DEPARTMENT_NAME 
     , AVG(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 GROUP BY d.DEPARTMENT_NAME 
 ORDER BY d.DEPARTMENT_NAME DESC
;

-- 36. 부서명별 최고급여를 최고급여로 오름차순 정렬하여 조회한다.
-- 36: 11 rows
SELECT d.DEPARTMENT_NAME 
     , MAX(e.SALARY ) max_sal 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 GROUP BY d.DEPARTMENT_NAME 
 ORDER BY max_sal DESC
;


-- 37. 부서명이 가장 긴 부서에서 근무중인 사원의 모든 정보를 조회한다.
-- 37: 0 row
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                          FROM (SELECT DEPARTMENT_ID 
                                     , ROW_NUMBER() OVER(ORDER BY LEN DESC) rnk
                                  FROM (SELECT DEPARTMENT_ID 
                                             , LENGTH(DEPARTMENT_NAME ) len
                                          FROM DEPARTMENTS))
                         WHERE RNK = 1)
;

-- 38. 도시 별 사원의 수를 도시로 오름차순 정렬하여 조회한다.
-- 38: 7 rows
SELECT l.CITY
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 GROUP BY l.CITY 
 ORDER BY l.CITY ASC
;

-- 39. 모든 사원의 사원번호, 이름, 성, 급여, 커미션을 포함한 급여 정보를 조회한다.
-- 39: 107 rows
SELECT EMPLOYEE_ID 
     , FIRST_NAME 
     , LAST_NAME 
     , SALARY 
     , SALARY + COALESCE(COMMISSION_PCT, 0) * SALARY AS TOTAL_SALARY
  FROM EMPLOYEES 
;

-- 40. 매년 급여의 10%의 상여금을 받는다고 했을 때, 사원별로 현재까지 받은 상여금의 합과 사원번호, 급여를 조회한다.
-- 40: 107 rows
SELECT e.EMPLOYEE_ID
     , e.SALARY
     , TRUNC(e.SALARY * 0.1) * y.WORKED_YEARS AS BONUS
  FROM EMPLOYEES e 
 INNER JOIN (SELECT EMPLOYEE_ID 
                  , TRUNC((TRUNC(SYSDATE) - TRUNC(HIRE_DATE)) / 365) AS worked_years
               FROM EMPLOYEES) y
    ON e.EMPLOYEE_ID  = y.EMPLOYEE_ID
 ORDER BY e.EMPLOYEE_ID 
;

-- 41. 직무가 변경되었던 사원들의 모든 정보를 조회한다.
-- 41: 7 rows
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID IN (SELECT DISTINCT EMPLOYEE_ID 
                         FROM JOB_HISTORY)
;

-- 42. 모든 사원들의 현재 직무명과 과거의 직무명을 조회한다. 만약 직무가 한번도 변경되지 않았다면, 과거의 직무명은 '없음' 으로 조회한다.
-- 42: 110 rows
SELECT now.EMPLOYEE_ID 
     , now.JOB_TITLE AS now_job
     , COALESCE(old.JOB_TITLE, '없음') AS old_job
  FROM (SELECT e.EMPLOYEE_ID 
             , j.JOB_TITLE 
          FROM EMPLOYEES e 
         INNER JOIN JOBS j
            ON e.JOB_ID = j.JOB_ID ) now 
  LEFT JOIN (SELECT jh.EMPLOYEE_ID 
                  , j.JOB_TITLE 
               FROM JOB_HISTORY jh
              INNER JOIN JOBS j
                 ON jh.JOB_ID = j.JOB_ID) old 
    ON now.EMPLOYEE_ID = old.EMPLOYEE_ID
;

-- 43. 직무가 변경될 때마다 급여가 15%씩 감소한다고 했을 때, 직무가 변경된 사원들의 감소된 급여를 조회한다.

-- 44. 2003년에 입사한 사원은 몇 명인지 조회한다.

-- 45. 2002년부터 2006년까지 입사한 사원은 몇명인지 연도별로 조회한다.

-- 46. 113번 사원의 상사의 모든 정보를 조회한다.

-- 47. 100번 사원의 모든 부하직원을 계층조회한다.

-- 48. 113번 사원의 모든 상사를 계층조회한다.

-- 49. IT 부서장의 모든 부하직원을 계층조회한다.

-- 50. 모든 부서의 부서장들의 부하직원을 계층조회한다.
