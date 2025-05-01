-- data cleaning
 select *
 FROM layoffs;

-- 1. remove duplicate data
-- 2. standarize the data (like spelling etc.)
-- 3. check null or blank values and see if you can fill it in or not
-- 4. remove unessasry columns or rows

CREATE TABLE layoffs_staging -- to make a copy just in case of a mistake being made
LIKE layoffs;

select *
FROM layoffs_staging;

INSERT layoffs_staging
select *
FROM layoffs;

select *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off,percentage_laid_off, `date`) as row_num
FROM layoffs_staging;

WITH dupe_cte as
(
	select *,
	ROW_NUMBER() OVER(PARTITION BY
    company, location, industry,total_laid_off, percentage_laid_off
    , `date`, stage, country, funds_raised_millions) as row_num
	FROM layoffs_staging
)
select *
FROM dupe_cte
WHERE row_num > 1;

select *
FROM layoffs_staging
WHERE company = 'casper'
;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
select *,
	ROW_NUMBER() OVER(PARTITION BY
    company, location, industry,total_laid_off, percentage_laid_off
    , `date`, stage, country, funds_raised_millions) as row_num
	FROM layoffs_staging;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

select *
FROM layoffs_staging2
;

-- standerizing the data
select company
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

select *
FROM layoffs_staging2
;

select *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

select DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1
;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);

select `date`, 
str_to_date(`date`, '%m/%d/%Y')
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

select *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

select *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

select t1.company, t2.company, t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL OR t1.industry = ''
AND t2.industry IS NOT NULL
;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

select t1.company, t2.company, t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL
;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL
;

select *
FROM layoffs_staging2
ORDER BY 1;

select *
FROM layoffs_staging2
;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;