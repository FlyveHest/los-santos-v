ALTER TABLE `Players`
	ADD COLUMN `pid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
	ADD COLUMN `PlayerName` VARCHAR(250) NOT NULL DEFAULT 'Player' AFTER `PlayerID`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`pid`),
	ADD UNIQUE INDEX `PlayerID` (`PlayerID`)
;

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

DROP TABLE TimeTrialRecords;
