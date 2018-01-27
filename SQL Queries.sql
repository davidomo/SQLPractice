-- 1a
USE sakila;
SELECT * FROM actor;

-- 1b
SELECT concat(first_name, ' ', last_name) AS 'Actor Name' FROM actor;

-- 2a
SELECT actor_id, first_name, last_name FROM actor
WHERE
first_name = 'Joe';

-- 2b
SELECT * FROM actor
WHERE
last_name LIKE '%gen%';

-- 2c
SELECT last_name, first_name FROM actor
WHERE
last_name LIKE '%li%'

-- 2d
SELECT country_id, country FROM country
WHERE
country in ('Afghanistan', 'Bangladesh', 'China');

-- 3a
ALTER TABLE actor
ADD middle_name VARCHAR(30);
SELECT actor_id, first_name, middle_name, last_name, last_update FROM actor;

-- 3b
ALTER TABLE actor
MODIFY middle_name blob;

-- 3c
ALTER TABLE actor
DROP COLUMN middle_name;

-- 4a
SELECT last_name, COUNT(*) from actor
GROUP BY last_name;