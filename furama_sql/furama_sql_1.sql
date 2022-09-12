DROP DATABASE IF EXISTS furama_case_study;
CREATE DATABASE furama_case_study;
USE furama_case_study;

CREATE TABLE vi_tri(
	ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ten_vi_tri VARCHAR(45) NOT NULL
);

CREATE TABLE trinh_do(
	ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45) NOT NULL
);

CREATE TABLE bo_phan (
	ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45) NOT NULL
);

CREATE TABLE nhan_vien (
	ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR (45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
	ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45) NOT NULL
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ma_loai_khach INT NOT NULL,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach (ma_loai_khach)
);

CREATE TABLE loai_dich_vu (
	ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45) NOT NULL
);

CREATE TABLE dich_vu(
	ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    tieu_chuan_phong VARCHAR(45) NOT NULL,
    mo_ta_tien_nghi_khac VARCHAR(45) NOT NULL,
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem(
	ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
	ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45) NOT NULL
);

CREATE TABLE hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL,
    FOREIGN KEY (ma_hop_dong) REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

CREATE TABLE hop_dong (
	ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu (ma_dich_vu)
);

INSERT INTO vi_tri(ten_vi_tri)
VALUES ('Quản lý'),
('Nhnhan_vienn viên');

INSERT INTO trinh_do(ten_trinh_do)
VALUES ('Trung Cấp'),
('Cao Đẳng'),
('Đại học'),
('Sau Đại Học');

INSERT INTO bo_phan (ten_bo_phan)
VALUES ('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

INSERT INTO nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
VALUES ('Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');






