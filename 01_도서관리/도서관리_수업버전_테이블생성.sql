CREATE TABLE publish (
    publish_id NUMBER NOT NULL PRIMARY KEY,
    publish_name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(30),
    address VARCHAR2(60),
    manager_name VARCHAR2(30)
);

CREATE TABLE category (
    category_id NUMBER NOT NULL PRIMARY KEY,
    category_name VARCHAR2(30) NOT NULL,
    category_desc VARCHAR2(50)
);

CREATE TABLE book (
    isbn VARCHAR2(30) NOT NULL PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    author VARCHAR2(30),
    price NUMBER DEFAULT 0,
    inventory NUMBER DEFAULT 0,
    category_id NUMBER,
    publish_id NUMBER,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (publish_id) REFERENCES publish(publish_id)
);
