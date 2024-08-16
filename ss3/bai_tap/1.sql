create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
CREATE TABLE class (
    class_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    status BIT
);
CREATE TABLE student (
    student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);
CREATE TABLE subject (
    sub_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT DEFAULT 1 CHECK (credit >= 1),
    status BIT DEFAULT 1
);
CREATE TABLE mark (
    mark_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 1 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    FOREIGN KEY (sub_id)
        REFERENCES subject (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date(), 0);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO subject
VALUES 
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES 
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);
--------------------
SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';
--------------------
SELECT 
    *
FROM
    class
WHERE
    start_date >= '2024-12-01 00:00:00'
        AND start_date < '2024-12-31 00:00:00';
--------------------
SELECT 
    *
FROM
    subject
WHERE
    credit BETWEEN 3 AND 5;
--------------------
SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'hung';
SET SQL_SAFE_UPDATES = 1;
--------------------
SELECT 
    student_name, sub_name, mark
FROM
    mark
        JOIN
    subject ON subject.sub_id = mark.sub_id
        JOIN
    student ON student.student_id = student.student_id
ORDER BY mark ASC , student.student_name DESC;