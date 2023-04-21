USE furama1;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien
AS
SELECT nv.ma_nhan_vien,nv.ho_ten,nv.ngay_sinh,nv.dia_chi FROM nhan_vien AS nv
JOIN hop_dong AS hd ON hd.ma_nhan_vien =nv.ma_nhan_vien AND nv.dia_chi LIKE '%Hải Châu%'
WHERE ngay_lam_hop_dong= '2019-12-12';

--  22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET SQL_SAFE_UPDATES =0;
UPDATE v_nhan_vien SET dia_chi='Liên Chiểu';
SET SQL_SAFE_UPDATES =1;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
CREATE PROCEDURE sp_xoa_khach_hang(IN id_khach_hang INT)
BEGIN
DELETE FROM  khach_hang AS kh 
WHERE kh.ma_khach_hang =id_khach_hang;
END //
delimiter ;
SET FOREIGN_KEY_CHECKS =0;
CALL sp_xoa_khach_hang(2);
SET FOREIGN_KEY_CHECKS =1;

-- 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
CREATE PROCEDURE sp_them_moi_hop_dong(IN new_ma_hop_dong INT,IN new_ngay_lam_hop_dong DATETIME,IN new_ngay_ket_thuc DATETIME,
IN new_tien_dat_coc DOUBLE,IN new_ma_nhan_vien INT,IN new_ma_khach_hang INT,IN new_ma_dich_vu INT)
BEGIN
INSERT INTO hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
VALUE(new_ma_hop_dong,new_ngay_lam_hop_dong,new_ngay_ket_thuc,new_tien_dat_coc,new_ma_nhan_vien,new_ma_khach_hang,new_ma_dich_vu);
END //
delimiter ;

CALL sp_them_moi_hop_dong(13,"2020-09-15","2021-01-15",30000,3,3,1);

-- 25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

delimiter //
CREATE TRIGGER tr_xoa_hop_dong
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
DELETE FROM hop_dong WHERE ma_hop_dong =13;
END //
delimiter ;
SELECT * FROM hop_dong;
