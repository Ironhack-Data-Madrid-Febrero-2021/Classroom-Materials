CREATE SCHEMA `car_store_2`;

USE `car_store_2`;

CREATE TABLE `Cars` (
`ID` INT AUTO_INCREMENT PRIMARY KEY,
`VIN` VARCHAR(40),
`Manufacturer` VARCHAR(40),
`Model` VARCHAR(40),	
`Year` YEAR,	
`Color`VARCHAR(40)
);

CREATE TABLE `Invoices` (
`ID` INT AUTO_INCREMENT,
`Invoice Number` VARCHAR(40),
`Date` DATE,
`Car` INT,
PRIMARY KEY(`ID`),
FOREIGN KEY (`Car`) REFERENCES `Cars`(`ID`)
)
