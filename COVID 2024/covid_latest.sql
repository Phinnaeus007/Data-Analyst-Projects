-- DROPPING UNECESSARY COLUMNS(COLUMNS WITH NO VALUES WHATSOEVER)

SELECT *
FROM covid_latest;
-- following tables to drop because pointless
-- positive rate, total test, excess mortality, excess mortality cumulative,  stringency index, tests_units, total_tests_per_thousand
-- excess_mortality_cumulative_absolute, new_tests_smoothed_per_thousand, excess_mortality_cumulative_per_million, repoduction rate,
-- people_fully_vaccinated_per_hundred

CREATE TABLE covid_lates_copy
LIKE covid_latest;

INSERT covid_lates_copy
SELECT *
FROM covid_latest;

ALTER TABLE covid_lates_copy
RENAME COLUMN `MyUnknownColumn` TO `Country`;

SELECT *
FROM covid_lates_copy;

ALTER TABLE covid_lates_copy
DROP COLUMN positive_rate, 
DROP COLUMN total_tests,
DROP COLUMN excess_mortality,
DROP COLUMN excess_mortality_cumulative,
DROP COLUMN stringency_index,
DROP COLUMN tests_units,
DROP COLUMN total_tests_per_thousand,
DROP COLUMN excess_mortality_cumulative_absolute,
DROP COLUMN new_tests_smoothed_per_thousand,
DROP COLUMN excess_mortality_cumulative_per_million,
DROP COLUMN reproduction_rate,
DROP COLUMN people_fully_vaccinated_per_hundred,
DROP COLUMN new_tests,
DROP COLUMN new_cases_smoothed,
DROP COLUMN tests_per_case,
DROP COLUMN new_tests_per_thousand,
DROP COLUMN new_tests_smoothed,
DROP COLUMN weekly_icu_admissions_per_million;

-- CHANGING BLANK VALUES TO 0.0 AND DATA TYPE TO DOUBLE

SELECT new_vaccinations_smoothed_per_million
FROM covid_lates_copy
WHERE new_vaccinations_smoothed_per_million = '';

UPDATE covid_lates_copy
SET new_vaccinations_smoothed_per_million = 0.0
WHERE new_vaccinations_smoothed_per_million = '';

SELECT new_vaccinations_smoothed_per_million
FROM covid_lates_copy
WHERE new_vaccinations_smoothed_per_million = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `new_vaccinations_smoothed_per_million` DOUBLE;

SELECT new_vaccinations_smoothed_per_million 
FROM covid_lates_copy;

UPDATE covid_lates_copy
SET weekly_hosp_admissions = 0.0
WHERE weekly_hosp_admissions = '';

SELECT weekly_hosp_admissions
FROM covid_lates_copy;

ALTER TABLE covid_lates_copy
MODIFY COLUMN `weekly_hosp_admissions` DOUBLE;

SELECT human_development_index
FROM covid_lates_copy;


CREATE TABLE covid_lates_copy2
LIKE covid_lates_copy;

INSERT covid_lates_copy2
SELECT *
FROM covid_lates_copy;

UPDATE covid_lates_copy2
SET human_development_index = 0.00
WHERE human_development_index = '';

ALTER TABLE covid_lates_copy2
MODIFY COLUMN `human_development_index` DOUBLE;

SELECT human_development_index
FROM covid_lates_copy2;

UPDATE covid_lates_copy
SET human_development_index = 0.00
WHERE human_development_index = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `human_development_index` DOUBLE;

SELECT human_development_index
FROM covid_lates_copy;

SELECT total_vaccinations
FROM covid_lates_copy
WHERE total_vaccinations = '';

UPDATE covid_lates_copy
SET total_vaccinations = 0.00
WHERE total_vaccinations = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `total_vaccinations` DOUBLE;

-- THIS POINT FORWARDS NO. OF BLANKS WILL BE WRITTEN ON THE SIDE

SELECT weekly_icu_admissions_per_million
FROM covid_lates_copy
WHERE weekly_icu_admissions_per_million = ''; -- 240?! IM DROPPING THIS

SELECT people_vaccinated_per_hundred
FROM covid_lates_copy
WHERE people_vaccinated_per_hundred = ''; -- 14 ROWS HAVE VALUES ONLY.

UPDATE covid_lates_copy
SET people_vaccinated_per_hundred = 0.00
WHERE people_vaccinated_per_hundred = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `people_vaccinated_per_hundred` DOUBLE;

SELECT extreme_poverty
FROM covid_lates_copy
WHERE extreme_poverty = ''; -- 118 BLANKS

UPDATE covid_lates_copy
SET extreme_poverty = 0.00
WHERE extreme_poverty = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `extreme_poverty` DOUBLE;

SELECT total_boosters_per_hundred
FROM covid_lates_copy
WHERE total_boosters_per_hundred = ''; -- 226 ROWS BLANK

UPDATE covid_lates_copy
SET total_boosters_per_hundred = 0.00
WHERE total_boosters_per_hundred = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `total_boosters_per_hundred` DOUBLE;

SELECT handwashing_facilities
FROM covid_lates_copy
WHERE handwashing_facilities = ''; -- 146 ROWS BLANK

UPDATE covid_lates_copy
SET handwashing_facilities = 0.00
WHERE handwashing_facilities = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `handwashing_facilities` DOUBLE;

SELECT new_vaccinations_smoothed
FROM covid_lates_copy
WHERE new_vaccinations_smoothed = '';

--  AFTER THIS I AM AUTOMATING THIS PROCESS USING PYTHON and GPT
-- new_vaccinations_smoothed

SELECT new_vaccinations_smoothed
FROM covid_lates_copy
WHERE new_vaccinations_smoothed = ''; -- 226 BLANKS

UPDATE covid_lates_copy
SET new_vaccinations_smoothed = 0.00
WHERE new_vaccinations_smoothed = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `new_vaccinations_smoothed` DOUBLE;


-- total_boosters

SELECT total_boosters
FROM covid_lates_copy
WHERE total_boosters = ''; -- 226 BLANKS

UPDATE covid_lates_copy
SET total_boosters = 0.00
WHERE total_boosters = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `total_boosters` DOUBLE;


-- aged_70_older

SELECT aged_70_older
FROM covid_lates_copy
WHERE aged_70_older = ''; -- 51 BLANKS

UPDATE covid_lates_copy
SET aged_70_older = 0.00
WHERE aged_70_older = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `aged_70_older` DOUBLE;


-- new_vaccinations

SELECT new_vaccinations
FROM covid_lates_copy
WHERE new_vaccinations = ''; -- 228 BLANKS

UPDATE covid_lates_copy
SET new_vaccinations = 0.00
WHERE new_vaccinations = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `new_vaccinations` DOUBLE;


-- hospital_beds_per_thousand

SELECT hospital_beds_per_thousand
FROM covid_lates_copy
WHERE hospital_beds_per_thousand = ''; -- 73 BLANKS

UPDATE covid_lates_copy
SET hospital_beds_per_thousand = 0.00
WHERE hospital_beds_per_thousand = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `hospital_beds_per_thousand` DOUBLE;


-- total_vaccinations_per_hundred

SELECT total_vaccinations_per_hundred
FROM covid_lates_copy
WHERE total_vaccinations_per_hundred = ''; -- 226 BLANKS

UPDATE covid_lates_copy
SET total_vaccinations_per_hundred = 0.00
WHERE total_vaccinations_per_hundred = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `total_vaccinations_per_hundred` DOUBLE;


-- people_vaccinated

SELECT people_vaccinated
FROM covid_lates_copy
WHERE people_vaccinated = ''; -- 228 BLANKS

UPDATE covid_lates_copy
SET people_vaccinated = 0.00
WHERE people_vaccinated = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `people_vaccinated` DOUBLE;


-- people_fully_vaccinated

SELECT people_fully_vaccinated
FROM covid_lates_copy
WHERE people_fully_vaccinated = ''; -- 228 BLANKS

UPDATE covid_lates_copy
SET people_fully_vaccinated = 0.00
WHERE people_fully_vaccinated = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `people_fully_vaccinated` DOUBLE;


-- new_people_vaccinated_smoothed_per_hundred

SELECT new_people_vaccinated_smoothed_per_hundred
FROM covid_lates_copy
WHERE new_people_vaccinated_smoothed_per_hundred = ''; -- 228 BLANKS

UPDATE covid_lates_copy
SET new_people_vaccinated_smoothed_per_hundred = 0.00
WHERE new_people_vaccinated_smoothed_per_hundred = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `new_people_vaccinated_smoothed_per_hundred` DOUBLE;


-- diabetes_prevalence

SELECT diabetes_prevalence
FROM covid_lates_copy
WHERE diabetes_prevalence = ''; -- 41 BLANKS

UPDATE covid_lates_copy
SET diabetes_prevalence = 0.00
WHERE diabetes_prevalence = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `diabetes_prevalence` DOUBLE;


-- new_people_vaccinated_smoothed

SELECT new_people_vaccinated_smoothed
FROM covid_lates_copy
WHERE new_people_vaccinated_smoothed = ''; -- 228 BLANKS

UPDATE covid_lates_copy
SET new_people_vaccinated_smoothed = 0.00
WHERE new_people_vaccinated_smoothed = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `new_people_vaccinated_smoothed` DOUBLE;


-- cardiovasc_death_rate

SELECT cardiovasc_death_rate
FROM covid_lates_copy
WHERE cardiovasc_death_rate = ''; -- 51 BLANKS

UPDATE covid_lates_copy
SET cardiovasc_death_rate = 0.00
WHERE cardiovasc_death_rate = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `cardiovasc_death_rate` DOUBLE;


-- icu_patients

SELECT icu_patients
FROM covid_lates_copy
WHERE icu_patients = ''; -- 239 BLANKS

UPDATE covid_lates_copy
SET icu_patients = 0.00
WHERE icu_patients = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `icu_patients` DOUBLE;


-- gdp_per_capita

SELECT gdp_per_capita
FROM covid_lates_copy
WHERE gdp_per_capita = ''; -- 52 BLANKS

UPDATE covid_lates_copy
SET gdp_per_capita = 0.00
WHERE gdp_per_capita = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `gdp_per_capita` DOUBLE;


-- aged_65_older

SELECT aged_65_older
FROM covid_lates_copy
WHERE aged_65_older = ''; -- 55 BLANKS

UPDATE covid_lates_copy
SET aged_65_older = 0.00
WHERE aged_65_older = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `aged_65_older` DOUBLE;


-- weekly_hosp_admissions_per_million

SELECT weekly_hosp_admissions_per_million
FROM covid_lates_copy
WHERE weekly_hosp_admissions_per_million = ''; -- 240 BLANKS

UPDATE covid_lates_copy
SET weekly_hosp_admissions_per_million = 0.00
WHERE weekly_hosp_admissions_per_million = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `weekly_hosp_admissions_per_million` DOUBLE;


-- life_expectancy

SELECT life_expectancy
FROM covid_lates_copy
WHERE life_expectancy = ''; -- 16 BLANKS

UPDATE covid_lates_copy
SET life_expectancy = 0.00
WHERE life_expectancy = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `life_expectancy` DOUBLE;


-- female_smokers

SELECT female_smokers
FROM covid_lates_copy
WHERE female_smokers = ''; -- 99 BLANKS

UPDATE covid_lates_copy
SET female_smokers = 0.00
WHERE female_smokers = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `female_smokers` DOUBLE;


-- hosp_patients

SELECT hosp_patients
FROM covid_lates_copy
WHERE hosp_patients = ''; -- 239 BLANKS

UPDATE covid_lates_copy
SET hosp_patients = 0.00
WHERE hosp_patients = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `hosp_patients` DOUBLE;


-- male_smokers

SELECT male_smokers
FROM covid_lates_copy
WHERE male_smokers = ''; -- 101 BLANKS

UPDATE covid_lates_copy
SET male_smokers = 0.00
WHERE male_smokers = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `male_smokers` DOUBLE;


-- population_density

SELECT population_density
FROM covid_lates_copy
WHERE population_density = ''; -- 33 BLANKS

UPDATE covid_lates_copy
SET population_density = 0.00
WHERE population_density = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `population_density` DOUBLE;


-- icu_patients_per_million

SELECT icu_patients_per_million
FROM covid_lates_copy
WHERE icu_patients_per_million = ''; -- 239 BLANKS

UPDATE covid_lates_copy
SET icu_patients_per_million = 0.00
WHERE icu_patients_per_million = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `icu_patients_per_million` DOUBLE;


-- hosp_patients_per_million

SELECT hosp_patients_per_million
FROM covid_lates_copy
WHERE hosp_patients_per_million = ''; -- 239 BLANKS

UPDATE covid_lates_copy
SET hosp_patients_per_million = 0.00
WHERE hosp_patients_per_million = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `hosp_patients_per_million` DOUBLE;


-- weekly_icu_admissions

SELECT weekly_icu_admissions
FROM covid_lates_copy
WHERE weekly_icu_admissions = ''; -- 240 BLANKS

UPDATE covid_lates_copy
SET weekly_icu_admissions = 0.00
WHERE weekly_icu_admissions = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `weekly_icu_admissions` DOUBLE;


-- median_age

SELECT median_age
FROM covid_lates_copy
WHERE median_age = ''; -- 49 BLANKS

UPDATE covid_lates_copy
SET median_age = 0.00
WHERE median_age = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `median_age` DOUBLE;

SELECT *
FROM covid_lates_copy;

-- REARRANGE COLUMN
ALTER TABLE covid_lates_copy
MODIFY COLUMN location TEXT AFTER Country;

SELECT *
FROM covid_lates_copy;

ALTER TABLE covid_lates_copy
MODIFY COLUMN continent TEXT AFTER location;
ALTER TABLE covid_lates_copy
MODIFY COLUMN `last_updated_date` DATE;
ALTER TABLE covid_lates_copy
MODIFY COLUMN last_updated_date DATE AFTER Country ;
ALTER TABLE covid_lates_copy
RENAME COLUMN Country TO country_abvs ;
ALTER TABLE covid_lates_copy
RENAME COLUMN location TO Country;

-- Editing continent values
SELECT location,
continent
FROM covid_lates_copy
WHERE continent = '0.00';

UPDATE covid_lates_copy
SET continent = location
WHERE continent = '0.00';

UPDATE covid_lates_copy
SET continent = 'Europe'
WHERE Country = 'European Union (27)';

SELECT *
FROM covid_lates_copy;

-- queries
CREATE VIEW `DEATH_RANKING` AS 
	SELECT Country,
	DENSE_RANK() OVER(ORDER BY total_deaths DESC) Death_rank,
	total_deaths
	FROM covid_lates_copy
	WHERE total_deaths < 1188026;

SELECT *
FROM death_ranking;

CREATE VIEW `Death_per_mill_rank` AS
	SELECT Country,
	DENSE_RANK() OVER(ORDER BY total_deaths_per_million DESC) AS Death_per_mill_rank,
	total_deaths_per_million
	FROM covid_lates_copy
	WHERE Country != continent;

SELECT *
FROM death_per_mill_rank;

CREATE VIEW `CONTINENT_DEATH_AND_CASE` AS
	SELECT continent,
	SUM(total_deaths) AS Continent_deaths,
    SUM(total_cases) AS Continent_cases
	FROM covid_lates_copy
	WHERE continent IS NOT NULL
	GROUP BY continent
	ORDER BY SUM(total_deaths) DESC
	;
SELECT *
FROM continent_death_and_case;

SELECT DISTINCT continent
FROM covid_lates_copy;

UPDATE covid_lates_copy
SET continent = NULL
WHERE Country = 'World' ;

UPDATE covid_lates_copy
SET continent = NULL
WHERE Country = 'Low-income countries';

UPDATE covid_lates_copy
SET continent = NULL
WHERE Country = 'Lower-middle-income countries' ;

UPDATE covid_lates_copy
SET continent = NULL
WHERE Country = 'Upper-middle-income countries';

UPDATE covid_lates_copy
SET continent = NULL
WHERE Country = 'High-income countries' ; 

CREATE VIEW `CONTINENT_CASES_PER_MILL` AS
	SELECT continent,
	SUM(total_cases) AS total_cases,
	ROUND((SUM(total_cases) / 1000000), 2) AS total_cases_per_mill
	FROM covid_lates_copy
	WHERE continent IS NOT NULL
	GROUP BY continent
	ORDER BY total_cases DESC;

CREATE VIEW `CARDIOVASCULAR_DEATH_RANK` AS
    SELECT Country,
	cardiovasc_death_rate,
	DENSE_RANK() OVER(ORDER BY cardiovasc_death_rate DESC) AS cardiovasc_death_rate_rank
	FROM covid_lates_copy;
SELECT *
FROM cardiovascular_death_rank;

CREATE VIEW `gdp_per_capita_rank` AS 
	SELECT Country,
	gdp_per_capita,
	DENSE_RANK() OVER(ORDER BY gdp_per_capita DESC) AS gdp_per_capita_rank
	FROM covid_lates_copy;


CREATE VIEW `population_density` AS
	SELECT continent,
	ROUND(SUM(population_density), 2 ) AS population_densitys
	FROM covid_lates_copy
	WHERE continent IS NOT NULL
	GROUP BY continent
	ORDER BY population_densitys DESC;

CREATE VIEW `male_female_smokers` AS
	SELECT continent,
	ROUND (SUM(female_smokers), 2 ) AS fem_smoke,
	ROUND(SUM(male_smokers), 2 )AS male_smoke
	FROM covid_lates_copy
	WHERE continent IS NOT NULL
	GROUP BY continent;
SELECT *
FROM population_density;
SELECT *
FROM male_female_smokers;
SELECT continent,
SUM(total_vaccinations)
FROM covid_lates_copy
GROUP BY continent;

SELECT *
FROM death_ranking;

