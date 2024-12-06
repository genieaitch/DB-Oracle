-- cafe table 데이터 모두 조회
SELECT *
FROM cafe;

-- menu table 데이터 모두 조회
SELECT *
FROM menu;

-- 지역에 서울로 시작하는 카페 이름과 위치 조회
SELECT cafe_name, location
FROM cafe
WHERE location
LIKE '서울%';

-- 가격이 5500원인 메뉴 조회
SELECT price, menu_name
FROM menu
WHERE price
LIKE 5500;

/*********************************/
-- 1. 각 카페의 이름과 등록된 메뉴 개수를 조회하세요.
SELECT COUNT(CAFE_NAME), COUNT(DESCRIPTION)
FROM CAFE, MENU;

-- 2. 각 카페에서 가장 비싼 메뉴의 가격을 조회하세요
SELECT CAFE_NAME, PRICE
FROM CAFE, MENU
WHERE (CAFE_NAME, PRICE) IN (SELECT CAFE_NAME, MAX(PRICE) FROM CAFE, MENU GROUP BY CAFE_NAME)
ORDER BY CAFE_NAME;

-- 3. 메뉴 가격이 5,000원 이상인 메뉴를 가진 카페의 이름을 조회하세요.
SELECT CAFE_NAME, MENU_NAME, PRICE
FROM CAFE, MENU
WHERE PRICE >= 5000;

-- 4. 특정 카페 (cafe_id = 3)의 모든 메뉴 이름과 가격을 조회하세요.
SELECT MENU_NAME, PRICE
FROM MENU
WHERE CAFE_ID = 3;

-- 5. 모든 메뉴의 가격을 합산한 결과를 조회하세요.
SELECT SUM(PRICE)
FROM MENU;

-- 6. '아메리카노'를 판매하는 카페의 이름을 중복 없이 조회하세요.
SELECT C.CAFE_NAME
FROM CAFE C, MENU M
WHERE M.MENU_NAME
LIKE '아메리카노';

-- 7. 메뉴 이름에 '라떼'가 포함된 모든 메뉴의 이름과 가격을 조회하세요.
SELECT MENU_NAME, PRICE
FROM MENU
WHERE MENU_NAME
LIKE '%라떼%';

-- 8. 각 카페에서 메뉴의 평균 가격을 (버림) 계산하여 카페 이름과 함께 조회하세요.
SELECT CAFE_NAME, FLOOR(AVG(PRICE))
FROM CAFE, MENU
GROUP BY CAFE_NAME;

-- 9. 특정 지역('서울 강남구')의 카페 이름과 해당 카페의 메뉴 개수를 조회하세요.
SELECT C.CAFE_NAME, COUNT(M.MENU_NAME)
FROM CAFE C, MENU M
GROUP BY C.CAFE_NAME;

-- 10. 모든 카페의 메뉴 개수를 합산하여 조회하세요.
SELECT COUNT(MENU_NAME)
FROM MENU;

-- 11. 특정 지역('서울 서초구')에 위치한 카페에서 판매하는 메뉴들의 총 가격을 조회하세요.
SELECT M.MENU_NAME, SUM(M.PRICE)
FROM CAFE C, MENU M
WHERE C.LOCATION
LIKE '%서울 서초구%'
GROUP BY M.MENU_NAME
ORDER BY M.MENU_NAME;

-- 12. 메뉴 이름에 '프라푸치노'가 포함된 메뉴를 판매하는 카페 이름을 조회하세요.
SELECT C.CAFE_NAME
FROM CAFE C, MENU M
WHERE M.MENU_NAME
LIKE '%프라푸치노%';

-- 13. 특정 메뉴 이름('아이스 아메리카노')의 가격을 가진 메뉴를 조회하세요.
SELECT MENU_NAME, PRICE
FROM MENU
WHERE MENU_NAME = '아이스 아메리카노';

-- 14. 메뉴 이름에 '녹차'가 포함된 모든 메뉴를 조회하세요.
SELECT *
FROM MENU 
WHERE MENU_NAME
LIKE '%녹차%'

-- 15. 메뉴 설명(description)이 없는 메뉴의 이름과 가격을 조회하세요.
SELECT MENU_NAME, PRICE
FROM MENU M
WHERE DESCRIPTION IS NULL;

-- 16. 메뉴 설명(description)에 '달콤한'이라는 단어가 포함된 메뉴를 조회하세요.
SELECT MENU_NAME
FROM MENU
WHERE DESCRIPTION
LIKE '%달콤한%';

-- 17. 카페 이름과 해당 카페에서 판매 중인 메뉴의 총 가격 합계를 조회하세요.
SELECT C.CAFE_NAME, SUM(M.PRICE)
FROM CAFE C, MENU M
GROUP BY CAFE_NAME
ORDER BY CAFE_NAME;

-- 18. '서울 용산구'에 위치한 카페들의 평균 메뉴 가격을 조회하세요. (버림)
SELECT C.LOCATION, FLOOR(AVG(M.PRICE))AS"평균 가격"
FROM CAFE C, MENU M
WHERE C.LOCATION = '서울 용산구'
GROUP BY C.LOCATION;