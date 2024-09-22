
/*Top 10 Data jobs that are seeing the most growth in demand?*/
-- Data jobs:
WITH 
    -- 1: Count the jobs for each job_title in 2024
    jobs_2024 AS (
        SELECT 
            job_category,
            COUNT(*) AS count_2024,
            (SELECT COUNT(*) FROM salaries WHERE work_year = '2024') AS total_2024
        FROM salaries
        WHERE work_year = '2024'
        GROUP BY job_category
    ),
    -- 2: Count the jobs for each job_title in 2023
    jobs_2023 AS (
        SELECT 
            job_category,
            COUNT(*) AS count_2023,
            (SELECT COUNT(*) FROM salaries WHERE work_year = '2023') AS total_2023
        FROM salaries
        WHERE work_year = '2023'
        GROUP BY job_category
    )
-- 3: Calculate the growth for each job between 2024 and 2023
SELECT 
    s.job_category,
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
    jobs_2023 m ON s.job_category = m.job_category
ORDER BY growth_percentage DESC
LIMIT 10;


/*INSIGHTS 
The highest growth is seen in Consulting & Management and Robotics & Automation Engineering roles, as businesses seek innovation and competitive advantage in an evolving market.
In contrast, traditional roles such as Data Analyst and BI Analyst are experiencing a slow growth or even decline in demand, signaling a shift away from general data analysis toward more technical and specialized expertise.
RESULTS
-- DATA JOBS:
[
	{
		"job_category" : "Consulting & Management Roles",
		"growth_percentage" : 2360.51771156
	},
	{
		"job_category" : "Robotics & Automation Engineering",
		"growth_percentage" : 1299.43158092
	},
	{
		"job_category" : "Data & Software Engineering",
		"growth_percentage" : 371.82490530
	},
	{
		"job_category" : "Business Analysts",
		"growth_percentage" : 64.51441547
	},
	{
		"job_category" : "AI & Machine Learning Engineering",
		"growth_percentage" : 20.00795212
	},
	{
		"job_category" : "Engineer Manager",
		"growth_percentage" : 9.02766474
	},
	{
		"job_category" : "Data Management & Strategy",
		"growth_percentage" : 6.01728158
	},
	{
		"job_category" : "Data Analysts",
		"growth_percentage" : -11.08358113
	},
	{
		"job_category" : "AI Research & Science",
		"growth_percentage" : -17.36001138
	},
	{
		"job_category" : "General Data Role",
		"growth_percentage" : -31.53506382
	}
]

/*