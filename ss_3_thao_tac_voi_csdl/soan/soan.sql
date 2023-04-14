CREATE DATABASE bai_soan;
USE bai_soan;
CREATE TABLE classes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
    );
CREATE TABLE instructor(
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    birth_day DATE,
    salary INT
    );
CREATE TABLE instructor_class(
	i_id INT,
    c_id INT,
    start_time DATETIME,
    PRIMARY KEY(i_id,c_id),
    FOREIGN KEY(i_id) REFERENCES instructor(id),
    FOREIGN KEY(c_id) REFERENCES classes(id)
    );
CREATE TABLE student(
	id INT PRIMARY KEY,
    `name` VARCHAR(50),
    gender BIT(1),
    birth_day DATE,
    email VARCHAR(50),
    `point` INT,
    username VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id)  REFERENCES classes(id)
    );
    -- thêm dữ liệu vào bảng
    INSERT INTO classes VALUES(1,"c1121g1"),(2,"c1121g1"),(3,"a0821i1"),(4,"a0921i1");
    INSERT INTO instructor VALUES(1,"tran van chanh",'1985/3/2',100),
									(2,"tran minh chien",'1985/3/2',200),
									(3,"vu thanh tien",'1985/3/2',300),
									(4,"tran van nam",'1989/12/12',100);
                                    
INSERT INTO student VALUES(1,"c1121g1"),(2,"c1121g1"),(3,"a0821i1"),(4,"a0921i1");
SELECT * FROM instructor i
join instructor_class ic ON 
                                    
                                    