USE furama_database;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET sql_safe_updates = 0;
DELETE
FROM nhan_vien nv
WHERE nv.ma_nhan_vien 
NOT IN (SELECT hd.ma_nhan_vien FROM hop_dong hd WHERE YEAR(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);
SET sql_safe_updates = 1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE khach_hang kh 
SET 
    kh.ma_loai_khach = 1
WHERE
    kh.ma_loai_khach = 2
        AND kh.ma_khach_hang IN (SELECT 
            represent.ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang,
                COALESCE(dv.chi_phi_thue + COALESCE(SUM(hdct.so_luong * dvdk.gia), 0)) AS tong_tien_thanh_toan
            FROM
                loai_khach lk
            JOIN khach_hang kh ON lk.ma_loai_khach = kh.ma_loai_khach
            JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            WHERE
                (lk.ten_loai_khach = 'Platinium'
                    AND (IFNULL(chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia, 0), 0) > 1000000)
                    AND YEAR(ngay_lam_hop_dong) = 2021)) AS represent);
SELECT * FROM khach_hang;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET sql_safe_updates = 0;
SET foreign_key_checks = 0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        hop_dong
    
    WHERE
        YEAR(ngay_lam_hop_dong) < 2021);
SET foreign_key_checks=1;
SET sql_safe_updates = 1;
SELECT 
    *
FROM
    khach_hang;

-- 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
SET sql_safe_updates = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            dai_dien.ma_dich_vu_di_kem
        FROM
            (SELECT 
                hdct.ma_dich_vu_di_kem, SUM(hdct.so_luong) AS tong_so_lan_su_dung
            FROM
                hop_dong_chi_tiet hdct
            JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
            WHERE
                    YEAR(hd.ngay_lam_hop_dong) = 2020
            GROUP BY hdct.ma_dich_vu_di_kem
            HAVING tong_so_lan_su_dung > 10 ) AS dai_dien);
SET sql_safe_updates = 1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    nv.ma_nhan_vien AS id,
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
FROM
    nhan_vien nv 
UNION SELECT 
    kh.ma_khach_hang AS id,
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
FROM
    khach_hang kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” (
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
-- Thêm điều kiện Gia Lai , 2020-12-08.
DROP VIEW IF EXISTS v_nhan_vien;
CREATE VIEW v_nhan_vien AS
    SELECT 
        nv.*
    FROM
        nhan_vien nv
            JOIN
        hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
    WHERE
        nv.dia_chi REGEXP '^.*(Hải Châu|Gia Lai).*$'
            AND ngay_lam_hop_dong IN ('2019-12-12','2020-12-08');
SELECT * FROM v_nhan_vien;

-- 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET sql_safe_updates = 0;
UPDATE v_nhan_vien
SET 
    dia_chi = 'Liên Chiểu';
SET sql_safe_updates = 1;
select * from nhan_vien;
-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DROP procedure if exists remove_customer_by_customer_code;
DELIMITER //
CREATE PROCEDURE remove_customer_by_customer_code(customer_code_to_remove INT)
BEGIN
SET sql_safe_updates = 0;
DELETE
FROM khach_hang
WHERE ma_khach_hang = customer_code_to_remove;
SET sql_safe_updates = 1;
END //
DELIMITER ;
SELECT * FROM khach_hang;
CALL remove_customer_by_customer_code(9);