select count(*)
from actor;

select *
from actor
limit 100;

select *
from customer C
left join address A 
on c.address_id = a.address_id;

select Max(amount) 
from payment;

select *
from payment P 
left join Rental R
on p.rental_id = r.rental_id
left join Inventory I
on r.inventory_id = i.inventory_id
left join film F
on i.film_id = f.film_id
where amount = 11.99;

select s.email, s.first_name, s.last_name, a.address, c.city, co.country 
from staff S
left join address A
on s.address_id = a.address_id
left join city c
on c.city_id = a.city_id
left join country co
on c.country_id = co.country_id

--maybe working for Nvidia becuase everyone is talking about chips right now
--so I figured that I can't go wrong with that. I am really not sure.

--crows foot notation means that one input can have multiple outputs
--so for example in the country table we can have one imput from a country
--but get multiple out puts from the city table, so United States and chicago Newyork Los Angeles.







