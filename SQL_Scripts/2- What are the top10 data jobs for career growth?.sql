/* What are the top 10 data jobs for career growth?*/
WITH salary_growth AS (
   SELECT 
      job_title,
      MAX(CASE WHEN experience_level = 'EX' THEN salary_in_usd END) AS max_salary,
      MIN(CASE WHEN experience_level = 'EN' THEN salary_in_usd END) AS min_salary
   FROM 
      salaries
   GROUP BY 
      job_title
),
calculated_growth AS (
   SELECT 
      job_title,
      max_salary,
      min_salary,
      (max_salary - min_salary) / min_salary * 100 AS salary_growth_pct
   FROM 
      salary_growth
   WHERE 
      min_salary IS NOT NULL
      AND max_salary IS NOT NULL
)
SELECT 
   job_title,
   max_salary,
   min_salary,
   salary_growth_pct
FROM 
   calculated_growth
WHERE 
   job_title LIKE '%Analyst%'
   AND salary_growth_pct > 0
ORDER BY 
   salary_growth_pct DESC
LIMIT 10;


/*INSIGHTS 
Data Analysts lead with an impressive 1100% growth, likely driven by strong demand and their versatility across various industries. 
BI Data Analysts and Research Analysts follow with 500% and 434.44% growth, respectively, probrably reflecting the rising value of business intelligence and research insights.
Specialized positions like Quantitative Analysts offer high salaries (up to $200,000) but exhibit stable growth rates (around 126.76% to 317.98%).

RESULTS:
[
	{
		"job_title" : "Data Analyst",
		"max_salary" : 180000,
		"min_salary" : 15000,
		"salary_growth_pct" : 1100.0000
	},
	{
		"job_title" : "BI Data Analyst",
		"max_salary" : 150000,
		"min_salary" : 25000,
		"salary_growth_pct" : 500.0000
	},
	{
		"job_title" : "Research Analyst",
		"max_salary" : 209500,
		"min_salary" : 39200,
		"salary_growth_pct" : 434.4388
	},
	{
		"job_title" : "Business Intelligence Analyst",
		"max_salary" : 180000,
		"min_salary" : 43064,
		"salary_growth_pct" : 317.9825
	},
	{
		"job_title" : "Business Analyst",
		"max_salary" : 142500,
		"min_salary" : 36266,
		"salary_growth_pct" : 292.9300
	},
	{
		"job_title" : "Analyst",
		"max_salary" : 132500,
		"min_salary" : 37500,
		"salary_growth_pct" : 253.3333
	},
	{
		"job_title" : "Data Governance Analyst",
		"max_salary" : 150000,
		"min_salary" : 64000,
		"salary_growth_pct" : 134.3750
	},
	{
		"job_title" : "Quantitative Analyst",
		"max_salary" : 200000,
		"min_salary" : 88200,
		"salary_growth_pct" : 126.7574
	}
]
*/

