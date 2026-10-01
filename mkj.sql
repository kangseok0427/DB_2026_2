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





































