/*Cost of living influences salary?*/
-- Create Tables
CREATE TABLE ISO_Code (
   Name VARCHAR(255),  
   Code VARCHAR(10)     
);

INSERT INTO ISO_Code (Name, Code)
VALUES
('United States', 'US'),
('United Kingdom', 'GB'),
('Netherlands', 'NL'),
('France', 'FR'),
('Canada', 'CA'),
('Australia', 'AU'),
('Spain', 'ES'),
('India', 'IN'),
('Italy', 'IT'),
('Egypt', 'EG'),
('Germany', 'DE'),
('Lithuania', 'LT'),
('Ireland', 'IE'),
('Czech Republic', 'CZ'),
('Poland', 'PL'),
('Belgium', 'BE'),
('Finland', 'FI'),
('Switzerland', 'CH'),
('Sweden', 'SE'),
('Austria', 'AT'),
('Armenia', 'AM'),
('Malta', 'MT'),
('Portugal', 'PT'),
('Colombia', 'CO'),
('New Zealand', 'NZ'),
('Mexico', 'MX'),
('Brazil', 'BR'),
('Argentina', 'AR'),
('South Africa', 'ZA'),
('Cyprus', 'CY'),
('Philippines', 'PH'),
('Chile', 'CL'),
('Bulgaria', 'BG'),
('Greece', 'GR'),
('Turkey', 'TR'),
('Israel', 'IL'),
('Romania', 'RO'),
('Venezuela', 'VE'),
('South Korea', 'KR'),
('Slovakia', 'SK'),
('Ukraine', 'UA'),
('Bermuda', 'BM'),
('Vietnam', 'VN'),
('Luxembourg', 'LU'),
('Kenya', 'KE'),
('Serbia', 'RS'),
('Denmark', 'DK'),
('Latvia', 'LV'),
('Georgia', 'GE'),
('Croatia', 'HR'),
('United Arab Emirates', 'AE'),
('Saudi Arabia', 'SA'),
('Oman', 'OM'),
('Bosnia and Herzegovina', 'BA'),
('Estonia', 'EE'),
('Lebanon', 'LB'),
('Hungary', 'HU'),
('Nigeria', 'NG'),
('Pakistan', 'PK'),
('Uganda', 'UG'),
('Slovenia', 'SI'),
('Mauritius', 'MU'),
('Thailand', 'TH'),
('Qatar', 'QA'),
('Russia', 'RU'),
('Tunisia', 'TN'),
('Ghana', 'GH'),
('Andorra', 'AD'),
('Ecuador', 'EC'),
('Peru', 'PE'),
('Moldova', 'MD'),
('Norway', 'NO'),
('Uzbekistan', 'UZ'),
('Japan', 'JP'),
('Hong Kong', 'HK'),
('Central African Republic', 'CF'),
('Singapore', 'SG'),
('Kuwait', 'KW'),
('Iran', 'IR'),
('American Samoa', 'AS'),
('China', 'CN'),
('Costa Rica', 'CR'),
('Puerto Rico', 'PR'),
('Bolivia', 'BO'),
('Dominican Republic', 'DO'),
('Indonesia', 'ID'),
('Malaysia', 'MY'),
('Honduras', 'HN'),
('Algeria', 'DZ'),
('Iraq', 'IQ'),
('Jersey', 'JE');

CREATE TABLE Cost(
   Country VARCHAR(255),
   Cost INT
);-- Imported table using Data Table import Wizard

-- Company Location
SELECT 
   salaries.company_location,
   AVG(salaries.salary_in_usd) AS avg_salary,
   Cost.Cost
FROM salaries
JOIN ISO_code
ON salaries.company_location = ISO_code.code 
JOIN Cost
ON ISO_code.name = Cost.Country
GROUP BY
   salaries.company_location
ORDER BY
	Cost.Cost DESC,
   avg_salary DESC;

WITH avg_values AS (
   SELECT 
       (SELECT AVG(Cost.Cost) FROM Cost) AS avg_cost,
       (SELECT AVG(salary_in_usd) FROM salaries) AS avg_salary
)
SELECT
    SUM((salaries.salary_in_usd - avg_values.avg_salary) * (Cost.Cost - avg_values.avg_cost)) /
    (SQRT(SUM(POW(salaries.salary_in_usd - avg_values.avg_salary, 2))) * 
    SQRT(SUM(POW(Cost.Cost - avg_values.avg_cost, 2)))) AS CORRELATION
FROM salaries
JOIN ISO_code ON salaries.company_location = ISO_code.code  
JOIN Cost ON ISO_code.name = Cost.Country,
avg_values;

-- Employee Residence
SELECT 
   salaries.employee_residence,
   AVG(salaries.salary_in_usd) AS avg_salary,
   Cost.Cost
FROM salaries
JOIN ISO_code
ON salaries.employee_residence = ISO_code.code 
JOIN Cost
ON ISO_code.name = Cost.Country
GROUP BY
   salaries.employee_residence
ORDER BY
	Cost.Cost DESC,
   avg_salary DESC;

WITH avg_values AS (
   SELECT 
       (SELECT AVG(Cost.Cost) FROM Cost) AS avg_cost,
       (SELECT AVG(salary_in_usd) FROM salaries) AS avg_salary
)
SELECT
    SUM((salaries.salary_in_usd - avg_values.avg_salary) * (Cost.Cost - avg_values.avg_cost)) /
    (SQRT(SUM(POW(salaries.salary_in_usd - avg_values.avg_salary, 2))) * 
    SQRT(SUM(POW(Cost.Cost - avg_values.avg_cost, 2)))) AS CORRELATION
FROM salaries
JOIN ISO_code ON salaries.employee_residence = ISO_code.code  
JOIN Cost ON ISO_code.name = Cost.Country,
avg_values;

/*INSIGHTS
Correlations show that while higher salaries are generally associated with higher living costs, this relationship isn’t always consistent. 
Outliers like Qatar (QA) and Slovakia (SK) report extremely high salaries ($300,000 and $225,000, respectively) that deviate from this pattern, however this is likely due to the sample size of this analysis.
Similarly, salary discrepancies based on employee residence demonstrate that location continues to heavily influence salary outcomes, even within the same company location.
What we can conclude is that, in general, the higher the cost of living, the higher the salary, both in terms of company location and employee residence.

RESULTS
-- Company Location Table
[
	{
		"company_location" : CH,
		"avg_salary" : 129196.1579,
		"Cost" : 101
	},
	{
		"company_location" : SG,
		"avg_salary" : 62783.0000,
		"Cost" : 77
	},
	{
		"company_location" : NO,
		"avg_salary" : 88462.0000,
		"Cost" : 76
	},
	{
		"company_location" : DK,
		"avg_salary" : 60776.6667,
		"Cost" : 72
	},
	{
		"company_location" : US,
		"avg_salary" : 165847.4321,
		"Cost" : 70
	},
	{
		"company_location" : AU,
		"avg_salary" : 128031.0000,
		"Cost" : 70
	},
	{
		"company_location" : CA,
		"avg_salary" : 141983.6055,
		"Cost" : 65
	},
	{
		"company_location" : NZ,
		"avg_salary" : 116901.4444,
		"Cost" : 65
	},
	{
		"company_location" : AT,
		"avg_salary" : 65201.0417,
		"Cost" : 65
	},
	{
		"company_location" : IE,
		"avg_salary" : 106162.3636,
		"Cost" : 64
	},
	{
		"company_location" : FR,
		"avg_salary" : 95175.2621,
		"Cost" : 64
	},
	{
		"company_location" : PR,
		"avg_salary" : 167500.0000,
		"Cost" : 63
	},
	{
		"company_location" : IL,
		"avg_salary" : 157888.6250,
		"Cost" : 63
	},
	{
		"company_location" : FI,
		"avg_salary" : 95598.3125,
		"Cost" : 63
	},
	{
		"company_location" : NL,
		"avg_salary" : 79427.5479,
		"Cost" : 63
	},
	{
		"company_location" : DE,
		"avg_salary" : 112284.8650,
		"Cost" : 62
	},
	{
		"company_location" : GB,
		"avg_salary" : 97555.5576,
		"Cost" : 62
	},
	{
		"company_location" : LU,
		"avg_salary" : 49595.7500,
		"Cost" : 62
	},
	{
		"company_location" : BE,
		"avg_salary" : 122234.6000,
		"Cost" : 61
	},
	{
		"company_location" : KR,
		"avg_salary" : 71676.0000,
		"Cost" : 60
	},
	{
		"company_location" : SE,
		"avg_salary" : 120746.0000,
		"Cost" : 59
	},
	{
		"company_location" : AE,
		"avg_salary" : 86000.0000,
		"Cost" : 56
	},
	{
		"company_location" : IT,
		"avg_salary" : 84550.2308,
		"Cost" : 56
	},
	{
		"company_location" : CY,
		"avg_salary" : 37777.5000,
		"Cost" : 55
	},
	{
		"company_location" : MT,
		"avg_salary" : 64569.9091,
		"Cost" : 53
	},
	{
		"company_location" : GR,
		"avg_salary" : 50894.8750,
		"Cost" : 52
	},
	{
		"company_location" : EE,
		"avg_salary" : 45588.4167,
		"Cost" : 52
	},
	{
		"company_location" : QA,
		"avg_salary" : 300000.0000,
		"Cost" : 51
	},
	{
		"company_location" : SI,
		"avg_salary" : 56186.3333,
		"Cost" : 50
	},
	{
		"company_location" : LV,
		"avg_salary" : 57059.6875,
		"Cost" : 49
	},
	{
		"company_location" : SK,
		"avg_salary" : 225000.0000,
		"Cost" : 47
	},
	{
		"company_location" : CZ,
		"avg_salary" : 67442.2500,
		"Cost" : 47
	},
	{
		"company_location" : LT,
		"avg_salary" : 62847.5435,
		"Cost" : 47
	},
	{
		"company_location" : ES,
		"avg_salary" : 61565.0066,
		"Cost" : 47
	},
	{
		"company_location" : JP,
		"avg_salary" : 110821.6250,
		"Cost" : 46
	},
	{
		"company_location" : HR,
		"avg_salary" : 76726.0000,
		"Cost" : 46
	},
	{
		"company_location" : SA,
		"avg_salary" : 139999.3333,
		"Cost" : 45
	},
	{
		"company_location" : PT,
		"avg_salary" : 55432.5588,
		"Cost" : 45
	},
	{
		"company_location" : LB,
		"avg_salary" : 71750.0000,
		"Cost" : 42
	},
	{
		"company_location" : OM,
		"avg_salary" : 46848.0000,
		"Cost" : 42
	},
	{
		"company_location" : HU,
		"avg_salary" : 39938.0000,
		"Cost" : 42
	},
	{
		"company_location" : PL,
		"avg_salary" : 80413.4000,
		"Cost" : 41
	},
	{
		"company_location" : AM,
		"avg_salary" : 56533.2000,
		"Cost" : 41
	},
	{
		"company_location" : MX,
		"avg_salary" : 112642.2258,
		"Cost" : 40
	},
	{
		"company_location" : CL,
		"avg_salary" : 71553.2000,
		"Cost" : 39
	},
	{
		"company_location" : VE,
		"avg_salary" : 192500.0000,
		"Cost" : 38
	},
	{
		"company_location" : BG,
		"avg_salary" : 60000.0000,
		"Cost" : 38
	},
	{
		"company_location" : RS,
		"avg_salary" : 51000.0000,
		"Cost" : 38
	},
	{
		"company_location" : RO,
		"avg_salary" : 41663.5000,
		"Cost" : 38
	},
	{
		"company_location" : MU,
		"avg_salary" : 100000.0000,
		"Cost" : 37
	},
	{
		"company_location" : TR,
		"avg_salary" : 52463.6471,
		"Cost" : 37
	},
	{
		"company_location" : BA,
		"avg_salary" : 75000.0000,
		"Cost" : 35
	},
	{
		"company_location" : ZA,
		"avg_salary" : 68671.0303,
		"Cost" : 35
	},
	{
		"company_location" : TH,
		"avg_salary" : 22971.3333,
		"Cost" : 34
	},
	{
		"company_location" : MD,
		"avg_salary" : 18000.0000,
		"Cost" : 34
	},
	{
		"company_location" : EC,
		"avg_salary" : 16000.0000,
		"Cost" : 33
	},
	{
		"company_location" : CN,
		"avg_salary" : 100000.0000,
		"Cost" : 32
	},
	{
		"company_location" : RU,
		"avg_salary" : 78207.8571,
		"Cost" : 31
	},
	{
		"company_location" : NG,
		"avg_salary" : 60444.4444,
		"Cost" : 31
	},
	{
		"company_location" : PH,
		"avg_salary" : 41054.7500,
		"Cost" : 31
	},
	{
		"company_location" : GH,
		"avg_salary" : 27000.0000,
		"Cost" : 31
	},
	{
		"company_location" : BR,
		"avg_salary" : 57530.0256,
		"Cost" : 30
	},
	{
		"company_location" : KE,
		"avg_salary" : 50000.0000,
		"Cost" : 30
	},
	{
		"company_location" : MY,
		"avg_salary" : 40000.0000,
		"Cost" : 30
	},
	{
		"company_location" : DZ,
		"avg_salary" : 100000.0000,
		"Cost" : 29
	},
	{
		"company_location" : IQ,
		"avg_salary" : 100000.0000,
		"Cost" : 29
	},
	{
		"company_location" : AR,
		"avg_salary" : 80359.9200,
		"Cost" : 29
	},
	{
		"company_location" : CO,
		"avg_salary" : 70732.2000,
		"Cost" : 29
	},
	{
		"company_location" : VN,
		"avg_salary" : 63000.0000,
		"Cost" : 29
	},
	{
		"company_location" : ID,
		"avg_salary" : 34208.0000,
		"Cost" : 27
	},
	{
		"company_location" : UA,
		"avg_salary" : 103000.0000,
		"Cost" : 26
	},
	{
		"company_location" : IR,
		"avg_salary" : 100000.0000,
		"Cost" : 26
	},
	{
		"company_location" : EG,
		"avg_salary" : 135090.9091,
		"Cost" : 21
	},
	{
		"company_location" : IN,
		"avg_salary" : 55509.9326,
		"Cost" : 21
	},
	{
		"company_location" : PK,
		"avg_salary" : 30000.0000,
		"Cost" : 19
	}
]

-- Correlation Company Location and Cost of Living
[
	{
		"CORRELATION" : 0.03890079224719815
	}
]

-- Employee Residence Table
[
	{
		"employee_residence" : CH,
		"avg_salary" : 135022.5000,
		"Cost" : 101
	},
	{
		"employee_residence" : SG,
		"avg_salary" : 83092.6000,
		"Cost" : 77
	},
	{
		"employee_residence" : NO,
		"avg_salary" : 88462.0000,
		"Cost" : 76
	},
	{
		"employee_residence" : DK,
		"avg_salary" : 52806.2500,
		"Cost" : 72
	},
	{
		"employee_residence" : US,
		"avg_salary" : 165957.0922,
		"Cost" : 70
	},
	{
		"employee_residence" : AU,
		"avg_salary" : 130094.6509,
		"Cost" : 70
	},
	{
		"employee_residence" : CA,
		"avg_salary" : 142123.0694,
		"Cost" : 65
	},
	{
		"employee_residence" : NZ,
		"avg_salary" : 116901.4444,
		"Cost" : 65
	},
	{
		"employee_residence" : AT,
		"avg_salary" : 65159.1667,
		"Cost" : 65
	},
	{
		"employee_residence" : IE,
		"avg_salary" : 106162.3636,
		"Cost" : 64
	},
	{
		"employee_residence" : FR,
		"avg_salary" : 94803.7944,
		"Cost" : 64
	},
	{
		"employee_residence" : IL,
		"avg_salary" : 171508.3333,
		"Cost" : 63
	},
	{
		"employee_residence" : PR,
		"avg_salary" : 166000.0000,
		"Cost" : 63
	},
	{
		"employee_residence" : FI,
		"avg_salary" : 97462.5333,
		"Cost" : 63
	},
	{
		"employee_residence" : NL,
		"avg_salary" : 79650.4521,
		"Cost" : 63
	},
	{
		"employee_residence" : DE,
		"avg_salary" : 116274.5064,
		"Cost" : 62
	},
	{
		"employee_residence" : GB,
		"avg_salary" : 97734.3972,
		"Cost" : 62
	},
	{
		"employee_residence" : LU,
		"avg_salary" : 57328.5000,
		"Cost" : 62
	},
	{
		"employee_residence" : BE,
		"avg_salary" : 124023.5000,
		"Cost" : 61
	},
	{
		"employee_residence" : KR,
		"avg_salary" : 71676.0000,
		"Cost" : 60
	},
	{
		"employee_residence" : SE,
		"avg_salary" : 125656.2857,
		"Cost" : 59
	},
	{
		"employee_residence" : AE,
		"avg_salary" : 86000.0000,
		"Cost" : 56
	},
	{
		"employee_residence" : IT,
		"avg_salary" : 80488.5152,
		"Cost" : 56
	},
	{
		"employee_residence" : CY,
		"avg_salary" : 46418.6667,
		"Cost" : 55
	},
	{
		"employee_residence" : MT,
		"avg_salary" : 64569.9091,
		"Cost" : 53
	},
	{
		"employee_residence" : GR,
		"avg_salary" : 51762.5556,
		"Cost" : 52
	},
	{
		"employee_residence" : EE,
		"avg_salary" : 43941.8182,
		"Cost" : 52
	},
	{
		"employee_residence" : CR,
		"avg_salary" : 20000.0000,
		"Cost" : 52
	},
	{
		"employee_residence" : QA,
		"avg_salary" : 300000.0000,
		"Cost" : 51
	},
	{
		"employee_residence" : SI,
		"avg_salary" : 56186.3333,
		"Cost" : 50
	},
	{
		"employee_residence" : LV,
		"avg_salary" : 57059.6875,
		"Cost" : 49
	},
	{
		"employee_residence" : SK,
		"avg_salary" : 225000.0000,
		"Cost" : 47
	},
	{
		"employee_residence" : ES,
		"avg_salary" : 63047.1161,
		"Cost" : 47
	},
	{
		"employee_residence" : LT,
		"avg_salary" : 62847.5435,
		"Cost" : 47
	},
	{
		"employee_residence" : CZ,
		"avg_salary" : 60444.0000,
		"Cost" : 47
	},
	{
		"employee_residence" : JP,
		"avg_salary" : 95821.6250,
		"Cost" : 46
	},
	{
		"employee_residence" : HR,
		"avg_salary" : 84751.8333,
		"Cost" : 46
	},
	{
		"employee_residence" : SA,
		"avg_salary" : 139999.3333,
		"Cost" : 45
	},
	{
		"employee_residence" : PT,
		"avg_salary" : 58200.7500,
		"Cost" : 45
	},
	{
		"employee_residence" : LB,
		"avg_salary" : 71750.0000,
		"Cost" : 42
	},
	{
		"employee_residence" : KW,
		"avg_salary" : 50000.0000,
		"Cost" : 42
	},
	{
		"employee_residence" : OM,
		"avg_salary" : 46848.0000,
		"Cost" : 42
	},
	{
		"employee_residence" : HU,
		"avg_salary" : 33169.5000,
		"Cost" : 42
	},
	{
		"employee_residence" : PL,
		"avg_salary" : 79110.4571,
		"Cost" : 41
	},
	{
		"employee_residence" : AM,
		"avg_salary" : 49944.3333,
		"Cost" : 41
	},
	{
		"employee_residence" : MX,
		"avg_salary" : 114396.9667,
		"Cost" : 40
	},
	{
		"employee_residence" : CL,
		"avg_salary" : 77127.6667,
		"Cost" : 39
	},
	{
		"employee_residence" : VE,
		"avg_salary" : 192500.0000,
		"Cost" : 38
	},
	{
		"employee_residence" : DO,
		"avg_salary" : 110000.0000,
		"Cost" : 38
	},
	{
		"employee_residence" : BG,
		"avg_salary" : 70000.0000,
		"Cost" : 38
	},
	{
		"employee_residence" : RS,
		"avg_salary" : 42510.6667,
		"Cost" : 38
	},
	{
		"employee_residence" : RO,
		"avg_salary" : 41831.2857,
		"Cost" : 38
	},
	{
		"employee_residence" : MU,
		"avg_salary" : 100000.0000,
		"Cost" : 37
	},
	{
		"employee_residence" : TR,
		"avg_salary" : 54042.4211,
		"Cost" : 37
	},
	{
		"employee_residence" : BA,
		"avg_salary" : 75000.0000,
		"Cost" : 35
	},
	{
		"employee_residence" : ZA,
		"avg_salary" : 68671.0303,
		"Cost" : 35
	},
	{
		"employee_residence" : MD,
		"avg_salary" : 66500.0000,
		"Cost" : 34
	},
	{
		"employee_residence" : TH,
		"avg_salary" : 32228.5000,
		"Cost" : 34
	},
	{
		"employee_residence" : GE,
		"avg_salary" : 53500.0000,
		"Cost" : 33
	},
	{
		"employee_residence" : EC,
		"avg_salary" : 16000.0000,
		"Cost" : 33
	},
	{
		"employee_residence" : CN,
		"avg_salary" : 125404.0000,
		"Cost" : 32
	},
	{
		"employee_residence" : RU,
		"avg_salary" : 79242.5000,
		"Cost" : 31
	},
	{
		"employee_residence" : NG,
		"avg_salary" : 52416.6667,
		"Cost" : 31
	},
	{
		"employee_residence" : PH,
		"avg_salary" : 44505.4737,
		"Cost" : 31
	},
	{
		"employee_residence" : GH,
		"avg_salary" : 34250.0000,
		"Cost" : 31
	},
	{
		"employee_residence" : MY,
		"avg_salary" : 200000.0000,
		"Cost" : 30
	},
	{
		"employee_residence" : BR,
		"avg_salary" : 61065.1463,
		"Cost" : 30
	},
	{
		"employee_residence" : KE,
		"avg_salary" : 50000.0000,
		"Cost" : 30
	},
	{
		"employee_residence" : PE,
		"avg_salary" : 27000.0000,
		"Cost" : 30
	},
	{
		"employee_residence" : IQ,
		"avg_salary" : 100000.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : DZ,
		"avg_salary" : 100000.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : AR,
		"avg_salary" : 76103.3793,
		"Cost" : 29
	},
	{
		"employee_residence" : CO,
		"avg_salary" : 70732.2000,
		"Cost" : 29
	},
	{
		"employee_residence" : VN,
		"avg_salary" : 57200.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : UG,
		"avg_salary" : 36000.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : TN,
		"avg_salary" : 90234.5000,
		"Cost" : 28
	},
	{
		"employee_residence" : BO,
		"avg_salary" : 75000.0000,
		"Cost" : 28
	},
	{
		"employee_residence" : ID,
		"avg_salary" : 15000.0000,
		"Cost" : 27
	},
	{
		"employee_residence" : IR,
		"avg_salary" : 100000.0000,
		"Cost" : 26
	},
	{
		"employee_residence" : UA,
		"avg_salary" : 93928.5714,
		"Cost" : 26
	},
	{
		"employee_residence" : UZ,
		"avg_salary" : 82000.0000,
		"Cost" : 26
	},
	{
		"employee_residence" : EG,
		"avg_salary" : 133176.4706,
		"Cost" : 21
	},
	{
		"employee_residence" : IN,
		"avg_salary" : 56691.0377,
		"Cost" : 21
	},
	{
		"employee_residence" : PK,
		"avg_salary" : 38536.1667,
		"Cost" : 19
	}
]

-- Employee residence and cost of living correlation
[
	{
		"employee_residence" : CH,
		"avg_salary" : 135022.5000,
		"Cost" : 101
	},
	{
		"employee_residence" : SG,
		"avg_salary" : 83092.6000,
		"Cost" : 77
	},
	{
		"employee_residence" : NO,
		"avg_salary" : 88462.0000,
		"Cost" : 76
	},
	{
		"employee_residence" : DK,
		"avg_salary" : 52806.2500,
		"Cost" : 72
	},
	{
		"employee_residence" : US,
		"avg_salary" : 165957.0922,
		"Cost" : 70
	},
	{
		"employee_residence" : AU,
		"avg_salary" : 130094.6509,
		"Cost" : 70
	},
	{
		"employee_residence" : CA,
		"avg_salary" : 142123.0694,
		"Cost" : 65
	},
	{
		"employee_residence" : NZ,
		"avg_salary" : 116901.4444,
		"Cost" : 65
	},
	{
		"employee_residence" : AT,
		"avg_salary" : 65159.1667,
		"Cost" : 65
	},
	{
		"employee_residence" : IE,
		"avg_salary" : 106162.3636,
		"Cost" : 64
	},
	{
		"employee_residence" : FR,
		"avg_salary" : 94803.7944,
		"Cost" : 64
	},
	{
		"employee_residence" : IL,
		"avg_salary" : 171508.3333,
		"Cost" : 63
	},
	{
		"employee_residence" : PR,
		"avg_salary" : 166000.0000,
		"Cost" : 63
	},
	{
		"employee_residence" : FI,
		"avg_salary" : 97462.5333,
		"Cost" : 63
	},
	{
		"employee_residence" : NL,
		"avg_salary" : 79650.4521,
		"Cost" : 63
	},
	{
		"employee_residence" : DE,
		"avg_salary" : 116274.5064,
		"Cost" : 62
	},
	{
		"employee_residence" : GB,
		"avg_salary" : 97734.3972,
		"Cost" : 62
	},
	{
		"employee_residence" : LU,
		"avg_salary" : 57328.5000,
		"Cost" : 62
	},
	{
		"employee_residence" : BE,
		"avg_salary" : 124023.5000,
		"Cost" : 61
	},
	{
		"employee_residence" : KR,
		"avg_salary" : 71676.0000,
		"Cost" : 60
	},
	{
		"employee_residence" : SE,
		"avg_salary" : 125656.2857,
		"Cost" : 59
	},
	{
		"employee_residence" : AE,
		"avg_salary" : 86000.0000,
		"Cost" : 56
	},
	{
		"employee_residence" : IT,
		"avg_salary" : 80488.5152,
		"Cost" : 56
	},
	{
		"employee_residence" : CY,
		"avg_salary" : 46418.6667,
		"Cost" : 55
	},
	{
		"employee_residence" : MT,
		"avg_salary" : 64569.9091,
		"Cost" : 53
	},
	{
		"employee_residence" : GR,
		"avg_salary" : 51762.5556,
		"Cost" : 52
	},
	{
		"employee_residence" : EE,
		"avg_salary" : 43941.8182,
		"Cost" : 52
	},
	{
		"employee_residence" : CR,
		"avg_salary" : 20000.0000,
		"Cost" : 52
	},
	{
		"employee_residence" : QA,
		"avg_salary" : 300000.0000,
		"Cost" : 51
	},
	{
		"employee_residence" : SI,
		"avg_salary" : 56186.3333,
		"Cost" : 50
	},
	{
		"employee_residence" : LV,
		"avg_salary" : 57059.6875,
		"Cost" : 49
	},
	{
		"employee_residence" : SK,
		"avg_salary" : 225000.0000,
		"Cost" : 47
	},
	{
		"employee_residence" : ES,
		"avg_salary" : 63047.1161,
		"Cost" : 47
	},
	{
		"employee_residence" : LT,
		"avg_salary" : 62847.5435,
		"Cost" : 47
	},
	{
		"employee_residence" : CZ,
		"avg_salary" : 60444.0000,
		"Cost" : 47
	},
	{
		"employee_residence" : JP,
		"avg_salary" : 95821.6250,
		"Cost" : 46
	},
	{
		"employee_residence" : HR,
		"avg_salary" : 84751.8333,
		"Cost" : 46
	},
	{
		"employee_residence" : SA,
		"avg_salary" : 139999.3333,
		"Cost" : 45
	},
	{
		"employee_residence" : PT,
		"avg_salary" : 58200.7500,
		"Cost" : 45
	},
	{
		"employee_residence" : LB,
		"avg_salary" : 71750.0000,
		"Cost" : 42
	},
	{
		"employee_residence" : KW,
		"avg_salary" : 50000.0000,
		"Cost" : 42
	},
	{
		"employee_residence" : OM,
		"avg_salary" : 46848.0000,
		"Cost" : 42
	},
	{
		"employee_residence" : HU,
		"avg_salary" : 33169.5000,
		"Cost" : 42
	},
	{
		"employee_residence" : PL,
		"avg_salary" : 79110.4571,
		"Cost" : 41
	},
	{
		"employee_residence" : AM,
		"avg_salary" : 49944.3333,
		"Cost" : 41
	},
	{
		"employee_residence" : MX,
		"avg_salary" : 114396.9667,
		"Cost" : 40
	},
	{
		"employee_residence" : CL,
		"avg_salary" : 77127.6667,
		"Cost" : 39
	},
	{
		"employee_residence" : VE,
		"avg_salary" : 192500.0000,
		"Cost" : 38
	},
	{
		"employee_residence" : DO,
		"avg_salary" : 110000.0000,
		"Cost" : 38
	},
	{
		"employee_residence" : BG,
		"avg_salary" : 70000.0000,
		"Cost" : 38
	},
	{
		"employee_residence" : RS,
		"avg_salary" : 42510.6667,
		"Cost" : 38
	},
	{
		"employee_residence" : RO,
		"avg_salary" : 41831.2857,
		"Cost" : 38
	},
	{
		"employee_residence" : MU,
		"avg_salary" : 100000.0000,
		"Cost" : 37
	},
	{
		"employee_residence" : TR,
		"avg_salary" : 54042.4211,
		"Cost" : 37
	},
	{
		"employee_residence" : BA,
		"avg_salary" : 75000.0000,
		"Cost" : 35
	},
	{
		"employee_residence" : ZA,
		"avg_salary" : 68671.0303,
		"Cost" : 35
	},
	{
		"employee_residence" : MD,
		"avg_salary" : 66500.0000,
		"Cost" : 34
	},
	{
		"employee_residence" : TH,
		"avg_salary" : 32228.5000,
		"Cost" : 34
	},
	{
		"employee_residence" : GE,
		"avg_salary" : 53500.0000,
		"Cost" : 33
	},
	{
		"employee_residence" : EC,
		"avg_salary" : 16000.0000,
		"Cost" : 33
	},
	{
		"employee_residence" : CN,
		"avg_salary" : 125404.0000,
		"Cost" : 32
	},
	{
		"employee_residence" : RU,
		"avg_salary" : 79242.5000,
		"Cost" : 31
	},
	{
		"employee_residence" : NG,
		"avg_salary" : 52416.6667,
		"Cost" : 31
	},
	{
		"employee_residence" : PH,
		"avg_salary" : 44505.4737,
		"Cost" : 31
	},
	{
		"employee_residence" : GH,
		"avg_salary" : 34250.0000,
		"Cost" : 31
	},
	{
		"employee_residence" : MY,
		"avg_salary" : 200000.0000,
		"Cost" : 30
	},
	{
		"employee_residence" : BR,
		"avg_salary" : 61065.1463,
		"Cost" : 30
	},
	{
		"employee_residence" : KE,
		"avg_salary" : 50000.0000,
		"Cost" : 30
	},
	{
		"employee_residence" : PE,
		"avg_salary" : 27000.0000,
		"Cost" : 30
	},
	{
		"employee_residence" : IQ,
		"avg_salary" : 100000.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : DZ,
		"avg_salary" : 100000.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : AR,
		"avg_salary" : 76103.3793,
		"Cost" : 29
	},
	{
		"employee_residence" : CO,
		"avg_salary" : 70732.2000,
		"Cost" : 29
	},
	{
		"employee_residence" : VN,
		"avg_salary" : 57200.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : UG,
		"avg_salary" : 36000.0000,
		"Cost" : 29
	},
	{
		"employee_residence" : TN,
		"avg_salary" : 90234.5000,
		"Cost" : 28
	},
	{
		"employee_residence" : BO,
		"avg_salary" : 75000.0000,
		"Cost" : 28
	},
	{
		"employee_residence" : ID,
		"avg_salary" : 15000.0000,
		"Cost" : 27
	},
	{
		"employee_residence" : IR,
		"avg_salary" : 100000.0000,
		"Cost" : 26
	},
	{
		"employee_residence" : UA,
		"avg_salary" : 93928.5714,
		"Cost" : 26
	},
	{
		"employee_residence" : UZ,
		"avg_salary" : 82000.0000,
		"Cost" : 26
	},
	{
		"employee_residence" : EG,
		"avg_salary" : 133176.4706,
		"Cost" : 21
	},
	{
		"employee_residence" : IN,
		"avg_salary" : 56691.0377,
		"Cost" : 21
	},
	{
		"employee_residence" : PK,
		"avg_salary" : 38536.1667,
		"Cost" : 19
	}
]
*/