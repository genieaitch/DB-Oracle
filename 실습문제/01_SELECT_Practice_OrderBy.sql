SELECT * FROM EMPLOYEE;

SELECT emp_name, SALARY*12 AS 연봉
FROM EMPLOYEE E
ORDER BY 연봉 ASC;

SELECT emp_name
FROM EMPLOYEE
ORDER BY emp_name DESC;

--1. employee 테이블에서 사원들의 급여를 오름차순으로 정렬
SELECT emp_id, emp_name, SALARY
FROM EMPLOYEE E
ORDER BY salary /*ASC*/;

--2. employee 테이블에서 사원들의 입사일을 내림차순 정렬
SELECT emp_id, emp_name, hire_date
FROM EMPLOYEE E
ORDER BY HIRE_DATE DESC;

--3. department 테이블의 부서명을 오름차순 출력
SELECT dept_id, dept_title
FROM DEPARTMENT D
ORDER BY DEPT_TITLE /*ASC*/;

--4. employee 테이블에서 부서코드가 없는 사원들의 이름을 내림차순 출력
SELECT emp_id, emp_name, DEPT_CODE
FROM EMPLOYEE E
WHERE dept_code IS null
ORDER BY emp_name DESC;

--5. employee 테이블에서 급여가 3000000원 이상인 사원들의 급여 등급(salary_label)
--   내림차순 정렬
SELECT emp_id, emp_name, sal_level, SALARY
FROM EMPLOYEE E
WHERE salary >= 3000000
ORDER BY sal_level DESC;

-- EMPLOYEE 테이블에서 오름차순 + NULLS FIRST (NULL 값을 제일 위에 배치)
SELECT EMP_NAME, PHONE
FROM EMPLOYEE E
ORDER BY PHONE NULLS FIRST;

-- EMPLOYEE 테이블에서 오름차순 + NULLS FIRST (NULL 값을 제일 아래에 배치)
SELECT EMP_NAME, PHONE
FROM EMPLOYEE E
ORDER BY PHONE NULLS LAST; /*ASC NULLS LAST*/

-- EMPLOYEE 테이블에서 내림차순 + NULLS 가장 위로 배치 
SELECT emp_name, PHONE
FROM EMPLOYEE E
ORDER BY PHONE DESC NULLS FIRST;