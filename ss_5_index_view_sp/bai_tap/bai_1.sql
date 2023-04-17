-- Bước 1
CREATE DATABASE demo;
USE demo;
-- Bước 2
-- Tạo bảng
CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_code INT UNIQUE,
    product_name VARCHAR(50) NOT NULL,
    product_price INT NOT NULL CHECK (product_price>0),
    product_amount INT NOT NULL CHECK (product_amount>0),
    product_decription VARCHAR(50),
    product_status BIT(1)
);

-- Thêm dữ liệu vào bảng
INSERT INTO products
VALUES(1,1,"Iphone7",500,15,"da qua su dung",0),
	(2,2,"Iphone8",1000,10,"da qua su dung",1),
	(3,3,"Iphone9",1500,5,"da qua su dung",1),
	(4,4,"Iphone10",2000,1,"da qua su dung",0),
	(5,5,"Iphone14",3000,5,"moi",1);
    
-- Bước 3
-- Tạo Unique Index trên bảng Products
CREATE UNIQUE INDEX i_product_code ON products( product_code);
-- Tạo Composite Index trên bảng Products 
CREATE INDEX i_name_price ON products(product_name,Product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT productCode FROM products;
EXPLAIN SELECT product_name,Product_price FROM products;

-- Bước 4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW get_information_product
AS
SELECT product_code,product_name,product_price,product_status FROM products;
-- Hiển thị view
SELECT * FROM get_information_product;
-- Sửa view 
SET SQL_SAFE_UPDATES =0;
UPDATE get_information_product SET product_name ='iphone12' WHERE product_name ='iphone9';
SET SQL_SAFE_UPDATES =1;
-- Xoá view
DROP VIEW get_information_product;

-- Bước 5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
CREATE PROCEDURE get_all_products()
BEGIN
SELECT*FROM products;
END //
delimiter ;

CALL get_all_products();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
CREATE PROCEDURE add_product(IN id INT,product_code INT,product_name VARCHAR(50),product_price INT,product_amount INT,product_decription VARCHAR(50),product_status BIT(1))
BEGIN
INSERT INTO products
VALUE (id,product_code,product_name,product_price,product_amount,product_decription,product_status);
END //
delimiter ;

CALL update_product(6,6,"iphone13",3000,10,"moi",1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
CREATE PROCEDURE update_product(IN new_id INT,
								IN new_code INT,
                                IN new_name VARCHAR(50),
                                IN new_price INT,
                                IN new_amount INT,
                                IN new_decription VARCHAR(50),
                                IN new_status BIT(1))
BEGIN
UPDATE products SET new_code=product_code, 
					new_name = product_name,
					new_price=product_price,
					new_amount= product_amount,
					new_decription= product_decription, 
					new_status=product_status 
WHERE new_id=id;
END //
delimiter ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
CREATE PROCEDURE delect_product(IN new_id INT)
BEGIN
DELETE product
WHERE new_id=id;
END //
delimiter ;