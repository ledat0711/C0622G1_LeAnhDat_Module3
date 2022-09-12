DROP DATABASE IF EXISTS furama_case_study;
CREATE DATABASE furama_case_study;
USE furama_case_study;

CREATE TABLE vi_tri(
	ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);
INSERT INTO vi_tri(ten_vi_tri)
VALUES ("Quản lý"),
		("Nhân viên");
