USE ss05_demo_database;

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX i_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX product_code_name ON products(product_code,product_name);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN 
SELECT * FROM products
WHERE product_amount = 5000;

-- So sánh câu truy vấn trước và sau khi tạo index
DROP INDEX i_code ON products;
DROP INDEX product_code_name ON products;
EXPLAIN 
SELECT * FROM products
WHERE product_amount = 5000;

-- Bước 4: Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
DROP VIEW IF EXISTS view_products;
CREATE VIEW view_products AS
SELECT product_code,product_name,product_price,product_status
FROM products;

-- Truy xuat View:
SELECT * FROM view_products;

-- Tiến hành sửa đổi view
SET sql_safe_updates =0;
DELETE
FROM view_products vp 
WHERE vp.product_price = 3000;
SET sql_safe_updates =1;
SELECT * FROM view_products;

-- Tiến hành xoá view
DROP VIEW view_products;

-- Bước 5: Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER 
//
CREATE PROCEDURE get_all_info_products()
BEGIN
SELECT * FROM products;
END 
//
DELIMITER ;
