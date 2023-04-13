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

INSERT INTO customer 
VALUES (1,"Minh Quan",10),
	   (2,"Ngoc Anh",20),
	   (3,"Hong Ha",30);
 
INSERT INTO orders(o_id,c_id,o_date,o_total_price)
VALUES (1,1,"2006-03-21",null),
		(2,2,"2006-03-23",null),
		(3,1,"2006-03-16",null);
        
INSERT INTO product
VALUES (1,"May Giat", 3),
		(2,"Tu Lanh", 5),
		(3,"Dieu Hoa", 7),
		(4,"Quat", 1),
		(5,"Bep Dien", 2);
    
INSERT INTO order_detail 
VALUES (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
        
SELECT o_id,o_date,o_total_price FROM orders;

SELECT c.`name` AS customer_name, p.p_name AS product_name
FROM customer c
INNER JOIN orders o ON c.c_id = o.c_id 
INNER JOIN order_detail od ON o.o_id = od.o_id 
INNER JOIN product p ON od.p_id = p.p_ID;
 
SELECT c.`name`,o.o_id
FROM customer c
LEFT JOIN orders o ON c.c_id = o.c_id
WHERE o.o_id IS NULL;

SELECT o.o_id, o.o_date, SUM(p.p_price * od.od_QTY) AS total_price
FROM orders o
INNER JOIN order_detail od ON o.o_id = od.o_id
INNER JOIN product p ON od.p_id = p.p_id
GROUP BY o.o_id;