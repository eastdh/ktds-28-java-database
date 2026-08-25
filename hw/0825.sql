-- 151. 모든 사원들의 이름과 부서번호, 부서명을 조회한다. 근무중인 부서가 없는 경우도 조회한다.
SELECT e.FIRST_NAME
     , d.DEPARTMENT_ID
     , d.DEPARTMENT_NAME
  FROM EMPLOYEES e 
  LEFT JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
;
-- 152. 모든 사원들의 이름과 부서번호, 부서명, 근무중인 도시를 조회한다. 근무중인 부서가 없거나 근무중인 도시가 없는 경우도 조회한다.
SELECT e.FIRST_NAME
     , d.DEPARTMENT_ID
     , d.DEPARTMENT_NAME
     , l.CITY 
  FROM EMPLOYEES e 
  LEFT JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  LEFT JOIN LOCATIONS l 
    ON d.LOCATION_ID = l.LOCATION_ID
;
-- 153. 부서별로 근무중인 사원의 수를 조회한다. 근무중인 사원이 없는 부서는 0으로 조회한다.
SELECT d.DEPARTMENT_NAME 
     , COUNT(e.EMPLOYEE_ID ) AS e_cnt
  FROM DEPARTMENTS d 
  LEFT JOIN EMPLOYEES e 
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
 GROUP BY d.DEPARTMENT_NAME 
 ORDER BY E_CNT DESC
;
-- 154. 도시별로 존재하는 부서의 수를 조회한다. 존재하는 부서가 없는 도시는 0으로 조회한다.
SELECT l.CITY 
     , COUNT(d.DEPARTMENT_ID) AS d_cnt
  FROM LOCATIONS l 
  LEFT JOIN DEPARTMENTS d 
    ON l.LOCATION_ID = d.LOCATION_ID
 GROUP BY l.CITY 
 ORDER BY D_CNT DESC
;
-- 155. 도시별로 근무주인 사원의 수를 조회한다. 근무중인 사원이 없는 도시는 0으로 조회한다.
SELECT l.CITY 
     , COUNT(e.EMPLOYEE_ID ) AS e_cnt
  FROM LOCATIONS l
  LEFT JOIN DEPARTMENTS d 
    ON d.LOCATION_ID = l.LOCATION_ID
  LEFT JOIN EMPLOYEES e  
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 GROUP BY l.CITY 
 ORDER BY e_cnt DESC
;
-- 156. 모든 사원의 정보와 직무 변경이력을 함께 조회한다. 직무변경이력이 없는 사원도 함께 조회한다.
SELECT *
  FROM EMPLOYEES e 
  LEFT JOIN JOB_HISTORY jh 
    ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
;
-- 157. 모든 사원의 현재 수행중인 직무명, 현재 근무중인 부서명, 이전에 수행한 직무명, 이전에 근무한 부서명을 조회한다.
--     과거 직무와 이전 부서명이 없는 사원도 함께 조회한다.
SELECT now.EMPLOYEE_ID 
     , now.JOB_TITLE AS now_job
     , now.DEPARTMENT_NAME AS now_department
     , old.JOB_TITLE AS old_job
     , old.DEPARTMENT_NAME AS old_department
  FROM (SELECT e.EMPLOYEE_ID 
             , j.JOB_TITLE 
             , d.DEPARTMENT_NAME 
          FROM EMPLOYEES e 
         INNER JOIN DEPARTMENTS d 
            ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         INNER JOIN JOBS j
            ON e.JOB_ID = j.JOB_ID ) now 
  LEFT JOIN (SELECT jh.EMPLOYEE_ID 
                  , j.JOB_TITLE 
                  , d.DEPARTMENT_NAME 
               FROM JOB_HISTORY jh
              INNER JOIN JOBS j
                 ON jh.JOB_ID = j.JOB_ID
              INNER JOIN DEPARTMENTS d
                 ON jh.DEPARTMENT_ID = d.DEPARTMENT_ID) old 
    ON now.EMPLOYEE_ID = old.EMPLOYEE_ID
;
