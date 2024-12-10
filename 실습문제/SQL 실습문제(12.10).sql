/*12/10 UPDATE 문 (EATS, EATS_MENU 테이블) 실습문제*/
--문제 1: EATS 테이블에서 CAFE_ID가 11인 카페의 이름을 "빠나쁘레쏘 리뉴얼"로 변경

--문제 2: EATS_MENU 테이블에서 MENU_ID가 31인 메뉴의 가격을 5800원으로 수정
--문제 3: EATS 테이블에서 CAFE_ID가 14인 카페의 위치를 "경기도 성남시 수정구"로 변경
--문제 4: EATS 테이블에서 CAFE_ID가 15인 카페의 연락처를 "010-1111-2222"로 수정
--문제 5: EATS_MENU 테이블에서 MENU_ID가 34인 메뉴의 설명을 "진한 초콜릿 향과 부드러운 크림이 어우러진 프라페"로 변경
--문제 6: EATS_MENU 테이블에서 CAFE_ID가 12인 카페의 모든 메뉴 가격에 500원을 추가
--문제 7:EATS 테이블에서 CAFE_ID가 12인 카페의 이름을 "로맨틱블루 리뉴얼"로, 위치를 "부산 수영구"로 동시에 변경
--문제 8: EATS_MENU 테이블에서 가격이 5000원 이하인 메뉴의 가격을 300원 인상
--문제 9: EATS_MENU 테이블에서 MENU_ID가 13인 메뉴의 이름을 "더치 라떼"로 변경
--문제 10: EATS_MENU 테이블에서 MENU_ID가 27인 메뉴의 설명을 NULL로 변경하여 설명을 제거
--문제 11: EATS 테이블에서 CAFE_ID가 20인 카페의 이름을 "바닐라하우스 프리미엄"으로, 연락처를 "031-1234-5678"로 변경
--문제 12: EATS_MENU 테이블에서 MENU_ID가 38인 메뉴의 가격을 200원 인상

--문제 13: EATS_MENU 테이블에서 DESCRIPTION이 NULL이 아닌 모든 메뉴에 " - 추천 음료"라는 공통 문구를 추가
UPDATE EATS_MENU
SET description = description || ' - 추천 음료'
WHERE description IS NOT NULL;

--문제 14: EATS 테이블에서 CAFE_ID가 9인 카페의 위치를 "서울 강남구 삼성동"으로 변경
--문제 15: EATS_MENU 테이블에서 MENU_ID가 31인 메뉴의 이름을 "White Mocha"로 변경
--문제 16: EATS_MENU 테이블에서 CAFE_ID가 13인 카페의 모든 메뉴 가격에 10% 할인을 적용
--문제 18: EATS_MENU 테이블에서 CAFE_ID가 19인 카페의 모든 메뉴 설명을 NULL로 변경
--문제 19: EATS_MENU 테이블에서 가격이 6000원 이상인 메뉴의 설명에 "프리미엄 음료: "라는 태그 추가
--문제 20: EATS_MENU 테이블에서 CAFE_ID가 16이고 MENU_ID가 36인 메뉴의 가격을 5500원으로 동결
