-- 1a
USE sakila;
SELECT * FROM actor;

-- 1b
SELECT concat(UPPER(first_name), ' ', UPPER(last_name)) AS 'Actor Name' FROM actor;

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

-- 4b
SELECT last_name, COUNT(*) from actor
GROUP BY last_name
HAVING Count(last_name) > 2;

-- 4c
UPDATE actor
SET first_name = 'HARPO'
WHERE last_name = 'Williams' AND first_name = 'GROUCHO';

-- 4d
SELECT * FROM actor
WHERE
last_name = 'Williams';

UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id = 172 AND first_name = 'HAPRO'

UPDATE actor
SET first_name = 'MUCHO GROUCHO'
WHERE actor_id = 172

-- 5a


-- 6a
SELECT * FROM staff;
SELECT * FROM address;

SELECT staff.first_name, staff.last_name, address.address 
FROM staff
JOIN address ON
staff.address_id = address.address_id;

-- 6b
SELECT staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) AS amount_rung_up
FROM staff
INNER JOIN payment ON 
staff.staff_id = payment.staff_id
GROUP BY staff_id;

-- 6c
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT film_actor.film_id , film.title, COUNT(film_actor.actor_id) AS number_of_actors
FROM film
JOIN film_actor ON
film.film_id = film_actor.film_id
GROUP BY film_id;

-- 6d
SELECT * FROM inventory;
SELECT * FROM film;

SELECT COUNT(*) 
FROM inventory
WHERE film_id IN
	(SELECT film_id
	FROM film
    WHERE title = 'Hunchback Impossible')

-- 6e
SELECT * FROM payment;
SELECT * FROM customer;

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(payment.amount) AS payment_amount
FROM customer
JOIN payment ON
customer.customer_id = payment.customer_id
GROUP BY customer_id
ORDER BY last_name ASC;

-- 7a