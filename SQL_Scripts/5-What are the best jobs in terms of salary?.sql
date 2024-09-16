/*What are the best data jobs in terms of salary?
To better analyze salary trends, I categorized data jobs into specific groups, allowing for clearer insights into which types of roles offer the highest pay. 
This approach highlights salary variations based on job specialization and industry demand, regardless of the hierarchy of positions within the same category.*/

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