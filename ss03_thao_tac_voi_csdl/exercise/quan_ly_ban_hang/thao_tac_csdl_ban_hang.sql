use csdl_ban_hang;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT order_id, order_date, order_total_price
FROM `order` ;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.
SELECT c.customer_name, p.product_name
FROM order_detail od
JOIN product p ON od.product_id = p.product_id
JOIN `order` o ON o.order_id = od.order_id
JOIN customer c ON c.customer_id = o.customer_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.customer_name
FROM customer c
LEFT JOIN `order` o ON (o.customer_id = c.customer_id)
WHERE o.customer_id IS NULL;
    
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- Giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice.
SELECT o.order_id, o.order_date, SUM(p.product_price * od.order_quantity)
FROM order_detail od
JOIN product p ON p.product_id = od.product_id
JOIN `order` o ON od.order_id = o.order_id
GROUP BY od.order_id;