DROP DATABASE IF EXISTS csdl_ban_hang;
CREATE DATABASE csdl_ban_hang;
USE csdl_ban_hang;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(25) NOT NULL,
customer_age INT
);

CREATE TABLE `order`(
order_id INT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
order_total_price DOUBLE,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE product(
product_id INT PRIMARY KEY,
product_name VARCHAR(25) NOT NULL,
product_price DOUBLE NOT NULL
);

CREATE TABLE order_detail(
order_id INT,
product_id INT,
order_quantity INT,
PRIMARY KEY(order_id,product_id),
FOREIGN KEY(order_id) REFERENCES `order`(order_id),
FOREIGN KEY(product_id) REFERENCES product(product_id)
);

INSERT INTO  customer (customer_id, customer_name, customer_age) 
VALUES (1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

INSERT INTO product (product_id, product_name, product_price) 
VALUES (1, 'May Giat', '3'),
(2, 'Tu Lanh', '5'),
(3, 'Dieu Hoa', '7'),
(4, 'Quat', '1'),
(5, 'Bep Dien', '2');


INSERT INTO `order` (order_id, customer_id, order_date, order_total_price) 
VALUES ('1', '1', '2006-03-21', NULL),
('2', '2', '2006-03-23', NULL),
('3', '1', '2006-03-16', NULL);

INSERT INTO order_detail (order_id, product_id, order_quantity) 
VALUES ('1', '1', '3'),
('1', '3', '7'),
('1', '4', '2'),
('2', '1', '1'),
('3', '1', '8'),
('2', '5', '4'),
('2', '3', '3');