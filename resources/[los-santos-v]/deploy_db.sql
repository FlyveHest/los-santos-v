START TRANSACTION;
SET AUTOCOMMIT = 0;

CREATE TABLE `Players` (
	`pid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`PlayerID` VARCHAR(50) NOT NULL,
	`PlayerName` VARCHAR(250) NOT NULL DEFAULT 'Player',
	`TimePlayed` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`Banned` TINYINT(1) NOT NULL DEFAULT '0',
	`BanExpiresDate` INT(11) NULL DEFAULT NULL,
	`Moderator` INT(10) UNSIGNED NULL DEFAULT NULL,
	`PatreonTier` INT(10) UNSIGNED NULL DEFAULT NULL,
	`LoginTime` INT(10) UNSIGNED NULL DEFAULT NULL,
	`Cash` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`Experience` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`Prestige` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`Kills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`Deaths` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`MoneyWasted` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`Headshots` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`VehicleKills` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`MaxKillstreak` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`MissionsDone` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`EventsWon` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`LongestKillDistance` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`SkinModel` MEDIUMTEXT NULL DEFAULT NULL,
	`Weapons` MEDIUMTEXT NULL DEFAULT NULL,
	`Garages` MEDIUMTEXT NULL DEFAULT NULL,
	`Vehicles` LONGTEXT NULL DEFAULT NULL,
	`Settings` MEDIUMTEXT NULL DEFAULT NULL,
	PRIMARY KEY (`pid`) USING BTREE,
	UNIQUE INDEX `PlayerID` (`PlayerID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE SurvivalRecords (
	SurvivalID varchar(50) NOT NULL,
	PlayerName varchar(50) NOT NULL,
	Waves INT UNSIGNED NOT NULL,
	PRIMARY KEY (SurvivalID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `TrialTracks` (
	`tid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`TrackID` VARCHAR(100) NOT NULL,
	`TrackName` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`tid`) USING BTREE,
	UNIQUE INDEX `TrackID` (`TrackID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `VehicleClasses` (
	`vcid` INT(11) UNSIGNED NOT NULL,
	`VehicleClass` VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (`vcid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `TrackRecords` (
	`tid` INT(11) UNSIGNED NOT NULL,
	`pid` INT(11) UNSIGNED NOT NULL,
	`vcid` INT(11) UNSIGNED NOT NULL,
	`Time` INT(11) NULL DEFAULT NULL,
	`RecordDTM` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`tid`, `pid`, `vcid`) USING BTREE,
	INDEX `FK_TrackRecords_Players` (`pid`) USING BTREE,
	INDEX `FK_TrackRecords_VehicleClasses` (`vcid`) USING BTREE,
	CONSTRAINT `FK_TrackRecords_Players` FOREIGN KEY (`pid`) REFERENCES `fivem_dev`.`Players` (`pid`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_TrackRecords_TrialTracks` FOREIGN KEY (`tid`) REFERENCES `fivem_dev`.`TrialTracks` (`tid`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_TrackRecords_VehicleClasses` FOREIGN KEY (`vcid`) REFERENCES `fivem_dev`.`VehicleClasses` (`vcid`) ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;
