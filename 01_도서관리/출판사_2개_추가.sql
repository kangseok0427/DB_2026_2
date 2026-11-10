INSERT INTO publish (publish_id, publish_name, phone, address, manager_name)
VALUES (1, '한빛아카데미', '02-336-7112', '서울 서대문구 연희로2길 62', '김철수');

INSERT INTO publish (publish_id, publish_name, phone, address, manager_name)
VALUES (2, '생능출판사', '031-955-0761', '경기도 파주시 광인사길 143', '박대희');

COMMIT;

SELECT publish_id, publish_name, phone, address, manager_name
FROM publish
ORDER BY publish_id;
