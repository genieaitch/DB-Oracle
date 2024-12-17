use khtshopping;

select * from product;

select * from `order`;
/*
PENDING → 대기
SHIPPED → 배송 중
DELIVERED → 배송 완료
CANCELLED → 취소

1) safe_update = 0;
2) alter status 변경
3) update 작성
*/
set sql_safe_updates = 0;

alter table `ORDER` MODIFY column STATUS enum('PENDING','SHIPPED','DELIVERED','CANCELLED', '대기', '배송 중', '배송 완료', '취소');

update `order` set STATUS = '대기' WHERE USER_ID = 5;

COMMIT;
alter table `ORDER` MODIFY column STATUS enum('대기', '배송 중', '배송 완료', '취소') default '대기';
set sql_safe_updates = 1;

select * from review;

select * from order_item;

USE KHTUSER;

SELECT * FROM USER;

-- 이메일주소 도메인이 example.com → kht.co.kr 변경
-- CONCAT SUBSTRING SUBSTRING_INDEX 이용해서 변경
-- LIKE로 일치하는지 확인 후 변경

select CONCAT('Hello', ' ', 'World','!'); -- CONCAT 이어붙여 출력되는지 확인

SELECT SUBSTRING_INDEX('user@example.com', '@', 1); -- user
SELECT SUBSTRING_INDEX('user@example.com', '@', -1); -- example.com

select concat(SUBSTRING_INDEX('user@example.com','@',1),'@', 'kht.com');

/*
ERROR CODE : 1241 잘못된 문법으로 문자열 처리를 시도했기 때문에 발생한 에러코드
ERROR CODE : 1175 SAFE UPDATE MODE 비활성화
	→ 1번 EDIT → preferences → SQL Editor → 맨 밑에 Safe Updates(reject Update and Delete ~~~) 비활성화
    또는
    → 2번 SET SQL_SAFE_UPDATES = 0;
ERROR CODE : 
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE USER
SET EMAIL = CONCAT(substring_index(EMAIL,'@', 1), '@kht.com');

SELECT * FROM USER;

COMMIT;

-- USER 테이블에서 전화번호 앞에 +82)를 붙여주기
-- 최종 PHONE +82) 010-XXXX-XXXX
/*
ERROR CODE : 1406 : 컬럼이 VARCHAR(20)또는 그보다 작은 길이로 정의된 경우 새로운 값이 길이 제한을 넘어서기 때문에 발생하는 에러
컬럼에 존재하는 길이 늘리기
*/

ALTER TABLE USER MODIFY COLUMN PHONE VARCHAR(20);

START TRANSACTION; -- 트랜잭션 개념 ACID 개념이해가 더 중요함

UPDATE USER
SET PHONE = CONCAT('+82)', PHONE);

UPDATE USER SET PHONE = '010-4567-8901' WHERE USERNAME = '박민수';
/*
INSERT INTO USER (USERNAME, EMAIL, PASSWORD_HASH, PHONE, STATUS) VALUES
('홍길동', 'hong@example.com', 'hashed_password_1', '010-1234-5678', 'ACTIVE'),
('김영희', 'kim@example.com', 'hashed_password_2', '010-2345-6789', 'ACTIVE'),
('이철수', 'lee@example.com', 'hashed_password_3', '010-3456-7890', 'INACTIVE'),
('박민수', 'park@example.com', 'hashed_password_4', '010-4567-8901', 'ACTIVE'),
('최수지', 'choi@example.com', 'hashed_password_5', '010-5678-9012', 'ACTIVE');
*/

-- +82) 지우기
-- CONCAT
-- savepoint "SP1";

SAVEPOINT SP1;

UPDATE USER
SET PHONE = CONCAT(SUBSTRING_INDEX(PHONE, ')',-1),'');

SELECT * FROM USER;

-- CONCAT 이용하고 ) 기준으로 해서 지우기 KOR)010-XXXX-XXXX 이런시그올 맨 앞에 KOR) 붙이기
update USER
SET PHONE = CONCAT('KOR)', SUBSTRING_INDEX(PHONE, ')', -1));


ROLLBACK TO SP1;

UPDATE USER
SET PHONE = CONCAT('KOR)', PHONE);

-- 과제 ROLLBACK SAVEPOINT → JAVA 프로그램을 더 많이 활용하지 않는다는 얘기.