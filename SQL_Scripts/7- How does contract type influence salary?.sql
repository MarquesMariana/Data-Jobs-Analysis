/*How does the contract type influence salary?*/
SELECT 
   employment_type,
  AVG( salary_in_usd),
  MAX(salary_in_usd),
  MIN(salary_in_usd)
FROM
   salaries
GROUP BY 
   employment_type
ORDER BY
   AVG(salary_in_usd) DESC;

/*INSIGHTS
As expected full time workers with fixed hour receive the highest salaries. Followed by contract workers (with flexible hours) that receive only 33% less in average.
Part-time workers receive half the amount of full-time workers.
Freelancers are the ones that receive the lest with an average salary of only 60651.

RESULTS
[
	{
		"employment_type" : FT,
		"AVG( salary_in_usd)" : 160733.7622,
		"MAX(salary_in_usd)" : 800000,
		"MIN(salary_in_usd)" : 15000
	},
	{
		"employment_type" : CT,
		"AVG( salary_in_usd)" : 107675.3279,
		"MAX(salary_in_usd)" : 416000,
		"MIN(salary_in_usd)" : 18000
	},
	{
		"employment_type" : PT,
		"AVG( salary_in_usd)" : 81407.1250,
		"MAX(salary_in_usd)" : 405000,
		"MIN(salary_in_usd)" : 15966
	},
	{
		"employment_type" : FL,
		"AVG( salary_in_usd)" : 50651.5625,
		"MAX(salary_in_usd)" : 100000,
		"MIN(salary_in_usd)" : 20000
	}
]
*/