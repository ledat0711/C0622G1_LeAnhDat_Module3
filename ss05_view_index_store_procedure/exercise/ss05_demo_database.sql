-- Bước 1: Tạo database
DROP DATABASE IF EXISTS ss05_demo_database;
CREATE DATABASE ss05_demo_database;
USE ss05_demo_database;

-- Bước 2: Tạo bảng Products và chèn một số dữ liệu mẫu:
CREATE TABLE products (
id INT PRIMARY KEY AUTO_INCREMENT,
product_code VARCHAR (15),
product_name VARCHAR(30),
product_price double,
product_amount INT,
product_description TEXT,
product_status BIT
);
INSERT INTO products(product_code,product_name,product_price,product_amount,product_description,product_status)
VALUES ("C001", "But Chi",3000,12,"But chi de ve",1),
("D002", "But Do",5000,20,"But do danh dau",1),
("T003", "But Xanh",6000,20,"But xanh ghi bai",1),
("T004", "But Tim",7000,20,"But tim ghi bai",1);