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


-- continent

SELECT continent
FROM covid_lates_copy
WHERE continent = ''; -- 12 BLANKS

UPDATE covid_lates_copy
SET continent = 0.00
WHERE continent = '';

ALTER TABLE covid_lates_copy
MODIFY COLUMN `continent` DOUBLE;


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

