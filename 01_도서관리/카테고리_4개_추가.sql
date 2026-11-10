INSERT INTO category (category_id, category_name, category_desc)
VALUES (10, 'IT도서', 'IT, AI 관련 교육 및 기술서적들');

INSERT INTO category (category_id, category_name, category_desc)
VALUES (20, '소설', '국내 및 국외 소설');

INSERT INTO category (category_id, category_name, category_desc)
VALUES (30, '수필', '국내 및 국외 수필');

INSERT INTO category (category_id, category_name, category_desc)
VALUES (40, '시', '유명 시집');

COMMIT;

SELECT category_id, category_name, category_desc
FROM category
ORDER BY category_id;
