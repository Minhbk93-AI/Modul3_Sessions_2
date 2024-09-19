CREATE DATABASE exercises2_5;
USE exercises2_5;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(11),
    permission BIT,
    status BIT
);
CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    receiveAddress VARCHAR(100),
    receiveName VARCHAR(100),
    receivePhone VARCHAR(11),
    isDefault BIT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE catalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status BIT
);
CREATE TABLE book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    stock INT NOT NULL,
    status BIT
);
CREATE TABLE book_catalog (
    catalog_id INT NOT NULL,
    book_id INT NOT NULL,
    PRIMARY KEY (catalog_id, book_id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orderAt DATETIME NOT NULL,
    address_id INT NOT NULL,
    user_id INT NOT NULL,
    status BIT,
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE order_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);


