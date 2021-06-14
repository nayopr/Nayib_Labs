USE sakila;

SHOW FULL TABLES;
SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM film_text;
SELECT * from sakila.actor;
SELECT * from sakila.film_actor;
SELECT * from sakila.category;
SELECT * from sakila.film;
SELECT * from sakila.language;
SELECT * from sakila.inventory;
SELECT * from sakila.film_category;
SELECT * from sakila.store;
SELECT * from sakila.address;
SELECT * from sakila.staff;
SELECT * from sakila.payment;
SELECT * from sakila.rental;
SELECT * from sakila.customer;
SELECT * from sakila.customer;
SELECT * from sakila.country;

SELECT title from film;

select name as 'language' from language;

SELECT COUNT(store_id) from store;
SELECT COUNT(staff_id) from staff;

select first_name from actor;