### Instructions - Lab Lesson 2.5 (Sakila) 

### Select all the actors with the first name ‘Scarlett’.

Select *
from actor
where first_name = 'Scarlett';

### How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT(inventory_id))
FROM inventory;

SELECT COUNT(DISTINCT(rental_id))
FROM rental;

### What are the shortest and longest movie duration? Name the values max_duration and min_duration.
### What's the average movie duration expressed in format (hours, minutes)?
SELECT MAX(length) as max_duration, MIN(length) as min_duration
FROM film;
SELECT sec_to_time(avg(length)*60) as average_duration 
FROM film;

### What's the average movie duration expressed in format (hours, minutes)?
SELECT sec_to_time(avg(length)*60) as average_duration 
FROM film;

SELECT FLOOR(AVG(length)/60), ROUND(AVG(length)%60) as Minutes
FROM film;

SELECT time_format(sec_to_time(round(avg(length)*60)), '%H:%i') from film;

