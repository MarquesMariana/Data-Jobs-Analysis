/*What are the locations with higher salaries?
Due to the dataset lacking sufficient entries from each country, the salary data by country may not be reliable. 
Therefore, I conducted this analysis based on continent-level comparisons.*/

-- Create Table
CREATE TABLE continents (
    country VARCHAR(2) PRIMARY KEY,
    continent VARCHAR(20)
);
INSERT INTO continents (country, continent) VALUES
('US', 'North America'),
('CA', 'North America'),
('MX', 'North America'),
('BM', 'North America'),
('PR', 'North America'),
('HN', 'North America'),
('CR', 'North America'),
('DO', 'North America'),
('BR', 'South America'),
('AR', 'South America'),
('CO', 'South America'),
('VE', 'South America'),
('CL', 'South America'),
('EC', 'South America'),
('PE', 'South America'),
('BO', 'South America'),
('GB', 'Europe'),
('NL', 'Europe'),
('FR', 'Europe'),
('ES', 'Europe'),
('IT', 'Europe'),
('DE', 'Europe'),
('LT', 'Europe'),
('IE', 'Europe'),
('CZ', 'Europe'),
('PL', 'Europe'),
('BE', 'Europe'),
('FI', 'Europe'),
('CH', 'Europe'),
('SE', 'Europe'),
('AT', 'Europe'),
('MT', 'Europe'),
('PT', 'Europe'),
('CY', 'Europe'),
('BG', 'Europe'),
('GR', 'Europe'),
('RO', 'Europe'),
('SK', 'Europe'),
('UA', 'Europe'),
('LU', 'Europe'),
('RS', 'Europe'),
('DK', 'Europe'),
('LV', 'Europe'),
('BA', 'Europe'),
('EE', 'Europe'),
('HU', 'Europe'),
('SI', 'Europe'),
('HR', 'Europe'),
('GE', 'Europe'),
('JE', 'Europe'),
('AD', 'Europe'),
('IN', 'Asia'),
('PH', 'Asia'),
('TR', 'Asia'),
('IL', 'Asia'),
('KR', 'Asia'),
('VN', 'Asia'),
('AE', 'Asia'),
('SA', 'Asia'),
('OM', 'Asia'),
('LB', 'Asia'),
('PK', 'Asia'),
('TH', 'Asia'),
('RU', 'Asia'),
('SG', 'Asia'),
('IQ', 'Asia'),
('UZ', 'Asia'),
('HK', 'Asia'),
('IR', 'Asia'),
('CN', 'Asia'),
('MY', 'Asia'),
('JP', 'Asia'),
('EG', 'Africa'),
('ZA', 'Africa'),
('DZ', 'Africa'),
('KE', 'Africa'),
('NG', 'Africa'),
('UG', 'Africa'),
('GH', 'Africa'),
('TN', 'Africa'),
('CF', 'Africa'),
('MU', 'Africa'),
('AU', 'Oceania'),
('NZ', 'Oceania'),
('AS', 'Oceania'),
('GI', 'Europe'),
('MD', 'Europe'),
('KW', 'Asia'),
('BS', 'North America');

-- Analysis
SELECT 
   continents.continent,
   AVG(salary_in_usd) AS avg_salary
FROM 
   salaries 
JOIN
   continents
ON 
   salaries.company_location = continents.country
GROUP BY
   continents.continent
ORDER BY
   avg_salary DESC;

/*INSIGHTS
Lets compare the results with GDP per capita's rank:
1. North America
2. Oceania
3. Europe
4. South America
5. Asia
6. Africa
7. Antarctica

The average salary by continent largely mirrors the GDP per capita rankings, except for Africa, which shows a higher than expected average salary. 
This difference may be due to significant wealth disparities across the continent. Some regions or industries may experience higher salaries,including the tech industry.

RESULTS
[
	{
		"continent" : North America,
		"avg_salary" : 165039.5077
	},
	{
		"continent" : Oceania,
		"avg_salary" : 123808.2500
	},
	{
		"continent" : Europe,
		"avg_salary" : 92001.5471
	},
	{
		"continent" : Africa,
		"avg_salary" : 91351.4483
	},
	{
		"continent" : South America,
		"avg_salary" : 69848.6848
	},
	{
		"continent" : Asia,
		"avg_salary" : 64878.3017
	}
]
*/
