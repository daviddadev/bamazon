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
VALUES ('iPhone', 'Electronics', 199.99, 10);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Headset', 'Electronics', 99.99, 10);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Gloves', 'Sports', 14.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Ball', 'Sports', 4.99, 10);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Zelda', 'Games', 49.99, 20);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Monopoly', 'Games', 19.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Umbrella', 'Seasonal', 4.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Slide', 'Seasonal', 94.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Hose', 'Garden', 7.99, 40);

INSERT INTO products (product_name, deparment_name, price, stock_quantity)
VALUES ('Shovel', 'Garden', 19.99, 40);


-- Manager Table --
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