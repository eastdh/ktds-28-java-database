--1. 이름이 'S'로 시작하는 사원을 조회하시오.
-- 1: 13 rows
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
  FROM EMPLOYEES e 
 WHERE e.FIRST_NAME LIKE 'S%'
;
--2. 이름에 'an'이 포함된 사원을조회하시오.
-- 2: 19 rows
SELECT e.FIRST_NAME 
      , e.LAST_NAME 
  FROM EMPLOYEES e 
 WHERE e.FIRST_NAME LIKE '%an%'
;
--3. EMAIL이 'A'로 끝나는 사원을 조회하시오.
-- 3: 5 rows
SELECT e.FIRST_NAME 
      , e.LAST_NAME
      , e.EMAIL 
  FROM EMPLOYEES e 
 WHERE e.EMAIL  LIKE '%A'
;
--4. 이름을 모두 대문자로 변환해 조회하시오.
-- 4: 107 rows
SELECT UPPER(e.FIRST_NAME) 
      , e.LAST_NAME
  FROM EMPLOYEES e 
;
--5. 성을 모두 소문자로 변환해 조회하시오.
-- 5: 107 rows
SELECT e.FIRST_NAME 
      , LOWER(e.LAST_NAME)
  FROM EMPLOYEES e 
;
--6. 전체 사원 수를 조회하시오.
-- 6: 1 row
SELECT COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
;
--7. 전체 사원의 급여 합계를 조회하시오.
-- 7: 1 row
SELECT SUM(e.SALARY)
  FROM EMPLOYEES e 
;
--8. 전체 사원의 평균 급여를 조회하시오.
-- 8: 1 row
SELECT AVG(e.SALARY)
  FROM EMPLOYEES e 
;
--9. 가장 높은 급여와 가장 낮은 급여를 함께 조회하시오.
-- 9: 1 row
SELECT MAX(e.SALARY)
      , MIN(e.SALARY)
  FROM EMPLOYEES e 
;
--10. 부서별 사원 수를 조회하시오.
-- 10: 11 rows
SELECT e.DEPARTMENT_ID 
      , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 WHERE e.DEPARTMENT_ID IS NOT NULL
 GROUP BY e.DEPARTMENT_ID 
 
;
--11. 부서별 평균 급여를 조회하시오.
-- 11: 11 rows
SELECT e.DEPARTMENT_ID 
      , AVG(e.SALARY )
  FROM EMPLOYEES e 
 WHERE e.DEPARTMENT_ID IS NOT NULL
 GROUP BY e.DEPARTMENT_ID 
;
--12. 직무아이디별 최고 급여와 평균 급여를 조회하시오.
-- 12: 19 rows
SELECT e.JOB_ID 
      , MAX(e.SALARY )
      , AVG(e.SALARY )
  FROM EMPLOYEES e 
 GROUP BY e.JOB_ID 
;
--13. 부서아이디별, 직무아이디별 사원 수를 함께 조회하시오.
-- 13: 20 rows
SELECT e.DEPARTMENT_ID 
      , e.JOB_ID 
      , COUNT(e.EMPLOYEE_ID)
  FROM EMPLOYEES e 
 GROUP BY e.DEPARTMENT_ID, e.JOB_ID 
 ORDER BY e.DEPARTMENT_ID  
;
--14. 상사번호별로 관리하는 사원 수를 조회하시오.
-- 14: 19 rows
SELECT e.MANAGER_ID 
      , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 GROUP BY e.MANAGER_ID 
 ORDER BY e.MANAGER_ID 
;
  
--15. 사원 수가 5명 이상인 부서번호만 조회하시오.
-- 15: 5 rows
SELECT e.DEPARTMENT_ID 
      , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 GROUP BY e.DEPARTMENT_ID 
HAVING COUNT(e.EMPLOYEE_ID ) >= 5
 ORDER BY e.DEPARTMENT_ID 
;

--16. 평균 급여가 8000 이상인 부서아이디만 조회하시오.
-- 16: 6 rows
SELECT e.DEPARTMENT_ID 
      , AVG(e.SALARY )
  FROM EMPLOYEES e 
 GROUP BY e.DEPARTMENT_ID 
HAVING AVG(e.SALARY ) >= 8000
 ORDER BY e.DEPARTMENT_ID 
;
--17. 최고 급여가 15000을 초과하는 직무아이디만 조회하시오.
-- 17: 2 rows
SELECT e.JOB_ID 
      , MAX(e.SALARY )
  FROM EMPLOYEES e 
 GROUP BY e.JOB_ID 
HAVING MAX(e.SALARY ) > 15000
;
--18. 부서별 급여 합계가 30000을 초과하는 부서아이디만 조회하시오.
-- 18: 4 rows
SELECT e.DEPARTMENT_ID 
      , SUM(e.SALARY )
  FROM EMPLOYEES e 
 GROUP BY e.DEPARTMENT_ID 
HAVING SUM(e.SALARY ) >= 30000
;
--19. 관리하는 사원이 2명 이상인 매니저만 조회하시오.
-- 19: 15 rows
SELECT e.MANAGER_ID 
      , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 GROUP BY e.MANAGER_ID 
HAVING COUNT(e.EMPLOYEE_ID ) >= 2
;
--20. 부서별 급여 합계가 30000을 초과하는 부서아이디만 조회하시오.
-- 20: 4 rows
SELECT e.DEPARTMENT_ID 
      , SUM(e.SALARY )
  FROM EMPLOYEES e 
 GROUP BY e.DEPARTMENT_ID 
HAVING SUM(e.SALARY ) >= 30000
;
--21. 관리하는 사원이 2명 이상인 매니저만 조회하시오.
-- 21: 15 rows
SELECT e.MANAGER_ID 
      , COUNT(e.EMPLOYEE_ID )
  FROM EMPLOYEES e 
 GROUP BY e.MANAGER_ID 
HAVING COUNT(e.EMPLOYEE_ID ) >= 2
;
--22. 전체 평균 급여보다 높은 급여를 받는 사원을 조회하시오.
-- 22: 51 rows
SELECT e.FIRST_NAME
     , e.LAST_NAME 
     , e.SALARY 
  FROM EMPLOYEES e
 WHERE e.SALARY > (SELECT AVG(e.SALARY)
					FROM EMPLOYEES e )
;
--23. 'IT' 부서에서 근무하는 사원을 조회하시오.
-- 23: 5 rows
SELECT e.FIRST_NAME 
     , e.LAST_NAME 
  FROM EMPLOYEES e 
 WHERE e.DEPARTMENT_ID = (SELECT d.DEPARTMENT_ID 
						  FROM DEPARTMENTS d
						 WHERE d.DEPARTMENT_NAME = 'IT') 
;
--24. 가장 급여가 높은 사원을 조회하시오.
-- 24: 1 row
SELECT e.FIRST_NAME
     , e.LAST_NAME 
     , e.SALARY 
  FROM EMPLOYEES e
 WHERE e.SALARY = (SELECT MAX(e.SALARY)
					FROM EMPLOYEES e )
;						 
--25. 'King'이라는 성을 가진 사원과 같은 부서에서 근무하는 사원을 조회하시오. (본인 제외)
-- 25: 35 rows
SELECT e.FIRST_NAME 
     , e.LAST_NAME 
     , e.DEPARTMENT_ID 
  FROM EMPLOYEES e 
 WHERE e.LAST_NAME != 'King'
   AND e.DEPARTMENT_ID IN (SELECT e.DEPARTMENT_ID 
						  FROM EMPLOYEES e 
						 WHERE e.LAST_NAME = 'King')	
;						 
--26. 사원이 한 명도 없는 부서번호와 부서명을 조회하시오.
-- 26: 16 rows
SELECT d.DEPARTMENT_ID 
     , d.DEPARTMENT_NAME 
  FROM DEPARTMENTS d 
 WHERE d.DEPARTMENT_ID NOT IN (SELECT DISTINCT e.DEPARTMENT_ID  
								  FROM EMPLOYEES e 
								 WHERE e.DEPARTMENT_ID IS NOT NULL)
;
  
--27. 'Seattle'에 위치한 부서에서 근무하는 사원을 조회하시오.
--
--28. 직무변경 이력이 있는 사원의 이름과 성을 조회하시오.
-- 28: 7 rows
SELECT e.FIRST_NAME 
     , e.LAST_NAME 
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID IN (SELECT DISTINCT jh.EMPLOYEE_ID  
  							FROM JOB_HISTORY jh )
;
--29. 이직 이력이 없는 사원의 이름과 성을 조회하시오.
-- 29: 100 rows
SELECT e.FIRST_NAME 
     , e.LAST_NAME 
  FROM EMPLOYEES e 
 WHERE e.EMPLOYEE_ID NOT IN (SELECT DISTINCT jh.EMPLOYEE_ID  
  							FROM JOB_HISTORY jh )
;