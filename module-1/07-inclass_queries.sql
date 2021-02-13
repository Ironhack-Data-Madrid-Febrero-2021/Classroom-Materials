-- Select Database --
USE `cine_database`;
-- Inserting --
/*
INSERT INTO `table_name`(`column1`,`column2`, `...`)
VALUES(`value1`, `value2`, `...`);
*/
-- Insert row -- 
INSERT INTO `movies` VALUES (
DEFAULT, 
"Mission: Impossible", 
"An American agent, under false suspicion of disloyalty, must discover and expose the real spy without the help of his organization.",
1996
);
-- Insert row (selecting colums) -- 
INSERT INTO `movies` (`title`, `year`) VALUES ( 
"Inception",
2010
);
-- Insert multiple rows -- 
INSERT INTO `actors` (`name`, `last_name`, `dob`) VALUES 
("Leonardo", "DiCaprio", '1974-11-11'),
("Joseph", "Gordon-Levitt", NULL),
("Tom","Cruise",'1962-07-03')
;
-- Updating --
/*
UPDATE `table_name`
SET `column`='value'
WHERE 'condition' ;
*/
-- Update row --
UPDATE `actors`
SET `dob`='1981-02-17' 
WHERE `idactors`=2
;
-- Update row -- 
UPDATE `movies`
SET `description`='A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'
WHERE `title`='Inception'
;
-- Insert row in intermediate table --
INSERT INTO `movies_has_actors` VALUES
(1,3),
(2,1),
(2,2)
;
-- Deleting --
/*
DELETE FROM `table_name`
WHERE 'condition';
*/
-- Delete rows --
DELETE FROM `movies_has_actors`
WHERE `actors_idactors`=2;
-- Restraints (Foreign keys) must be deleted first -- 
DELETE FROM `actors`
WHERE `name`="Joseph";
--  No te olvides de poner el WHERE en el DELETE FROM -- 

