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
SELECT COUNT(*)
  FROM EMPLOYEES
 WHERE MANAGER_ID = 102
;
-- 54. 113번 직원의 직속 부하직원의 수를 조회한다.
SELECT COUNT(*)
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
      , COUNT(*)
  FROM EMPLOYEES
 GROUP BY JOB_ID 
;

-- 59. 상사아이디별 부하직원의 수를 조회한다. 단, 부하직원이 2명 이하인 경우는 제외한다.
SELECT MANAGER_ID 
      , COUNT(*)
  FROM EMPLOYEES
 GROUP BY MANAGER_ID 
 HAVING COUNT(*) > 2
;

-- 60. 부서번호별 현재 시간으로부터 15년 전 보다 일찍 입사한 사원의 수를 조회한다.
SELECT DEPARTMENT_ID 
      , COUNT(*)
  FROM EMPLOYEES
  WHERE HIRE_DATE < ADD_MONTHS(SYSDATE, -180)
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
   AND e.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
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
-- 65. 평균 급여보다 적게 받는 사원들의 사원번호, 급여, 부서번호를 조회한다.
-- 66. 가장 많은 급여를 받는 사원의 사원번호, 이름, 급여를 조회한다.
-- 67. 자신의 상사보다 더 많은 급여를 받는 사원의 모든 정보를 조회한다.
-- 68. 자신의 상사보다 더 일찍 입사한 사원의 모든 정보를 조회한다.
-- 69. 가장 많은 커미션을 받는 사원의 모든 정보를 조회한다.
-- 70. 가장 적은 커미션을 받는 사원의 급여과 커미션을 조회한다.
-- 71. 사원이 속한 부서의 평균급여보다 적게 받는 사원의 모든 정보를 조회한다.
-- 72. 50번 부서의 부서장의 이름, 성, 급여를 조회한다.
-- 73. 사원이 없는 부서명을 조회한다.
-- 74. 직무가 변경된 사원의 모든 정보를 조회한다.
-- 75. 직무가 변경된적 없는 사원의 모든 정보를 조회한다.
-- 76. 직무가 가장 많이 변경된 부서의 이름을 조회한다.
-- 77. 근무중인 사원이 없는 도시를 조회한다.
-- 78. 급여가 7000 에서 12000 사이인 사원이 근무중인 도시를 조회한다.
-- 79. 'Seattle' 에서 근무중인 사원의 직무명을 중복없이 조회한다.
-- 80. 부서가 없는 국가명을 조회한다.
-- 81. 'Europe' 에서 근무중인 사원들의 모든 정보를 조회한다.
-- 82. 'Seattle' 에서 근무중인 사원의 이름, 성, 급여, 부서명 을 조회한다.
-- 83. 'Seattle' 에서 근무하지 않는 모든 사원의 이름, 성, 급여, 부서명, 도시를 조회한다.
-- 84. 모든 사원들의 이름, 성, 급여, 부서명을 부서번호로 내림차순 정렬하여 조회한다.
-- 85. 2007년에 직무가 변경된 사원들의 현재 직무명, 부서명, 사원번호, 이름, 성을 조회한다.
-- 86. 부서장이 없는 부서명 중 첫 글자가 'C' 로 시작하는 부서명을 조회한다.
-- 87. 지역변호가 1000 ~ 1999 사이인 지역내 부서의 모든 정보를 조회한다.
-- 88. 국가 아이디가 'C'로 시작하는 국가의 지역을 모두 조회한다.
-- 89. 109번 사원의 입사일 부터 1년 동안 입사한 사원의 모든 정보를 조회한다.
-- 90. 가장 먼저 입사한 사원의 입사일로부터 2년 동안 입사한사원의 모든 정보를 조회한다.
-- 91. 가장 늦게 입사한 사원의 입사일 보다 1년 앞서 입사한 사원의 모든 정보를 조회한다.
-- 92. 사원들이 근무하는 부서명, 이름, 성을 조회한다.
-- 93. 우편번호가 5자리인 도시에서 근무하는 사원명, 부서명, 도시명, 우편번호를 조회한다.
-- 94. 부서장이 있는 부서명 중 첫 글자가 'S' 로 시작하는 부서에서 근무중인 사원의 
--     이름과 직무명, 부서명을 조회한다.
-- 95. 90, 60, 100번 부서에서 근무중인 사원의 이름, 성, 부서명을 조회한다.
-- 96. 부서명이 5글자 미만인 부서에서 근무중인 사원의 이름, 부서명을 조회한다.
-- 97. 도시명에 띄어쓰기 " " 가 포함된 도시에서 근무중인 사원들의 부서명, 도시명, 사원명을 조회한다.
-- 98. 우편번호에 공백이 없는 도시에서 근무하는 사원의 이름, 부서명, 우편번호를 조회한다.
-- 99. "주"가 없는 도시에서 근무하는 사원의 이름, 도시를 조회한다.
-- 100. 사원들의 사원번호, 이름, 성, 상사의 사원번호, 상사의 이름, 상사의 성을 조회한다.
-- 101. 직무가 변경된 사원의 과거 직무명과 현재 직무명을 조회한다.
-- 102. 가장 적은 급여를 받는 사원의 부서명, 이름, 성, 급여, 부서장사원번호를 조회한다.
-- 103. 부서명별 사원의 수를 조회한다.
-- 104. 대륙명별 사원의 수를 조회한다.
-- 105. 직무명별 최소급여를 조회한다.
-- 106. 부서명별 최대급여를 조회한다.
-- 107. 직무명별 평균급여를 평균급여순으로 오름차순 정렬하여 조회한다.
-- 108. 부서명별 평균급여를 내림차순 정렬하여 조회한다.
-- 109. 부서명별 급여의 합을 내림차순 정렬하여 조회한다.
-- 110. 직무명별 사원의 수를 오름차순 정렬하여 조회한다.
-- 111. 직무명, 부서명 별 사원 수, 평균급여를 조회한다.
-- 112. 도시별 사원 수를 조회한다.
-- 113. 국가별 사원 수, 최대급여, 최소급여를 조회한다.
-- 114. 국가별로 급여가 5000 이상인 사원의 수를 조회한다.
-- 115. 부서명, 직무명 별 평균 급여를 조회한다.
-- 116. 도시명, 지역명 별 사원의 수를 조회한다.
-- 117. 부서명, 직무명 별 평균 급여 중 가장 작은 평균급여를 받는 부서명, 직무명을 조회한다.
-- 118. 대륙명별 사원 수를 대륙명으로 오름차순 정렬하여 조회한다.
-- 119. 직무명별 최대급여보다 더 많은 급여를 받는 사원의 모든 정보를 조회한다.
-- 120. 입사연도별 최소급여를 조회한다.
-- 121. 사원 이름의 글자수 별 사원의 수를 조회한다.
-- 122. 사원 성의 글자수 별 사원의 수를 조회한다.
-- 123. 커미션을 포함한 급여가 10000 이상인 사원의 모든 정보를 조회한다.
-- 124. 국가 아이디의 첫 글자와 국가명의 첫 글자가 다른 모든 국가를 조회한다.
-- 125. 이름의 첫 번째 글자별 평균급여를 조회한다.
-- 126. 많은 급여를 받는 10명을 조회한다.
-- 127. 많은 급여를 받는 사원 중 11번 째 부터 20번째를 조회한다.
-- 128. 가장 적은 급여를 받는 중 90번 째 부터 100번째를 조회한다.
-- 129. 가장 적은 급여를 받는 사원의 상사명, 부서명을 조회한다.
-- 130. 'PU_CLERK' 직무인 2번째 부터 5번째 사원의 부서명, 직무명을 조회한다.
-- 131. 월별 최대급여 중 2번째 부터 4번째 데이터만 조회한다.
-- 132. 근무중인 사원이 가장 많은 도시와 사원의 수를 조회한다.  
-- 133. 사원의 수가 가장 많은 부서명, 사원의 수를 조회한다.
-- 134. 가장 많은 부서가 있는 도시를 조회한다.
-- 135. 가장 많은 사원이 있는 부서의 국가명을 조회한다.
-- 136. 'Europe' 에서 가장 많은 사원들이 있는 부서명을 조회한다.
-- 137. 100번 사원의 모든 부하직원을 계층조회한다. 단, LEVEL이 4인 사원은 제외한다.
-- 138. 101번 사원의 모든 부하직원 들의 이름, 성, 상사사원번호, 상사사원명을 계층 조회한다.
-- 139. 114번 직원의 모든 상사들의 이름, 성, 상사사원번호, 상사사원명을 계층 조회한다.
-- 140. 114번 직원의 모든 상사들의 이름, 성, 상사사원번호, 상사사원명을 역순으로 계층 조회한다.
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
