/*How has salary evolved over time in different job roles?*/
WITH avg_2024 AS (
    SELECT 
        job_category,
        AVG(salary_in_usd) AS avg_salary_2024
    FROM salaries
    WHERE work_year = '2024'
    GROUP BY job_category
),
avg_2021 AS (
    SELECT 
        job_category,
        AVG(salary_in_usd) AS avg_salary_2021
    FROM salaries
    WHERE work_year = '2021'
    GROUP BY job_category
)
SELECT 
    a2024.job_category,
    ROUND((a2024.avg_salary_2024 - a2021.avg_salary_2021)/a2021.avg_salary_2021 *100, 2) AS salary_difference
FROM avg_2024 a2024
JOIN avg_2021 a2021
ON a2024.job_category = a2021.job_category
ORDER BY salary_difference DESC
LIMIT 10;

/*INSIGHTS 
From 2021 to 2024, the largest salary increases were observed in specialized AI and engineering roles.
Leading with 264.13% growth is Robotics and automations, as companies invest in innovation.
These roles are in high demand due to their expertise in cutting-edge technologies like image recognition and AI research, which are becoming essential across various industries.
In contrast, more general roles like Data Scientists (72.46%) and Data Analysts (40.47%) had slower salary growth. 
While still important, these positions are more common and less specialized, resulting in steadier demand and more moderate salary increases compared to the rapid rise in AI-focused fields. 

RESULTS
[
	{
		"job_category" : "Robotics & Automation Engineering",
		"salary_difference" : 264.13
	},
	{
		"job_category" : "Engineer Manager",
		"salary_difference" : 117.79
	},
	{
		"job_category" : "AI & Machine Learning Engineering",
		"salary_difference" : 87.09
	},
	{
		"job_category" : "AI Research & Science",
		"salary_difference" : 72.17
	},
	{
		"job_category" : "General Data Role",
		"salary_difference" : 53.11
	},
	{
		"job_category" : "Data & Software Engineering",
		"salary_difference" : 50.81
	},
	{
		"job_category" : "Data Analysts",
		"salary_difference" : 14.89
	}
]
*/ 
