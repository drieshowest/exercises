-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Exercise 4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercise 4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise 4` DEFAULT CHARACTER SET utf8 ;
USE `Exercise 4` ;

-- -----------------------------------------------------
-- Table `Exercise 4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Doctor` (
  `idDoctor` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  `Adress` VARCHAR(45) NULL,
  `Phone_number` INT NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`idDoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Medical` (
  `id_Medical` INT NOT NULL,
  `idDoctor` INT NOT NULL,
  `Overtime_rate` TIME NULL,
  PRIMARY KEY (`id_Medical`),
  INDEX `idDoctorMedical_idx` (`idDoctor` ASC),
  CONSTRAINT `idDoctorMedical`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `Exercise 4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  `idDoctor` INT NOT NULL,
  PRIMARY KEY (`idSpecialist`),
  INDEX `idDoctor_idx` (`idDoctor` ASC),
  CONSTRAINT `idDoctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `Exercise 4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` INT NULL,
  `Date_of_birth` DATE NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Payment` (
  `idPayment` INT NOT NULL,
  `Details` VARCHAR(45) NULL,
  `Method` VARCHAR(45) NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `Date` DATE NULL,
  `Time` TIME NULL,
  `idDoctor` INT NOT NULL,
  `idPatient` INT NOT NULL,
  `idPayment` INT NOT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `Doctor_idx` (`idDoctor` ASC),
  INDEX `Patient_idx` (`idPatient` ASC),
  INDEX `Payment_idx` (`idPayment` ASC),
  CONSTRAINT `Doctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `Exercise 4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient`
    FOREIGN KEY (`idPatient`)
    REFERENCES `Exercise 4`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Payment`
    FOREIGN KEY (`idPayment`)
    REFERENCES `Exercise 4`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Bill` (
  `idBill` INT NOT NULL,
  `Total` INT NULL,
  PRIMARY KEY (`idBill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise 4`.`Crossref`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise 4`.`Crossref` (
  `idCrossref` INT NOT NULL,
  `idPayment` INT NOT NULL,
  `idBill` INT NOT NULL,
  PRIMARY KEY (`idCrossref`),
  INDEX `Payment_idx` (`idPayment` ASC),
  INDEX `Bill_idx` (`idBill` ASC),
  CONSTRAINT `PaymentCrossref`
    FOREIGN KEY (`idPayment`)
    REFERENCES `Exercise 4`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BillCrossref`
    FOREIGN KEY (`idBill`)
    REFERENCES `Exercise 4`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
