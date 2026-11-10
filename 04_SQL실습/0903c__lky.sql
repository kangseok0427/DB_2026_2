/* ============================================================
   Oracle SQL 실습 전체 초기 설정 워크시트
   실행 방법 : 전체 선택 후 '스크립트 실행(F5)'
   ============================================================ */


/* ============================================================
   0. 기존 테이블 삭제
   ============================================================ */

-- 기존 테이블이 있으면 삭제
-- 주문이 고객/제품을 참조하므로 주문부터 삭제

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 주문 CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 제품 CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 고객 CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE 배송업체 CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/


/* ============================================================
   1. 고객 테이블 생성
   ============================================================ */

CREATE TABLE 고객 (
    고객아이디 VARCHAR2(20)
        CONSTRAINT 고객_PK PRIMARY KEY,

    고객이름 VARCHAR2(20)
        NOT NULL,

    나이 NUMBER(3),

    등급 VARCHAR2(10)
        DEFAULT 'silver'
        NOT NULL,

    직업 VARCHAR2(20),

    적립금 NUMBER(10)
        DEFAULT 0
);


/* ============================================================
   2. 제품 테이블 생성
   ============================================================ */

CREATE TABLE 제품 (
    제품번호 VARCHAR2(10)
        CONSTRAINT 제품_PK PRIMARY KEY,

    제품명 VARCHAR2(30)
        NOT NULL,

    재고량 NUMBER(10)
        DEFAULT 0,

    단가 NUMBER(10),

    제조업체 VARCHAR2(30)
);


/* ============================================================
   3. 배송업체 테이블 생성
   ============================================================ */

CREATE TABLE 배송업체 (
    업체번호 VARCHAR2(10)
        CONSTRAINT 배송업체_PK PRIMARY KEY,

    업체명 VARCHAR2(30)
        NOT NULL,

    주소 VARCHAR2(100),

    전화번호 VARCHAR2(20)
);


/* ============================================================
   4. 주문 테이블 생성
   ============================================================ */

CREATE TABLE 주문 (
    주문번호 VARCHAR2(10)
        CONSTRAINT 주문_PK PRIMARY KEY,

    주문고객 VARCHAR2(20)
        NOT NULL,

    주문제품 VARCHAR2(10)
        NOT NULL,

    수량 NUMBER(10),

    배송지 VARCHAR2(100),

    주문일자 DATE,

    CONSTRAINT 주문_고객_FK
        FOREIGN KEY (주문고객)
        REFERENCES 고객(고객아이디),

    CONSTRAINT 주문_제품_FK
        FOREIGN KEY (주문제품)
        REFERENCES 제품(제품번호)
);


/* ============================================================
   5. 초기 고객 데이터
   주문에서 필요한 apple 포함
   ============================================================ */

INSERT ALL

    INTO 고객 VALUES
    ('apple', '홍길동', 20, 'gold', '학생', 1000)

    INTO 고객 VALUES
    ('banana', '김선우', 25, 'vip', '간호사', 2500)

    INTO 고객 VALUES
    ('carrot', '고명석', 28, 'gold', '교사', 4500)

    INTO 고객 VALUES
    ('orange', '김용욱', 22, 'silver', '학생', 0)

    INTO 고객 VALUES
    ('melon', '성원용', NULL, 'gold', '회사원', 0)

    INTO 고객 VALUES
    ('peach', '오형준', NULL, 'silver', '의사', 300)

    INTO 고객 VALUES
    ('pear', '채광주', 31, 'silver', '회사원', 500)

    INTO 고객 VALUES
    ('straberry', '최유경', 30, 'vip', '공무원', 100)

SELECT * FROM dual;


/* ============================================================
   6. 초기 제품 데이터
   주문에서 필요한 p01 포함
   ============================================================ */

INSERT ALL

    INTO 제품 VALUES
    ('p01', '그냥만두', 5000, 4500, '대한식품')

    INTO 제품 VALUES
    ('p02', '매운쫄면', 2500, 5500, '민국푸드')

    INTO 제품 VALUES
    ('p03', '쿵떡파이', 3600, 2600, '한빛제과')

    INTO 제품 VALUES
    ('p04', '맛난초콜릿', 1250, 2500, '한빛제과')

    INTO 제품 VALUES
    ('p05', '얼큰라면', 2200, 1200, '대한식품')

    INTO 제품 VALUES
    ('p06', '통통우동', 1000, 1550, '민국푸드')

    INTO 제품 VALUES
    ('p07', '달콤비스킷', 1650, 1500, '한빛제과')

SELECT * FROM dual;


/* ============================================================
   7. 초기 배송업체 데이터
   ============================================================ */

INSERT ALL

    INTO 배송업체 VALUES
    ('d01', '대한배송', '서울시 강남구', '02-1111-1111')

    INTO 배송업체 VALUES
    ('d02', '민국택배', '경기도 수원시', '031-222-2222')

SELECT * FROM dual;


/* ============================================================
   8. 초기 주문 데이터
   ============================================================ */

INSERT ALL

    INTO 주문 VALUES
    ('o03', 'banana', 'p06', 45,
     '경기도 부천시',
     TO_DATE('2026/09/01', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o04', 'carrot', 'p02', 8,
     '부산시 금천구',
     TO_DATE('2026/07/30', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o05', 'melon', 'p06', 36,
     '경기도 용인시',
     TO_DATE('2026/08/01', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o06', 'banana', 'p01', 19,
     '충청북도 보은군',
     TO_DATE('2026/07/07', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o07', 'apple', 'p03', 22,
     '서울시 영등포구',
     TO_DATE('2026/09/03', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o08', 'pear', 'p02', 50,
     '강원도 춘천시',
     TO_DATE('2026/06/03', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o09', 'banana', 'p04', 15,
     '전라남도 목포시',
     TO_DATE('2026/07/08', 'YYYY/MM/DD'))

    INTO 주문 VALUES
    ('o10', 'carrot', 'p03', 20,
     '경기도 안양시',
     TO_DATE('2026/08/20', 'YYYY/MM/DD'))

SELECT * FROM dual;


/* ============================================================
   9. 저장
   ============================================================ */

COMMIT;


/* ============================================================
   10. 정상 생성 확인
   ============================================================ */

SELECT * FROM 고객;
SELECT * FROM 제품;
SELECT * FROM 주문;
SELECT * FROM 배송업체;


/* ============================================================
   여기까지가 초기 설정
   ============================================================ */



/* ============================================================
   아래부터 수업 DDL 실습
   ============================================================ */


-- 고객 테이블에 가입날짜 컬럼 추가
ALTER TABLE 고객
    ADD 가입날짜 DATE;


-- 추가 확인
DESC 고객;


-- 가입날짜 컬럼 삭제
ALTER TABLE 고객
    DROP COLUMN 가입날짜;


-- 나이 20세 이상 CHECK 제약조건 추가
ALTER TABLE 고객
    ADD CONSTRAINT check_age
    CHECK(나이 >= 20);


-- CHECK 제약조건 삭제
ALTER TABLE 고객
    DROP CONSTRAINT check_age;


/* ============================================================
   배송업체 테이블 삭제 실습
   ============================================================ */

DROP TABLE 배송업체;


/* ============================================================
   최종 확인
   ============================================================ */

SELECT * FROM 고객;
SELECT * FROM 제품;
SELECT * FROM 주문;

COMMIT;

select 고객이름, 나이, 등급, 직업, 적립금, 고객아이디 from 고객;
select * from 고객;
select 고객아이디, 고객이름, 직업 from 고객;

select all 직업 from 고객;

select 직업 from 고객;

select distinct 직업 from 고객;

--제품테이블에서 제조업체를 검색하시오 / 중복데잍를 제거하고 검색하시오

select 제조업체 from 제품;
select distinct 제조업체 from 제품;

select distinct 제조업체 as 대표업체 from 제품;
select distinct 제조업체 대표업체2 from 제품;

--제품 테이블에서 제품명, 단가를 검색하되, 단가를 가격이라는 이름으로 출력하시오.

select distinct 제품명, 단가 as 가격 from 제품;

select 제품명, 단가+500 as 조정딘가 from 제품;

select 제품명, 단가, 제조업체
    from 제품
    where 제조업체='한빛제과';
    
select * from 제품;
select * from 주문;

select 주문제품, 수량, 주문일자
    from 주문
    where 주문고객='carrot' and 수량>=15;
    
select 주문제품, 수량, 주문일자
    from 주문
    where 주문고객='apple' or 수량>=20;
    
select * from 고객;

select 고객이름, 나이, 직업
    from 고객
    where 직업='학생' or 나이>=26;
    
    
select 고객이름, 나이, 직업
    from 고객
    where 직업='학생' and 나이>=22;
    
select 제품명, 단가, 제조업체
    from 제품
    where 단가 >= 2000 and 단가 <= 3000;
    
select 고객이름, 나이, 직업
    from 고객
    where 나이 >= 20 and 나이 <= 30;
    
select 고객이름, 나이, 등급, 적립금
    from 고객
    where 고객이름 like '김%';
    
select 고객이름, 나이
    from 고객
    where 고객이름 like '%용%';
    
select 고객아이디, 고객이름
    from 고객
    where 고객아이디 like '%p%';
    
select 고객아이디, 고객이름
    from 고객
    where 고객아이디 like 'pe__';