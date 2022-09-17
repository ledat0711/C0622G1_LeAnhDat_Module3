USE ss05_demo_database;

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX i_code ON products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX product_code_name 
ON products(product_code,product_name);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN 
SELECT 
* 
FROM products
WHERE product_amount = 5000;

-- So sánh câu truy vấn trước và sau khi tạo index
DROP INDEX i_code 
ON products;
DROP INDEX product_code_name 
ON products;
EXPLAIN 
SELECT
 * 
 FROM products
WHERE product_amount = 5000;

-- Bước 4: Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
DROP VIEW IF EXISTS view_products;
CREATE VIEW view_products AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        products;

-- Truy xuat View:
SELECT * FROM view_products;

-- Tiến hành sửa đổi view
SET sql_safe_updates =0;
DELETE
FROM view_products vp 
WHERE vp.product_price = 3000;
SET sql_safe_updates =1;
SELECT 
    *
FROM
    view_products;

-- Tiến hành xoá view
DROP VIEW view_products;

-- Bước 5: Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE get_all_info()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;
CALL get_all_info();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE insert_info(product_code_insert VARCHAR (15),product_name_insert VARCHAR(30),product_price_insert double,product_amount_insert INT,product_description_insert TEXT,product_status_insert BIT)
BEGIN
INSERT INTO products(product_code,product_name,product_price,product_amount,product_description,product_status)
VALUES (product_code_insert,product_name_insert,product_price_insert,product_amount_insert,product_description_insert,product_status_insert);
END //
DELIMITER ;
CALL insert_info("BP000","Ban Phim Co",10000,20,"Ban phim co brown",1);
SELECT 
    *
FROM
    products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE update_info(id_to_update INT, product_amount_new INT)
BEGIN
SET sql_safe_updates = 0;
UPDATE products p 
SET 
    product_amount = product_amount_new
WHERE
    id = id_to_update;
SET sql_safe_updates =1;
END //
DELIMITER ;
CALL update_info(2,37);
SELECT 
    *
FROM
    products;

-- Xóa sản phẩm theo id:
DELIMITER //
CREATE PROCEDURE remove_by_id(id_to_remove INT)
BEGIN
SET sql_safe_updates = 0;
DELETE FROM products 
WHERE
    id = id_to_remove;
SET sql_safe_updates = 1;
END //
DELIMITER ;

CALL remove_by_id(4);
SELECT 
    *
FROM
    products;