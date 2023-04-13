CREATE DATABASE student_management;
USE student_management;
CREATE TABLE classes(
		id INT PRIMARY KEY,
        `name` VARCHAR(50)
        );
CREATE TABLE teacher(
		id INT PRIMARY KEY,
        `name` VARCHAR(50),
        age INT,
        country VARCHAR(50)
        );
-- Thêm giá trị vào bảng class
INSERT INTO classes(id, `name`) VALUE(1,"C0123G1");  
 -- truy xuất bảng class
 SELECT *FROM classes;
 -- Thêm nhiều giá trị vào bảng
 INSERT INTO teacher VALUES(1,"then",24,"Viet Nam"),(2,"thien",23,"Viet Nam");
-- chỉnh sửa giá trị trong bảng
 UPDATE teacher set `name` ="trung" WHERE id=1;
SELECT *FROM teacher;
INSERT INTO teacher(id, `name`,age,country) VALUE(3,"nguyen",25,"Thai Lan");  
-- Xóa 1 hàng trong bảng
DELETE FROM teacher WHERE id=3;
-- Thêm 1 cột vào bảng
ALTER TABLE teacher ADD COLUMN gender varchar(5);
-- Tắt safe mode
SET SQL_SAFE_UPDATES =0;
-- chỉnh sửa toàn bộ
UPDATE teacher set gender="nam";
-- mở lại safe mode
SET SQL_SAFE_UPDATES=1;
INSERT INTO teacher(id, `name`,age,country) VALUE(4,"hà",20,"Viet Nam");
-- chỉnh sửa tại id 
UPDATE teacher set gender="nữ" WHERE id=4;
INSERT INTO teacher(id, `name`,age,country) VALUE(5,"thang",24,"Viet Nam");