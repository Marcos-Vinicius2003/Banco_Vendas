-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas` DEFAULT CHARACTER SET latin1 ;
USE `vendas` ;

-- -----------------------------------------------------
-- Table `vendas`.`fidelidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`fidelidade` (
  `id` INT(11) NOT NULL,
  `bonus` VARCHAR(30) NULL DEFAULT NULL,
  `CPF_client` CHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vendas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`clientes` (
  `ID` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(15) NULL DEFAULT NULL,
  `nascimento` DATETIME NULL DEFAULT NULL,
  `fidelidade_id` INT(11) NOT NULL,
  PRIMARY KEY (`fidelidade_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vendas`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`pedido` (
  `ID` INT(11) NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `ID_artigo` INT(11) NULL DEFAULT NULL,
  `QTD` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vendas`.`artigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`artigo` (
  `ID` INT(11) NOT NULL,
  `QTD` DECIMAL(10,0) NOT NULL,
  `descrição` VARCHAR(50) NULL DEFAULT NULL,
  `preço` DECIMAL(10,0) NULL DEFAULT NULL,
  `clientes_fidelidade_id` INT(11) NOT NULL,
  `pedido_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`, `clientes_fidelidade_id`, `pedido_ID`),
  INDEX `fk_artigo_clientes1_idx` (`clientes_fidelidade_id` ASC) VISIBLE,
  INDEX `fk_artigo_pedido1_idx` (`pedido_ID` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vendas`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`compra` (
  `id` INT(11) NULL DEFAULT NULL,
  `data_vendas` DATE NULL DEFAULT NULL,
  `valor` DECIMAL(10,0) NULL DEFAULT NULL)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vendas`.`log_operecoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`log_operecoes` (
  `ID` INT(11) NOT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `operacoes` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
