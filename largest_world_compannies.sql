select `Name`, Industry
FROM largest_companies;

select `Name`, Industry
FROM largest_companies
WHERE `Name` LIKE "%Petro%";

CREATE TABLE larg_comp_copy
LIKE largest_companies;

INSERT larg_comp_copy
select *
FROM largest_companies;

select *
FROM larg_comp_copy
WHERE Industry LIKE '%Oil%';

select `Name`, Industry
FROM largest_companies
WHERE `Name` LIKE "%Petro%";

UPDATE larg_comp_copy
SET Industry = 'Oil and gas'
WHERE `Name` LIKE "%Petro%";

select *
FROM larg_comp_copy
WHERE `Name` LIKE '%Bank%';

select *
FROM larg_comp_copy;

UPDATE larg_comp_copy
SET Industry = "Financials"
WHERE `Name` LIKE '%Bank%';

select *
FROM larg_comp_copy
WHERE Industry = '';

UPDATE larg_comp_copy
SET Industry = "Electronics"
WHERE `Name` = "Foxconn";

select *
FROM larg_comp_copy
;

UPDATE larg_comp_copy
SET `Headquarters[note 1]` = "United States"
WHERE `Headquarters[note 1]` = '';

ALTER TABLE larg_comp_copy
CHANGE COLUMN `Headquarters[note 1]` `Headquarters` TEXT ;

select *
FROM larg_comp_copy;

ALTER TABLE larg_comp_copy
MODIFY COLUMN `Employees` INT ;

UPDATE larg_comp_copy
SET Employees = REPLACE(Employees, ',' , '');

select *
FROM larg_comp_copy;

UPDATE larg_comp_copy
SET Revenue = REPLACE(Revenue, '$' , '');

ALTER TABLE larg_comp_copy
MODIFY COLUMN `Revenue` INT ;

ALTER TABLE larg_comp_copy
DROP COLUMN `State-Owned` ;

select *
FROM larg_comp_copy;

RENAME TABLE larg_comp_copy TO largest_companies;


































