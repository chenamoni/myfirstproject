-- DAY-1 --
use chandu_1;
show tables;

select * from employee;
update  employee set department='cse' where department='eee';
insert  employee values(106,'achyuth','cse',19500);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Quantity INT
);
INSERT INTO Products (ProductID, ProductName, Quantity) VALUES
(1, 'Widget A', 10),
(2, 'Widget B', 35),
(3, 'Gadget X', 50),
(4, 'Gizmo Y', 20);
select * from products;

update products set quantity=10 where productId=4;

drop table orders;
CREATE TABLE ORDERS (
    ORDERID INT PRIMARY KEY,
    ORDERNAME VARCHAR(255) NOT NULL,
    OrderAmount int,
    STATUS VARCHAR(50)
);
INSERT INTO ORDERS (ORDERID, ORDERNAME,orderAmount, STATUS) VALUES
(1, 'Order001',1500, 'Processing'),
(2, 'Order002',2000, 'Shipped'),
(3, 'Order003',3500, 'cancelled'),
(4, 'Order004',2200, 'Delivered');
select * from orders;

delete from orders where status='cancelled';

select * from products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);
-- Inserting dummy records into the Products table
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop A', 'Computers', 12000.00),
(2, 'Smartphone X', 'Electronics', 2000.00),
(3, 'Headphones Y', 'Electronics', 800.00),
(4, 'Tablet B', 'Computers', 3500.00),
(5, 'Camera Z', 'Electronics', 450.00),
(6, 'Keyboard C', 'Computers', 500.00);

select * from products where category='electronics' and price<1000;

-- Creating the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    CustomerLocation VARCHAR(100),
    CustomerSalary DECIMAL(10, 2)
);

-- Inserting dummy records into the Customers table
INSERT INTO Customers (CustomerID, CustomerName, CustomerLocation, CustomerSalary) VALUES
(1, 'John Doe', 'New York', 75000.00),
(2, 'Jane Smith', 'Los Angeles', 62000.50),
(3, 'Bob Johnson', 'Chicago', 85000.75),
(4, 'Alice Williams', 'San Francisco', 92000.25),
(5, 'Charlie Brown', 'Seattle', 68000.80);
drop table products;

select * from customers order by customername;

select * from products;

select count(*) as total_orders from orders;

-- Creating the Products table
select * from products;
CREATE TABLE Products_1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Category varchar(255),
    price int,
    Quantity INT
);
-- Inserting dummy records into the Products table
INSERT INTO Products_1 (ProductID, ProductName,Category,price, Quantity) VALUES
(1, 'Computer', 'elctronics',1000,50),
(2, 'washing machine', 'electricals',800,100),
(3, 'Tablet','electronics' ,600,30),
(4, 'grinder','electricals', 500,20);
-- Creating the Suppliers table
CREATE TABLE Suppliers (
    SupplierName VARCHAR(255) PRIMARY KEY,
    Category VARCHAR(50) NOT NULL
);

-- Inserting dummy records into the Suppliers table
INSERT INTO Suppliers (SupplierName, Category) VALUES
('SupplierA', 'Electronics'),
('SupplierB', 'Electricals'),
('SupplierC', 'Furniture'),
('SupplierD', 'Clothing');


-- Creating the Categories table
CREATE TABLE Categories (
    ProductName VARCHAR(255) PRIMARY KEY,
    Category VARCHAR(50) NOT NULL
);

-- Inserting dummy records into the Categories table
INSERT INTO Categories (ProductName, Category) VALUES
('Computer', 'Electronics'),
('Mobile Phone', 'Electronics'),
('Tablet', 'Electronics'),
('Refrigerator', 'Electricals'),
('Washing Machine', 'Electricals'),
('Blender', 'Electricals');
select * from categories;
select * from suppliers;
select * from products;
alter table products add column price int after category;
select p.productname,c.category,s.suppliername from products as p 
inner join categories as c on p.category=c.category 
inner join suppliers as s on p.category=s.category  order by productid;

select * from orders;
select * from customers;
select c.customername,o.orderamount from customers as c 
inner join orders as o on c.customerid=o.orderid 
where orderamount>1000;	
alter table products drop column price;
select * from employee;

select department,max(salary) as Maximum_salary from employee group by department ;

alter table products add column quantity int;
select * from products_1;
select * from customers;

select c.customername,sum(price*quantity) as Total_Revenue  from products_1 as p 
right join customers as c on p.productid=c.customerid group by customername;
