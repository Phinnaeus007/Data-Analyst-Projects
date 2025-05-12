select *
FROM fsi_data_2006_2023;

select Country,
SUM(`Security Apparatus`)
FROM fsi_data_2006_2023
WHERE Country = 'Iraq'
GROUP BY Country;

select DISTINCT Country
FROM fsi_data_2006_2023
;

WITH yr_total AS (
	select Country, `Security Apparatus` as SA
    FROM fsi_data_2006_2023
    WHERE Country= 'Chad'
)
select DISTINCT Country, SUM(SA) OVER(PARTITION BY Country) as rolling_sum
FROM yr_total;

DELIMITER //
CREATE PROCEDURE `Total` (state TEXT)
BEGIN
select DISTINCT Country, 
ROUND(SUM(`Security Apparatus`) OVER (ORDER BY Country), 2) as Security_apparatus_total,
ROUND(SUM(`Economy`) OVER (ORDER BY Country), 2) as Economy_total,
ROUND(SUM(`Demographic Pressures`) OVER (ORDER BY Country) , 2) as Demographic_pressures_total,
ROUND(SUM(`Public Services`) OVER (ORDER BY Country), 2) as Public_Services_total
FROM fsi_data_2006_2023
WHERE Country = state
;
END //
DELIMITER ;

CALL Total('Iraq');
CAll Total('India');
CAll Total('China');
CAll Total('Russia');

select *
FROM fsi_data_2006_2023
WHERE `Rank` LIKE '1st%';

select *
FROM fsi_data_2006_2023
WHERE `Rank` LIKE '179%';

select Country, COUNT(Country) AS `No. of most totals`
FROM fsi_data_2006_2023
GROUP BY Country
ORDER BY `No. of most totals` DESC
;

select *
FROM fsi_data_2006_2023

















