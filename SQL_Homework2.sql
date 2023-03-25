--Week 5 - Wednesday Questions

--1. List all customers who live in Texas (use JOINs)
SELECT customer.first_name, customer.last_name, address.address_id, district  
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
where district = 'Texas';

--OUTPUT: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
 
--2. Get all payments above $6.99 with the Customer's Full Name
select payment.amount, customer.customer_id, customer.first_name, customer.last_name 
from customer
full join payment
on payment.customer_id = customer.customer_id
where amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
select customer.first_name, customer.last_name 
from customer
where customer_id in (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name 
from customer
full join address
on address.address_id = customer.address_id
full join city
on city.city_id = address.city_id
full join country
on city.country_id = country.country_id
where country.country = 'Nepal';

--OUTPUT: Kevin Schuler
--5. Which staff member had the most transactions?
select staff.first_name, staff.last_name, count(payment.staff_id)
from staff 
full join payment 
on staff.staff_id = payment.staff_id 
group by staff.first_name, staff.last_name
order by count(payment.staff_id) desc; 

-- OUTPUT: John Stephens has the most transactions.
--6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
group by rating;

-- OUTPUT: NC-17 rating have 209 movies, G rating have 178, PG-13 rating have 223, PG rating have 194 and R rating have 196.
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer.first_name, customer.last_name 
from customer
where customer_id in (
	SELECT customer_id
	FROM payment
	where amount > 6.99
);

-- OUPUT: Mary Smith, Peter Menard, Douglas Graf, and Alvin Deloach
-- 8. How many free rentals did our stores give away?
select count(amount)  
from payment 
where amount < 0;
