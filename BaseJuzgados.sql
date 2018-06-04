-- MySQL Script generated by MySQL Workbench
-- Sun Jun  3 21:04:55 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Juzgados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Juzgados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Juzgados` DEFAULT CHARACTER SET utf8 ;
USE `Juzgados` ;

-- -----------------------------------------------------
-- Table `Juzgados`.`TtipoCaso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juzgados`.`TtipoCaso` (
  `CidCaso` INT NOT NULL COMMENT 'Clave que identifica al caso.',
  `CtipoCaso` VARCHAR(45) NOT NULL COMMENT 'Nombre del tipo de caso.',
  PRIMARY KEY (`CidCaso`))
ENGINE = InnoDB
COMMENT = 'Tabla donde se registran los tipos de casos que se pueden tratar en el juzgado.';


-- -----------------------------------------------------
-- Table `Juzgados`.`TinfExpediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juzgados`.`TinfExpediente` (
  `CnumExp` INT NOT NULL AUTO_INCREMENT COMMENT 'Folio correspondiente del expediente.',
  `CfechaExp` VARCHAR(45) NOT NULL COMMENT 'Fecha correspondiente a la creación del expediente',
  `CtipoCaso_idCaso` INT NOT NULL COMMENT 'Clave que nos identifica qué tipo de caso se trata en el expediente, enlazada con la tabla tipoCaso.',
  PRIMARY KEY (`CnumExp`),
  INDEX `fk_infExpediente_tipoCaso1_idx` (`CtipoCaso_idCaso` ASC),
  CONSTRAINT `fk_infExpediente_tipoCaso1`
    FOREIGN KEY (`CtipoCaso_idCaso`)
    REFERENCES `Juzgados`.`TtipoCaso` (`CidCaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabla donde muetra la información necesaria de cada expediente.';


-- -----------------------------------------------------
-- Table `Juzgados`.`TusuarioSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juzgados`.`TusuarioSistema` (
  `CidUsuSist` INT NOT NULL AUTO_INCREMENT COMMENT 'Clave identificadora del usuario del sistema.',
  `CnomUsuSist` VARCHAR(45) NOT NULL COMMENT 'Nombre del usuario del sistema.',
  `CcontraseñaUsuSist` VARCHAR(45) NOT NULL COMMENT 'Contraseña del usuario del sistema.',
  PRIMARY KEY (`CidUsuSist`))
ENGINE = InnoDB
COMMENT = 'Tabla para almacenar las cuentas de usuario que tiene acceso al sistema.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;