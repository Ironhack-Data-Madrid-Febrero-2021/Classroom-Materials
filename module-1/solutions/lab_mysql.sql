USE `car_store`;

INSERT INTO `Cars` VALUES(DEFAULT,"3K096I98581DHSNUP","Volkswagen","Tiguan",2019,"Blue");

INSERT INTO `Cars` VALUES 
(DEFAULT,"ZM8G7BEUQZ97IH46V","Peugeot","Rifter",2019,"Red"),
(DEFAULT,"RKXVNNIHLVVZOUB4M","Ford","Fusion",2018,"White"),
(DEFAULT,"HKNDGS7CU31E9Z7JW","Toyota","RAV4",2018,"Silver"),
(DEFAULT,"DAM41UDN3CHU2WVF6","Volvo","V60",2019,"Gray"),
(DEFAULT,"DAM41UDN3CHU2WVF6","Volvo","V60 Cross Country",2019,"Gray");

-- Bonus

UPDATE `Salespersons`
SET `Store`="Miami"
WHERE `Store`="Mimia";

DELETE FROM `Cars`
WHERE `ID`=4;