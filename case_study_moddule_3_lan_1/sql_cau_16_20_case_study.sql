USE furama;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SELECT *FROM hop_dong
J
   WHERE hop_dong.ma_nhan_vien = nhan_vien.
   
    AND hop_dong.ngay_ky BETWEEN '2019-01-01' AND '2021-12-31'