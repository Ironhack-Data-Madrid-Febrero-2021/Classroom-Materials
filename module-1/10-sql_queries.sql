-- CRUD
-- CREATE, READ, UPDATE, DELETE   - Basic operations
-- INSERT, SELECT, UPDATE, DELETE - Basic SQL verbs

USE `sakila`;

-- Select all columns from `actor`
SELECT * FROM `actor`;

-- Select specific columns
SELECT `title`, `description`,`film_id` FROM `film`;

-- Select specific rows
SELECT * FROM `actor`
WHERE `first_name`="BURT";

-- Select specific columns and specific rows
SELECT `last_name` FROM `actor`
WHERE `first_name`="ED";

-- WHERE clause
-- Comparatives
-- =
-- < , >
-- <= , >=
-- != , <> : Two different forms of writing different than.
SELECT `title`, `length` FROM `film`
WHERE `length`>120;


-- ORDER BY clause
SELECT `title`, `length` FROM `film`
ORDER BY `length`;

-- Ordering descendently
SELECT `title`, `length` FROM `film`
ORDER BY `length` DESC;

-- Ordering by multiple columns
SELECT `title`, `length`, `rental_rate` FROM `film`
ORDER BY `length` DESC, `rental_rate`;

SELECT `title`, `length`, `rental_rate` FROM `film`
ORDER BY `rental_rate`,`length` DESC;

-- You may even order by columns that are not on the SELECT clause
SELECT `title`, `length`, `rental_rate` FROM `film`
ORDER BY `rental_duration`;

-- LIMIT
SELECT `title`, `length` FROM `film`
ORDER BY `length` DESC
LIMIT 10;

-- OFFSET
-- LIMIT offset, limit
-- offset: how many rows to skip
SELECT `title`, `length` FROM `film`
ORDER BY `length` DESC
LIMIT 5,10;
-- Similar to 
-- LIMIT 10 OFFSET 5;

-- Operate with colums
SELECT `title`, `length`, `rental_rate`, `rental_rate`/`length` FROM `film`;

-- Alias
SELECT `title`, `length`, `rental_rate`, `rental_rate`/`length` AS `price_per_minute` FROM `film`;

-- Using Aliased column in ORDER BY
SELECT `title`, `length`, `rental_rate`, `rental_rate`/`length` AS `price_per_minute` FROM `film`
ORDER BY `price_per_minute` DESC;

-- You may operate with columns on different clauses
SELECT `title`, `length`, `rental_rate` FROM `film`
ORDER BY `rental_rate`/`length` DESC;

-- WHERE clause and ORDER BY clause
SELECT `title`, `length`, `rental_rate` FROM `film`
WHERE `length`>=120
ORDER BY `rental_rate`/`length`;

-- Multiple WHERE conditions
-- LOGIC OPERATORS: AND; OR; NOT
SELECT * FROM `payment`
WHERE (`amount`>6) AND (`customer_id`=13);

SELECT * FROM `payment`
WHERE (`amount`>10) OR (`customer_id`=13);

-- NOT
SELECT * FROM `payment`
WHERE (`amount`>6) AND NOT (`amount`>10);

-- DISCTINCT
SELECT `rating` FROM `film`;
-- Selecting disctinct is "similar" to set() in python
SELECT DISTINCT `rating` FROM `film`;

-- IN
SELECT `actor_id`, `first_name`, `last_name` FROM `actor`
WHERE `first_name`="KEVIN" OR `first_name`="JULIA" OR `first_name`="ED";

SELECT `actor_id`, `first_name`, `last_name` FROM `actor`
WHERE `first_name` IN ("KEVIN","JULIA","ED");

-- NOT IN
SELECT `actor_id`, `first_name`, `last_name` FROM `actor`
WHERE `first_name` NOT IN ("KEVIN","JULIA","ED");