/* What are the top 10 data jobs for career growth?*/
ALTER TABLE salaries
ADD COLUMN job_category VARCHAR(50);

-- Categories for job titles in the existing table
UPDATE salaries
SET job_category = CASE
    -- AI & Machine Learning Engineering
    WHEN job_title IN ('AI Developer', 'Machine Learning Platform Engineer', 'AI Software Engineer', 'AI Solution Architect', 
                       'AI Software Development Engineer', 'Lead AI Engineer', 'Applied AI ML Lead', 'MLOps Engineer', 
                       'Principal Machine Learning Engineer', 'Machine Learning Infrastructure Engineer', 'Machine Learning Quality Engineer', 
                       'Machine Learning Modeler', 'Machine Learning Architect', 'Lead Machine Learning Engineer', 'Machine Learning Manager', 
                       'AI Programmer', 'AI Specialist', 'Machine Learning Developer', 'AI Engineer', 
                       'Artificial Intelligence Engineer', 'AI Architect', 'Machine Learning Specialist', 'Deep Learning Engineer', 
                       'Machine Learning Software Engineer', 'Applied Machine Learning Scientist', 'Staff Machine Learning Engineer', 
                       'Deep Learning Researcher', 'Computer Vision Engineer', 'Computer Vision Software Engineer', 
                       'Machine Learning Research Engineer', 'Machine Learning Researcher', 'Machine Vision Engineer',
                       'Machine Learning Performance Engineer', 'Head of AI', 'Director of Machine Learning', 'AI Lead', 
                       'Lead AI Engineer', 'Lead Machine Learning Engineer', 'Principal Machine Learning Engineer', 
                       'AI Engineering Manager', 'Head of Machine Learning', 'Director of Business Intelligence')
    THEN 'AI & Machine Learning Engineering'

    -- AI Research & Science
    WHEN job_title IN ('AI Research Scientist', 'AI Researcher', 'Applied Scientist', 'Applied Research Scientist', 
                       'Research Scientist', 'Marketing Data Scientist', 'Data Scientist', 'AI Data Scientist', 
                       'Data Scientist Lead', 'AI Scientist', 'Applied Data Scientist', 'Principal Data Scientist', 
                       'Staff Data Scientist', 'Quantitative Analyst', 'Statistical Programmer', 'Quantitative Research Analyst', 
                       'Quantitative Researcher', 'Statistician', 'Principal Statistical Programmer')
    THEN 'AI Research & Science'


    -- Data & Software Engineering
    WHEN job_title IN ('Data Developer', 'Software Developer', 'Software Engineer', 'Full Stack Engineer', 
                       'Backend Engineer', 'Python Developer', 'Fullstack Engineer', 'ETL Engineer', 
                       'Software Data Engineer', 'BI Data Engineer', 'Marketing Data Engineer', 
                       'Data Analytics Engineer', 'Azure Data Engineer', 'Principal Data Engineer', 
                       'Lead Data Engineer', 'Prompt Engineer', 'NLP Engineer', 'Solutions Architect', 
                       'Engineer', 'Data Lead', 'Data Specialist', 'BI Developer', 
                       'Data Operations Engineer', 'QA Engineer', 'Data Infrastructure Engineer', 
                       'Business Intelligence Engineer', 'DataOps Engineer', 'Big Data Engineer', 
                       'Data DevOps Engineer', 'Big Data Developer', 'Cloud Data Engineer', 
                       'Frontend Engineer', 'Power BI Architect', 'Data Visualization Developer', 
                       'Power BI Developer', 'Technical Specialist', 'SAS Developer', 
                       'Data Integration Analyst', 'Data Analytics Developer', 'Data Analytics Specialist', 
                       'Data Analytics Lead', 'Data Analytics Associate', 'Cloud Data Architect', 
                       'Principal Data Architect', 'Analytics Engineering Manager', 'AWS Data Architect')
    THEN 'Data & Software Engineering'

    -- Platform & Infrastructure Engineering
    WHEN job_title IN ('Platform Engineer', 'Site Reliability Engineer', 'DevOps Engineer', 'Infrastructure Engineer', 
                       'Systems Engineer', 'Cloud Engineer', 'Solutions Engineer', 'Technical Lead', 
                       'Cloud Database Administrator', 'Elasticsearch Administrator', 'AWS Data Architect', 
                       'Cloud Data Architect')
    THEN 'Platform & Infrastructure Engineering'

    -- Robotics & Automation Engineering
    WHEN job_title IN ('Robotics Engineer', 'Robotics Software Engineer', 'Autonomous Vehicle Technician')
    THEN 'Robotics & Automation Engineering'

    -- Security & Governance Engineering
    WHEN job_title IN ('Security Engineer', 'Data Governance Engineer', 'Data Governance Lead', 
                       'Data Governance Manager', 'Data Governance Analyst', 'Data Governance Specialist')
    THEN 'Security & Governance Engineering'

    -- Data Integration & Quality
    WHEN job_title IN ('Analytics Engineer', 'Data Quality Engineer', 'Data Integration Developer', 
                       'Data Integration Specialist', 'Data Integration Coordinator', 'Data Quality Specialist', 
                       'Data Quality Lead', 'Data Quality Manager', 'Data Integration Analyst')
    THEN 'Data Integration & Quality'

    -- Data Analysts
    WHEN job_title IN ('Data Analyst Lead', 'Admin & Data Analyst', 'Financial Data Analyst', 
                       'Staff Data Analyst', 'Sales Data Analyst', 'Principal Data Analyst', 
                       'Business Intelligence Data Analyst', 'Pricing Analyst', 'Actuarial Analyst', 
                       'Data Visualization Specialist', 'Data Visualization Engineer', 'Data Operations Analyst', 
                       'Insight Analyst', 'Data Operations Associate', 'Analytics Lead', 
                       'People Data Analyst', 'Data Integrity Analyst', 'Data Analytics Team Lead', 
                       'Data Product Analyst', 'Marketing Data Analyst', 'Business Data Analyst', 
                       'Finance Data Analyst', 'Compliance Data Analyst', 'CRM Data Analyst', 
                       'BI Data Analyst', 'Applied Data Scientist', 'Data Reporting Analyst',
                       'Data Visualization Analyst')  -- Merged with the above category
    THEN 'Data Analysts'

    -- Business Analysts
    WHEN job_title IN ('Business Analyst', 'Product Analyst', 'Research Analyst', 'Marketing Analyst', 
                       'Business Intelligence', 'Business Intelligence Analyst', 'Data Analytics Consultant')
    THEN 'Business Analysts'

    -- Quantitative & Statistical Analysis
    WHEN job_title IN ('Quantitative Research Analyst', 'Quantitative Researcher', 'Statistician', 
                       'Principal Statistical Programmer', 'Statistical Programmer')
    THEN 'Quantitative & Statistical Analysis'

    -- Consulting & Management Roles
    WHEN job_title IN ('Consultant Data Engineer', 'Business Intelligence Consultant', 'Data Management Consultant', 
                       'AI Product Manager', 'Product Manager', 'Associate', 'Data Strategy Lead', 
                       'Data Operations Manager', 'Consultant', 'Data Management Manager', 
                       'Data Product Manager', 'Manager')
    THEN 'Consulting & Management Roles'

    -- Data Management & Strategy
    WHEN job_title IN ('Data Strategist', 'Manager Data Management', 'Data Team Lead', 'Data Product Owner', 
                       'Head of Business Intelligence', 'Master Data Management', 'Data Management Specialist', 
                       'Data Management Associate', 'Data Management Manager', 'Master Data Specialist', 
                       'Data Management Lead', 'Data Strategy Manager')
    THEN 'Data Management & Strategy'

    -- Business Intelligence Leadership
    WHEN job_title IN ('Business Intelligence Lead', 'Head of Business Intelligence', 'Director of Business Intelligence')
    THEN 'Business Intelligence Leadership'

    -- Engineer Manager
    WHEN job_title IN ('Engineering Manager', 'Research Engineer', 'Data Pipeline Engineer', 'Lead Data Scientist', 
                       'Data Analytics Manager', 'Data Operations Manager', 'Data Governance Manager', 
                       'Data Analytics Team Lead', 'Data Analytics Lead', 'AI Engineering Manager', 
                       'Lead Data Analyst')
    THEN 'Engineer Manager'

    -- Data Quality & Compliance
    WHEN job_title IN ('Data Quality Analyst', 'Data Quality Specialist', 'Data Quality Lead', 'Data Quality Manager', 
                       'Compliance Data Analyst')
    THEN 'Data Quality & Compliance'

    -- New Categories
    WHEN job_title IN ('AI Product Owner', 'AI Data Scientist', 'AI Scientist', 'Machine Learning Performance Engineer', 
                       'Machine Learning Model Engineer', 'Deep Learning Engineer', 'Machine Learning Research Engineer', 
                       'Data Scientist Lead', 'Data Analytics Developer', 'Technical Specialist', 'Marketing Analytics Manager', 
                       'Data Analytics Specialist', 'Data Management Associate', 'Data Operations Specialist', 
                       'Data Analytics Team Lead', 'Data Integration Analyst', 'Lead Data Analyst', 
                       'Business Data Analyst', 'Data Visualization Analyst', 'Data Analytics Manager')
    THEN 'AI & Machine Learning Engineering'  -- Adjusted for clarity and to fit existing categories

    -- If no match, set to 'General Data Role'
    ELSE 'General Data Role'
END;


WITH salary_growth AS (
   SELECT 
      job_category,
      MAX(CASE WHEN experience_level = 'EX' THEN salary_in_usd END) AS max_salary,
      MIN(CASE WHEN experience_level = 'EN' THEN salary_in_usd END) AS min_salary
   FROM 
      salaries
   GROUP BY 
      job_category
),
calculated_growth AS (
   SELECT 
      job_category,
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
   job_category,
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
Data & Software Engineering: Leading the growth charts, this category has witnessed an extraordinary salary increase of 3652.77%. This surge underscores the explosive demand for advanced technical skills and the increasing complexity of data systems and software engineering.
General Data Roles: Although broader in scope, general data roles have also experienced a significant salary growth of 3409.33%. This category reflects the rising importance of data-centric roles across various industries, driving substantial financial rewards for expertise in data analysis and management.
AI & Machine Learning Engineering: With a salary growth of 2886.67%, AI and machine learning roles highlight the premium placed on cutting-edge technologies and the need for professionals who can develop and implement sophisticated AI solutions.
AI Research & Science: This field shows a robust salary growth of 2500%, reflecting the crucial role of AI research in advancing technology and its application across diverse sectors.

RESULTS:
[
	{
		"job_category" : "Data & Software Engineering",
		"max_salary" : 609000,
		"min_salary" : 16228,
		"salary_growth_pct" : 3652.7730
	},
	{
		"job_category" : "General Data Role",
		"max_salary" : 526400,
		"min_salary" : 15000,
		"salary_growth_pct" : 3409.3333
	},
	{
		"job_category" : "AI & Machine Learning Engineering",
		"max_salary" : 448000,
		"min_salary" : 15000,
		"salary_growth_pct" : 2886.6667
	},
	{
		"job_category" : "AI Research & Science",
		"max_salary" : 416000,
		"min_salary" : 16000,
		"salary_growth_pct" : 2500.0000
	},
	{
		"job_category" : "Engineer Manager",
		"max_salary" : 196000,
		"min_salary" : 16455,
		"salary_growth_pct" : 1091.1273
	},
	{
		"job_category" : "Data Integration & Quality",
		"max_salary" : 282000,
		"min_salary" : 23753,
		"salary_growth_pct" : 1087.2185
	},
	{
		"job_category" : "Business Analysts",
		"max_salary" : 320000,
		"min_salary" : 36266,
		"salary_growth_pct" : 782.3692
	},
	{
		"job_category" : "Data Analysts",
		"max_salary" : 150000,
		"min_salary" : 18000,
		"salary_growth_pct" : 733.3333
	},
	{
		"job_category" : "Platform & Infrastructure Engineering",
		"max_salary" : 340000,
		"min_salary" : 42866,
		"salary_growth_pct" : 693.1694
	},
	{
		"job_category" : "Consulting & Management Roles",
		"max_salary" : 180000,
		"min_salary" : 40000,
		"salary_growth_pct" : 350.0000
	}
]
*/

