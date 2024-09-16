/*How does salary vary by company size?*/ 
-- Correlation
WITH 
   avg_salary AS (
       SELECT AVG(salary_in_usd) AS avg_salary
       FROM salaries
   ),
   avg_company_size AS (
       SELECT AVG(CASE company_size
           WHEN 'S' THEN 1
           WHEN 'M' THEN 2
           WHEN 'L' THEN 3
           ELSE NULL
       END) AS avg_company_size
       FROM salaries
   ),
   company_size_value AS (
       SELECT CASE company_size
           WHEN 'S' THEN 1
           WHEN 'M' THEN 2
           WHEN 'L' THEN 3
           ELSE NULL
       END AS company_size_value,
       salary_in_usd
       FROM salaries
   )

SELECT 
   SUM((cs.salary_in_usd - as1.avg_salary) * (cs.company_size_value - acs.avg_company_size)) /
   (SQRT(SUM(POW(cs.salary_in_usd - as1.avg_salary, 2))) * SQRT(SUM(POW(cs.company_size_value - acs.avg_company_size, 2)))) AS correlation
FROM
   company_size_value cs,
   avg_salary as1,
   avg_company_size acs;

-- Salaries
SELECT 
	company_size, 
	AVG(salary_in_usd), 
	MIN(salary_in_usd), 
	MAX(salary_in_usd)
FROM 
	salaries 
GROUP BY 
	company_size
ORDER BY 
	AVG(salary_in_usd) DESC;

/*INSIGHTS 
The correlation of -0.00487 indicates a negligible negative relationship between company size and salary. 
This means salary levels do not significantly change with company size, although there is a slight tendency for salary to decrease as company size increases.
Medium-sized companies tend to offer higher salaries, reflecting a greater appreciation for their employees compared to large companies. 
Small companies generally offer the lowest salaries, likely due to limited financial resources.

RESULTS
[
	{
		"correlation" : -0.004874023590167252
	}
]

[
	{
		"company_size" : M,
		"AVG(salary_in_usd)" : 161277.1001,
		"MIN(salary_in_usd)" : 15000,
		"MAX(salary_in_usd)" : 800000
	},
	{
		"company_size" : L,
		"AVG(salary_in_usd)" : 149287.9905,
		"MIN(salary_in_usd)" : 15000,
		"MAX(salary_in_usd)" : 423000
	},
	{
		"company_size" : S,
		"AVG(salary_in_usd)" : 87896.8060,
		"MIN(salary_in_usd)" : 15809,
		"MAX(salary_in_usd)" : 416000
	}
]
*/