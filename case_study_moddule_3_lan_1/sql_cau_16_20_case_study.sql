USE furama;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES =0;
DELETE FROM nhan_vien nv
WHERE nv.ma_nhan_vien NOT IN (SELECT ma_nv FROM (SELECT DISTINCT(nv.ma_nhan_vien) AS ma_nv FROM nhan_vien nv
JOIN hop_dong hd ON hd.	ma_nhan_vien=nv.ma_nhan_vien
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021) AS table_nv);
SET SQL_SAFE_UPDATES =1;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
CREATE VIEW tong_tien_view
AS
SELECT kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
ifnull(dv.chi_phi_thue+SUM(ifnull((hdct.so_luong*dvdk.gia),0)),0) AS tong_tien
FROM khach_hang kh
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
LEFT JOIN hop_dong hd ON hd.ma_khach_hang =kh.ma_khach_hang
LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem =hdct.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang,hd.ma_hop_dong
HAVING tong_tien >1000000 AND lk.ten_loai_khach ="Platinium";

UPDATE khach_hang SET ma_loai_khach =1
WHERE ma_khach_hang = (SELECT ma_khach_hang FROM tong_tien_view);
  
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET SQL_SAFE_UPDATES =0;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM khach_hang 
WHERE ma_khach_hang IN(SELECT ma_kh FROM (
SELECT kh.ma_khach_hang AS ma_kh FROM khach_hang kh
JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
WHERE year(ngay_lam_hop_dong) <2021) AS ma_kh);
SET SQL_SAFE_UPDATES =1;
SET FOREIGN_KEY_CHECKS=1;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- UPDATE  ma_dich_vu_di_kem
-- SELECT *FROM hop_dong_chi_tiet hdct
-- JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
-- JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
-- WHERE year(hd.ngay_lam_hop_dong) =2020 AND hdct.so_luong>10;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
-- SELECT ma_nhan_vien,ma_khach_hang FROM nhan_vien
