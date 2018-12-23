-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema rh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `funcionarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funcionarios` ;

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `ID_FUNCIONARIO` INT NOT NULL AUTO_INCREMENT,
  `NOME_FUNCIONARIO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dependentes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dependentes` ;

CREATE TABLE IF NOT EXISTS `dependentes` (
  `ID_DEPENDENTE` INT NOT NULL AUTO_INCREMENT,
  `ID_FUNCIONARIO` INT NOT NULL,
  `NOME_DEPENDENTE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_DEPENDENTE`, `ID_FUNCIONARIO`),
  INDEX `fk_dependentes_funcionarios_idx` (`ID_FUNCIONARIO` ASC),
  CONSTRAINT `fk_dependentes_funcionarios`
    FOREIGN KEY (`ID_FUNCIONARIO`)
    REFERENCES `funcionarios` (`ID_FUNCIONARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `funcionarios`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `funcionarios` (`ID_FUNCIONARIO`, `NOME_FUNCIONARIO`) VALUES (1, 'José Silva');
INSERT INTO `funcionarios` (`ID_FUNCIONARIO`, `NOME_FUNCIONARIO`) VALUES (2, 'André Pereira');
INSERT INTO `funcionarios` (`ID_FUNCIONARIO`, `NOME_FUNCIONARIO`) VALUES (3, 'João Costa');
INSERT INTO `funcionarios` (`ID_FUNCIONARIO`, `NOME_FUNCIONARIO`) VALUES (4, 'Márcio Garcia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dependentes`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `dependentes` (`ID_DEPENDENTE`, `ID_FUNCIONARIO`, `NOME_DEPENDENTE`) VALUES (1, 1, 'Luiz Henrique Soares Silva');
INSERT INTO `dependentes` (`ID_DEPENDENTE`, `ID_FUNCIONARIO`, `NOME_DEPENDENTE`) VALUES (2, 1, 'Paulo Soares Silva');
INSERT INTO `dependentes` (`ID_DEPENDENTE`, `ID_FUNCIONARIO`, `NOME_DEPENDENTE`) VALUES (3, 2, 'Márcia Pereira');

COMMIT;

