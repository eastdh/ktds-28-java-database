--각 문제를 풀고 문제 마다 조회된 ROW의 수를 댓글로 작성하세요.
--1. 사원 테이블의 모든 컬럼과 모든 행을 조회하시오.
-- 1번: 107개
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

--2. 사원의 이름과 급여만 조회하시오.
-- 2번: 107개
SELECT FIRST_NAME
      , SALARY 
  FROM EMPLOYEES
  ;

--3. 모든 사원의 이름, 성, 급여를 조회하시오.
-- 3번: 107개
SELECT FIRST_NAME
      , LAST_NAME
      , SALARY 
  FROM EMPLOYEES
  ;

--4. 모든 사원의 이름과 성을 조회하시오.
-- 4번: 107개
SELECT FIRST_NAME
      , LAST_NAME
  FROM EMPLOYEES
  ;

--5. 모든 사원의 연봉(SALARY * 12)을 조회하시오.
-- 5번: 107개
SELECT SALARY * 12
  FROM EMPLOYEES
;

--6. 모든 부서명을 중복 없이 조회하시오.
-- 6번: 27개
SELECT DISTINCT DEPARTMENT_NAME
  FROM DEPARTMENTS
;

--7. 직무 ID와 직무명을 조회하시오.
-- 7번: 19개
SELECT JOB_ID 
      , JOB_TITLE 
  FROM JOBS
;

--8. 모든 사원을 급여가 높은 순으로 정렬해 조회하시오.
-- 8번: 107개
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
 ORDER BY SALARY DESC
;

--9. 모든 사원을 입사일이 빠른 순으로 정렬해 조회하시오.
-- 9번: 107개
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
 ORDER BY HIRE_DATE ASC
;
--10. 사원을 부서번호 오름차순, 같은 부서 내에서는 급여 내림차순으로 정렬해 조회하시오.
-- 10번: 107개
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
 ORDER BY DEPARTMENT_ID ASC
      , SALARY DESC
;

--11. 사원을 '성'기준 알파벳순으로 정렬해 이름과 성을 조회하시오.
-- 11번: 107개
SELECT FIRST_NAME
      , LAST_NAME
  FROM EMPLOYEES
 ORDER BY LAST_NAME  ASC
;

--12. 모든 부서의 정보를 부서명 기준 오름차순으로 정렬해 모든 정보를 조회하시오.
-- 12번: 27개
SELECT DEPARTMENT_ID 
      , DEPARTMENT_NAME
      , MANAGER_ID 
      , LOCATION_ID 
  FROM DEPARTMENTS
 ORDER BY DEPARTMENT_NAME ASC
;

--13. 커미션이 있는 사원만 커미션이 높은 순으로 정렬해 모든 정보를 조회하시오.
-- 13번: 35개
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
 WHERE COMMISSION_PCT IS NOT NULL
 ORDER BY COMMISSION_PCT DESC
;

--14. 급여가 10000 이상인 사원을 조회하시오.
-- 14번: 19개
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
 WHERE SALARY >= 10000
;

--15. 급여가 5000 이상 10000 이하인 사원을 BETWEEN으로 조회하시오.
-- 15번: 43개
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
 WHERE SALARY BETWEEN 5000 AND 10000
;
--16. 부서번호가 50, 60, 90인 사원을 조회하시오.
-- 16번: 53개
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
 WHERE DEPARTMENT_ID IN (50, 60, 90)
;

--17. 성이 'King'인 사원을 조회하시오.
-- 17번: 2개
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
 WHERE LAST_NAME = 'King'
;

--18. 커미션이 없는 사원을 조회하시오.
-- 18번: 72개
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
 WHERE COMMISSION_PCT IS NULL
;

--19. 커미션이 있는 사원을 조회하시오.
-- 19번: 35개
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
 WHERE COMMISSION_PCT IS NOT NULL
;

--20. 부서번호가 50이면서 급여가 5000을 초과하는 사원을 조회하시오.
-- 20번: 5개
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
 WHERE DEPARTMENT_ID = 50
   AND SALARY > 5000
;

--21. 부서번호가 10이거나 20인 사원을 조회하시오.
-- 21번: 3개
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
 WHERE DEPARTMENT_ID IN (10, 20)
;

--22. 직무아이디가 'IT_PROG'가 아닌 사원을 조회하시오.
-- 22번: 102개
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
 WHERE JOB_ID != 'IT_PROG'
;

--23. 입사일이 2005년 1월 1일 이후인 사원을 조회하시오.
-- 23번: 83개
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
 WHERE HIRE_DATE > TO_DATE('20050101', 'YYYYMMDD')
;
--24. 상사가 없는 최상위 사원을 조회하시오.
-- 24번: 1개
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
 WHERE MANAGER_ID IS NULL
;

--25. 입사일을 "YYYY-MM-DD" 형식의 문자열로 변환해 조회하시오.
-- 25번: 107개
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
;

--26. 입사일을 "YYYY년 MM월 DD일" 형식으로 변환해 조회하시오.
---- 날짜 포멧에 한글이 들어갈 경우 ORACLE 에러 발생!
---- 아래처럼 큰 따옴표("") 이용하면 에러 없음.
---- SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"')
----   FROM DUAL
-- 26번: 107개
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"')
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
;

--27. 각 사원의 입사일로부터 6개월 후의 날짜를 조회하시오.
-- 27번: 107개
SELECT EMPLOYEE_ID 
      , FIRST_NAME
      , LAST_NAME
      , EMAIL
      , PHONE_NUMBER
      , TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"')
      , TO_CHAR(ADD_MONTHS(HIRE_DATE, 6), 'YYYY"년" MM"월" DD"일"')
      , JOB_ID
      , SALARY 
      , COMMISSION_PCT 
      , MANAGER_ID 
      , DEPARTMENT_ID 
  FROM EMPLOYEES
  ;
