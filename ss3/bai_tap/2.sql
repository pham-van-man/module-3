create database quan_ly_ban_hang;
use quan_ly_ban_hang;
CREATE TABLE customer (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(255),
    c_age INT CHECK (c_age >= 18)
);
CREATE TABLE or_der (
    o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_total_price INT,
    foreign key (c_id) references customer (c_id)
);
 CREATE TABLE product (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(255),
    p_price INT
);
  CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES or_der (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id),
    od_qty INT
);
insert into customer (c_name, c_age)
value 
('minh quan',20),
('ngoc oanh',20),
('hong ha',50);
insert into or_der (c_id, o_date)
value 
(1, '2006-03-21'),
(2, '2006-03-23'),
(1, '2006-03-16');
insert into product (p_name, p_price)
value 
('may giat', 3),
('tu lanh', 5),
('dieu hoa', 7),
('quat', 1),
('bep dien', 2);
insert into order_detail (o_id, p_id, od_qty)
value 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),	
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
--------------------
SELECT 
    o_id, o_date, o_total_price
FROM
    or_der;
--------------------
SELECT 
    c_name, p_name
FROM
    customer
        JOIN
    or_der ON or_der.c_id = customer.c_id
        JOIN
    order_detail ON order_detail.o_id = or_der.o_id
        JOIN
    product ON product.p_id = order_detail.p_id;
--------------------
SELECT 
    *
FROM
    customer
        LEFT JOIN
    or_der ON or_der.c_id = customer.c_id
WHERE
    o_id IS NULL;
--------------------
SELECT 
    or_der.o_id, or_der.o_date, SUM(product.p_price * order_detail.od_qty) AS o_total_price
FROM
    or_der
        JOIN
    order_detail ON order_detail.o_id = or_der.o_id
        JOIN
    product ON order_detail.p_id = product.p_id
GROUP BY or_der.o_id;
