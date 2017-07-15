-- Here we create the database, starting with delete database and then 
-- create, we add USE keyword to use the database. Follow with the
-- creation of the table (products) of 10 items for sale.


-- Creating the database --
CREATE DATABASE bamazon_db;

USE bamazon_db;

-- Creating the table --
CREATE TABLE products (
    item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    deparment_name VARCHAR(50) NOT NULL,
    price FLOAT(10, 2) NOT NULL,
    stock_quantity INTEGER(7) NOT NULL,
    PRIMARY KEY (item_id)
);

-- List of 10 products --
INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Apple iPhone 4', 'Electronics', 399.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Jaybird X3 Headset', 'Electronics', 99.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Boxing Gloves', 'Sports', 14.99, 400);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Soccer Ball', 'Sports', 4.99, 400);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Call of Duty', 'Games', 49.99, 20);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Monopoly', 'Games', 19.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Beach Umbrella', 'Seasonal', 14.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Water Slide', 'Seasonal', 94.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Water Hose', 'Garden', 7.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Gazibo', 'Garden', 99.99, 40);


-- Bonus feelin' brave ;) --
CREATE TABLE Departments (
    department_id INTEGER(11) AUTO_INCREMENT NOT NULL,
    deparment_name VARCHAR(50) NOT NULL,
    overhead_cost FLOAT(7, 2) NOT NULL,
    total_sales FLOAT(7, 2) NOT NULL,
    PRIMARY KEY (department_id)
);

INSERT INTO Departments (deparment_name, overhead_cost, total_sales)
VALUES ('Electronics', 2000, 0);

INSERT INTO Departments (deparment_name, overhead_cost, total_sales)
VALUES ('Sports', 300, 0);

INSERT INTO Departments (deparment_name, overhead_cost, total_sales)
VALUES ('Games', 400, 0);

INSERT INTO Departments (deparment_name, overhead_cost, total_sales)
VALUES ('Seasonal', 300, 0);

INSERT INTO Departments (deparment_name, overhead_cost, total_sales)
VALUES ('Garden', 100, 0);

INSERT INTO Departments (deparment_name, overhead_cost, total_sales)
VALUES ('Garden', 100, 0);