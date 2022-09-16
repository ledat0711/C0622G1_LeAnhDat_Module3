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
SET kh.ma_loai_khach = 1
WHERE kh.ma_loai_khach = 2
AND kh.ma_khach_hang 
	IN (SELECT 
            represent.ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang
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
DELETE 
FROM khach_hang 
WHERE ma_khach_hang 
IN (SELECT ma_khach_hang FROM hop_dong WHERE YEAR(ngay_lam_hop_dong) <2021);
SET foreign_key_checks=1;
SET sql_safe_updates = 1;
SELECT * FROM khach_hang;