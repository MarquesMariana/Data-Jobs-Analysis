/*How does remote work influence salary?*/
SELECT 
SUM((salary_in_usd - avg_salary) * (remote_ratio - avg_remote_ratio)) /
(SQRT(SUM(POW(salary_in_usd - avg_salary, 2))) * SQRT(SUM(POW(remote_ratio - avg_remote_ratio, 2)))) AS CORRELATION
FROM (
	SELECT 
		salary_in_usd, 
        remote_ratio,
        job_title,
        (SELECT(AVG(salary_in_usd)) FROM salaries) AS avg_salary,
        (SELECT(AVG(remote_ratio)) FROM salaries) AS avg_remote_ratio
	FROM 
		salaries) AS subquery;

SELECT 
   remote_ratio,
   AVG(salary_in_usd),
   MAX(salary_in_usd),
   MIN(salary_in_usd)
FROM
   salaries
GROUP BY
   remote_ratio
ORDER BY
   AVG(salary_in_usd) DESC;
   
/*INSIGHTS
The correlation of -0.088 between remote work and salary indicates an insignificant relationship between these two factors. 
While the correlation is slightly negative, it suggests that as the percentage of remote work increases, salaries slightly decrease but not in a meaningful way.

On-site jobs tend to offer the highest average salary, with the average salary at $164,283.23.
Remote jobs offer an average salary that is 8.88% lower than on-site jobs, at $149,680.95. 
However, the maximum salary for remote jobs is slightly higher than for on-site jobs, suggesting that remote work might still offer competitive high-end salaries.
Hybrid jobs appear to offer the lowest salaries, with an average salary of $81,816.83, which is roughly half of the average salary for on-site jobs.
The minimum salaries across all job types (on-site, remote, and hybrid) are the same across all remote_ratios.


RESULTS
[
	{
		"CORRELATION" : -0.08805810225624801
	}
]

[
	{
		"remote_ratio" : 0,
		"AVG(salary_in_usd)" : 164283.2276,
		"MAX(salary_in_usd)" : 774000,
		"MIN(salary_in_usd)" : 15000
	},
	{
		"remote_ratio" : 100,
		"AVG(salary_in_usd)" : 149680.9493,
		"MAX(salary_in_usd)" : 800000,
		"MIN(salary_in_usd)" : 15000
	},
	{
		"remote_ratio" : 50,
		"AVG(salary_in_usd)" : 81816.8314,
		"MAX(salary_in_usd)" : 423000,
		"MIN(salary_in_usd)" : 15129
	}
]
*/
