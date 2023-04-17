USE furama;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dv.ma_dich_vu, dv.ten_dich_vu,dv.dien_tich, chi_phi_thue,ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu =ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (SELECT hd.ma_dich_vu
FROM hop_dong hd WHERE YEAR(hd.ngay_lam_hop_dong) = 2021 AND QUARTER(hd.ngay_lam_hop_dong) = 1);

-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu 
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
JOIN hop_dong hd ON dv.ma_dich_vu=hd.ma_dich_vu
WHERE dv.ma_dich_vu IN (SELECT hd.ma_dich_vu FROM hop_dong hd WHERE  YEAR (hd.ngay_lam_hop_dong)=2020)
AND dv.ma_dich_vu NOT IN (SELECT hd.ma_dich_vu FROM hop_dong hd WHERE  YEAR (hd.ngay_lam_hop_dong)=2021)
GROUP BY hd.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- Cách 1
SELECT DISTINCT(ho_ten) FROM khach_hang;

-- Cách 2
SELECT ho_ten FROM khach_hang
GROUP BY ho_ten;

-- Cách 3
SELECT DISTINCT(ho_ten) FROM khach_hang
WHERE ho_ten IN (SELECT ho_ten FROM khach_hang);

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT  month(ngay_lam_hop_dong) AS `month`,COUNT(ngay_lam_hop_dong) AS so_luong
FROM hop_dong hd
WHERE year(ngay_lam_hop_dong)=2021
GROUP BY `month`
ORDER BY `month`;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,ifnull(SUM(hdct.so_luong),0) AS so_luong_dich_vu_di_kem 
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong =hd.ma_hop_dong 
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem =hdct.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong