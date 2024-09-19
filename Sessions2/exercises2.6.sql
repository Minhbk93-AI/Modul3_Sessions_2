CREATE TABLE exercises2_6;
USE exercises2_6;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    permission INT
    );
    
CREATE TABLE catalog(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    status BIT NOT NULL
);

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DOUBLE NOT NULL,
    stock INT,
    FOREIGN KEY (catalog_Id) REFERENCES catalog(id),
    status BIT NOT NULL
);
    
CREATE TABLE wishlish(
	FOREIGN KEY (user_Id) REFERENCES users(id),
    FOREIGN KEY (product_Id) REFERENCES product(id)
);

CREATE TABLE shopping_cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (user_Id) REFERENCES users(id),
    FOREIGN KEY (product_Id) REFERENCES product(id),
    quantity INT NOT NULL
);

CREATE TABLE address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (user_Id) REFERENCES users(id),
    receiveAddress VARCHAR(100) NOT NULL,
    receiveName VARCHAR(100) NOT NULL,
    receivePhone VARCHAR(11) NOT NULL,
    isDefaut BIT NOT NULL
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    orderAt DATETIME,
    totals DOUBLE NOT NULL,
	FOREIGN KEY (user_Id) REFERENCES users(id),
    status BIT NOT NULL
);

CREATE TABLE order_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (order_Id) REFERENCES orders(id),
    FOREIGN KEY (product_Id) REFERENCES product(id),
    quantity INT,
    unit_price DOUBLE
);