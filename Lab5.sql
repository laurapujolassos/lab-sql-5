#Drop column picture from staff.
select * from sakila.staff;
alter table sakila.staff
drop column picture;
select * from sakila.staff;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from sakila.customer 
where last_name= 'SANDERS';
INSERT INTO sakila.staff (staff_id, first_name, last_name,address_id,email,store_id,active,username,password,last_update)
VALUES (3,'Tammy', 'Sanders','79','TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy' ,' ','2006-02-15 04:57:20');
select * from sakila.staff;

#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query
select * from sakila.rental;
INSERT INTO sakila.rental (rental_id, rental_date, inventory_id,customer_id, return_date,staff_id,last_update)
VALUES (rental_id, '2022-11-15 8:38:29', 5,130, ' ',1,last_update); # I don't know how to fill the rest of the gaps.
select * from sakila.rental;

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';


select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select * from sakila.film
where title='Academy Dinosaur';

select * from sakila.inventory;


select * from sakila.rental
where customer_id=130 and staff_id=1;


select * from sakila.staff;

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
#Check if there are any non-active users
select * from sakila.customer
where active = 0; # We can see there are inactive customers. 

#Create a table backup table as suggested
CREATE TABLE deleted_users AS SELECT * FROM sakila.customer;

#Insert the non active users in the table backup table

select * from sakila.deleted_users
where active = 0;

#Delete the non active users from the table customer
SET SQL_SAFE_UPDATES = 0;
delete from sakila.deleted_users where active = 0;
select * from sakila.deleted_users
where active = 0;
SET SQL_SAFE_UPDATES = 1;


