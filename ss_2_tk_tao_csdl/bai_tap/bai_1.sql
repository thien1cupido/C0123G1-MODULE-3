CREATE DATABASE bai_tap_1;
USE bai_tap_1;


CREATE TABLE nha_cung_cap (
    ma_ncc INT AUTO_INCREMENT PRIMARY KEY,
    ten_ncc VARCHAR(50),
    dia_chi VARCHAR(50)
);
CREATE TABLE SDT (
    ten_SDT VARCHAR(10) PRIMARY KEY,
    ma_ncc INT,
    FOREIGN KEY(ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
    );
    
CREATE TABLE don_DH(
	so_DH INT AUTO_INCREMENT PRIMARY KEY,
    ngay_DH DATE,
    ma_ncc INT,
    FOREIGN KEY(ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
    );
    
CREATE TABLE vat_tu(
	ma_vat_tu INT AUTO_INCREMENT PRIMARY KEY,
    ten_vat_tu varchar(50)
);

 CREATE TABLE kho_hang(
 ma_vat_tu INT,
 so_DH INT,
 PRIMARY KEY(ma_vat_tu,so_DH),
 FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
 FOREIGN KEY(so_DH) REFERENCES don_DH(so_DH)
 );


CREATE TABLE phieu_xuat(
	so_phieu_xuat INT AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE
    );
    
 
 CREATE TABLE quan_li_xuat(
	so_phieu_xuat INT,
    ma_vat_tu INT,
    don_gia_xuat FLOAT,
    san_luong_xuat INT,
    PRIMARY KEY(so_phieu_xuat,ma_vat_tu),
    FOREIGN KEY(so_phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat),
    FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)	
 );
    
CREATE TABLE phieu_nhap(
	so_PN INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE quan_li_nhap(
	so_PN INT,
	ma_vat_tu INT,
    don_gia_nhap FLOAT,
    so_luong_nhap INT,
    PRIMARY KEY(so_PN,ma_vat_tu),
    FOREIGN KEY(so_PN) REFERENCES phieu_nhap(so_PN),
    FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
    );