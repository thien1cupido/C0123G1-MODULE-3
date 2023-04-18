USE furama;
-- Task 3--

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.
SELECT * FROM nhan_vien
WHERE  LENGTH(ho_ten) <= 15 AND
ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%';

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * FROM khach_hang
WHERE round(datediff(curdate(),ngay_sinh)/365)
BETWEEN 18 AND 50 AND (dia_chi LIKE'% Đà Nẵng' OR dia_chi LIKE'% Quảng Trị');

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.ma_khach_hang,kh.ho_ten,COUNT(kh.ma_khach_hang) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON lk.ma_loai_khach=kh.ma_loai_khach
JOIN hop_dong hd ON hd.ma_khach_hang =kh.ma_khach_hang
WHERE lk.ten_loai_khach = "Diamond"
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
SUM(dv.chi_phi_thue+ifnull((hdct.so_luong*dvdk.gia),0)) AS tong_tien
FROM khach_hang kh
JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
LEFT JOIN hop_dong hd ON hd.ma_khach_hang =kh.ma_khach_hang
LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem =hdct.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang,hd.ma_hop_dong
ORDER BY  tong_tien