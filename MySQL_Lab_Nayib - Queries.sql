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

SELECT MAX(length) as max_duration, MIN(length) as min_duration
FROM film;

### What's the average movie duration expressed in format (hours, minutes)?

SELECT sec_to_time(avg(length)*60) as average_duration 
FROM film;

### What's the average movie duration expressed in format (hours, minutes)?

SELECT sec_to_time(avg(length)*60) as average_duration 
FROM film;

SELECT FLOOR(AVG(length)/60), ROUND(AVG(length)%60) as Minutes
FROM film;

SELECT time_format(sec_to_time(round(avg(length)*60)), '%H:%i') from film;

### How many distinct (different) actors' last names are there?
 
SELECT COUNT(DISTINCT(last_name))
FROM actor;
  
### Since how many days has the company been operating (check DATEDIFF() function)?

SELECT min(rental_date) as ‘company_start’, max(rental_date) as ‘company_end’, DATEDIFF("2006-06-14","2005-05-24") as number_of_days
FROM rental;

### Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(convert(substring_index(rental_date, ' ', 1), date), '%M') as rental_month, date_format(convert(substring_index(rental_date, ' ', 1), date), '%W') as rental_weekday
FROM rental
LIMIT 20;

### Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, monthname(rental_date) AS month, weekday(rental_date) as weekday,
CASE
WHEN (weekday(rental_date) in (5,6)) then 'weekend'
ELSE 'workday'
END AS day_type
FROM rental;

### How many rentals were in the last month of activity?

SELECT COUNT(rental_id) as rentals_last_month
FROM rental 
WHERE month(rental_date) = (select month(max(rental_date)) from rental);


############ END #####################


############ NEW #####################


### GROUPING LAB | SQL QUERIES 7

### Instructions

### In the actor table, which are the actors whose last names are not repeated? 
### For example if you would sort the data in the table actor by last_name, 
### you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
### These three actors have the same last name. 
### So we do not want to include this last name in our output. 
### Last name "Astaire" is present only one time with actor "Angelina Astaire", 
### hence we would want this in our output list.

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

### Which last names appear more than once?
### We would use the same logic as in the previous question 
### but this time we want to include the last names of the actors 
### where the last name was present more than once.

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

### Using the rental table, 
### find out how many rentals were processed by each employee.

SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;

### Using the film table, find out how many films were released each year.

SELECT release_year, COUNT(film_id)
FROM film
GROUP BY release_year;

### Using the film table, find out for each rating how many films were there.

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

### What is the average length of films for each rating? 
### Round off the average lengths to two decimal places.

SELECT rating, ROUND(AVG(length), 2) AS AVG_Duration
FROM film
GROUP BY rating;

### Which kind of movies (based on rating) have an average duration of two hours or more?

SELECT rating, ROUND(AVG(length), 2) AS AVG_Duration
FROM film
GROUP BY rating
HAVING AVG_Duration > 120.00;


