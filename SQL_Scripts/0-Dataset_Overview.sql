/*General calculations to understand the Dataset*/

SELECT 
   remote_ratio, 
   COUNT(*) * 100.0 / (SELECT COUNT(*) FROM salaries) AS remote_ratio_percentage
FROM 
   salaries
GROUP BY 
   remote_ratio;

SELECT 
  company_location, 
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM salaries) AS country_percentage
FROM 
   salaries
GROUP BY 
   company_location;

SELECT 
   employee_residence,
   COUNT(*) * 100.0 / (SELECT COUNT(*) FROM salaries) AS employee_residence_percentage
FROM 
   salaries
GROUP BY 
   employee_residence
ORDER BY 
   employee_residence_percentage DESC;
