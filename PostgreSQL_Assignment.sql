-- 1. Create a database named bookstore_db
CREATE DATABASE bookstore_db;


-- 2. Create a table named books
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(220) NOT NULL,
  author VARCHAR(200) NOT NULL,
  price NUMERIC(10, 2) CHECK (price >= 0) NOT NULL,
  stock INT CHECK (stock >= 0) NOT NULL,
  published_year INT CHECK (published_year > 0) NOT NULL
);


-- 3. Create a table named customers
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  joined_date DATE DEFAULT CURRENT_DATE
);


-- 4. Create a table named orders
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  book_id INT REFERENCES books(id) ON DELETE CASCADE,
  quantity INT CHECK (quantity > 0) NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 5. Insert sample data into books table
INSERT INTO books (id, title, author, price, stock, published_year) VALUES
(1, 'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
(2, 'Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
(4, 'Refactoring', 'Martin Fowler', 50.00, 3, 1999),
(5, 'Database Design Principles', 'Jane Smith', 20.00, 0, 2018);


-- 6. Insert sample data into customers table
INSERT INTO customers (id, name, email, joined_date) VALUES
(1, 'Alice', 'alice@email.com', '2023-01-10'),
(2, 'Bob', 'bob@email.com', '2022-05-15'),
(3, 'Charlie', 'charlie@email.com', '2023-06-20'),
(4, 'David', 'david@email.com', '2024-02-12'),
(5, 'Eva', 'eva@email.com', '2024-07-25');


-- 7. Insert sample data into orders table
INSERT INTO orders (id, customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2024-03-10'),
(2, 2, 1, 1, '2024-02-20'),
(3, 1, 3, 2, '2024-03-05');


-- 8. View all data from books
SELECT * FROM books;

-- 9. View all data from customers
SELECT * FROM customers;

-- 10. View all data from orders
SELECT * FROM orders;


-- 11. Find books that are out of stock
SELECT title FROM books
WHERE stock = 0;


-- 12. Retrieve the most expensive book using subquery
SELECT * FROM books
WHERE price = (SELECT MAX(price) FROM books);


-- 13. Find total number of orders placed by each customer
SELECT customers.name, COUNT(orders.id) AS total_orders
FROM customers
JOIN orders ON customer_id = customers.id
GROUP BY customers.name;


-- 14. Calculate total revenue generated from all orders
SELECT SUM(orders.quantity * books.price) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;


-- 15. List all customers who have placed more than one order
SELECT customers.name, COUNT(orders.id) AS orders_count
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING COUNT(orders.id) > 1;


-- 16. Find the average price of books in the store
SELECT ROUND(AVG(price), 2) AS average_price
FROM books;


-- 17. Increase the price of all books published before 2000 by 10%
UPDATE books
SET price = price * 1.1
WHERE published_year < 2000;


-- 18. Delete customers who haven't placed any orders
DELETE FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);
