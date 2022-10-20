-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clothing_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clothing_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clothing_store` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema productsdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema productsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `productsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clothing_store` ;

-- -----------------------------------------------------
-- Table `clothing_store`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothing_store`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `section_id` INT NOT NULL,
  `name_product` VARCHAR(45) NULL,
  `img_product` VARCHAR(255) NULL,
  `price_product` DECIMAL(10,2) NULL,
  `description_product` TINYTEXT NULL,
  `discount` INT NULL,
  UNIQUE INDEX `id_product_UNIQUE` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`product_id`, `section_id`),
  UNIQUE INDEX `section_id_UNIQUE` (`section_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothing_store`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothing_store`.`section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `name_section` VARCHAR(45) NULL,
  `section_description` TINYTEXT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE INDEX `srction_id_UNIQUE` (`section_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothing_store`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothing_store`.`image` (
  `product_id` INT NOT NULL,
  `img_name` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  CONSTRAINT `img_to_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `clothing_store`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothing_store`.`section_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothing_store`.`section_product` (
  `product_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `section_id_UNIQUE` (`section_id` ASC) VISIBLE,
  CONSTRAINT `section_to_product`
    FOREIGN KEY (`section_id` , `product_id`)
    REFERENCES `clothing_store`.`product` (`section_id` , `product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_to_section`
    FOREIGN KEY (`section_id`)
    REFERENCES `clothing_store`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `productsdb` ;

-- -----------------------------------------------------
-- Table `productsdb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productsdb`.`customers` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Age` INT NULL DEFAULT NULL,
  `FirstName` VARCHAR(20) NOT NULL,
  `LastName` VARCHAR(20) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Phone` (`Phone` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `productsdb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productsdb`.`orders` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `CustomerId` INT NULL DEFAULT NULL,
  `CreatedAt` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `CustomerId` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `productsdb`.`customers` (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
