-- MySQL Workbench Synchronization
-- Generated: 2023-04-24 10:30
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: salim

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `donkeyair`.`bookings` 
DROP FOREIGN KEY `bookings_ibfk_1`,
DROP FOREIGN KEY `bookings_ibfk_2`;

ALTER TABLE `donkeyair`.`airports` 
CHANGE COLUMN `airport_id` `airport_id` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `name` `name` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `city` `city` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `country` `country` VARCHAR(50) NULL DEFAULT NULL ;

ALTER TABLE `donkeyair`.`bookings` 
CHANGE COLUMN `booking_id` `booking_id` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `user_id` `user_id` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `flight_id` `flight_id` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `status` `status` VARCHAR(20) NULL DEFAULT NULL ;

CREATE TABLE IF NOT EXISTS `donkeyair`.`passengers` (
  `passenger_id` INT(11) NOT NULL AUTO_INCREMENT,
  `booking_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `passport_number` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  INDEX `booking_id` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `passengers_ibfk_1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `donkeyair`.`bookings` (`booking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `donkeyair`.`options` (
  `option_id` INT(11) NOT NULL AUTO_INCREMENT,
  `flight_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  INDEX `flight_id_idx` (`flight_id` ASC) VISIBLE,
  CONSTRAINT `flight_id`
    FOREIGN KEY (`flight_id`)
    REFERENCES `donkeyair`.`flights` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `donkeyair`.`bookings` 
ADD CONSTRAINT `bookings_ibfk_1`
  FOREIGN KEY (`user_id`)
  REFERENCES `donkeyair`.`users` (`user_id`),
ADD CONSTRAINT `bookings_ibfk_2`
  FOREIGN KEY (`flight_id`)
  REFERENCES `donkeyair`.`flights` (`flight_id`);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
