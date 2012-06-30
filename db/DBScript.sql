SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `mb`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`role` ;

CREATE  TABLE IF NOT EXISTS `mb`.`role` (
  `role_id` INT NOT NULL ,
  `role_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`role_id`) )
ENGINE = InnoDB, 
COMMENT = 'User role need to be stored in this table that define the ac' /* comment truncated */ ;


-- -----------------------------------------------------
-- Table `mb`.`item_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`item_type` ;

CREATE  TABLE IF NOT EXISTS `mb`.`item_type` (
  `iditem_type` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`iditem_type`) )
ENGINE = InnoDB, 
COMMENT = 'This table store\nIncome\nExpense' ;


-- -----------------------------------------------------
-- Table `mb`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`item` ;

CREATE  TABLE IF NOT EXISTS `mb`.`item` (
  `iditem` INT NOT NULL ,
  `item_type_iditem_type` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `monthy_inclusion` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`iditem`) ,
  INDEX `fk_item_item_type1` (`item_type_iditem_type` ASC) ,
  CONSTRAINT `fk_item_item_type1`
    FOREIGN KEY (`item_type_iditem_type` )
    REFERENCES `mb`.`item_type` (`iditem_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`user` ;

CREATE  TABLE IF NOT EXISTS `mb`.`user` (
  `user_id` INT NOT NULL ,
  `user_first_name` VARCHAR(45) NOT NULL ,
  `user_last_name` VARCHAR(45) NOT NULL ,
  `user_email` VARCHAR(90) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `role_role_id` INT NOT NULL ,
  `item_iditem` INT NOT NULL ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) ,
  INDEX `fk_user_role1` (`role_role_id` ASC) ,
  INDEX `fk_user_item1` (`item_iditem` ASC) ,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_role_id` )
    REFERENCES `mb`.`role` (`role_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_item1`
    FOREIGN KEY (`item_iditem` )
    REFERENCES `mb`.`item` (`iditem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'User related details need to be stored in this table.\nUser r' /* comment truncated */ ;


-- -----------------------------------------------------
-- Table `mb`.`budget`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`budget` ;

CREATE  TABLE IF NOT EXISTS `mb`.`budget` (
  `idbudget` INT NOT NULL ,
  `amount` FLOAT NULL ,
  `item_iditem` INT NOT NULL ,
  PRIMARY KEY (`idbudget`) ,
  INDEX `fk_budget_item1` (`item_iditem` ASC) ,
  CONSTRAINT `fk_budget_item1`
    FOREIGN KEY (`item_iditem` )
    REFERENCES `mb`.`item` (`iditem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mb`.`transaction_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`transaction_type` ;

CREATE  TABLE IF NOT EXISTS `mb`.`transaction_type` (
  `transaction_type_id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`transaction_type_id`) )
ENGINE = InnoDB, 
COMMENT = 'Income\nExpense\nTransfer' ;


-- -----------------------------------------------------
-- Table `mb`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`transaction` ;

CREATE  TABLE IF NOT EXISTS `mb`.`transaction` (
  `transaction_id` MEDIUMTEXT  NOT NULL ,
  `amount` FLOAT NOT NULL ,
  `note` VARCHAR(255) NULL ,
  `trans_date` DATETIME NOT NULL ,
  `from_item_iditem` INT NOT NULL ,
  `to_item_iditem` INT NOT NULL ,
  `transaction_type_id` INT NOT NULL ,
  `approve` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`transaction_id`) ,
  INDEX `fk_transaction_item1` (`from_item_iditem` ASC) ,
  INDEX `fk_transaction_item2` (`to_item_iditem` ASC) ,
  INDEX `fk_transaction_transaction_type2` (`transaction_type_id` ASC) ,
  CONSTRAINT `fk_transaction_item1`
    FOREIGN KEY (`from_item_iditem` )
    REFERENCES `mb`.`item` (`iditem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_item2`
    FOREIGN KEY (`to_item_iditem` )
    REFERENCES `mb`.`item` (`iditem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_transaction_type2`
    FOREIGN KEY (`transaction_type_id` )
    REFERENCES `mb`.`transaction_type` (`transaction_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mb`.`setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mb`.`setting` ;

CREATE  TABLE IF NOT EXISTS `mb`.`setting` (
  `key` VARCHAR(45) NOT NULL ,
  `value` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`key`, `value`) )
ENGINE = InnoDB, 
COMMENT = 'Settings related to application need to be stored in this ta' /* comment truncated */ ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
