use sakila;
-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE (first_name='Scarlett');

-- 2.How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT(inventory_id)) FROM sakila.inventory;
SELECT COUNT(DISTINCT(rental_id)) FROM sakila.rental;

-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS 'max_duration', MIN(length) AS 'min_duration' FROM sakila.film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(ROUND(AVG(length)*60,0)) from film;

-- 5.How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM sakila.actor;

-- 6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT Datediff(Max(date(last_update)),Min(date(payment_date))) AS DiffDate from payment;
-- 

-- 7.Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, substr(rental_date,6,2) AS month, dayname(rental_date) AS weekday FROM rental
LIMIT 20;

-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, CASE
WHEN DAYOFWEEK(rental_date) in (2,3,4,5,6) then 'weekday'
WHEN DAYOFWEEK(rental_date) in (1,7) then 'weekend'
END AS day_type FROM rental;

-- 9.Get release years.
SELECT release_year FROM FILM;

-- 10.Get all films with ARMAGEDDON in the title.
SELECT * from film
WHERE title LIKE '%A_MAGEDDON%';

-- 11.Get all films which title ends with APOLLO.
SELECT * from film
WHERE right(title,6)='APOLLO';

-- 12.Get 10 the longest films.
SELECT * from film
order by length(title) desc 
limit 10;

-- 13.How many films include Behind the Scenes content?
SELECT count(special_features) from film 
where find_in_set('Behind the Scenes', special_features);
