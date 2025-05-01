select *
FROM forbes;
-- no need for data cleaning as data is already neat

-- checking Tata's stats
select `Forbes 2000 rank`,
`Rank`,
`Name`, 
`Assets(billions US$)`, 
`Profit(billions US$)`,
`Value(billions US$)`,
`Revenue(billions US$)`
FROM forbes
WHERE `Name` LIKE 'Tata%'
ORDER BY `Assets(billions US$)` DESC
;

select `Forbes 2000 rank`,`Rank`,`Name`, `Assets(billions US$)`
FROM forbes
WHERE `Name` LIKE '%bank%';

-- making store procedure to check the assets, profit, value and revenue of chosen companies
DELIMITER /
CREATE PROCEDURE `AssetChecker`(nam TEXT)
BEGIN
	select `Forbes 2000 rank`,
	`Rank`,
	`Name`, 
	`Assets(billions US$)`, 
	`Profit(billions US$)`,
	`Value(billions US$)`,
	`Revenue(billions US$)`
	FROM forbes
	WHERE `Name` LIKE nam
	ORDER BY `Assets(billions US$)` DESC
	;
END/
DELIMITER ;

select *
FROM forbes;

-- running the procedure
CALL `AssetChecker`('Bajaj%');
CALL `AssetChecker`('ICICI%');
CALL `AssetChecker`('NTPC%');
CALL `AssetChecker`('Kotak%');

-- seeing the total assets, profit, revenue and value as per headquarters
select Headquarters , 
ROUND(SUM(`Assets(billions US$)`), 2) as `total Assets in billion USD`,
ROUND(SUM(`Revenue(billions US$)`), 2) as `total Revenue in billion USD`, 
ROUND(SUM(`Profit(billions US$)`), 2) as `total Profit in billion USD`,
ROUND(SUM(`Value(billions US$)`), 2) as `total Vaue in billion USD`,
COUNT(`Assets(billions US$)`) as `No. of companies`
FROM forbes
GROUP BY Headquarters
ORDER BY `total Assets in billion USD` DESC
;

-- now useing the above but industry wise
select Industry , 
ROUND(SUM(`Assets(billions US$)`), 2) as `total Assets in billion USD`,
ROUND(SUM(`Revenue(billions US$)`), 2) as `total Revenue in billion USD`, 
ROUND(SUM(`Profit(billions US$)`), 2) as `total Profit in billion USD`,
ROUND(SUM(`Value(billions US$)`), 2) as `total Vaue in billion USD`,
COUNT(`Assets(billions US$)`) as `No. of companies`
FROM forbes
GROUP BY Industry
ORDER BY `total Assets in billion USD` DESC
;

select *
FROM forbes;













