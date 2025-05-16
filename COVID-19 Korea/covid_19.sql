SELECT *
FROM cases;
SELECT *
FROM patientinfo;
SELECT *
FROM policy; -- MODIFY THE DATE
SELECT *
FROM region;
SELECT *
FROM searchtrend;
SELECT *
FROM seoulfloating; -- MODIFY THE DATE HERE
SELECT *
FROM `time`; -- DATE 
SELECT *
FROM timeage; -- DATE
SELECT *
FROM timegender; -- DATE
SELECT *
FROM timeprovince; -- DATE
SELECT *
FROM weather; -- DATE


CREATE TABLE `policy_COPY` (
  `policy_id` int DEFAULT NULL,
  `country` text,
  `type` text,
  `gov_policy` text,
  `detail` text,
  `start_date` text,
  `end_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- POLICY MODIFYING
INSERT policy_COPY
SELECT *
FROM policy;

SELECT * 
FROM policy_copy;

UPDATE policy_copy
SET start_date = REPLACE(start_date, '-', '') ;

UPDATE policy_copy
SET end_date = REPLACE(end_date, '-', '')  ;

SELECT * 
FROM policy_copy;

ALTER TABLE policy_copy
MODIFY COLUMN `start_date` DATE;

SELECT start_date, end_date
FROM policy_copy;

ALTER TABLE policy_copy
MODIFY COLUMN `end_date` DATE;

SELECT end_date
FROM policy_copy
WHERE end_date = '';

UPDATE policy_copy
SET end_date = 'na'
WHERE end_date = '';

SELECT end_date
FROM policy_copy
;

ALTER TABLE policy_copy
MODIFY COLUMN `end_date` DATE;

UPDATE policy_copy
SET end_date = '20200101'
WHERE end_date = 'na';

ALTER TABLE policy_copy
MODIFY COLUMN `end_date` DATE;

SELECT start_date, end_date
FROM policy_copy;

UPDATE policy_copy
SET end_date = NULL
WHERE end_date = '20200101';

RENAME TABLE policy TO policy_backup;
RENAME TABLE policy_copy TO policy;

-- SEAOULFLOATING MODIFYING
CREATE TABLE seoulfloating_copy
LIKE seoulfloating;

INSERT seoulfloating_copy
SELECT *
FROM seoulfloating;

SELECT *
FROM seoulfloating_copy;

SELECT `date`
FROM seoulfloating_copy
WHERE `date` IS NULL OR `date` = '';

ALTER TABLE seoulfloating_copy
MODIFY COLUMN `date` DATE;

SELECT *
FROM seoulfloating_copy;

RENAME TABLE seoulfloating TO seoulfloating_backup;
RENAME TABLE seoulfloating_copy TO seoulfloating;

-- TIME MODIFYING
CREATE TABLE time_copy
LIKE `time`;

INSERT time_copy
SELECT *
FROM `time`;

SELECT *
FROM time_copy;

SELECT `date`
FROM time_copy
WHERE `date` = '' OR `date` IS NULL;

ALTER TABLE time_copy
MODIFY COLUMN `date` DATE;


RENAME TABLE `time` to time_backup;
RENAME TABLE time_copy to `time`;


-- time age
SELECT *
FROM timeage;

CREATE TABLE timeage_copy
LIKE timeage;
INSERT timeage_copy
SELECT *
FROM timeage;

ALTER TABLE timeage_copy
MODIFY COLUMN `date` DATE;

RENAME TABLE `timeage` TO timeage_backup;
RENAME TABLE timeage_copy TO timeage;

-- inspection
CREATE VIEW `datewise_stats` AS
SELECT 
`time`.`date` AS `date`,
SUM(`time`.`test`) AS `total_taken`,
SUM(`time`.`negative`) AS `total_-ve`,
SUM(`time`.`confirmed`) AS `total_confim`,
SUM(`time`.`released`) AS `total_released`,
SUM(`time`.`deceased`) AS `total_dead`
FROM
`time`
GROUP BY `time`.`date`
ORDER BY `total_taken` DESC;

SELECT *
FROM datewise_stats;

SELECT 
`time`.`date` AS `date`,
SUM(`time`.`test`) AS `total_taken`,
SUM(`time`.`negative`) AS `total_-ve`,
SUM(`time`.`confirmed`) AS `total_confim`,
SUM(`time`.`released`) AS `total_released`,
SUM(`time`.`deceased`) AS `total_dead`
FROM
`time`
GROUP BY `time`.`date`
ORDER BY `total_taken` DESC;



SELECT age,
SUM(confirmed) as age_confirmed,
SUM(deceased) as age_deceased
FROM timeage
GROUP BY age
ORDER BY age_confirmed DESC;

CREATE VIEW `AGEWISE_CASES` AS
SELECT age,
SUM(confirmed) as age_confirmed,
SUM(deceased) as age_deceased
FROM timeage
GROUP BY age
ORDER BY age_confirmed DESC;

SELECT *
FROM timegender;

SELECT sex,
COUNT(sex) AS total_people,
SUM(confirmed) AS `total_confirmed`,
SUM(deceased) AS `total_deceased`
FROM timegender
GROUP BY sex;

CREATE VIEW `genderwise_cases` AS
SELECT sex,
COUNT(sex) AS total_people,
SUM(confirmed) AS `total_confirmed`,
SUM(deceased) AS `total_deceased`
FROM timegender
GROUP BY sex;

SELECT province,
SUM(confirmed) AS total_confirmed,
SUM(released) AS total_released,
SUM(deceased) AS total_deceased
FROM timeprovince
GROUP BY province
ORDER BY total_confirmed DESC;

CREATE VIEW `provicewise_cases` AS
SELECT province,
SUM(confirmed) AS total_confirmed,
SUM(released) AS total_released,
SUM(deceased) AS total_deceased
FROM timeprovince
GROUP BY province
ORDER BY total_confirmed DESC;

SELECT `date`,
province,
SUM(confirmed) AS total_confirmed,
SUM(released) AS total_released,
SUM(deceased) AS total_deceased
FROM timeprovince
GROUP BY `date` , province
ORDER BY `date` ASC;

CREATE VIEW `dateprovincewise_cases` AS
SELECT `date`,
province,
SUM(confirmed) AS total_confirmed,
SUM(released) AS total_released,
SUM(deceased) AS total_deceased
FROM timeprovince
GROUP BY `date` , province
ORDER BY `date` ASC;


















