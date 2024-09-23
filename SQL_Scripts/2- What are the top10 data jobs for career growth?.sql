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
	
   salary_growth_pct > 0
ORDER BY 
   salary_growth_pct DESC
LIMIT 10;


/*INSIGHTS 
The results show that roles more related to Data analysis have the highest growth when comparing average salary of entry levels and executive levels. 
Data Analyst roles lead with an impressive 1100% salary growth, followed by BI Data Analysts with 500%, and Research Analysts with 434.4%. 
Business Intelligence Analysts see a 318% increase, while Business Analysts experience 293% growth. 
The broader Analyst role also shows considerable growth at 253%. 
More specialized positions, like Data Governance Analysts and Quantitative Analysts, demonstrate salary growth of 134.4% and 126.8%, respectively. 
This results demonstrate the importance of these roles in a company but also demonstrates that this are roles that are easier to get for recent graduates, this implies a long learning curve in these roles, where professionals can significantly grow their expertise and compensation over time.
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

