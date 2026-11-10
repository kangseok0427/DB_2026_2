CREATE TABLE publisher (
    publisher_id VARCHAR2(10) PRIMARY KEY,
    publisher_name VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20),
    address VARCHAR2(300),
    contact_name VARCHAR2(50)
);

CREATE TABLE category (
    category_id VARCHAR2(10) PRIMARY KEY,
    category_name VARCHAR2(100) NOT NULL,
    category_description VARCHAR2(500)
);

CREATE TABLE book (
    book_id VARCHAR2(10) PRIMARY KEY,
    book_title VARCHAR2(200) NOT NULL,
    author_name VARCHAR2(100),
    unit_price NUMBER(10) NOT NULL CHECK (unit_price >= 0),
    stock_quantity NUMBER(6) DEFAULT 0 NOT NULL CHECK (stock_quantity >= 0),
    publisher_id VARCHAR2(10) NOT NULL,
    category_id VARCHAR2(10) NOT NULL,
    CONSTRAINT book_publisher_fk
        FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    CONSTRAINT book_category_fk
        FOREIGN KEY (category_id) REFERENCES category(category_id)
);
