CREATE DATABASE study_case;
USE study_case;

CREATE TABLE category (
    name_category VARCHAR(255) PRIMARY KEY,
    describe_category TEXT
);

CREATE TABLE product (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    name_product VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL DEFAULT 100 CHECK (price > 0),
    name_category VARCHAR(255),
    describe_product TEXT,
    FOREIGN KEY (name_category)
        REFERENCES category (name_category)
);

CREATE TABLE img_product (
    img BLOB,
    id_product INT,
    FOREIGN KEY (id_product)
        REFERENCES product (id_product)
);

CREATE TABLE user_account (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(100),
    email VARCHAR(50),
    phone VARCHAR(10),
    citizen VARCHAR(12),
    address VARCHAR(255) DEFAULT 'Việt Nam',
    role_user VARCHAR(50) DEFAULT 'ROLE_USER'
);

CREATE TABLE provider (
    id_provider INT PRIMARY KEY AUTO_INCREMENT,
    name_provider VARCHAR(255),
    phone_provider VARCHAR(10),
    email_provider VARCHAR(100)
);

CREATE TABLE provider_product (
    id_provider INT,
    id_product INT,
    PRIMARY KEY (id_provider, id_product),
    FOREIGN KEY (id_provider) REFERENCES provider (id_provider),
    FOREIGN KEY (id_product) REFERENCES product (id_product)
);

CREATE TABLE review (
    person_review VARCHAR(35),
    id_product INT,
    id_user INT,
    content_review VARCHAR(255),
    rating_review INT,
    date_review DATE,
    FOREIGN KEY (id_product)
        REFERENCES product (id_product),
    FOREIGN KEY (id_user)
        REFERENCES user_account (id_user)
);

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT NOT NULL,
    last_updated DATETIME NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES product (id_product)
);

CREATE TABLE user_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('processing', 'completed')),
    order_date DATETIME NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES user_account (id_user),
    FOREIGN KEY (product_id)
        REFERENCES product (id_product)
);

CREATE TABLE payment (
    id_payment INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    method_payment VARCHAR(35),
    status_payment BIT,
    date_payment DATE,
    FOREIGN KEY (order_id) 
        REFERENCES user_order (order_id)
);
