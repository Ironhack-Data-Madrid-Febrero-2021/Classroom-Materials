USE `sakila`;

-- JOIN
SELECT *
FROM 
	`film`
		JOIN
	`language`
		ON
	`film`.`language_id` = `language`.`language_id`;

-- Column with same name (Ambiguity)
SELECT `title`, `name`, `film`.`language_id`
FROM 
	`film`
		JOIN
	`language`
		ON
	`film`.`language_id` = `language`.`language_id`;
    
-- INNER JOIN
SELECT `first_name`, `last_name`, `district` 
FROM 
-- LEFT table JOIN RIGHT table
	`staff` INNER JOIN `address`
-- 	`staff` JOIN `address`
-- By default mySQL does an INNER JOIN
		ON
	`staff`.`address_id`=`address`.`address_id`;
    
-- LEFT JOIN
SELECT `first_name`, `last_name`, `district` 
FROM 
-- LEFT table JOIN RIGHT table
	`staff` LEFT JOIN `address`
		ON
	`staff`.`address_id`=`address`.`address_id`;

-- RIGHT JOIN
SELECT `first_name`, `last_name`, `district` 
FROM 
-- LEFT table JOIN RIGHT table
	`staff` RIGHT JOIN `address`
		ON
	`staff`.`address_id`=`address`.`address_id`;
    
-- Full Outer Join
-- MySQL does not have a FULL OUTER JOIN option, though it exists on other dialects of SQL.
-- The solution for that is doing and UNION between a LEFT JOIN and a RIGHT JOIN.
SELECT `first_name`, `last_name`, `district`
FROM 
-- LEFT table JOIN RIGHT table
	`staff` LEFT JOIN `address`
		ON
	`staff`.`address_id`=`address`.`address_id`
UNION ALL
SELECT `first_name`, `last_name`, `district` 
FROM 
-- LEFT table JOIN RIGHT table
	`staff` RIGHT JOIN `address`
		ON
	`staff`.`address_id`=`address`.`address_id`;

-- Joining multiple tables
SELECT `first_name`, `last_name`, `city` 
FROM 
	`staff` 
    JOIN `address`
		ON
	`staff`.`address_id`=`address`.`address_id`
    JOIN `city`
		ON
	`address`.`city_id` = `city`.`city_id`;
    
-- 
SELECT * FROM `film_text`
JOIN `film`
ON `film`.`film_id`=`film_text`.`film_id`; 

-- JOIN with intermediate table
SELECT `first_name`, `last_name`, `title` 
	FROM `film` AS `f`
		JOIN `film_actor` AS `fa`
    ON `f`.`film_id`=`fa`.`film_id`
		JOIN `actor` AS `a`
    ON `fa`.`actor_id`=`a`.`actor_id`;