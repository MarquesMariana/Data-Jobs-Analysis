/*How has salary evolved over time in different job roles?*/
WITH avg_2024 AS (
    SELECT 
        job_title,
        AVG(salary_in_usd) AS avg_salary_2024
    FROM salaries
    WHERE work_year = '2024'
    GROUP BY job_title
),
avg_2021 AS (
    SELECT 
        job_title,
        AVG(salary_in_usd) AS avg_salary_2021
    FROM salaries
    WHERE work_year = '2021'
    GROUP BY job_title
)
SELECT 
    a2024.job_title,
    ROUND((a2024.avg_salary_2024 - a2021.avg_salary_2021)/a2021.avg_salary_2021 *100, 2) AS salary_difference_
FROM avg_2024 a2024
JOIN avg_2021 a2021
ON a2024.job_title = a2021.job_title
ORDER BY salary_difference DESC
LIMIT 10;

/*INSIGHTS 
The most significant salary increases from 2021 to 2024 were seen in specialized AI roles, with Computer Vision Engineers leading with a 618.79% growth, followed by AI Scientists (394.26%). 
These roles are highly valued due to their niche expertise in cutting-edge technologies like image recognition and AI research, which are in high demand across industries.

In contrast, more general roles like Data Scientists (72.46%) and Data Analysts (40.47%) experienced slower salary growth. 
These positions, while still important, are more widespread and less specialized, leading to more stable demand and moderate salary increases compared to the rapid rise in AI-focused fields. 

RESULTS
[
	{
		"job_title" : "Computer Vision Engineer",
		"salary_difference" : 618.79
	},
	{
		"job_title" : "AI Scientist",
		"salary_difference" : 394.26
	},
	{
		"job_title" : "Machine Learning Research Engineer",
		"salary_difference" : 303.85
	},
	{
		"job_title" : "Machine Learning Developer",
		"salary_difference" : 182.14
	},
	{
		"job_title" : "Lead Data Scientist",
		"salary_difference" : 160.18
	},
	{
		"job_title" : "Research Scientist",
		"salary_difference" : 144.44
	},
	{
		"job_title" : "Machine Learning Engineer",
		"salary_difference" : 121.18
	},
	{
		"job_title" : "Data Scientist",
		"salary_difference" : 72.46
	},
	{
		"job_title" : "Data Engineer",
		"salary_difference" : 57.63
	},
	{
		"job_title" : "Data Analyst",
		"salary_difference" : 40.47
	}
]
*/ 
