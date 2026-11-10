INSERT INTO publish (publish_id, publish_name, phone, address, manager_name)
VALUES (3, '민음사', '02-515-2000', '서울시 강남구 도산대로1길 62', '홍길민');

INSERT INTO publish (publish_id, publish_name, phone, address, manager_name)
VALUES (4, '해냄출판사', '02-326-1600', '서울특별시 마포구 잔다리로 30', '이해냄');

COMMIT;

SELECT publish_id, publish_name, phone, address, manager_name
FROM publish
ORDER BY publish_id;
