/*Employee residence influences salary?
Since the dataset doesn't have enough entries from each country, the salary data per country may not be accurate. 
Therefore, I compared only companies from the US with employees residing in different locations. 
While the salary figures may not be entirely accurate for each residence, the data is sufficient to conclude that salary varies based on employee residence.*/

SELECT 
   company_location,
   employee_residence,
   AVG(salary_in_usd)
FROM
   salaries
WHERE
   company_location = 'US'
GROUP BY
   employee_residence
ORDER BY
   AVG(salary_in_usd) DESC;
-- Continents
SELECT 
   continents.continent,
   AVG(salary_in_usd) AS avg_salary
FROM 
   salaries 
JOIN
   continents
ON 
   salaries.employee_residence = continents.country
GROUP BY
   continents.continent
ORDER BY
   avg_salary DESC;
   
/*INSIGHTS
The results show that even within the same company location (the US), significant salary variations exist based on the employee's residence. 
However, country-specific salary data should be treated cautiously due to potential inaccuracies. 
Thus, I analyzed average salaries by continent, which mirrored GDP per capita rankings, except for Africa, as shown in the previous analysis.

RESULTS
[
	{
		"company_location" : "US",
		"employee_residence" : MY,
		"AVG(salary_in_usd)" : 200000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : FR,
		"AVG(salary_in_usd)" : 186952.5000
	},
	{
		"company_location" : "US",
		"employee_residence" : HR,
		"AVG(salary_in_usd)" : 180000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : US,
		"AVG(salary_in_usd)" : 165963.3766
	},
	{
		"company_location" : "US",
		"employee_residence" : PR,
		"AVG(salary_in_usd)" : 160000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : TN,
		"AVG(salary_in_usd)" : 150000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : BE,
		"AVG(salary_in_usd)" : 132968.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : BR,
		"AVG(salary_in_usd)" : 130000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : CN,
		"AVG(salary_in_usd)" : 125404.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : ES,
		"AVG(salary_in_usd)" : 116338.6667
	},
	{
		"company_location" : "US",
		"employee_residence" : DE,
		"AVG(salary_in_usd)" : 108436.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : CL,
		"AVG(salary_in_usd)" : 105000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : PT,
		"AVG(salary_in_usd)" : 103000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : TR,
		"AVG(salary_in_usd)" : 100000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : CA,
		"AVG(salary_in_usd)" : 88333.3333
	},
	{
		"company_location" : "US",
		"employee_residence" : IN,
		"AVG(salary_in_usd)" : 84736.1250
	},
	{
		"company_location" : "US",
		"employee_residence" : BG,
		"AVG(salary_in_usd)" : 80000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : BO,
		"AVG(salary_in_usd)" : 75000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : EG,
		"AVG(salary_in_usd)" : 70000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : UZ,
		"AVG(salary_in_usd)" : 70000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : GR,
		"AVG(salary_in_usd)" : 68428.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : TH,
		"AVG(salary_in_usd)" : 60000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : GH,
		"AVG(salary_in_usd)" : 56000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : RU,
		"AVG(salary_in_usd)" : 54000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : GE,
		"AVG(salary_in_usd)" : 50000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : KW,
		"AVG(salary_in_usd)" : 50000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : AR,
		"AVG(salary_in_usd)" : 46000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : IT,
		"AVG(salary_in_usd)" : 45089.5000
	},
	{
		"company_location" : "US",
		"employee_residence" : PH,
		"AVG(salary_in_usd)" : 40380.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : VN,
		"AVG(salary_in_usd)" : 38400.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : HU,
		"AVG(salary_in_usd)" : 36259.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : UG,
		"AVG(salary_in_usd)" : 36000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : RO,
		"AVG(salary_in_usd)" : 26005.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : CR,
		"AVG(salary_in_usd)" : 20000.0000
	},
	{
		"company_location" : "US",
		"employee_residence" : NG,
		"AVG(salary_in_usd)" : 20000.0000
	}
]

[
	{
		"continent" : North America,
		"avg_salary" : 165149.0109
	},
	{
		"continent" : Oceania,
		"avg_salary" : 127518.5120
	},
	{
		"continent" : Europe,
		"avg_salary" : 92239.2357
	},
	{
		"continent" : Africa,
		"avg_salary" : 88032.3936
	},
	{
		"continent" : South America,
		"avg_salary" : 70255.6765
	},
	{
		"continent" : Asia,
		"avg_salary" : 64494.1517
	}
]
*/