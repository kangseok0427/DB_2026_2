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