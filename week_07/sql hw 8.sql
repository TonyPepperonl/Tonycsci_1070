--Alter Table rental
--Add status varchar(255);

--update rental R
	--SET status = CASE
		--when extract(day from r.return_date):: integer < extract(day from r.return_date):: integer + f.rental_duration then 'early' 
		--when extract(day from r.return_date):: integer = extract(day from r.return_date):: integer + f.rental_duration then 'on time' 
		--else 'late'
	--end
--from inventory i 
--left join film f 
--on i.film_id = f.film_id;

--select rental_date, rental_duration, status, return_date
--from rental r 
--left join inventory i
--on r.inventory_id = i.inventory_id
--left join film f
--on i.film_id = f.film_id

--explain select 	Sum(p.amount),ct.city as total_amount
--from payment p
--left join customer c
--on p.customer_id = c.customer_id
--left join address a
--on c.address_id = a.address_id
--left join city ct
--on a.city_id = ct.city_id
--where city = 'Saint Louis' or city = 'Kansas City';

--select count(c.name) as title, c.name
--from film f 
--left join film_category fc
--on f.film_id = fc.film_id
--left join category c
--on fc.category_id = c.category_id
--group by c.name, f.title
--order by c.name;

--the film_category table exists to provide a sort of bridge between category 
--and film it has both film_id and category_id where as category only has
--category_id and film only has film_id which means that they have no common link 
--that it is why film_category table exists, simply to provide that link

--select f.film_id, f.title, f.length
--from film f 
--left join inventory i 
--on f.film_id = i.film_id
--left join rental r 
--on i.inventory_id = r.inventory_id
--where r.return_date between '2005-05-15' and '2005-05-31';

--select avg(amount)
--from payment;

--select f.title, p.amount
--from film f 
--left join inventory i 
--on f.film_id = i.film_id
--left join rental r 
--on i.inventory_id = r.inventory_id
--left join payment p 
--on r.rental_id = p.rental_id
--where p.amount < 4.2006056453822965;

--select count(status)
--from rental 
--where status = 'late'

--select count(status)
--from rental 
--where status = 'on time'

--select count(status)
--from rental 
--where status = 'early'

--with film
		--as (select film.length from film)

--		as (select film.length, 
	--				percent_rank() over(
		--			order by film.length) as percent_rank 
			--	from film)
		--select *
		--from film

--explain select f.film_id, f.title, f.length
--from film f 
--left join inventory i 
--on f.film_id = i.film_id
--left join rental r 
--on i.inventory_id = r.inventory_id
--where r.return_date between '2005-05-15' and '2005-05-31'
--it first does the join statements so that it can tie the return date to the 
--film titles it next applies the filter which is the where statement.

explain select count(c.name) as title, c.name
from film f 
left join film_category fc
on f.film_id = fc.film_id
left join category c
on fc.category_id = c.category_id
group by c.name, f.title
order by c.name;
--first it looks at the group by statement and then does the join statements
--it then does the counter statement and returns the results




