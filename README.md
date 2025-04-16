# PostgreSQL Questions & Answers

## 1️⃣ What is PostgreSQL ? 

**PostgreSQL** একটি শক্তিশালী, ওপেন সোর্স, রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS) যা SQL (Structured Query Language) ব্যবহার করে ডেটাবেস পরিচালনা করতে ব্যবহৃত হয়।এটি ডেটা সংরক্ষণ, পরিচালনা করার জন্য ব্যবহৃত হয় | এটি ট্রানজেকশনাল সাপোর্ট, অ্যাডভান্সড কুয়েরি অপটিমাইজেশন, স্কেলেবিলিটি এবং ইন্টারনাল এক্সটেনসিবিলিটির জন্য পরিচিত।

### উদাহরণ:
PostgreSQL ডাটাবেস তৈরি করা:
```sql
CREATE DATABASE databaseName;
```

## 2️⃣ What is the purpose of a database schema in PostgreSQL?
**PostgreSQL** -এ স্কিমা মূলত ডাটাবেস সংগঠিত রাখার একটি উপায়। এটি একটি লজিক্যাল কন্টেইনার, যেখানে টেবিল, ভিউ, ইনডেক্স, ফাংশন ইত্যাদি রাখা যায়। একটি ডাটাবেসের মধ্যে একাধিক স্কিমা থাকতে পারে, যা একই ডাটাবেসের মধ্যে বিভিন্ন অ্যাপ্লিকেশন বা ইউজারের ডাটা আলাদা রাখতে সাহায্য করে। এটি ডাটাকে আলাদা ও নিরাপদ রাখতে সাহায্য করে এবং একই ডাটাবেসে একই নামের একাধিক টেবিল ব্যবহারের সুযোগ দেয়।
```sql
CREATE SCHEMA hr;
CREATE TABLE hr.employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
```
## 3️⃣ Explain the Primary Key and Foreign Key concepts in PostgreSQL.
***🔹 প্রাইমারি কী***

***Primary Key*** হলো একটি বা একাধিক কলামের সংমিশ্রণ, যা প্রতিটি সারিকে অনন্যভাবে চিহ্নিত করে। এটি NULL হতে পারে না এবং একটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে।

***🔹 ফরেন কী***

***Foreign Key*** হলো একটি কলাম, যা অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক তৈরি করে। এটি ডাটার অখণ্ডতা (Data Integrity) নিশ্চিত করে, যাতে সম্পর্কিত ডাটা ভুলবশত মুছে বা পরিবর্তন করা না যায়।

## 4️⃣ What is the difference between the VARCHAR and CHAR data types?
### ***VARCHAR*** 

1. পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে।

2. যতটুকু জায়গা প্রয়োজন, ঠিক ততটুকু ব্যবহার করে, অতিরিক্ত স্পেস নেয় না।

3. সর্বোচ্চ দৈর্ঘ্য নির্ধারণ করা যায় (যেমন: VARCHAR(50))।
```sql
name VARCHAR(50); -- সর্বোচ্চ ৫০ অক্ষর সংরক্ষণ করা যাবে।
```
### ***CHAR*** 
1. নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে।

2. ছোট ডাটা হলেও পুরো নির্ধারিত জায়গা দখল করে রাখে।

3. নির্দিষ্ট দৈর্ঘ্যের ডাটার জন্য দ্রুত কাজ করে।
```sql
code CHAR(10); -- সবসময় ১০ অক্ষরের জায়গা দখল করবে, ডাটা ছোট হলেও।
```
## 5️⃣ Explain the purpose of the WHERE clause in a SELECT statement.

WHERE clause ব্যবহার করে নির্দিষ্ট শর্ত অনুযায়ী ডাটা বের করা যায়। যখন ডাটাবেজে অনেক তথ্য থাকে, তখন WHERE ক্লজ ব্যবহার করে প্রয়োজনীয় তথ্য ফিল্টার করা হয়।

### **ব্যবহার** 
1. নির্দিষ্ট শর্তে ডাটা খুঁজতে – যেমন, বয়স ১৮-এর বেশি এমন শিক্ষার্থীদের বের করা।
2. তুলনা করতে – =, >, <, >=, <=, != দিয়ে চেক করা।
3. বেশি শর্ত একসাথে দিতে – AND, OR, NOT ব্যবহার করে।
4. আনুমানিক মিল খুঁজতে – LIKE, ILIKE দিয়ে আংশিক মিলিয়ে খোঁজা।
```sql
SELECT * FROM students WHERE age > 18;
```
## 6️⃣ What are the LIMIT and OFFSET clauses used for?
PostgreSQL-এ LIMIT এবং OFFSET ব্যবহার করে ডাটার নির্দিষ্ট অংশ দেখা যায়, যা পেজিনেশন (pagination) বা বড় ডাটাসেট থেকে নির্দিষ্ট পরিমাণ তথ্য আনতে সাহায্য করে।

### LIMIT 
1. রেকর্ডের সংখ্যা সীমিত করে।
2. যদি ১০০টি রেকর্ড থাকে এবং LIMIT 5 ব্যবহার করা হয়, তাহলে প্রথম ৫টি রেকর্ড ফেরত আসবে।
```sql
SELECT * FROM students LIMIT 5;
```
### OFFSET 
1. নির্দিষ্ট সংখ্যক রেকর্ড এড়িয়ে যায়।
2. সাধারণত LIMIT-এর সাথে ব্যবহার হয়, যাতে নির্দিষ্ট পৃষ্ঠার ডাটা দেখা যায়।
```sql
SELECT * FROM students LIMIT 5 OFFSET 10;
```

## 7️⃣ How can you modify data using UPDATE statements?
UPDATE স্টেটমেন্ট ব্যবহার করে ডাটাবেজের বিদ্যমান রেকর্ড পরিবর্তন করা যায়। এটি সাধারণত WHERE ক্লজের সাথে ব্যবহার করা হয়, যাতে শুধুমাত্র নির্দিষ্ট রেকর্ড পরিবর্তন করা হয়।
```sql
UPDATE table_name 
SET column1 = value1, column2 = value2 
WHERE condition;
```

## 8️⃣ What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN একটি খুবই শক্তিশালী অপারেশন, যা একাধিক টেবিলের মধ্যে সম্পর্কিত ডাটা একত্রিত করতে সাহায্য করে। ডাটাবেজে একাধিক টেবিল থাকতে পারে এবং কখনও কখনও তথ্য সম্পর্কিত টেবিলগুলো থেকে একসাথে আনা প্রয়োজন হয়। JOIN অপারেশন বিভিন্ন টেবিলের মধ্যে সম্পর্ক তৈরি করে, এবং এটি তথ্য বিশ্লেষণকে আরও কার্যকর এবং সহজ করে তোলে।

### PostgreSQL JOIN অপারেশন

PostgreSQL-এ `JOIN` অপারেশন ব্যবহার করে একাধিক টেবিলের মধ্যে সম্পর্কিত ডাটা একত্রিত করা হয়। নিচে বিভিন্ন ধরনের `JOIN` অপারেশন এবং তাদের কাজের বর্ণনা দেয়া হলো:

| **JOIN প্রকার**  | **কী করে?** |
|-----------------|-------------|
| **INNER JOIN**  | দুই টেবিলের মধ্যে **মিল থাকা রেকর্ডগুলো** দেখায়। |
| **LEFT JOIN**   | প্রথম (বাম) টেবিলের **সব রেকর্ড** দেখায়, আর দ্বিতীয় টেবিল থেকে **মিল পাওয়া রেকর্ড** যোগ করে। |
| **RIGHT JOIN**  | দ্বিতীয় (ডান) টেবিলের **সব রেকর্ড** দেখায়, আর প্রথম টেবিল থেকে **মিল পাওয়া রেকর্ড** যোগ করে। |
| **FULL JOIN**   | দুই টেবিলের **সব রেকর্ড** দেখায়, যেখানে মিল আছে বা নেই। |


## 9️⃣ Explain the GROUP BY clause and its role in aggregation operations.
PostgreSQL-এ GROUP BY ক্লজ ব্যবহার করে ডাটাকে একাধিক গ্রুপে ভাগ করা হয় এবং প্রতি গ্রুপের উপর অ্যাগ্রিগেট ফাংশন (যেমন: COUNT(), SUM(), AVG(), MAX(), MIN()) প্রয়োগ করা হয়। এটি ডাটা বিশ্লেষণ এবং সারাংশ তৈরি করতে সাহায্য করে।

### GROUP BY 
1. GROUP BY ডাটাকে একই মান থাকা রেকর্ডগুলোর গ্রুপ করে।
2. এরপর, অ্যাগ্রিগেট ফাংশন (যেমন: COUNT(), SUM(), AVG()) প্রয়োগ করা হয় গ্রুপের উপর, যার মাধ্যমে গ্রুপভিত্তিক বিশ্লেষণ করা যায়।
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;
```

## 🔟 How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?



**Aggregate Functions** হল এমন ফাংশন যা ডাটাবেসের এক বা একাধিক রেকর্ড থেকে একটি একক মান তৈরি করতে ব্যবহৃত হয়। এগুলি ডাটা বিশ্লেষণ ও গ্রুপিং করার জন্য খুবই কার্যকরী। PostgreSQL-এ কিছু সাধারণ অ্যাগ্রিগেট ফাংশন রয়েছে:

###  Aggregate Functions:

| **ফাংশন**   | **বর্ণনা**                                         |
|-------------|----------------------------------------------------|
| **`COUNT()`** | রেকর্ডের সংখ্যা গণনা করে।                          |
| **`SUM()`**   | একটি নির্দিষ্ট কলামের মান যোগ করে।                  |
| **`AVG()`**   | একটি নির্দিষ্ট কলামের গড় মান বের করে।               |

## GROUP BY ক্লজের সাথে Aggregate Functions

**`GROUP BY`** ক্লজ ব্যবহার করে একাধিক রেকর্ডের উপর অ্যাগ্রিগেট ফাংশন প্রয়োগ করতে পারেন, যা ডাটাকে গ্রুপ করে এবং প্রতিটি গ্রুপের উপর গণনা করে।

## Aggregate Functions এর উদাহরণ:

### 1. `COUNT()` ফাংশন উদাহরণ:

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```
### 2. `SUM()` ফাংশন উদাহরণ:



```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

### 3. `AVG()` ফাংশন উদাহরণ:

```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```



## **📜 Assignment Objective**  

This assignment focuses on **PostgreSQL** database operations. You will create and manage three tables (**books, customers, orders**), insert sample data, and perform essential SQL queries. Key tasks include **CRUD operations, constraints, JOINs, aggregations, filtering, and data manipulation** to reinforce your understanding of relational databases.

## **📂 Database Setup**

1️⃣ **Install PostgreSQL** on your system if it is not already installed.

2️⃣ Open **pgAdmin** or your PostgreSQL terminal.

3️⃣ **Create a new database** named **"bookstore_db"** or any appropriate name.

4️⃣ **Connect** to the newly created database.

---

## **📂 Table Creation**

1️⃣ **Create a "books" table** with the following fields:

- `id` (Primary Key): A unique identifier for each book.
- `title`: The name of the book.
- `author`: The author of the book.
- `price`: The price of the book (must be non-negative, enforced via CHECK constraint).
- `stock`: The number of available copies in stock.
- `published_year`: The year the book was published.

2️⃣ **Create a "customers" table** with the following fields:

- `id` (Primary Key): A unique identifier for each customer.
- `name`: The full name of the customer.
- `email`: The email address of the customer (must be unique).
- `joined_date`: The date the customer registered (default to the current date).

3️⃣ **Create an "orders" table** with the following fields:

- `id` (Primary Key): A unique identifier for each order.
- `customer_id` (Foreign Key): References the `id` field in the "customers" table.
- `book_id` (Foreign Key): References the `id` field in the "books" table.
- `quantity`: The number of books ordered (must be greater than zero).
- `order_date`: The date and time when the order was placed (default to the current timestamp).

---

## **📂 Sample Data**

### **1️⃣ `books` Table**

```markdown
| id  | title                        | author            | price | stock | published_year |
| --- | ---------------------------- | ----------------- | ----- | ----- | -------------- |
| 1   | The Pragmatic Programmer     | Andrew Hunt       | 40.00 | 10    | 1999           |
| 2   | Clean Code                   | Robert C. Martin  | 35.00 | 5     | 2008           |
| 3   | You Don't Know JS            | Kyle Simpson      | 30.00 | 8     | 2014           |
| 4   | Refactoring                  | Martin Fowler     | 50.00 | 3     | 1999           |
| 5   | Database Design Principles   | Jane Smith        | 20.00 | 0     | 2018           |
```

### **2️⃣ `customers` Table**

```markdown
| id  | name    | email              | joined_date  |
| --- | ------- | ------------------ | ------------ |
| 1   | Alice   | alice@email.com    | 2023-01-10   |
| 2   | Bob     | bob@email.com      | 2022-05-15   |
| 3   | Charlie | charlie@email.com  | 2023-06-20   |
```

### **3️⃣ `orders` Table**

```markdown
| id  | customer_id | book_id | quantity | order_date  |
| --- | ----------- | ------- | -------- | ----------- |
| 1   | 1           | 2       | 1        | 2024-03-10  |
| 2   | 2           | 1       | 1        | 2024-02-20  |
| 3   | 1           | 3       | 2        | 2024-03-05  |
```

---

## **📂 PostgreSQL Problems & Sample Outputs**

1️⃣ **Find books that are out of stock.**

**Sample Output:**

```markdown
title
----------------------------
Database Design Principles
```

2️⃣ **Retrieve the most expensive book in the store.**

**Sample Output:**

```markdown
| id  | title       | author        | price | stock | published_year |
| --- | ----------- | ------------- | ----- | ----- | -------------- |
| 4   | Refactoring | Martin Fowler | 50.00 | 3     | 1999           |
```

3️⃣ **Find the total number of orders placed by each customer.**

**Sample Output:**

```markdown
| name    | total_orders |
| ------- | ------------ |
| Alice   | 2            |
| Bob     | 1            |
```

4️⃣ **Calculate the total revenue generated from book sales.**

**Sample Output:**

```markdown
total_revenue
-----------------
135.00
```

5️⃣ **List all customers who have placed more than one order.**

**Sample Output:**

```markdown
| name    | orders_count |
| ------- | ------------ |
| Alice   | 2            |
```

6️⃣ **Find the average price of books in the store.**

**Sample Output:**

```markdown
avg_book_price
----------------------------
35.00
```

7️⃣ **Increase the price of all books published before 2000 by 10%.**

**Sample Output:** *(No table output, but affected rows will be updated accordingly.)*

```markdown
| id  | title                        | author             | price  | stock | published_year |
|-----|------------------------------|--------------------|--------|-------|----------------|
| 1   | The Pragmatic Programmer     | Andrew Hunt        | 44.00  | 10    | 1999           |
| 2   | Clean Code                   | Robert C. Martin   | 35.00  | 5     | 2008           |
| 3   | You Don't Know JS            | Kyle Simpson       | 30.00  | 8     | 2014           |
| 4   | Refactoring                  | Martin Fowler      | 55.00  | 3     | 1999           |
| 5   | Database Design Principles   | Jane Smith         | 20.00  | 0     | 2018           |
```

8️⃣ **Delete customers who haven't placed any orders.**

**Sample Output:** *(No table output, but affected rows will be removed accordingly.)*

```markdown
| id  | name    | email              | joined_date  |
| --- | ------- | ------------------ | ------------ |
| 1   | Alice   | alice@email.com    | 2023-01-10   |
| 2   | Bob     | bob@email.com      | 2022-05-15   |
```

---
