-- 1. 현재 시간을 조회한다.
SELECT SYSDATE 
  FROM DUAL
;
-- 2. 현재 시간을 "연-월-일" 포멧으로 조회한다.
SELECT TO_CHAR(SYSDATE , 'YYYY-MM-DD')  
  FROM DUAL
;
-- 3. 한 시간 전 시간을 "시:분:초" 포멧으로 조회한다.
SELECT TO_CHAR(SYSDATE - 1/24, 'HH:MI:SS')
      , TO_CHAR(SYSDATE, 'HH24:MI:SS')
  FROM DUAL
;
-- 4. EMPLOYEES 테이블의 모든 정보를 조회한다.
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
-- 5. DEPARTMENTS 테이블의 모든 정보를 조회한다.
SELECT DEPARTMENT_ID 
      , DEPARTMENT_NAME
      , MANAGER_ID 
      , LOCATION_ID 
  FROM DEPARTMENTS
;
-- 6. JOBS 테이블의 모든 정보를 조회한다.
SELECT JOB_ID 
      , JOB_TITLE 
      , MIN_SALARY 
      , MAX_SALARY 
  FROM JOBS
;
-- 7. LOCATIONS 테이블의 모든 정보를 조회한다.
SELECT LOCATION_ID 
      , STREET_ADDRESS 
      , POSTAL_CODE 
      , CITY 
      , STATE_PROVINCE 
      , COUNTRY_ID 
  FROM LOCATIONS
;
-- 8. COUNTRIES 테이블의 모든 정보를 조회한다.
SELECT COUNTRY_ID 
      , COUNTRY_NAME 
      , REGION_ID 
  FROM COUNTRIES
  ;
-- 9. REGIONS 테이블의 모든 정보를 조회한다.
SELECT REGION_ID 
      , REGION_NAME 
  FROM REGIONS
;
-- 10. JOB_HISTORY 테이블의 모든 정보를 조회한다.
SELECT EMPLOYEE_ID 
      , START_DATE 
      , END_DATE 
      , JOB_ID 
      , DEPARTMENT_ID 
  FROM JOB_HISTORY
  ;
-- 11. 상사사원번호를 중복없이 조회한다.
SELECT DISTINCT MANAGER_ID  
  FROM EMPLOYEES
;
-- 12. 90번 부서에서 근무하는 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 90
;
-- 13. 90번, 100번 부서에서 근무하는 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
    OR DEPARTMENT_ID = 100
;
-- 14. 100번 상사의 직속 부하직원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE MANAGER_ID = 100
;
-- 15. 111번 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 111
;
-- 16. 직무 아이디가 AD_VP 인 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE JOB_ID  = 'AD_VP'
;
-- 17. 급여가 7000 이상인 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE SALARY  >= 7000
;
-- 18. 직무 아이디가 'PU_CLERK'인 사원 중 급여가 3000 이상인 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE JOB_ID  = 'PU_CLERK'
   AND SALARY  >= 3000
;
-- 19. 급여가 2500, 3500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사원들의 
--     모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE (JOB_ID = 'SA_REP' OR e.JOB_ID = 'ST_CLERK') 
   AND SALARY != 2500 
   AND SALARY != 3500 
   AND SALARY != 7000
;
-- 20. 커미션을 안받는 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IS NULL
 ;
-- 21. 커미션을 받는 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES e
 WHERE COMMISSION_PCT IS NOT NULL
 ;

-- 22. 이름의 첫 글자가 'D' 인 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'D%'
  ;
-- 23. 성의 마지막 글자가 'a' 인 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '%a'
;
-- 24. 전화번호에 '.124.'이 포함된 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '%.124.%'
 ;
-- 25. 이름이 4글자인 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES 
 -- WHERE LENGTH(FIRST_NAME) = 4
 WHERE FIRST_NAME LIKE '____'
 ;
-- 26. 이름이나 성에 'A' 혹은 'a' 가 포함된 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%A%'
    OR FIRST_NAME LIKE '%a%'
    OR LAST_NAME LIKE '%A%'
    OR LAST_NAME LIKE '%a%'
;

SELECT *
  FROM (SELECT e.*
  		      , LOWER(FIRST_NAME || LAST_NAME) NAME
  		   FROM EMPLOYEES e )
 WHERE NAME LIKE '%a%'
;
 
-- 27. 국가명이 6자리인 국가의 모든 정보를 조회한다.
SELECT *
  FROM COUNTRIES
 WHERE COUNTRY_NAME LIKE '______'
 ;

-- 28. '20230222' 문자 데이터를 날짜로 변환해 조회한다.(DUAL)
SELECT TO_DATE('20230222', 'YYYY-MM-DD')
  FROM DUAL
  ;
-- 29. '20230222' 문자 데이터를 'YYYY-MM' 으로 변환해 조회한다.(DUAL)
SELECT TO_CHAR(TO_DATE('20230222', 'YYYYMMDD'), 'YYYY-MM')
  FROM DUAL
  ;
-- 30. '20230222130140' 문자 데이터를 'YYYY-MM-DD HH24:MI:SS' 으로 변환해 조회한다. (DUAL)
SELECT TO_CHAR(TO_DATE('20230222130140', 'YYYYMMDDHH24MISS'), 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL
  ;
-- 31. '20230222' 날짜의 열흘 후의 날짜를 'YYYY-MM-DD' 으로 변환해 조회한다. (DUAL)
SELECT TO_CHAR(TO_DATE('20230222', 'YYYYMMDD') + 10, 'YYYY-MM-DD')
  FROM DUAL
  ;
-- 32. 직원의 입사일자를 '연-월-일' 형태로 조회한다.
SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')
  FROM EMPLOYEES
  ;
-- 33. 2005년 09월에 입사한 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
-- WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM') = '2005-09'
 WHERE HIRE_DATE >= TO_DATE('20050901', 'YYYYMMDD') 
   AND HIRE_DATE <= TO_DATE('20050930', 'YYYYMMDD')
 ;
-- 34. 현재 시간으로부터 20년 전 보다 일찍 입사한 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES
 WHERE HIRE_DATE < ADD_MONTHS(SYSDATE, -20 * 12)
;
-- 35. 사원들의 정보 중 입사연도, 이름, 성만 조회한다.
SELECT TO_CHAR(HIRE_DATE, 'YYYY')
      , FIRST_NAME
      , LAST_NAME
  FROM EMPLOYEES
  ;

-- 36. 사원들의 정보 중 입사연도, 입사월, 이름, 성만 조회한다.
SELECT TO_CHAR(HIRE_DATE, 'YYYY')
      , TO_CHAR(HIRE_DATE, 'MM')
      , FIRST_NAME
      , LAST_NAME
  FROM EMPLOYEES
  ;

-- 37. MOD 함수를 통해 사원번호가 홀수면 남자, 짝수면 여자 로 구분해 조회한다. MOD(값, 나눌값)
SELECT CASE WHEN MOD(EMPLOYEE_ID , 2) = 1 THEN 'MALE' ELSE 'FEMALE' END
  FROM EMPLOYEES
  ;
-- 38. 사원 모든 정보 중 이메일만 모두 소문자로 변경하여 조회한다.
SELECT EMPLOYEE_ID
      , FIRST_NAME 
      , LAST_NAME 
      , LOWER(EMAIL )
  FROM EMPLOYEES
  ;

-- 39. 사원의 급여를 TRUNC(소수점 버림) 함수를 사용해 100 단위는 버린채 다음과 같이 조회한다. 
--     예> 3700 -> 3000, 12700 -> 12000
SELECT TRUNC(SALARY, -3)
  FROM EMPLOYEES
  ;

-- 40. 100단위를 버린 사원의 급여 별 사원의 수를 조회한다.
SELECT TRUNC(SALARY, -3), COUNT(*)
  FROM EMPLOYEES
 GROUP BY TRUNC(SALARY, -3)
  ;
-- 41. 모든 사원들의 이름을 10자리로 맞추어 조회한다.
-- 42. 사원의 이름과 성을 이용해 EMAIL과 같은 값으로 만들어 조회한다.
-- 43. 모든 사원들의 이름을 10자리로 변환해 조회한다. 예> 이름 => "        이름"
-- 44. 모든 사원들의 성을 10자리로 변환해 조회한다. 예> 성 => "성         "

-- 45. 모든 사원들의 모든 정보를 조회한다. 
--     단, 커미션을 받는 사원은 "커미션여부" 컬럼에 "Y"를, 아닌 경우 "N"으로 조회한다.
SELECT EMPLOYEE_ID
      , FIRST_NAME 
      , LAST_NAME 
      , EMAIL
      , COMMISSION_PCT 
      , CASE WHEN COMMISSION_PCT IS NOT NULL THEN 'Y' ELSE 'N' END AS "커미션 여부"
  FROM EMPLOYEES
;
-- 46. 사원의 모든 정보를 조회한다. 
--     사원의 급여가 5000 이하이면 "사원", 
--                7000 이하이면 "대리", 
--                9000 이하이면 "과장", 
--                그 외에는 "임원" 으로 조회한다.
SELECT EMPLOYEE_ID 
      , FIRST_NAME 
      , LAST_NAME 
      , SALARY
      , CASE WHEN SALARY <= 5000 THEN '사원'
             WHEN SALARY <= 7000 THEN '대리'
             WHEN SALARY <= 9000 THEN '과장'
             ELSE '임원' END "직급"
  FROM EMPLOYEES
  ;

-- 47. 모든 사원들의 모든 정보를 급여 오름차순 정렬하여 조회한다.
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC
;
-- 48. 모든 사원들의 모든 정보를 이름 내림차순 정렬하여 조회한다.
SELECT *
  FROM EMPLOYEES
ORDER BY FIRST_NAME DESC
;
-- 49. 모든 사원들의 모든 정보를 직무 오름차순, 급여 내림차순으로 조회한다.
SELECT *
  FROM EMPLOYEES
 ORDER BY JOB_ID ASC
       , SALARY DESC
;
-- 50. 가장 늦게 입사한 사원의 모든 정보를 조회한다.
SELECT *
FROM  EMPLOYEES
WHERE HIRE_DATE = (
	SELECT MAX(HIRE_DATE)
	  FROM EMPLOYEES
	  )
;
-- 51. 가장 일찍 입사한 사원의 모든 정보를 조회한다.
SELECT *
FROM  EMPLOYEES
WHERE HIRE_DATE = (
	SELECT MIN(HIRE_DATE)
	  FROM EMPLOYEES
	  )
;
-- 52. 사내의 최고급여과 최저급여의 차이를 조회한다.
SELECT MAX(SALARY) - MIN(SALARY)
  FROM EMPLOYEES
;
-- 53. 102번 직원의 직속 부하직원의 수를 조회한다.
SELECT COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
 WHERE MANAGER_ID = 102
;
-- 54. 113번 직원의 직속 부하직원의 수를 조회한다.
SELECT COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
 WHERE MANAGER_ID = 113
;
-- 55. 'SA_REP' 직무인 직원 중 가장 높은 급여과 가장 낮은 급여를 조회한다.
SELECT MAX(SALARY)
      , MIN(SALARY)
  FROM EMPLOYEES
 WHERE JOB_ID = 'SA_REP'
 ;
-- 56. 부서아이디별 평균 급여를 조회한다.
SELECT DEPARTMENT_ID
      , AVG(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 
;
-- 57. 직무아이디별 평균 급여, 최고급여, 최저급여를 조회한다.
SELECT DEPARTMENT_ID
      , AVG(SALARY)
      , MAX(SALARY)
      , MIN(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 
;

-- 58. 직무아이디별 사원의 수를 조회한다.
SELECT JOB_ID
      , COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
 GROUP BY JOB_ID 
;

-- 59. 상사아이디별 부하직원의 수를 조회한다. 단, 부하직원이 2명 이하인 경우는 제외한다.
SELECT MANAGER_ID 
      , COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
 GROUP BY MANAGER_ID 
 HAVING COUNT(EMPLOYEE_ID ) > 2
 ORDER BY MANAGER_ID 
;

-- 60. 부서번호별 현재 시간으로부터 15년 전 보다 일찍 입사한 사원의 수를 조회한다.
SELECT DEPARTMENT_ID 
      , COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
  WHERE HIRE_DATE < ADD_MONTHS(SYSDATE, -15 * 12)
 GROUP BY DEPARTMENT_ID 
;
-- 61. 커미션을 안받는 사원이 근무하는 도시를 조회한다.
SELECT l.CITY 
  FROM EMPLOYEES e 
  LEFT JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
  LEFT JOIN LOCATIONS l  ON d.LOCATION_ID = l.LOCATION_ID 
 WHERE e.COMMISSION_PCT IS  NULL 
  ;

-- 62. 회사 전체의 평균 급여보다 많이 받는 사원들 중 
--     이름에 'u' 가 포함된 사원과 동일한 부서에서 근무중인 사원들의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES e 
 WHERE e.SALARY > (SELECT AVG(e2.SALARY)
 					  FROM EMPLOYEES e2)
   AND e.DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID 
   							  FROM EMPLOYEES e3 
   							 WHERE e3.FIRST_NAME LIKE '%u%')
;

-- 63. 이름이 'Renske' 인 사원의 급여과 같은 급여를 받는 사원의 모든 정보를 조회한다. 
--     단, 'Renske' 사원은 조회에서 제외한다.
SELECT *
  FROM EMPLOYEES e 
 WHERE e.FIRST_NAME != 'Renske'
   AND e.SALARY = (SELECT SALARY
   					 FROM EMPLOYEES e2 
   					WHERE e2.FIRST_NAME = 'Renske')
;

-- 64. 평균 급여보다 많이 받는 사원들의 사원번호, 이름, 성, 급여를 조회한다.
SELECT e.EMPLOYEE_ID 
      , e.FIRST_NAME 
      , e.LAST_NAME 
      , e.SALARY 
  FROM EMPLOYEES e
 WHERE e.SALARY > (SELECT AVG(e2.SALARY )
 					  FROM EMPLOYEES e2 )
 ;
-- 65. 평균 급여보다 적게 받는 사원들의 사원번호, 급여, 부서번호를 조회한다.
SELECT e.EMPLOYEE_ID 
      , e.SALARY 
      , e.DEPARTMENT_ID 
  FROM EMPLOYEES e
 WHERE e.SALARY < (SELECT AVG(e2.SALARY )
 					  FROM EMPLOYEES e2 )					  
;
-- 66. 가장 많은 급여를 받는 사원의 사원번호, 이름, 급여를 조회한다.
SELECT e.EMPLOYEE_ID
      , e.FIRST_NAME 
      , e.SALARY 
  FROM EMPLOYEES e
 WHERE e.SALARY = (SELECT MAX(e2.SALARY )
 					  FROM EMPLOYEES e2 )					  
;
-- 67. 자신의 상사보다 더 많은 급여를 받는 사원의 모든 정보를 조회한다.
SELECT e.*
  FROM EMPLOYEES e 
  LEFT JOIN EMPLOYEES e2 ON e.MANAGER_ID = e2.EMPLOYEE_ID 
 WHERE e.SALARY > e2.SALARY 
;
-- 68. 자신의 상사보다 더 일찍 입사한 사원의 모든 정보를 조회한다.
SELECT e.*
  FROM EMPLOYEES e 
  LEFT JOIN EMPLOYEES e2 ON e.MANAGER_ID = e2.EMPLOYEE_ID 
 WHERE e.HIRE_DATE  < e2.HIRE_DATE  
;
-- 69. 가장 많은 커미션을 받는 사원의 모든 정보를 조회한다.
SELECT * 
  FROM EMPLOYEES e
 WHERE e.COMMISSION_PCT  = (SELECT MAX(e2.COMMISSION_PCT  )
 					  		   FROM EMPLOYEES e2 )					  
;
-- 70. 가장 적은 커미션을 받는 사원의 급여과 커미션을 조회한다.
SELECT e.SALARY 
      , e.COMMISSION_PCT 
  FROM EMPLOYEES e
 WHERE e.COMMISSION_PCT  = (SELECT MIN(e2.COMMISSION_PCT  )
 				   			   FROM EMPLOYEES e2 )					  
;
-- 71. 사원이 속한 부서의 평균급여보다 적게 받는 사원의 모든 정보를 조회한다.
SELECT * 
  FROM EMPLOYEES e
 WHERE e.SALARY < (SELECT AVG(e2.SALARY   )
 					  FROM EMPLOYEES e2 
 					 WHERE e2.DEPARTMENT_ID = e.DEPARTMENT_ID )					  
;
-- 72. 50번 부서의 부서장의 이름, 성, 급여를 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , e.SALARY 
  FROM DEPARTMENTS d 
  LEFT JOIN EMPLOYEES e ON d.MANAGER_ID = e.EMPLOYEE_ID
 WHERE d.DEPARTMENT_ID = 50
;

SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , e.SALARY 
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID = (SELECT d.MANAGER_ID
                          FROM DEPARTMENTS d 
                         WHERE d.DEPARTMENT_ID = 50)
;

-- 73. 근무중인 사원이 없는 부서명을 조회한다.
SELECT d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d
  LEFT JOIN EMPLOYEES e  ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE e.EMPLOYEE_ID IS NULL
;

SELECT d.DEPARTMENT_NAME
  FROM DEPARTMENTS d
 WHERE d.DEPARTMENT_ID NOT IN (SELECT DISTINCT e.DEPARTMENT_ID 
                                  FROM EMPLOYEES e 
                                 WHERE e.DEPARTMENT_ID IS NOT NULL)
;

-- 74. 직무가 변경된 사원의 모든 정보를 조회한다.
SELECT DISTINCT e.*
  FROM JOB_HISTORY jh 
  LEFT JOIN EMPLOYEES e ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID
;

SELECT *
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID IN (SELECT DISTINCT jh.EMPLOYEE_ID 
                            FROM JOB_HISTORY jh )
;

-- 75. 직무가 변경된적 없는 사원의 모든 정보를 조회한다.
SELECT e.*
  FROM EMPLOYEES e 
  LEFT JOIN JOB_HISTORY jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
 WHERE jh.EMPLOYEE_ID IS NULL
;

SELECT *
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID NOT IN (SELECT DISTINCT jh.EMPLOYEE_ID 
                                FROM JOB_HISTORY jh )
;

-- 76. 직무가 가장 많이 변경된 부서의 이름을 조회한다.
WITH jhcount AS (SELECT DEPARTMENT_ID 
					  , COUNT(*) IDCOUNT
				  FROM JOB_HISTORY jh 
				 GROUP BY DEPARTMENT_ID)
SELECT d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d 
  LEFT JOIN jhcount ON d.DEPARTMENT_ID = jhcount.DEPARTMENT_ID
 WHERE jhcount.IDCOUNT = (SELECT MAX(IDCOUNT )
                             FROM jhcount )  
;

-- 77. 근무중인 사원이 없는 도시를 조회한다.
WITH location_employee AS (SELECT l.LOCATION_ID 
							      , COUNT(e.EMPLOYEE_ID ) E_COUNT
							  FROM LOCATIONS l 
							  LEFT JOIN DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID
							  LEFT JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
							  GROUP BY l.LOCATION_ID )
SELECT l.CITY 
  FROM LOCATIONS l 
  LEFT JOIN location_employee le ON l.LOCATION_ID = le.LOCATION_ID 
 WHERE le.E_COUNT = 0
;

-- 78. 급여가 7000 에서 12000 사이인 사원이 근무중인 도시를 조회한다.
WITH DEPARTMENT_SALARY AS (SELECT DISTINCT e.DEPARTMENT_ID 
							  FROM EMPLOYEES e 
							 WHERE e.SALARY >= 7000
							   AND e.SALARY <= 12000)
SELECT l.CITY 
  FROM DEPARTMENT_SALARY ds
  JOIN DEPARTMENTS d ON ds.DEPARTMENT_ID = d.DEPARTMENT_ID 
  JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID 
;

-- 79. 'Seattle' 에서 근무중인 사원의 직무명을 중복없이 조회한다.
SELECT DISTINCT j.JOB_TITLE  
  FROM EMPLOYEES e 
  LEFT JOIN JOBS j ON e.JOB_ID = j.JOB_ID 
  LEFT JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  LEFT JOIN LOCATIONS l  ON d.LOCATION_ID = l.LOCATION_ID
 WHERE l.CITY = 'Seattle'
;

-- 80. 부서가 없는 국가명을 조회한다.
WITH COUNTRY_DEPARTMENT AS (SELECT c.COUNTRY_ID 
                                  , COUNT(d.DEPARTMENT_ID ) d_count
                              FROM COUNTRIES c 
                              LEFT JOIN LOCATIONS l ON c.COUNTRY_ID = l.COUNTRY_ID
                              LEFT JOIN DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID
                             GROUP BY c.COUNTRY_ID )
SELECT c.COUNTRY_NAME
  FROM COUNTRIES c 
  LEFT JOIN COUNTRY_DEPARTMENT cd ON c.COUNTRY_ID = cd.COUNTRY_ID 
 WHERE cd.D_COUNT = 0
;

-- 81. 'Europe' 에서 근무중인 사원들의 모든 정보를 조회한다.
SELECT e.*
  FROM EMPLOYEES e 
  LEFT JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  LEFT JOIN LOCATIONS l  ON d.LOCATION_ID = l.LOCATION_ID
  LEFT JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID 
  LEFT JOIN REGIONS r ON c.REGION_ID = r.REGION_ID
 WHERE r.REGION_NAME = 'Europe'
;

-- 82. 'Seattle' 에서 근무중인 사원의 이름, 성, 급여, 부서명 을 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , e.SALARY 
      , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
  JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE d.LOCATION_ID = (SELECT l.LOCATION_ID 
                          FROM LOCATIONS l 
                         WHERE l.CITY = 'Seattle') 
;

 
-- 83. 'Seattle' 에서 근무하지 않는 모든 사원의 이름, 성, 급여, 부서명, 도시를 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , e.SALARY 
      , d.DEPARTMENT_NAME 
      , l.CITY
  FROM EMPLOYEES e 
  JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 WHERE l.CITY != 'Seattle'
;

-- 84. 모든 사원들의 이름, 성, 급여, 부서명을 부서번호로 내림차순 정렬하여 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , e.SALARY 
      , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
  JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 ORDER BY d.DEPARTMENT_ID 
;

-- 85. 2007년에 직무가 변경된 사원들의 현재 직무명, 부서명, 사원번호, 이름, 성을 조회한다.
SELECT j.JOB_TITLE 
      , d.DEPARTMENT_NAME 
      , e.EMPLOYEE_ID 
      , e.FIRST_NAME 
      , e.LAST_NAME 
  FROM JOB_HISTORY jh 
 INNER JOIN EMPLOYEES e 
    ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID 
 INNER JOIN DEPARTMENTS d  
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE jh.END_DATE >= TO_DATE('20070101', 'YYYYMMDD')
   AND jh.END_DATE <= TO_DATE('20071231', 'YYYYMMDD')
;

SELECT j.JOB_TITLE 
      , d.DEPARTMENT_NAME 
      , e.EMPLOYEE_ID 
      , e.FIRST_NAME 
      , e.LAST_NAME 
  FROM EMPLOYEES e 
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID 
 INNER JOIN DEPARTMENTS d  
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE e.EMPLOYEE_ID IN (SELECT jh.EMPLOYEE_ID 
                            FROM JOB_HISTORY jh 
                           WHERE jh.END_DATE >= TO_DATE('20070101', 'YYYYMMDD')
                             AND jh.END_DATE <= TO_DATE('20071231', 'YYYYMMDD'))
;


-- 86. 부서장이 없는 부서명 중 첫 글자가 'C' 로 시작하는 부서명을 조회한다.
SELECT d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d 
 WHERE d.MANAGER_ID IS NULL
   AND d.DEPARTMENT_NAME LIKE 'C%'
;

-- 87. 지역변호가 1000 ~ 1999 사이인 지역내 부서의 모든 정보를 조회한다.
SELECT *
  FROM DEPARTMENTS d 
 WHERE d.LOCATION_ID >= 1000
   AND d.LOCATION_ID <= 1999
;

-- 88. 국가 아이디가 'C'로 시작하는 국가의 지역을 모두 조회한다.
SELECT *
  FROM LOCATIONS l 
 WHERE l.COUNTRY_ID LIKE 'C%'
;

-- 89. 109번 사원의 입사일 부터 1년 동안 입사한 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES e 
 WHERE e.HIRE_DATE >= (SELECT HIRE_DATE
                       FROM EMPLOYEES e 
                      WHERE e.EMPLOYEE_ID = 109)
   AND e.HIRE_DATE <= ADD_MONTHS((SELECT HIRE_DATE
                       FROM EMPLOYEES e 
                      WHERE e.EMPLOYEE_ID = 109), 1 * 12)
;

-- 90. 가장 먼저 입사한 사원의 입사일로부터 2년 동안 입사한사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES e 
 WHERE e.HIRE_DATE >= (SELECT MIN(HIRE_DATE)
                       FROM EMPLOYEES e )
   AND e.HIRE_DATE <= ADD_MONTHS((SELECT MIN(HIRE_DATE)
                                    FROM EMPLOYEES e ), 2 * 12)
;
-- 91. 가장 늦게 입사한 사원의 입사일의 1년 전보다 일찍 입사한 사원의 모든 정보를 조회한다.
SELECT *
  FROM EMPLOYEES e 
 WHERE e.HIRE_DATE < ADD_MONTHS((SELECT MAX(HIRE_DATE)
                                    FROM EMPLOYEES e ), -1 * 12)
;
-- 92. 사원들이 근무하는 부서명, 이름, 성을 조회한다.
SELECT d.DEPARTMENT_NAME 
      , e.FIRST_NAME 
      , e.LAST_NAME 
  FROM EMPLOYEES e 
  JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
;

-- 93. 우편번호가 5자리인 도시에서 근무하는 사원명, 부서명, 도시명, 우편번호를 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , d.DEPARTMENT_NAME 
      , l.CITY 
      , l.POSTAL_CODE 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l  
    ON d.LOCATION_ID = l.LOCATION_ID
 WHERE l.POSTAL_CODE LIKE '_____'
;

-- 94. 부서장이 있는 부서명 중 첫 글자가 'S' 로 시작하는 부서에서 근무중인 사원의 
--     이름과 직무명, 부서명을 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , j.JOB_TITLE 
      , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID 
 WHERE d.MANAGER_ID IS NOT NULL
   AND d.DEPARTMENT_NAME LIKE 'S%'
;

-- 95. 90, 60, 100번 부서에서 근무중인 사원의 이름, 성, 부서명을 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE d.DEPARTMENT_ID IN (90, 60, 100)
;

-- 96. 부서명이 5글자 미만인 부서에서 근무중인 사원의 이름, 부서명을 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE d.DEPARTMENT_NAME NOT LIKE '_____%'
;

-- 97. 도시명에 띄어쓰기 " " 가 포함된 도시에서 근무중인 사원들의 부서명, 도시명, 사원명을 조회한다.
SELECT d.DEPARTMENT_NAME 
      , l.CITY 
      , e.FIRST_NAME 
      , e.LAST_NAME 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l  
    ON d.LOCATION_ID = l.LOCATION_ID
 WHERE l.CITY LIKE '% %'
;
  
-- 98. 우편번호에 공백이 없는 도시에서 근무하는 사원의 이름, 부서명, 우편번호를 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , d.DEPARTMENT_NAME 
      , l.POSTAL_CODE 
  FROM EMPLOYEES e
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l  
    ON d.LOCATION_ID = l.LOCATION_ID
 WHERE l.POSTAL_CODE NOT LIKE '% %'
;

-- 99. "주"가 없는 도시에서 근무하는 사원의 이름, 도시를 조회한다.
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
      , l.CITY 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID 
 WHERE l.STATE_PROVINCE IS NULL
;

-- 100. 사원들의 사원번호, 이름, 성, 상사의 사원번호, 상사의 이름, 상사의 성을 조회한다.
SELECT e.EMPLOYEE_ID 
      , e.FIRST_NAME 
      , e.LAST_NAME 
      , e2.EMPLOYEE_ID 
      , e2.FIRST_NAME 
      , e2.LAST_NAME 
  FROM EMPLOYEES e 
  JOIN EMPLOYEES e2 ON e.MANAGER_ID = e2.EMPLOYEE_ID 

;

-- 101. 직무가 변경된 사원의 과거 직무명과 현재 직무명을 조회한다.
SELECT old_j.JOB_TITLE 
     , now_j.JOB_TITLE 
  FROM JOB_HISTORY jh 
 INNER JOIN EMPLOYEES e 
    ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID
 INNER JOIN JOBS old_j
    ON jh.JOB_ID = old_j.JOB_ID
 INNER JOIN JOBS now_j
    ON e.JOB_ID = now_j.JOB_ID
;
-- 102. 가장 적은 급여를 받는 사원의 부서명, 이름, 성, 급여, 부서장사원번호를 조회한다.
SELECT d.DEPARTMENT_NAME 
     , e.FIRST_NAME 
     , e.LAST_NAME 
     , e.SALARY 
     , d.MANAGER_ID 
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE e.SALARY = (SELECT MIN(SALARY)
                      FROM EMPLOYEES)
;
 
-- 103. 부서명별 사원의 수를 조회한다.
SELECT d.DEPARTMENT_NAME 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 GROUP BY d.DEPARTMENT_NAME 
 ORDER BY d.DEPARTMENT_NAME
;
-- 104. 대륙명별 사원의 수를 조회한다.
SELECT r.REGION_NAME 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 INNER JOIN COUNTRIES c 
    ON l.COUNTRY_ID = c.COUNTRY_ID
 INNER JOIN REGIONS r 
    ON c.REGION_ID = r.REGION_ID
 GROUP BY r.REGION_NAME 
 ORDER BY r.REGION_NAME 
;
-- 105. 직무명별 최소급여를 조회한다.
SELECT j.JOB_TITLE  
     , MIN(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN JOBS j  
    ON e.JOB_ID = j.JOB_ID  
 GROUP BY j.JOB_TITLE 
 ORDER BY j.JOB_TITLE 
;

--SELECT j.JOB_TITLE 
--     , j.MIN_SALARY 
--  FROM JOBS j
-- ORDER BY j.JOB_TITLE 
--;

-- 106. 부서명별 최대급여를 조회한다.
SELECT d.DEPARTMENT_NAME 
     , MAX(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
 GROUP BY d.DEPARTMENT_NAME
;

-- 107. 직무명별 평균급여를 평균급여순으로 오름차순 정렬하여 조회한다.
SELECT j.JOB_TITLE 
     , AVG(e.SALARY ) AS avg_salary
  FROM EMPLOYEES e 
 INNER JOIN JOBS j 
    ON e.JOB_ID  = j.JOB_ID 
 GROUP BY j.JOB_TITLE 
 ORDER BY AVG_SALARY ASC
;
-- 108. 부서명별 평균급여를 내림차순 정렬하여 조회한다.
SELECT d.DEPARTMENT_NAME 
     , AVG(e.SALARY )AS avg_salary
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
 GROUP BY d.DEPARTMENT_NAME
 ORDER BY AVG_SALARY DESC
;
-- 109. 부서명별 급여의 합을 내림차순 정렬하여 조회한다.
SELECT d.DEPARTMENT_NAME 
     , SUM(e.SALARY )AS sum_salary
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
 GROUP BY d.DEPARTMENT_NAME
 ORDER BY sum_SALARY DESC
;
-- 110. 직무명별 사원의 수를 오름차순 정렬하여 조회한다.
SELECT j.JOB_TITLE 
     , COUNT(e.EMPLOYEE_ID ) AS E_COUNT
  FROM EMPLOYEES e 
 INNER JOIN JOBS j 
    ON e.JOB_ID  = j.JOB_ID 
 GROUP BY j.JOB_TITLE 
 ORDER BY E_COUNT ASC
;
-- 111. 직무명, 부서명 별 사원 수, 평균급여를 조회한다.
SELECT j.JOB_TITLE 
     , d.DEPARTMENT_NAME 
     , COUNT(e.EMPLOYEE_ID )
     , AVG(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 GROUP BY j.JOB_TITLE, d.DEPARTMENT_NAME 
;
-- 112. 도시별 사원 수를 조회한다.
SELECT l.CITY 
     , COUNT(E.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 GROUP BY l.CITY
;

-- 113. 국가별 사원 수, 최대급여, 최소급여를 조회한다.
SELECT c.COUNTRY_NAME 
     , COUNT(e.EMPLOYEE_ID )
     , MAX(e.SALARY )
     , MIN(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 INNER JOIN COUNTRIES c 
    ON l.COUNTRY_ID = c.COUNTRY_ID
 GROUP BY c.COUNTRY_NAME 
;
 
-- 114. 국가별로 급여가 5000 이상인 사원의 수를 조회한다.
SELECT c.COUNTRY_NAME 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 INNER JOIN COUNTRIES c 
    ON l.COUNTRY_ID = c.COUNTRY_ID
 WHERE e.SALARY >= 5000
 GROUP BY c.COUNTRY_NAME 
;

-- 115. 부서명, 직무명 별 평균 급여를 조회한다.
SELECT d.DEPARTMENT_NAME 
     , j.JOB_TITLE 
     , AVG(e.SALARY )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 GROUP BY j.JOB_TITLE, d.DEPARTMENT_NAME 
;

-- 116. 도시명, 직무명 별 사원의 수를 조회한다.
SELECT l.CITY 
     , j.JOB_TITLE 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 INNER JOIN JOBS j 
    ON e.JOB_ID = j.JOB_ID
 GROUP BY l.CITY , j.JOB_TITLE 
;

-- 117. 부서명, 직무명 별 평균 급여 중 가장 작은 평균급여를 받는 부서명, 직무명을 조회한다.
WITH jas AS (
    SELECT d.DEPARTMENT_NAME 
         , j.JOB_TITLE 
         , AVG(e.SALARY ) AS avg_sal
      FROM EMPLOYEES e 
     INNER JOIN DEPARTMENTS d 
        ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
     INNER JOIN JOBS j 
        ON e.JOB_ID = j.JOB_ID
     GROUP BY j.JOB_TITLE, d.DEPARTMENT_NAME 
)
SELECT jas.DEPARTMENT_NAME 
     , jas.JOB_TITLE 
  FROM jas
 WHERE jas.avg_sal = (SELECT MIN(jas.avg_sal)
                        FROM jas)
;
-- 118. 대륙명별 사원 수를 대륙명으로 오름차순 정렬하여 조회한다.
SELECT r.REGION_NAME 
     , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 INNER JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
 INNER JOIN COUNTRIES c 
    ON l.COUNTRY_ID = c.COUNTRY_ID
 INNER JOIN REGIONS r 
    ON c.REGION_ID = r.REGION_ID
 GROUP BY r.REGION_NAME 
 ORDER BY r.REGION_NAME ASC

-- 119. 직무명별 최대급여보다 더 많은 급여를 받는 사원의 모든 정보를 조회한다.
WITH job_max AS (
    SELECT j.JOB_ID  
         , MAX(e.SALARY ) j_max
      FROM EMPLOYEES e
     INNER JOIN JOBS j 
        ON e.JOB_ID = j.JOB_ID
     GROUP BY j.JOB_ID)
SELECT e.*
  FROM EMPLOYEES e 
 INNER JOIN job_max ON e.JOB_ID = JOB_MAX.JOB_ID 
 WHERE e.SALARY > job_max.J_MAX 
;
  
-- 120. 입사연도별 최소급여를 조회한다.
WITH hire_year AS (
    SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY') AS YEAR
         , SALARY 
      FROM EMPLOYEES
)
SELECT "YEAR" 
     , MIN(SALARY)
  FROM hire_year
 GROUP BY "YEAR" 
;
-- 121. 사원 이름의 글자수 별 사원의 수를 조회한다.
WITH name_len AS (
    SELECT e.EMPLOYEE_ID 
         , LENGTH(e.FIRST_NAME ) AS len 
      FROM EMPLOYEES e 
)
SELECT len
     , COUNT(name_len.EMPLOYEE_ID)
  FROM name_len
 GROUP BY LEN 
 ORDER BY LEN
;
-- 122. 사원 성의 글자수 별 사원의 수를 조회한다.
-- 123. 커미션을 포함한 급여가 10000 이상인 사원의 모든 정보를 조회한다.
-- 124. 국가 아이디의 첫 글자와 국가명의 첫 글자가 다른 모든 국가를 조회한다.
-- 125. 이름의 첫 번째 글자별 평균급여를 조회한다.
-- 126. 많은 급여를 받는 10명을 조회한다.
-- 127. 많은 급여를 받는 사원 중 11번 째 부터 20번째를 조회한다.
-- 128. 가장 적은 급여를 받는 중 90번 째 부터 100번째를 조회한다.
-- 129. 가장 적은 급여를 받는 사원의 상사명, 부서명을 조회한다.
SELECT e2.FIRST_NAME 
      , d.DEPARTMENT_NAME 
  FROM EMPLOYEES e 
 INNER JOIN EMPLOYEES e2 
    ON e.MANAGER_ID = e2.EMPLOYEE_ID
 INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
  WHERE e.SALARY = (SELECT MIN(SALARY) 
                       FROM EMPLOYEES)
;
-- 130. 'PU_CLERK' 직무인 2번째 부터 5번째 사원의 부서명, 직무명을 조회한다.
-- 131. 월별 최대급여 중 2번째 부터 4번째 데이터만 조회한다.
-- 132. 근무중인 사원이 가장 많은 도시와 사원의 수를 조회한다.  
-- 133. 사원의 수가 가장 많은 부서명, 사원의 수를 조회한다.
-- 134. 가장 많은 부서가 있는 도시를 조회한다.
-- 135. 가장 많은 사원이 있는 부서의 국가명을 조회한다.
-- 136. 'Europe' 에서 가장 많은 사원들이 있는 부서명을 조회한다.
-- 137. 100번 사원의 모든 부하직원을 계층조회한다. 단, LEVEL이 4인 사원은 제외한다.
 SELECT EMPLOYEE_ID
      , FIRST_NAME || ' ' || LAST_NAME AS NAME
      , MANAGER_ID
      , LEVEL
   FROM EMPLOYEES e 
  WHERE LEVEL < 4
  START WITH e.EMPLOYEE_ID = 100
CONNECT BY PRIOR e.EMPLOYEE_ID = e.MANAGER_ID
;
-- 138. 101번 사원의 모든 부하직원 들의 이름, 성, 상사사원번호, 상사사원명을 계층 조회한다.
 SELECT e.EMPLOYEE_ID  
      , e.FIRST_NAME || ' ' || e.LAST_NAME AS NAME
      , e.MANAGER_ID 
      , me.FIRST_NAME || ' ' || me.LAST_NAME AS MANAGER
      , LEVEL
   FROM EMPLOYEES e 
   LEFT JOIN EMPLOYEES me
     ON e.MANAGER_ID = me.EMPLOYEE_ID
  START WITH e.EMPLOYEE_ID = 101
CONNECT BY PRIOR e.EMPLOYEE_ID = e.MANAGER_ID
;
-- 139. 114번 직원의 모든 상사들의 이름, 성, 상사사원번호, 상사사원명을 계층 조회다.
 SELECT e.EMPLOYEE_ID  
      , e.FIRST_NAME || ' ' || e.LAST_NAME AS NAME
      , e.MANAGER_ID 
      , me.FIRST_NAME || ' ' || me.LAST_NAME AS MANAGER
      , LEVEL
   FROM EMPLOYEES e 
   LEFT JOIN EMPLOYEES me
     ON e.MANAGER_ID = me.EMPLOYEE_ID
  START WITH e.EMPLOYEE_ID = 114
CONNECT BY PRIOR e.MANAGER_ID = e.EMPLOYEE_ID
;
-- 140. 114번 직원의 모든 상사들의 이름, 성, 상사사원번호, 상사사원명을 역순으로 계층 조회한다.
 SELECT e.EMPLOYEE_ID  
      , e.FIRST_NAME || ' ' || e.LAST_NAME AS NAME
      , e.MANAGER_ID 
      , me.FIRST_NAME || ' ' || me.LAST_NAME AS MANAGER
      , LEVEL
   FROM EMPLOYEES e 
   LEFT JOIN EMPLOYEES me
     ON e.MANAGER_ID = me.EMPLOYEE_ID
  START WITH e.EMPLOYEE_ID = 109
CONNECT BY PRIOR e.MANAGER_ID = e.EMPLOYEE_ID
  ORDER BY LEVEL DESC
;
-- 141. 부서별 사원의 수를 조인을 이용해 다음과 같이 조회한다."부서명 (사원의 수)"
-- 142. 부서별 사원의 수를 스칼라쿼리를 이용해 다음과 같이 조회한다. "부서명 (사원의 수)"
-- 143. 사원의 정보를 다음과 같이 조회한다. "사원번호 번 사원의 이름은 성이름 입니다."
-- 144. 사원의 정보를 스칼라쿼리를 이용해 다음과 같이 조회한다. 
--      "사원번호 번 사원의 상사명은 상사명 입니다."
-- 145. 사원의 정보를 조인을 이용해 다음고 같이 조회한다. "사원명 (직무명)"
-- 146. 사원의 정보를 스칼라쿼리를 이용해 다음과 같이 조회한다. "사원명 (직무명)"
-- 147. 부서별 급여 차이(최고급여 - 최저급여)가 가장 큰 부서명을 조회한다.
-- 148. 부서별 급여 차이(최고급여 - 최저급여)가 가장 큰 부서에서 근무하는 사원들의 직무명을 
--      중복없이 조회한다.
-- 149. 부하직원이 없는 사원의 모든 정보를 조회한다.
   
SELECT *
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID NOT IN (SELECT DISTINCT manager.EMPLOYEE_ID 
                                  FROM EMPLOYEES e 
                                 INNER JOIN EMPLOYEES manager
                                    ON e.MANAGER_ID = manager.EMPLOYEE_ID)
;

SELECT *
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID NOT IN (SELECT DISTINCT MANAGER_ID 
                                 FROM EMPLOYEES
                                WHERE MANAGER_ID IS NOT NULL)
;

-- 150. 사원번호가 100번인 사원의 사원번호, 이름과 
--      사원번호로 내림차순 정렬된 사원의 사원번호, 이름을 조회한다.
/*조회 예
--------------------
100    Steven
206    William
205    Shelley
204    Hermann
203    Susan
202    Pat
201    Michael
200    Jennifer
199    Douglas
198    Donald
197    Kevin
196    Alana
...
*/
