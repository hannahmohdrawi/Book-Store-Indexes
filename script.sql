--Question 1: Familiarize yourself with what we are starting with, look at the first 10 rows in each table; customers, orders, and books to get a feel for what is in each.

SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

--Question 2: 
SELECT * FROM pg_indexes
WHERE tablename = 'customers';

SELECT * FROM pg_indexes
WHERE tablename = 'books';

SELECT * FROM pg_indexes
WHERE tablename = 'orders';

--Question 4:
EXPLAIN ANALYZE 
SELECT original_language, title, sales_in_millions 
FROM books
WHERE original_language = 'French';

--Question 5:
SELECT pg_size_pretty (pg_total_relation_size('books'));

--Question 6: 
CREATE INDEX
original_language_title_sales_in_millions ON books(sales_in_millions, original_language, title);

--Question 7: 

SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_indexes
WHERE tablename = 'customers';

SELECT * FROM pg_indexes
WHERE tablename = 'books';

SELECT * FROM pg_indexes
WHERE tablename = 'orders';

--Question 8: 
DROP INDEX IF EXISTS original_language_title_sales_in_millions;

--Question 9:

SELECT NOW();

\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;

SELECT NOW();
--Checking if there are any indexes left:
SELECT *
FROM pg_indexes
WHERE tablename = 'orders';

--No indexes left to delete.

CREATE INDEX customer_id_book_id_quantity_idx
ON orders(customer_id, book_id, quantity);

--Tables are quite small, no real need.

--Question 11:

--Answer 1: There isnt enough information to know if this is a good idea or not. The previous question indicated that the database is small enough to not require an index.
--Answer 2: We need specifics and how often these queries are required. WHERE clauses may be sufficient in this case.
--Answer 3: Does the boss want quicker answers? Experimentation may need to be performed to see if this is quicker. Does the boss know that INSERT, UPDATE, DELETE queries will be slower? Does he know the index will take up storage? 

--Question 4: Do all columns asked for need to be within the index? How common are all the last names in the table, possibly a last name parameter can be added to the index?

--Question 5: Speed of INSERT, UPDATE, DELETE queries will be impacted. The indexes will also take up storage space.

CREATE INDEX 
customers_last_index_email_address_first_name ON customers (last_name, email_address, first_name);


