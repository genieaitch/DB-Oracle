
SELECT * FROM department; --department 라는 테이블에 있는 모든 내용 조회하기

--QUIZ 1 LOCATION 테이블 모두 조회하기
SELECT * FROM location;

--QUIZ 2 JOB 테이블 모두 조회하기
SELECT * FROM job;

--QUIZ 3 NATIONAL 테이블 모두 조회하기
SELECT * FROM national;

--QUIZ 4 SAL_GRADE 테이블 모두 조회하기
SELECT * FROM sal_grade;

--EMPLOYEE 테이블에서 사번(EMP_ID) 이름(EMP_NAME) 급여(SALARY) 조회
SELECT emp_id, emp_name, salary FROM employee;

--EMPLOYEE 테이블 이름(emp_name)조회
SELECT emp_name FROM employee;

--Employee 테이블에서 emp_name hire_date 조회
SELECT emp_name, hire_date FROM employee;
--DEPARTMENT 테이블에서 부서명 조회(DEPT_ID, DEPT_TITLE)
SELECT dept_id, dept_title FROM department;
-- DEPARTMENT 테이블에서 모든 데이터 조회
SELECT * FROM department;

-- EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여*12 를 해서 연봉 조회
SELECT emp_id, emp_name, salary*12 FROM employee;

SELECT emp_id, emp_name, salary, salary*12 FROM employee;

SELECT emp_id, emp_name, salary, salary*12 AS 연봉 FROM employee;

-- employee 테이블에서 EMP_ID AS 직원아이디, EMP_NAME = 직원이름, SALARY = 월급으로 표기해서 출력
SELECT EMP_ID AS 직원아이디, EMP_NAME AS 직원이름, SALARY AS 월급 FROM employee;


-- 가짜 테이블을 이용해서 시간 기능 조회하기
SELECT SYSDATE FROM DUAL; -- 24/12/04

SELECT SYSTIMESTAMP FROM DUAL; --24/12/04 14:29:25.680000000 +09:00

-- 가짜 테이블을 이용해서 AS 어제, AS 현재, AS 내일,  AS모레 조회
SELECT SYSDATE-1 AS 어제, SYSDATE AS 현재, SYSDATE+1 AS 내일, SYSDATE+2 AS 모레 FROM DUAL;

/*
-- 현재시간   한 시간 후,              1분 후,                    10초 후 조회
SYSDATE     SYSDATE+1/24        SYSDATE + 1/24/60          SYSDATE+1/24/60/60*10
            24시간 중 1시간 후    24시간에서 60분 중 1분 후    24시간 중 60분 60초 중에 (1*10) 초 후
*/

-- TO_DATE('문자열', '패턴');
-- 문자열을 패턴 형태로 해석해서 DATE 타입으로 변경하는 함수

SELECT '2024-12-04', TO_DATE('2024-12-04', 'YYYY-MM-DD') FROM DUAL;

-- EMPLOYEE 에서 모든 사원의 이름, 입사일 근무 일수(SYSDATE - 입사일) 조회
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE FROM employee;


-- 퇴사여부 Y 인 사원의 이름과 퇴사일 조회
SELECT EMP_NAME, ENT_DATE -- 무엇을 조회할 것인가
FROM EMPLOYEE             -- 어디서 조회할 것인가
WHERE ENT_YN = 'Y';       -- 어떤 조건을 걸 것인가

-- 보너스가 있는 사원의 이름과 보너스 금액 조회
SELECT EMP_NAME, bonus
FROM employee
WHERE bonus IS NOT NULL;

-- 급여가 300만원 이상인 사원의 이름과 급여를 조회
-- 급여 >= 3000000
SELECT EMP_NAME, salary
FROM employee
WHERE salary >= 3000000;

-- DEPARTMENT 테이블에서 LOCATION_ID 가 'L1' 지역에 위치한 부서의 모든 정보 조회
SELECT *
FROM department
WHERE location_id='L1';

-- EMPLOYEE 테이블에서 이메일 주소가 없는 사원의 이름 조회
SELECT EMP_NAME, EMAIL
FROM employee
WHERE EMAIL IS NULL;
-- → 이메일 주소가 모두 존재하기 떄문에 아무것도 안나오는 것이 맞음

-- EMPLOYEE 테이블에서 관리자가 없는 사원의 정보 조회
SELECT *
FROM employee
WHERE MANAGER_ID IS NULL;

-- EMPLOYEE 테이블에서 모든 사원의 이름, 입사일, 근무일수(현재 시간 - 입사일) 조회
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE
FROM employee;

-- 포멧팅을 활용해서 보기좋게 정리
-- FLOOR(소수점 아래 모두 버리기) 이용해서 정리
-- CEIL (올림 처리)
-- ROUND(반올림 처리)

SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE-HIRE_DATE)AS 근무일수
FROM employee;
-- FLOOR(SYSDATE-HIRE_DATE) 입사일부터 현재까지의 차이를 계산하고 소수점 아래는 모두 버려 정수로 나타냄
-- 소수점 아래를 버림하는 이유는 반올림을 할 경우 입사일이 하루 추가되므로 현재 입사해서 근무한 일자에 어긋남

-- EMPLOYEE 테이블에서 부서 코드가 D9 부서가 아닌 사원들만 컬럼을 모두 조회
SELECT *
FROM employee
WHERE dept_code !='D9';

--1. EMPLOYEE 테이블에서 연봉이 5000만원 이하의 사원의 사번, 이름, 연봉 조회
SELECT EMP_ID, EMP_NAME, SALARY * 12 AS 연봉
FROM employee
WHERE SALARY*12 <= 50000000;

--2. EMPLOYEE 테이블에서 부서코드가 D6이 아닌 사원의 이름 부서코드 전화번호 조회
SELECT EMP_NAME, DEPT_CODE, PHONE
FROM employee
WHERE DEPT_CODE !='D6';

-- EMPLOYEE 테이블에서 부서코드가 D1 D3 이 아닌 사원의 이름 부서코드 조회
SELECT EMP_NAME, DEPT_CODE
FROM employee
WHERE DEPT_CODE !='D3'
AND DEPT_CODE !='D1';


-- EMPLOYEE 테이블에서 부서코드가 D1 D3가 아닌 사원 조회
SELECT EMP_NAME, DEPT_CODE
FROM employee
WHERE DEPT_CODE NOT IN('D1', 'D3');

-- D5 부서에 속한 사원의 사원번호 사원이름 부서코드 조회
SELECT EMP_NO, EMP_NAME, DEPT_CODE
FROM employee
WHERE dept_code = 'D5';

-- 입사일이 (HIRE_DATE) 2000년 이후인 직원들의 정보 조회 EMPLOYEE
SELECT *
FROM employee
WHERE hire_date >= TO_DATE('2000-01-01', 'YYYY-MM-DD');

-- EMPLOYEE 테이블에서 퇴직여부가 'Y'이고, 퇴사일이 2015년 이후인 직원들의 정보를 조회
SELECT *
FROM employee
WHERE ent_yn = 'Y'
AND ent_date >= TO_DATE('2015-01-01', 'YYYY-MM-DD');

-- EMPLOYEE 테이블에서 성씨가 '전' 씨인 사원의 이름 조회
SELECT EMP_NAME
FROM employee
WHERE EMP_NAME
LIKE '전%';

-- EMPLOYEE 테이블에서 이름이 수로 끝나는 사원의 이름 조회
SELECT EMP_NAME
FROM employee
WHERE emp_name
LIKE '%수';