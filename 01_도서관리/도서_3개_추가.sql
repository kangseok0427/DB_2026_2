INSERT INTO book (isbn, name, author, price, inventory, category_id, publish_id)
VALUES ('1001', '처음 배우는 자바', '김영한', 25000, 20, 10, 1);

INSERT INTO book (isbn, name, author, price, inventory, category_id, publish_id)
VALUES ('1002', '스프링부트 완전정복', '박부완', 35000, 30, 10, 2);

INSERT INTO book (isbn, name, author, price, inventory, category_id, publish_id)
VALUES ('1003', '개미', '베르나르베르베르', 20000, 10, 20, 3);

COMMIT;

SELECT isbn, name, author, price, inventory, category_id, publish_id
FROM book
ORDER BY isbn;
