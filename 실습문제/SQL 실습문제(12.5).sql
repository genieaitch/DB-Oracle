---- 테이블 : EMPLOYEE
--평균 급여 조회(소수점 내림 처리)
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE;

--부서 코드가 'D5'인 사원의 수 
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--전화번호가 있는 사원의 수
---- COUNT(*) = 모든 사람 수 세기, COUNT(PHONE) = phone 컬럼에서 전화번호가 null 값이 아닌 사람만 존재
SELECT COUNT(*)
FROM EMPLOYEE;

--전화번호가 있는 사원의 수 
--> NULL이 아닌 행의 수만 카운트
SELECT COUNT(PHONE)
FROM EMPLOYEE;

--존재하는 부서코드의 수를 조회
SELECT COUNT(DISTINCT DEPT_CODE)
FROM employee;

SELECT COUNT(DISTINCT DEPT_TITLE)
FROM DEPARTMENT;

--부서명이 '영업'으로 끝나는 부서 조회
SELECT *
FROM DEPARTMENT
WHERE DEPT_TITLE
LIKE '%영업';

SELECT * FROM DEPARTMENT ORDER BY DEPT_TITLE;

--이름이 대문자로 표시된 직원 조회
--한글이기 때문에 대소문자 구분없이 출력
--영어 이외에 대소문자 구분xx
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = UPPER(EMP_NAME);

--이름이 '송'으로 시작하는 직원 조회
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME
LIKE '송%';

--급여가 200만 원 이하인 직원의 이름과 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E
WHERE SALARY <= 2000000;

--'Y'로 퇴사 여부가 표시된 직원의 평균 급여 조회
-- 대소문자 구분없이 검색해서 검색 결과가 대문자로 출력되게 설정
SELECT AVG(SALARY*12) AS 평균급여
FROM EMPLOYEE E
WHERE ENT_YN=UPPER('y');

--'영업'으로 끝나는 부서에 속한 직원 수 조회
SELECT COUNT(*) AS 영업_글자가_포함된_부서
FROM DEPARTMENT
WHERE DEPT_TITLE
LIKE '%영업%';

--각 부서별 직원 수 조회
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE E
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--급여등급이 'S5' 이상인 직원 이름과 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E
WHERE SAL_LEVEL >= 'S5';

--전화번호가 '010'으로 시작하지 않는 직원 조회
SELECT *
FROM EMPLOYEE E
WHERE PHONE
NOT LIKE '010%';

--각 부서별 평균 급여 조회
SELECT DEPT_CODE, AVG(salary) AS "평균 급여"
FROM employee E
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--'N'으로 표시된 퇴사 여부 직원 수 조회
SELECT COUNT(*)
FROM EMPLOYEE E
WHERE ENT_YN
LIKE 'N';

--급여가 300만 원 이상인 직원 이름과 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E
WHERE SALARY >= 3000000;

-- 테이블: JOB
--직급명이 소문자로 표시된 데이터 조회
SELECT *
FROM JOB
WHERE LOWER(JOB_NAME) = JOB_NAME;