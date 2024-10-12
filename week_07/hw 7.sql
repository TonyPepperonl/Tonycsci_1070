select *
from customer 
where last_name LIKE 'T%'
order by first_name;

select *
from rental 
where return_date >= '2005-05-28'and return_date <='2005-06-01';

select title,rental_rate
from film 
order by rental_rate desc
limit 10;

select sum(amount), first_name, last_name
from payment p
left join customer c
on p.customer_id = c.customer_id
group by first_name, last_name, p.amount
order by sum(p.amount) asc;


select a.first_name, a.last_name, count(a.first_name)
from film f
left join film_actor fa
on f.film_id = fa.film_id
left join actor a
on fa.actor_id = a.actor_id
where f.release_year = 2006
group by a.first_name, a.last_name
order by count(a.first_name) desc;

explain select sum(amount), first_name, last_name
from payment p
left join customer c
on p.customer_id = c.customer_id
group by first_name, last_name, p.amount
order by sum(p.amount) asc;
--first it looks at the data table, then it looks at the action for getting the sum 
--then it looks at how we want to group the data, it then joins the different tables 
--on the values I assgined it then looks at the new data table resulting from the
--grouping statements and returns it. I think. 

explain select a.first_name, a.last_name, count(a.first_name)
from film f
left join film_actor fa
on f.film_id = fa.film_id
left join actor a
on fa.actor_id = a.actor_id
where f.release_year = 2006
group by a.first_name, a.last_name
order by count(a.first_name) desc;
--it again looks at the tables but this time it looks at the action of taking count 
--and the fact that we want it in descending order. Next it looks at the group by statements
--and the left join statements on the values I assigned it then does a right join not sure why though
--because I do not have a right join statement in my code. It then does a filter resutlting from my
--where statement. It then looks at the new table that we have created from the different actions and 
--returns it.

select c.name, count(c.name), AVG(f.rental_rate)
from film f
left join film_category ca
on f.film_id = ca.film_id
left join category c
on ca.category_id = c.category_id
group by c.name;

select c.name, count(c.name), avg(f.rental_rate), sum(p.amount)
from film f
left join film_category ca
on f.film_id = ca.film_id
left join category c
on ca.category_id = c.category_id
left join inventory i 
on f.film_id = i.film_id
left join rental r
on i.inventory_id = r.inventory_id
left join payment p
on r.rental_id = p.rental_id
group by c.name
order by avg(f.rental_rate) desc
limit 5



