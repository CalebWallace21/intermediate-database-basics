-- Section 1
-- SELECT * FROM invoice i JOIN invoice_line il ON il.invoice_id = i.invoice_id WHERE il.unit_price > 0.99;
-- SELECT i.invoice_date, c.first_name, c.last_name from invoice i JOIN customer c on i.customer_id = c.customer_id
-- SELECT c.first_name, c.last_name, e.first_name, e.last_name FROM customer c JOIN employee e ON c.support_rep_id = e.employee_id
-- SELECT al.title, a.name FROM artist a JOIN album al on a.artist_id = al.artist_id
-- SELECT pt.track_id FROM playlist p JOIN playlist_track pt ON p.playlist_id = pt.playlist_id WHERE p.name = 'Music'
-- SELECT t.name from track t JOIN playlist_track pt ON pt.track_id = t.track_id WHERE pt.playlist_id = 5
-- SELECT t.name, p.name FROM track t JOIN playlist_track pt ON pt.track_id = t.track_id JOIN playlist p ON p.playlist_id = pt.playlist_id
-- SELECT t.name, a.title FROM track t JOIN album a ON a.album_id = t.album_id JOIN genre g ON g.genre_id = t.genre_id WHERE g.name = 'Alternative & Punk'

--Section 2
-- SELECT * FROM invoice WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99)
-- SELECT * FROM playlist_track WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music')
-- SELECT name FROM track WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5)
-- SELECT * FROM track WHERE genre_id IN (SELECT genre_id FROM genre WHERE name ='Comedy')
-- SELECT * FROM track WHERE album_id IN (SELECT album_id FROM album WHERE title ='Fireball')
-- SELECT * FROM track WHERE album_id IN (SELECT album_id from album WHERE artist_id IN (Select artist_id FROM artist WHERE name = 'Queen'))

-- Section 3
-- UPDATE customer SET fax = null WHERE fax IS NOT null
-- UPDATE customer SET company = 'self' WHERE company IS null
-- UPDATE customer SET last_name = 'Thompson' WHERE first_name = 'Julia' AND last_name = 'Barnett'
-- UPDATE customer SET support_rep_id = 4 WHERE email = 'luisrojas@yahoo.cl'
-- UPDATE track SET composer = 'The darkness around us' WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal') AND composer IS null

--Section 4
-- SELECT COUNT(*), g.name FROM track t JOIN genre g on g.genre_id = t.genre_id GROUP BY g.name
-- SELECT COUNT(*), g.name FROM track t JOIN genre g on g.genre_id = t.genre_id  WHERE g.name = 'Pop' OR 'Rock' GROUP BY g.name
-- SELECT COUNT(*), a.name FROM artist a JOIN album al on al.artist_id = a.artist_id GROUP BY a.name

-- Section 5
-- SELECT DISTINCT composer FROM track
-- SELECT DISTINCT billing_postal_code FROM invoice
-- SELECT DISTINCT company FROM customer

-- Section 6
-- DELETE FROM practice_delete WHERE type = 'bronze'
-- DELETE FROM practice_delete WHERE type = 'silver'
-- DELETE FROM practice_delete WHERE value = '150'

--SECTION 7
-- CREATE TABLE users (
-- user_id SERIAL PRIMARY KEY, first_name VARCHAR(40), last_name VARCHAR(40), email VARCHAR(40)
-- )
-- CREATE TABLE products (
-- product_id SERIAL PRIMARY KEY, name VARCHAR(40), price FLOAT
-- )
-- CREATE TABLE orders (
-- orders_id SERIAL PRIMARY KEY, product_id INTEGER REFERENCES products(product_id)
-- )
-- INSERT INTO users (first_name, last_name, email) VALUES ('Tim', 'Bookies', 'timbookies@email.com')
-- INSERT INTO users (first_name, last_name, email) VALUES ('Sara', 'Bookies', 'sarabookies@email.com')
-- INSERT INTO users (first_name, last_name, email) VALUES ('Bob', 'Lance', 'boblance@email.com')
-- INSERT INTO products (name, price) VALUES ('Crayon', 0.50)
-- INSERT INTO products (name, price) VALUES ('Pen', 1.10)
-- INSERT INTO products (name, price) VALUES ('Pencil', 0.25)
-- ALTER TABLE orders ADD COLUMN user_id INTEGER REFERENCES users(user_id) 
-- INSERT INTO orders (product_id, user_id) VALUES (1, 1)
-- INSERT INTO orders (product_id, user_id) VALUES (2, 3)
-- INSERT INTO orders (product_id, user_id) VALUES (3, 2)
-- SELECT o.product_id, p.name FROM orders o JOIN products p ON p.product_id = o.product_id WHERE o.orders_id = 1
-- SELECT o.orders_id, u.first_name, u.last_name FROM orders o JOIN users u ON u.user_id = o.user_id
-- SELECT o.orders_id, sum(p.price) FROM orders o JOIN products p ON p.product_id = o.product_id WHERE o.orders_id = 1 GROUP BY o.orders_id

-- SELECT o.orders_id, u.first_name, u.last_name FROM orders o JOIN users u ON u.user_id = o.user_id WHERE u.first_name = 'Bob' AND u.last_name = 'Lance'
-- SELECT u.first_name, u.last_name, count(o.orders_id) FROM orders o JOIN users u ON u.user_id = o.user_id GROUP BY u.first_name, u.last_name