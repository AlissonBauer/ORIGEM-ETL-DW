-- MySQL Script generated by MySQL Workbench
-- Tue Oct 31 21:53:50 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clinica` ;

-- -----------------------------------------------------
-- Table `clinica`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Medico` (
  `Sk_medico` INT(11) NOT NULL,
  `id_medico` VARCHAR(45) NULL,
  `Nome` VARCHAR(255) NULL DEFAULT NULL,
  `Especialidade` VARCHAR(255) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  `Endereco` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`Sk_medico`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Paciente` (
  `Sk_paciente` INT(11) NOT NULL,
  `Nome` VARCHAR(255) NULL DEFAULT NULL,
  `DataNascimento` DATE NULL DEFAULT NULL,
  `Genero` VARCHAR(10) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  `Endereco` VARCHAR(255) NULL DEFAULT NULL,
  `id_paciente` INT(11) NULL,
  PRIMARY KEY (`Sk_paciente`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`Salario_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Salario_medico` (
  `Sk_Salario` INT(11) NOT NULL,
  `id_salario` INT(11) NULL,
  `Salario` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`Sk_Salario`),
  INDEX `idx_Salario_medico_lookup` (`Sk_Salario` ASC) VISIBLE,
  INDEX `idx_Salario_medico_tk` (`Sk_Salario` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`Tempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Tempo` (
  `SK_tempo` INT(11) NOT NULL,
  `Ano` INT(11) NULL DEFAULT NULL,
  `Mes` INT(2) NULL DEFAULT NULL,
  `Data_completa` DATETIME NULL DEFAULT NULL,
  `Dia` INT(2) NULL DEFAULT NULL,
  `Semestre` INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (`SK_tempo`))
ENGINE = InnoDB
AUTO_INCREMENT = 98411
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `clinica`.`Indicadores_clinicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`Indicadores_clinicos` (
  `Tempo_SK_tempo` INT(11) NOT NULL,
  `Salario_medico_Sk_Salario` INT(11) NOT NULL,
  `Paciente_Sk_paciente` INT(11) NOT NULL,
  `Medico_Sk_medico` INT(11) NOT NULL,
  `Satisfacao_Paciente` INT(11) NULL DEFAULT NULL,
  `Consulta` INT(11) NULL DEFAULT NULL,
  `Hora_inicio_consulta` DATETIME NULL DEFAULT NULL,
  `Hora_fim_consulta` DATETIME NULL DEFAULT NULL,
  `Nota_Satisfacao` INT(1) NULL DEFAULT NULL,
  `Comentario_Satisfacao` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`Tempo_SK_tempo`, `Salario_medico_Sk_Salario`, `Paciente_Sk_paciente`, `Medico_Sk_medico`),
  INDEX `fk_Indicadores_clinicos_Salario_medico1_idx` (`Salario_medico_Sk_Salario` ASC) VISIBLE,
  INDEX `fk_Indicadores_clinicos_Paciente1_idx` (`Paciente_Sk_paciente` ASC) VISIBLE,
  INDEX `fk_Indicadores_clinicos_Medico1_idx` (`Medico_Sk_medico` ASC) VISIBLE,
  CONSTRAINT `fk_Indicadores_clinicos_Medico1`
    FOREIGN KEY (`Medico_Sk_medico`)
    REFERENCES `clinica`.`Medico` (`Sk_medico`),
  CONSTRAINT `fk_Indicadores_clinicos_Paciente1`
    FOREIGN KEY (`Paciente_Sk_paciente`)
    REFERENCES `clinica`.`Paciente` (`Sk_paciente`),
  CONSTRAINT `fk_Indicadores_clinicos_Salario_medico1`
    FOREIGN KEY (`Salario_medico_Sk_Salario`)
    REFERENCES `clinica`.`Salario_medico` (`Sk_Salario`),
  CONSTRAINT `fk_Indicadores_clinicos_Tempo`
    FOREIGN KEY (`Tempo_SK_tempo`)
    REFERENCES `clinica`.`Tempo` (`SK_tempo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;