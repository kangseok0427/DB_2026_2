select * from 고객
    where 나이 is not null;
    
select 고객이름, 등급, 나이 from 고객
    order by 나이 desc;
    
select 고객이름, 등급, 나이 from 고객
    where 나이 is not null
    order by 나이 asc;
    
select 고객이름, 등급, 나이 from 고객
    where 나이 >= 25
    order by 등급 desc;

select 주문고객, 주문제품, 수량, 주문일자 from 주문
    where 수량 >= 10
    order by 주문제품, 수량 desc;
    
select avg(나이) 고객나이평균 from 고객;

select round(avg(나이), 2) 나이평균 from 고객
    where 고객이름 like '김%' or 고객이름 like '최%' or 고객이름 like '으%';
    
select round(avg(단가), 3) 단가평균 from 제품
    where 제조업체 in('한빛제과', '대한식품');
    
select to_char(avg(단가), 'FM9990.000') 단가평균 from 제품
    where 제조업체 in('한빛제과', '대한식품');
    
select sum(재고량) from 제품
    where 제조업체 = '한빛제과';
    
select * from 고객;

select count(*) from 고객;
select count(고객이름) from 고객;

select 제조업체 from 제품;
select distinct 제조업체 from 제품;

select count(distinct 제조업체) 참여제조업체수 from 제품;

select count(distinct 제조업체) 참여제조업체수 from 제품
    where 제조업체 like '%한%';
    
select * from 주문;

select 주문고객, sum(수량) 총주문수량 from 주문
    group by 주문고객;
    
select 제조업체, count(*) 제품수, max(단가) 최고가 from 제품
    group by 제조업체;
    
select 주문고객, count(*) 주문제품수, min(수량) from 주문
    group by 주문고객;
    
select 제조업체, count(*) 제품수, max(단가) 최고가 from 제품
    group by 제조업체
    having count(*) >= 3;
    
select * from 고객;

select 직업, max(나이) 최고령, min(나이) 최연소 from 고객
    group by 직업
    having sum(적립금) < 2000;


select 고객이름 from 주문
    where EXISTS(
        select * from 주문
            where 주문일자='2026-08-01' and 주문고객=고객아이디
            );
            
select 고객이름 from 주문
    where Not EXISTS(
        select * from 주문
            where 주문일자='2026-08-01' and 주문고객=고객아이디
            );

insert into 고객 values('kiwi', '김유정', 32, 'gold', '연예인', 1000);
select *from 고객;

insert into 고객(고객아이디, 고객이름, 나이, 등급, 적립금) values('tomato', '정은심', 36, 'silver', 4000);
select *from 고객;

create table 한빛제품(
   제품명 varchar(50) not null primary key,
   재고량 int,
   단가 INT
);

insert into 한빛제품(제품명, 재고량, 단가)
    select 제품명, 재고량, 단가 from 제품
    where 제조업체='한빛제과';
    
select * from 한빛제품;

update 제품 set 제품명='통큰파이'
    where 제품번호='p03';
    
select * from 제품;

update 제품 set 제품명='쫄깃우동'
    where 제품명='통통우동';
    
select * from 제품;

update 제품 set 단가=단가*1.1;
select 제품번호, 제품명, 재고량, 단가 인상단가, 제조업체 from 제품;

update 주문 set 수량=5
    where 주문고객 in(select 고객아이디 from 고객
                        where 고객이름 = '정소화');
                        
create view 우수고객 as select 고객아이디, 고객이름, 나이, 등급 from 고객 where 등급='vip' with check option;

select * from 우수고객;
    
select * from 고객;

create view 업체별제품수(제조업체, 제품수) as select 제조업체, COUNT(*) from 제품 group by 제조업체 with check option;

select * from 업체별제품수;

select * from 우수고객
    where 나이 >= 30;
    
create view 제품2 as select 제품번호, 재고량, 제조업체 from 제품 with check option;

select * from 제품2;

insert into 제품2 values('p08', 1000, '신선식품');

select * from 제품;


























