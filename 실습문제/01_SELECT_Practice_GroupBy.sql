-- EMPLOYEE 테이블에서 부서코드, 부서(그룹) 별 급여 합계 조회
--    /*어떤 그룹을 묶어서 조회할 것인지를 추가로 작성해줌*/
SELECT DEPT_CODE                                       , SUM(SALARY) AS 월급합계, FLOOR(AVG(SALARY)) AS 평균월급 -- 그룹 별로 월급 합계 / 평균 월급 조회
FROM employee -- EMPLOYEE 테이블에서
GROUP BY DEPT_CODE; --DEPT_CODE 컬럼 값이 같은 행들끼리 묶어서

-- EMPLOYEE 테이블에서
-- 부서코드, 부서 별 급여의 합계, 부서 별 급여의 평균(정수처리), 인원수 조회하고
-- 부서코드 오름차순으로 정렬
-- SUM FLOOR AVG COUNT SELECT FROM GROUP BY ORDER BY
SELECT DEPT_CODE, SUM(SALARY) AS 급여합계, FLOOR(AVG(SALARY)) AS 급여평균, COUNT(*) AS 사원수
FROM employee
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

-- EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
-- 부서코드 오름차순 정렬 NULL인 행을 빼고 카운트
SELECT DEPT_CODE, COUNT(*) AS 사원수
FROM employee
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE ASC;

-- 1. EMPLOYEE 테이블에서 부서코드가 'D5', 'D6'인 부서의 평균 급여 조회
-- UPPER 함수는 문자열 하나를 변호나하기 위해 사용, 다중 값 사용 불가
SELECT DEPT_CODE,  FLOOR(AVG(SALARY)) AS 평균급여
FROM employee
WHERE UPPER(DEPT_CODE) IN ('D5', 'D6')
GROUP BY DEPT_CODE;

-- 2. EMPLOYEE 테이블에서 직급 별 2000년도 이후 입사자들의 급여 합을 조회
------ WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000
SELECT JOB_CODE, SUM(SALARY) AS 급여합계 
FROM employee
WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000 -- 특정 날짜 열에서 년도만 가져오기
GROUP BY JOB_CODE;

-- 3. EMPLOYEE 테이블에서 부서 별로 같은 직급인 사원의 급여 합계를 조회하고
---- 부서 코드 오름차순으로 정렬 GROUP BY DEPT_CODE, JOB_CODE
-- SUM이나 AVG 같이 특정 함수로 계산한 결과를 나타낼 때 조회하고자하는 컬럼명을 작성해줄 경우 GROUP BY 절에 SUM, AVG 와 같이 계산 함수가 적용되지 않은 컬럼명을 모두 작성해줘야함
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) AS 급여합계
FROM employee
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE ASC;

-- 4. EMPLOYEE 테이블에서 부서 별로 급여 등급이 같은 직원의 수를 조회하고
---- 부서코드, 급여 등급 오름차순으로 정렬 GROUP BY DEPT_CODE, SAL_LEVEL
SELECT DEPT_CODE, SAL_LEVEL, COUNT(*)
FROM employee
GROUP BY DEPT_CODE, sal_level
-- 첫 번째로 부서코드 ABCD 순으로 정렬, 부서 안에 존재하는 급여레벨 ABCD순으로 정렬
ORDER BY DEPT_CODE, sal_level ASC;

-- 5. EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
---- 부서코드 오름차순 정렬
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

-- 6. EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
---- 부서코드 오름차순 정렬 null 인 행 빼고 카운트 카운트 함수 내부에 BONUS 작성하면 BONUS 컬럼명에서 NULL 값은 제외하고 수 측정을 진행함
SELECT DEPT_CODE, COUNT(BONUS)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

-- EMPLOYEE 테이블과 DEPARTMENT 테이블에서 부서코드 조회하기
SELECT * FROM EMPLOYEE; --emp_id emp_name dept_code
SELECT * FROM department; -- dept_id dept_title, location_id

SELECT EMPOYEE.EMP_ID, EMPOYEE.EMP_NAME, EMPOYEE.DEPT_CODE, DEPARTMENT.DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT; --테이블 조회를 2개이상 가능
WHERE EMPOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID; -- ORACLE에서는 되지 않음

SELECT E.EMP_ID, E.EMP_NAME, E.JOB_CODE, N.JOB_NAME
FROM EMPLOYEE E, JOB N;

SELECT D.DEPT_ID, D.DEPT_TITLE, D.LOCATION_ID, L.LOCAL_NAME
FROM DEPARTMENT D, LOCATION L;

-- DEPARTMENT 테이블과 LOCATION 테이블 NATIONAL 테이블을 이용해서
-- DEPT_ID, DEPT_TITLE, LOCATION_ID, NATIONAL_CODE, NATIONAL_NAME 출력
-- WHERE절 사용 → 서로 같다는 표기를 2개 이상의 테이블에서 진행해야할 때는 WHERE절을 필수로 사용!
--- DEPARTMENT 테이블에서 LOCATION_ID와 LOCATION테이블에서 LOCAL_CODE 일치하고
--- LOCATION 테이블에서 NATIONAL_CODE 와 NATIONAL 테이블에서 NATIONAL_CODE 일치
SELECT D.DEPT_ID, D.DEPT_TITLE, D.LOCATION_ID, L.NATIONAL_CODE, N.NATIONAL_NAME
FROM DEPARTMENT D, LOCATION L, NATIONAL N
WHERE D.LOCATION_ID = L.LOCAL_CODE
AND L.LOCAL_NAME = N.NATIONAL_CODE;

--1. EMPLOYEE 테이블에서 각 부서에 속한 사원들에 평균 급여
--- 평균 급여 컬럼명은 [평균 급여] 표기
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS "평균 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--2. EMPLOYEE 테이블에서 각 직급마다 급여가 가장 높은 사원의 이름과 급여 MAX(SALARY)
--- GROUP BY ORDER BY
SELECT JOB_CODE, EMP_NAME, MAX(SALARY)AS"가장 높은 급여"
FROM EMPLOYEE
GROUP BY JOB_CODE, EMP_NAME
ORDER BY JOB_CODE, MAX(SALARY) DESC;

--3. 부서별로 입사한 직원들의 평균 급여 GROUP BY
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS "평균 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--4. 부서이름이 인사관리부인 직원의 이름 출력
SELECT EMP_NAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.DEPT_ID = E.DEPT_CODE
AND D.DEPT_TITLE = '인사관리부';

/*******************************************************/

-- 1. 이메일 주소가 등록된 직원의 이름과 부서명을 출력하시오.
SELECT E.EMP_ID, D.DEPT_TITLE
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.EMAIL IS NOT NULL;

-- 2. 각 부서의 최고 급여를 출력하시오.(최고 급여 순)
SELECT EMP_NAME, DEPT_CODE, MAX(SALARY) AS "최고 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE, EMP_NAME
ORDER BY DEPT_CODE, MAX(SALARY) DESC;

-- 2-1. 각 부서의 최고 급여를 출력하시오.(부서별 최고 급여만 받는 사람 출력)
-- 서브쿼리
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY)
IN (SELECT DEPT_CODE, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE)
ORDER BY DEPT_CODE;

-- 3. 각 급여 등급별 직원 수를 출력하시오.
SELECT COUNT(*) AS "직원 수" FROM EMPLOYEE; -- 회사 내 총 직원 수

SELECT SALARY, COUNT(*) AS "직원 수"
FROM EMPLOYEE
GROUP BY SALARY; -- 급여별로 동일한 금액을 받는 직원 수

-- 4. 부서 이름과 평균 급여를 급여가 높은 순으로 정렬 출력하시오.
SELECT d.dept_title, FLOOR(AVG(SALARY)) AS "평균 급여"
FROM EMPLOYEE E, DEPARTMENT D
/*WHERE EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID*/
GROUP BY D.DEPT_TITLE
ORDER BY FLOOR(AVG(SALARY))DESC;

-- 5. 지역별 부서 수를 출력하시오.
---COUNT(DISTINCT 컬럼명) : 특정 컬럼에서 중복 값을 제외한 행의 개수 반환
SELECT LOCATION_ID, COUNT(DISTINCT DEPT_ID) AS "부서 수"
FROM DEPARTMENT
GROUP BY LOCATION_ID;

-- 6. 각 부서(DEPT_CODE)별 보너스 비율(BONUS)의 평균을 구하되, 평균 보너스 비율이 높은 순으로 정렬
--- 부서의 급여와 평균 보너스 비율을 계산한 뒤 보너스 평균 값 기준으로 오름차순으로 정렬하는 작업
-----   부서코드    각 부서의 급여 평균 계산                    부서의 보너스 비율 평균 계산
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS 평균급여, AVG(BONUS) AS "평균 보너스 비율"
FROM EMPLOYEE, DEPARTMENT
GROUP BY DEPT_CODE
ORDER BY AVG(BONUS);

SELECT DEPT_TITLE, AVG(SALARY) AS 평균급여, AVG(BONUS) AS "평균 보너스 비율"
FROM EMPLOYEE, DEPARTMENT
GROUP BY DEPT_TITLE
ORDER BY DEPT_TITLE;

-- 7.각 부서(DEPT_CODE)별 평균 급여(SALARY)와 평균 보너스 비율(BONUS)을 조회하되, 부서명(DEPT_TITLE)을 기준으로 오름차순 정렬
SELECT D.DEPT_TITLE, FLOOR(AVG(E.SALARY)) AS 평균급여, AVG(E.BONUS) AS 평균보너스비율
FROM EMPLOYEE E, DEPARTMENT D
/*WHERE E.DEPT_CODE = D.DEPT_ID*/
GROUP BY D.DEPT_TITLE
ORDER BY D.DEPT_TITLE ASC;

-- 8. 각 부서별 퇴사자 수를 조회하고, 퇴사자 수가 많은 순으로 정렬
SELECT DEPT_CODE, COUNT(*) AS 퇴사자
FROM EMPLOYEE
WHERE ENT_YN = UPPER('y')
GROUP BY DEPT_CODE
ORDER BY 퇴사자 DESC;