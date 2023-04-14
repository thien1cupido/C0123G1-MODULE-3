CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer(
	c_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT
);
CREATE TABLE orders(
	o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_total_price INT,
    FOREIGN KEY (c_id) REFERENCES customer(c_id)
    );
CREATE TABLE product(
	p_ID INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(50),
    p_price INT
    );
CREATE TABLE order_detail(
	o_id INT,
    p_id INT,
    od_QTY INT,
    PRIMARY KEY (o_id,c_id),
    FOREIGN KEY (o_id) REFERENCES orders (o_id),
    FOREIGN KEY (p_id) REFERENCES product (p_id)
    );

 