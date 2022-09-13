DROP DATABASE IF EXISTS erd_sang_mh_quan_he;
CREATE DATABASE erd_sang_mh_quan_he;
USE erd_sang_mh_quan_he;

CREATE TABLE phieu_xuat(
	so_phieu_xuat INT PRIMARY KEY,
	ngay_xuat DATE
);

CREATE TABLE vat_tu(
	ma_vat_tu INT PRIMARY KEY,
    ten_vat_tu VARCHAR(55)
);

CREATE TABLE chi_tiet_phieu_xuat(
    so_phieu_xuat INT,
    ma_vat_tu INT,
	don_gia_xuat DOUBLE,
    so_luong_xuat INT,
    PRIMARY KEY (so_phieu_xuat,ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat) REFERENCES phieu_xuat (so_phieu_xuat),
	FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap(
	so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap(
	ma_vat_tu INT,
    so_phieu_nhap INT,
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    PRIMARY KEY (ma_vat_tu,so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap)
);

CREATE TABLE don_dat_hang(
	so_don_dat_hang INT PRIMARY KEY,
    ngay_dat_hang DATE
);

CREATE TABLE chi_tiet_don_dat_hang(
	so_don_dat_hang INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_don_dat_hang,ma_vat_tu),
    FOREIGN KEY (so_don_dat_hang) REFERENCES don_dat_hang (so_don_dat_hang),
    FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE nha_cung_cap(
	ma_so_nha_cung_cap INT PRIMARY KEY,
	ten_nha_cung_cap VARCHAR(55),
    dia_chi VARCHAR(55)
);

CREATE TABLE cung_cap(
	so_don_dat_hang INT,
    ma_so_nha_cung_cap INT,
    PRIMARY KEY (so_don_dat_hang,ma_so_nha_cung_cap),
    FOREIGN KEY (so_don_dat_hang) REFERENCES chi_tiet_don_dat_hang (so_don_dat_hang),
    FOREIGN KEY (ma_so_nha_cung_cap) REFERENCES nha_cung_cap (ma_so_nha_cung_cap)
);
