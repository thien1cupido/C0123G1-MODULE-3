CREATE DATABASE quan_ly_diem_thi;
USE quan_ly_diem_thi;
CREATE TABLE hoc_sinh(
	ma_HS INT AUTO_INCREMENT PRIMARY KEY,
    ten_HS VARCHAR(45) NOT NULL,
    ngay_sinh DATE,
    lop CHAR(5),
    goi_tinh BIT(1)
    );
 
CREATE TABLE giao_vien(
	ma_GV INT AUTO_INCREMENT PRIMARY KEY,
    ten_GV VARCHAR(45),
    SDT VARCHAR(45)
    );   

CREATE TABLE mon_hoc(
	ma_MH INT AUTO_INCREMENT PRIMARY KEY,
    ten_MH VARCHAR(45),
    ma_GV INT,
    FOREIGN KEY (ma_GV) REFERENCES giao_vien(ma_GV)
    );
CREATE TABLE bang_diem(
	ma_HS INT,
    ma_MH INT,
    diem_thi FLOAT,
    ngay_KT DATETIME,
    PRIMARY KEY(ma_HS,ma_MH),
    FOREIGN KEY(ma_HS) REFERENCES hoc_sinh(ma_HS),
    FOREIGN KEY(ma_MH) REFERENCES mon_hoc(ma_MH)
    );