-- task_2.sql
-- Create all required tables in the alx_book_store database
-- All SQL keywords are in uppercase

USE alx_book_store;

-- AUTHORS table creation
-- Check for presence of "Authors" table
CREATE TABLE AUTHORS (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL
);

-- BOOKS table creation
-- Check for presence of "Books" table
CREATE TABLE BOOKS (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- CUSTOMERS table creation
-- Check for presence of "Customers" table
CREATE TABLE CUSTOMERS (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
);

-- ORDERS table creation
-- Check for presence of "Orders" table
CREATE TABLE ORDERS (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- ORDER_DETAILS table creation
-- Check for presence of "Order_Details" table
CREATE TABLE ORDER_DETAILS (
  orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE,
  FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
  FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
