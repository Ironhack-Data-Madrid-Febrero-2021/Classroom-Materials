-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cine_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cine_database
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cine_database`;
CREATE SCHEMA IF NOT EXISTS `cine_database` DEFAULT CHARACTER SET utf8 ;
USE `cine_database` ;

-- -----------------------------------------------------
-- Table `cine_database`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine_database`.`movies` (
  `idmovies` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `year` YEAR(4) NULL,
  PRIMARY KEY (`idmovies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine_database`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine_database`.`actors` (
  `idactors` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `dob` DATETIME NULL,
  PRIMARY KEY (`idactors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine_database`.`movies_has_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine_database`.`movies_has_actors` (
  `movies_idmovies` INT NOT NULL,
  `actors_idactors` INT NOT NULL,
  PRIMARY KEY (`movies_idmovies`, `actors_idactors`),
  INDEX `fk_movies_has_actors_actors1_idx` (`actors_idactors` ASC) VISIBLE,
  INDEX `fk_movies_has_actors_movies_idx` (`movies_idmovies` ASC) VISIBLE,
  CONSTRAINT `fk_movies_has_actors_movies`
    FOREIGN KEY (`movies_idmovies`)
    REFERENCES `cine_database`.`movies` (`idmovies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_has_actors_actors1`
    FOREIGN KEY (`actors_idactors`)
    REFERENCES `cine_database`.`actors` (`idactors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
