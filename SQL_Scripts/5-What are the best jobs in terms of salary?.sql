/*What are the best data jobs in terms of salary?
To better analyze salary trends, I categorized data jobs into specific groups, allowing for clearer insights into which types of roles offer the highest pay. 
This approach highlights salary variations based on job specialization and industry demand, regardless of the hierarchy of positions within the same category.*/
-- Salary by category 
SELECT
   job_category,
   AVG(salary_in_usd)
FROM
   salaries
GROUP BY
   job_category
ORDER BY
   AVG(salary_in_usd) DESC;


/*INSIGHTS 
Engineering and management roles offer the higher compensations likely due to their ongoing importance and the combination of technical and leadership skills required. 
Secondly, AI and machine learning roles offer significant financial rewards due to their specialized nature and increasing demand. 
In contrast, more general data roles like Data and Business analysts, while essential, have lower salary levels, likely reflecting a broader skill set with less specialization.

RESULTS
[
	{
		"job_category" : Engineer Manager,
		"AVG(salary_in_usd)" : 209566.8238
	},
	{
		"job_category" : Data & Software Engineering,
		"AVG(salary_in_usd)" : 175767.5470
	},
	{
		"job_category" : Platform & Infrastructure Engineering,
		"AVG(salary_in_usd)" : 169478.9000
	},
	{
		"job_category" : AI Research & Science,
		"AVG(salary_in_usd)" : 169094.2698
	},
	{
		"job_category" : AI & Machine Learning Engineering,
		"AVG(salary_in_usd)" : 167481.8968
	},
	{
		"job_category" : Robotics & Automation Engineering,
		"AVG(salary_in_usd)" : 162911.6250
	},
	{
		"job_category" : Consulting & Management Roles,
		"AVG(salary_in_usd)" : 162315.9959
	},
	{
		"job_category" : Security & Governance Engineering,
		"AVG(salary_in_usd)" : 157400.9040
	},
	{
		"job_category" : Data Integration & Quality,
		"AVG(salary_in_usd)" : 154079.1712
	},
	{
		"job_category" : General Data Role,
		"AVG(salary_in_usd)" : 150078.7180
	},
	{
		"job_category" : Business Intelligence Leadership,
		"AVG(salary_in_usd)" : 130153.9583
	},
	{
		"job_category" : Business Analysts,
		"AVG(salary_in_usd)" : 124830.6076
	},
	{
		"job_category" : Data Management & Strategy,
		"AVG(salary_in_usd)" : 115489.7544
	},
	{
		"job_category" : Data Quality & Compliance,
		"AVG(salary_in_usd)" : 99625.1579
	},
	{
		"job_category" : Data Analysts,
		"AVG(salary_in_usd)" : 94054.1797
	}
]
*/ 