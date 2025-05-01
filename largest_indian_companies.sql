select *
FROM forbes;
select `Forbes 2000 rank`,`Rank`,`Name`, `Assets(billions US$)`
FROM forbes
WHERE `Name` LIKE 'Tata%'
ORDER BY `Assets(billions US$)` DESC
;

select `Forbes 2000 rank`,`Rank`,`Name`, `Assets(billions US$)`
FROM forbes
WHERE `Name` LIKE '%bank%';





