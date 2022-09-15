USE furama_database;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT dvdk.*
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond' AND kh.dia_chi REGEXP '^.*(Vinh|Quảng Ngãi)$';

-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT hd.ma_hop_dong,
	nv.ho_ten,
	kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    IFNULL(SUM(hdct.so_luong),0) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM dich_vu dv
LEFT JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
LEFT JOIN khach_hang kh ON kh.ma_khach_hang = dv.ma_khach_hang
WHERE MONTH(hd.ngay_lam_hop_dong) IN (10,11,12) AND YEAR(hd.ngay_lam_hop_dong) = 2020
AND hd.ma_hop_dong
NOT IN (SELECT ma_hop_dong FROM hop_dong WHERE MONTH(hd.ngay_lam_hop_dong)