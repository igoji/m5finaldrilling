/* Construye las siguientes consultas: */

--  Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

-- Customer
insert into customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, 
					  create_date, last_update, active) values (?);
					  
update customer set 
customer_id = ?, 
store_id = ?, 
first_name = ?, 
last_name = ?, 
email = ?, 
address_id = ?, 
activebool = ?, 
create_date = ?, 
last_update = ?, 
active = ?
where <condicion>;
	
delete from customer where <condicion>;

-- Staff
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, 
				   active, username, password, last_update, picture) values (?);
				   
update staff set
staff_id = ?, 
first_name = ?, 
last_name = ?, 
address_id = ?, 
email = ?, 
store_id = ?, 
active = ?, 
username = ?, 
password = ?, 
last_update = ?, 
picture = ?
where <condicion>;

delete from staff where <condicion>;

-- Actor
select * from actor

insert into actor(actor_id, first_name, last_name, last_update) values(?);

update actor set
actor_id = ?, 
first_name = ?, 
last_name = ?, 
last_update = ?
where <condicion>;

delete from actor where <condicion>;

-- Listar todas las “rental” con los datos del “customer” dado un año y mes.

select * from rental
inner join customer on rental.customer_id = customer.customer_id
where extract(year from rental_date) = 2005 and extract(month from rental_date) = 08;

-- Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.

select payment_id Numero, payment_date Fecha, amount Total from payment;
	
-- Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0. 

select * from film		
where release_year = 2006 and
rental_rate > 4;
	
--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si
--éstas pueden ser nulas, y su tipo de dato correspondiente.

SELECT
t1.TABLE_NAME AS tabla_nombre,
t1.COLUMN_NAME AS columna_nombre,
t1.COLUMN_DEFAULT AS columna_defecto,
t1.IS_NULLABLE AS columna_nulo,
t1.DATA_TYPE AS columna_tipo_dato,
COALESCE(t1.NUMERIC_PRECISION,
t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
PG_CATALOG.COL_DESCRIPTION(t2.OID,
t1.DTD_IDENTIFIER::int) AS columna_descripcion,
t1.DOMAIN_NAME AS columna_dominio
FROM
INFORMATION_SCHEMA.COLUMNS t1
INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
t1.TABLE_SCHEMA = 'public'
ORDER BY
t1.TABLE_NAME;
