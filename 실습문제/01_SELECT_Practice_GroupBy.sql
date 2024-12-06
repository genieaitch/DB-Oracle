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
SELECT * FROM EMPLOYEE;
SELECT * FROM department;