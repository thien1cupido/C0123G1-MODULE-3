CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE classes(
    id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    `status`   BIT
);
CREATE TABLE student(
    id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    `status`      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes (id)
);
CREATE TABLE subjects(
    id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    `status`  BIT                  DEFAULT 1
);

CREATE TABLE exam(
    id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES subjects (id),
    FOREIGN KEY (student_id) REFERENCES student (id)
);

INSERT INTO classes
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO classes
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO classes
VALUES (3, 'B3', current_date, 0);


INSERT INTO student (`name`, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (`name`, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (`name`, address, phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO exam (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);       
        
SELECT * FROM student
WHERE `name` LIKE 'h%';

SELECT * FROM classes
HAVING month(start_date)=12;

SELECT * FROM subjects
WHERE credit BETWEEN 3 AND 5;

SET SQL_SAFE_UPDATES=0;
UPDATE student SET class_id=2
WHERE `name`="Hung";
SET SQL_SAFE_UPDATES=1;

SELECT s.`name` AS name_sutdent ,sub.`name` AS subjects_name,e.mark
FROM  exam e
JOIN student s ON s.id=e.student_id
JOIN subjects sub ON sub.id =e.sub_id
ORDER BY e.mark DESC, name_sutdent ASC;	