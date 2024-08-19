CREATE DATABASE demo_db;
USE demo_db;
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_price DECIMAL(10 , 2 ) NOT NULL,
    product_amount INT NOT NULL,
    product_description TEXT,
    product_status ENUM('Available', 'Out of Stock') NOT NULL
);
INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
('P001', 'Laptop X1', 999.99, 50, 'High-performance laptop with 16GB RAM and 512GB SSD.', 'Available'),
('P002', 'Smartphone Z', 499.99, 150, 'Latest smartphone with a 6.5-inch display and 128GB storage.', 'Available'),
('P003', 'Wireless Mouse', 29.99, 200, 'Ergonomic wireless mouse with adjustable DPI.', 'Available'),
('P004', 'Bluetooth Headphones', 89.99, 75, 'Noise-cancelling Bluetooth headphones with long battery life.', 'Out of Stock'),
('P005', '4K Monitor', 299.99, 30, '27-inch 4K monitor with excellent color accuracy.', 'Available');
--------------------------------------------------------------------------------------------------------------------------------
CREATE UNIQUE INDEX index_product_code ON products(product_code);
ALTER TABLE products
ADD INDEX index_product_name_product_price (product_name, product_price);
EXPLAIN SELECT * FROM products WHERE product_code = 'P001';
--------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW view_products AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        products;
DROP VIEW view_products;
--------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE find_all_products()
BEGIN
    SELECT * FROM products;
END
//DELIMITER ;
--------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE add_product(
    IN in_product_code VARCHAR(50),
    IN in_product_name VARCHAR(100),
    IN in_product_price DECIMAL(10, 2),
    IN in_product_amount INT,
    IN in_product_description TEXT,
    IN in_product_status ENUM('Available', 'Out of Stock')
)
BEGIN
    INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (in_product_code, in_product_name, in_product_price, in_product_amount, in_product_description, in_product_status);
END
//DELIMITER ;
--------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE update_product(
    IN in_id INT,
    IN in_product_code VARCHAR(50),
    IN in_product_name VARCHAR(100),
    IN in_product_price DECIMAL(10, 2),
    IN in_product_amount INT,
    IN in_product_description TEXT,
    IN in_product_status ENUM('Available', 'Out of Stock')
)
BEGIN
    UPDATE products
    SET product_code = in_product_code,
        product_name = in_product_name,
        product_price = in_product_price,
        product_amount = in_product_amount,
        product_description = in_product_description,
        product_status = in_product_status
    WHERE id = in_id;
END
//DELIMITER ;
--------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE delete_product(
    IN in_id INT
)
BEGIN
    DELETE FROM products
    WHERE id = in_id;
END
//DELIMITER ;