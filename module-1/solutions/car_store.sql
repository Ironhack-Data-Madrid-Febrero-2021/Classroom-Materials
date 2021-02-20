-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_store` DEFAULT CHARACTER SET utf8 ;
USE `car_store` ;

-- -----------------------------------------------------
-- Table `car_store`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_store`.`Cars` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` YEAR(4) NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_store`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Customer ID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Telephone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_store`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_store`.`Salespersons` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Staff ID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_store`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_store`.`Invoices` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Invoice Number` VARCHAR(45) NULL,
  `Date` DATE NULL,
  `Car` INT NOT NULL,
  `Customer` INT NOT NULL,
  `Sales Person` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoices_Cars1_idx` (`Car` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customer` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Sales Person` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Car`)
    REFERENCES `car_store`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customer`)
    REFERENCES `car_store`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Sales Person`)
    REFERENCES `car_store`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_store`.`Customers_has_Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_store`.`Customers_has_Invoices` (
  `Customers_ID` INT NOT NULL,
  `Invoices_ID` INT NOT NULL,
  PRIMARY KEY (`Customers_ID`, `Invoices_ID`),
  INDEX `fk_Customers_has_Invoices_Invoices1_idx` (`Invoices_ID` ASC) VISIBLE,
  INDEX `fk_Customers_has_Invoices_Customers_idx` (`Customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_has_Invoices_Customers`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `car_store`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_has_Invoices_Invoices1`
    FOREIGN KEY (`Invoices_ID`)
    REFERENCES `car_store`.`Invoices` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
