/*How does salary vary by experience level?*/
-- Calculate correlation
SELECT
	SUM((salary_in_usd - avg_salary) * (experience_level_value - avg_experience_level)) /
	(SQRT(SUM(POW(salary_in_usd - avg_salary, 2))) * SQRT(SUM(POW(experience_level_value - avg_experience_level, 2)))) AS CORRELATION
FROM (
   SELECT 
      salary_in_usd,
      job_title,
      CASE experience_level
         WHEN 'EN' THEN 1
         WHEN 'MI' THEN 2
         WHEN 'SE' THEN 3
         WHEN 'EX' THEN 4
         ELSE NULL
         END AS experience_level_value,
      (SELECT AVG(salary_in_usd) FROM salaries) AS avg_salary,
      (SELECT AVG(CASE experience_level
         WHEN 'EN' THEN 1
         WHEN 'MI' THEN 2
         WHEN 'SE' THEN 3
         WHEN 'EX' THEN 4
         ELSE NULL
         END)
      FROM 
         salaries) AS avg_experience_level
FROM 
   salaries) AS subquery
WHERE job_title LIKE '%Analyst%';

-- Average, Max, Min and Median
WITH ranked_salaries AS (
    SELECT
        experience_level,
        salary_in_usd,
        ROW_NUMBER() OVER (PARTITION BY experience_level ORDER BY salary_in_usd) AS row_num,
        COUNT(*) OVER (PARTITION BY experience_level) AS total_count
    FROM
        salaries
),
median_salaries AS (
    SELECT
        experience_level,
        AVG(salary_in_usd) AS median_salary
    FROM
        ranked_salaries
    WHERE
        row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2))
    GROUP BY
        experience_level
)
SELECT
    s.experience_level,
    AVG(s.salary_in_usd) AS avg_salary,
    MAX(s.salary_in_usd) AS max_salary,
    MIN(s.salary_in_usd) AS min_salary,
    m.median_salary
FROM
    salaries s
JOIN median_salaries m ON s.experience_level = m.experience_level
GROUP BY
    s.experience_level, m.median_salary
ORDER BY
    avg_salary ASC;

/* INSIGHTS
The correlation of 0.5011 indicates a moderate relationship between experience level and salary. As experience increases, there is a tendency for salary to increase as well, although the relationship is not perfectly linear.
There is a clear upward trend in salary as experience level increases, with executives earning almost double that of entry-level professionals, when comparing average salaries.
While the average salary increases, the salary ranges across all experience levels show significant variation, indicating some outliers or specialized roles that offer extremely high salaries even at lower experience levels.
The median salary is consistently below the average, suggesting that high outliers may be skewing the average upwards, particularly at the entry and mid-levels.

RESULTS:
[
	{
		"CORRELATION" : 0.5011122109625771
	}
]

[
	{
		"experience_level" : EN,
		"avg_salary" : 107621.7080,
		"max_salary" : 774000,
		"min_salary" : 15000,
		"median_salary" : 95000.0000
	},
	{
		"experience_level" : MI,
		"avg_salary" : 144332.2365,
		"max_salary" : 800000,
		"min_salary" : 15000,
		"median_salary" : 133000.0000
	},
	{
		"experience_level" : SE,
		"avg_salary" : 174488.6235,
		"max_salary" : 750000,
		"min_salary" : 15809,
		"median_salary" : 165000.0000
	},
	{
		"experience_level" : EX,
		"avg_salary" : 200983.7623,
		"max_salary" : 609000,
		"min_salary" : 15000,
		"median_salary" : 200000.0000
	}
]
*/

