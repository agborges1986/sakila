USE sakila;
/* 
1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente  */

SELECT city_id, first_name as name, last_name as apellidos, email, address as direccion FROM customer
JOIN address ON customer.address_id=address.address_id
WHERE city_id=312;

/* 
2. ¿Qué consulta harías para obtener todas las películas de comedia? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales y el género (categoría)*/

SELECT title, description, release_year, rating, special_features, name FROM film
JOIN film_category ON film.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
WHERE name='Comedy';

/*
3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, 
la descripción y el año de lanzamiento.*/

SELECT a.actor_id, concat(first_name,' ',last_name) as nombre, title, description, release_year FROM actor a
JOIN film_actor ON a.actor_id=film_actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
WHERE a.actor_id=5;


/*
4. Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
*/

SELECT city_id, store_id, c.first_name as name, c.last_name as apellido, email, address as direccion FROM customer as c
JOIN address ON c.address_id=address.address_id
WHERE store_id=1 AND city_id IN (1,42,312,459);

/*
5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena" (Behind the Scenes), unidas por actor_id = 15? 
Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.*/

SELECT title, f.description, release_year, rating, special_features FROM film as f
JOIN film_actor ON f.film_id=film_actor.film_id
WHERE actor_id=15 AND f.rating='G' AND special_features LIKE '%Behind the Scenes%';

/*
6.¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
Su consulta debe devolver film_id, title, actor_id y actor_name.
*/
SELECT film.film_id,title,a.actor_id,concat(first_name,' ',last_name) as name FROM actor as a
JOIN film_actor ON a.actor_id=film_actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
WHERE film.film_id=369;

/*
7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales y el género (categoría).
*/

SELECT f.film_id, title, description, release_year, rating, special_features, category.name FROM film as f
JOIN film_category ON f.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
WHERE rental_rate=2.99 AND category.name='Drama';

/*
8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales, el género (categoría) y el nombre y apellido del actor.
*/
SELECT f.film_id, title, description, release_year, rating, special_features, category.name, concat(actor.first_name,' ',actor.last_name) as actor_name FROM film as f
JOIN film_category ON f.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
JOIN film_actor ON f.film_id=film_actor.film_id
JOIN actor ON film_actor.actor_id=actor.actor_id
WHERE category.name='Action' AND concat(actor.first_name,' ',actor.last_name)= 'SANDRA KILMER';