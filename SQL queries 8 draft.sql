### Inspect the database structure 
select *, 
rank() over (partition by district_id order by amount desc) as ranking
from clients_loans
order by district_id;

### Use the RANK() and the table of your choice rank films by length 
###(filter out the rows that have nulls or 0s in length column). 
###In your output, only select the columns title, length, and the rank.

SELECT title, length, RANK() OVER (ORDER BY length DESC) as 'rank'
FROM film
WHERE length IS NOT NULL AND length <> 0
ORDER BY title;

### Build on top of the previous query and 
### rank films by length within the rating category 
### (filter out the rows that have nulls or 0s in length column). 
### In your output, only select the columns title, length, rating and the rank.
SELECT title, length, rating, RANK() 
OVER (PARTITION BY rating ORDER BY length DESC) as 'rank'
FROM film
WHERE length IS NOT NULL AND length <> 0
ORDER BY rating;


### Will finish tomorrow ###