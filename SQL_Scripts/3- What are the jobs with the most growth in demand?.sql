
/*Top 10 Data jobs that are seeing the most growth in demand?*/
-- Data jobs:
WITH 
    -- 1: Count the jobs for each job_title in 2024
    jobs_2024 AS (
        SELECT 
            job_title,
            COUNT(*) AS count_2024,
            (SELECT COUNT(*) FROM salaries WHERE work_year = '2024') AS total_2024
        FROM salaries
        WHERE work_year = '2024'
        GROUP BY job_title
    ),
    -- 2: Count the jobs for each job_title in 2023
    jobs_2023 AS (
        SELECT 
            job_title,
            COUNT(*) AS count_2023,
            (SELECT COUNT(*) FROM salaries WHERE work_year = '2023') AS total_2023
        FROM salaries
        WHERE work_year = '2023'
        GROUP BY job_title
    )
-- 3: Calculate the growth for each job between 2024 and 2023
SELECT 
    s.job_title,
    CASE 
        WHEN m.count_2023 = 0 OR m.total_2023 = 0 THEN NULL
        ELSE (
            ((s.count_2024 / s.total_2024) - (m.count_2023 / m.total_2023)) 
            / (m.count_2023 / m.total_2023)
        ) * 100
    END AS growth_percentage
FROM 
    jobs_2024 s
JOIN 
    jobs_2023 m ON s.job_title = m.job_title
ORDER BY growth_percentage DESC
LIMIT 10;

-- Analyst jobs:
WITH 
    -- 1: Count the jobs for each job_title in 2024
    jobs_2024 AS (
        SELECT 
            job_title,
            COUNT(*) AS count_2024,
            (SELECT COUNT(*) FROM salaries WHERE work_year = '2024') AS total_2024
        FROM salaries
        WHERE work_year = '2024'
        GROUP BY job_title
    ),
    -- 2: Count the jobs for each job_title in 2023
    jobs_2023 AS (
        SELECT 
            job_title,
            COUNT(*) AS count_2023,
            (SELECT COUNT(*) FROM salaries WHERE work_year = '2023') AS total_2023
        FROM salaries
        WHERE work_year = '2023'
        GROUP BY job_title
    )
-- 3: Calculate the growth for each job between 2024 and 2023
SELECT 
    s.job_title,
    CASE 
        WHEN m.count_2023 = 0 OR m.total_2023 = 0 THEN NULL
        ELSE (
            ((s.count_2024 / s.total_2024) - (m.count_2023 / m.total_2023)) 
            / (m.count_2023 / m.total_2023)
        ) * 100
    END AS growth_percentage
FROM 
    jobs_2024 s
JOIN 
    jobs_2023 m ON s.job_title = m.job_title
WHERE s.job_title LIKE '%Analyst%'
ORDER BY growth_percentage DESC
LIMIT 10;


/*INSIGHTS 
The data shows a clear increase in demand for AI, machine learning and specialized data management roles.
AI Product Manager stands out with the highest growth rate of 366.48%, reflecting the increasing integration of AI technologies into products and services. 
Traditional roles, such as Data Analyst (-33.76%) and BI Analyst (-42.41%), are seeing a decline in demand. 
This shift suggests that companies are moving away from general data analysis toward more specialized roles that offer deeper expertise in machine learning, AI, and data infrastructure.
Overall, the most in-demand roles are those that combine technical skills with a strategic understanding of AI and data management, while more traditional data analyst positions are seeing less demand as businesses seek specialized knowledge to stay competitive in a rapidly evolving market.

RESULTS
-- DATA JOBS:
[
	{
		"job_title" : "AI Product Manager",
		"growth_percentage" : 366.47690957
	},
	{
		"job_title" : "Data Management Analyst",
		"growth_percentage" : 262.81486153
	},
	{
		"job_title" : "Machine Learning Researcher",
		"growth_percentage" : 236.89941198
	},
	{
		"job_title" : "Data Analytics Specialist",
		"growth_percentage" : 210.98489045
	},
	{
		"job_title" : "Data Visualization Analyst",
		"growth_percentage" : 198.02715117
	},
	{
		"job_title" : "Data Analytics Lead",
		"growth_percentage" : 174.70292271
	},
	{
		"job_title" : "Data Integration Engineer",
		"growth_percentage" : 172.11109288
	},
	{
		"job_title" : "Machine Learning Manager",
		"growth_percentage" : 159.15393334
	},
	{
		"job_title" : "Data Management Specialist",
		"growth_percentage" : 133.23817092
	},
	{
		"job_title" : "Data Product Owner",
		"growth_percentage" : 120.28045925
	}
]

--ANALYST JOBS:
[
	{
		"job_title" : "Data Management Analyst",
		"growth_percentage" : 262.81486153
	},
	{
		"job_title" : "Data Visualization Analyst",
		"growth_percentage" : 198.02715117
	},
	{
		"job_title" : "Data Operations Analyst",
		"growth_percentage" : 46.85353521
	},
	{
		"job_title" : "Business Intelligence Analyst",
		"growth_percentage" : -3.98035308
	},
	{
		"job_title" : "Insight Analyst",
		"growth_percentage" : -6.70477138
	},
	{
		"job_title" : "Research Analyst",
		"growth_percentage" : -11.79691623
	},
	{
		"job_title" : "Admin & Data Analyst",
		"growth_percentage" : -22.25441654
	},
	{
		"job_title" : "Data Analyst",
		"growth_percentage" : -33.75826543
	},
	{
		"job_title" : "BI Analyst",
		"growth_percentage" : -42.41036907
	},
	{
		"job_title" : "Data Quality Analyst",
		"growth_percentage" : -52.05661508
	}
]

/*