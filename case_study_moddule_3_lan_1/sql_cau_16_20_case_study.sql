USE furama;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM nhan_vien nv
WHERE nv.ma_nhan_vien NOT IN (SELECT nv.ma_nhan_vien FROM nhan_vien nv
JOIN hop_dong hd ON hd.ma_nhan_vien=nv.ma_nhan_vien
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

SELECT *FROM loai_khach