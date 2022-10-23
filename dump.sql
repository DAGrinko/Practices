-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Clothing_Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Clothing_Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clothing_Store` DEFAULT CHARACTER SET utf8 ;
USE `Clothing_Store` ;

-- -----------------------------------------------------
-- Table `Clothing_Store`.`Section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clothing_Store`.`Section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `discription` TINYTEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clothing_Store`.`Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clothing_Store`.`Image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `alt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clothing_Store`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clothing_Store`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `price_without_discount` DECIMAL(10,2) NOT NULL,
  `price_with_promocode` DECIMAL(10,2) NOT NULL,
  `discription` TINYTEXT NULL,
  `status` INT NOT NULL,
  `main_img` INT NOT NULL,
  `main_section` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `main_img_UNIQUE` (`main_img` ASC) VISIBLE,
  UNIQUE INDEX `main_section_UNIQUE` (`main_section` ASC) VISIBLE,
  INDEX `main_section_product_idx` (`id` ASC, `main_section` ASC) VISIBLE,
  CONSTRAINT `main_section_product`
    FOREIGN KEY (`id` , `main_section`)
    REFERENCES `Clothing_Store`.`Section` (`id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `main_img_product`
    FOREIGN KEY (`main_img`)
    REFERENCES `Clothing_Store`.`Image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clothing_Store`.`Section_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clothing_Store`.`Section_Product` (
  `id_section` INT NOT NULL,
  `id_product` INT NOT NULL,
  PRIMARY KEY (`id_section`, `id_product`),
  UNIQUE INDEX `id_product_UNIQUE` (`id_product` ASC) VISIBLE,
  UNIQUE INDEX `id_section_UNIQUE` (`id_section` ASC) VISIBLE,
  CONSTRAINT `section_to_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `Clothing_Store`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_to_section`
    FOREIGN KEY (`id_section`)
    REFERENCES `Clothing_Store`.`Section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clothing_Store`.`Product_Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clothing_Store`.`Product_Image` (
  `id_product` INT NOT NULL,
  `id_image` INT NOT NULL,
  PRIMARY KEY (`id_product`, `id_image`),
  UNIQUE INDEX `id_product_UNIQUE` (`id_product` ASC) VISIBLE,
  UNIQUE INDEX `id_image_UNIQUE` (`id_image` ASC) VISIBLE,
  CONSTRAINT `product_to_image`
    FOREIGN KEY (`id_image`)
    REFERENCES `Clothing_Store`.`Image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `image_to_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `Clothing_Store`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
