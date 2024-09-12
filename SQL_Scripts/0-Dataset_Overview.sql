/*General calculations to understand the Dataset:
- Percentage of remote, hybrid and on-site jobs
- Percentage distribution of companies by location
- Percentage distribution of employees by residence*/

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

/*INSIGHTS
   Predominance of On-site Roles: The majority of jobs are on-site (76.9%), with a much smaller proportion being hybrid (0.6%) or fully remote (22.5%). 
This suggests that on-site work remains the dominant work arrangement, with remote roles being less common but still significant.

 The vast majority of companies are based in the US (90.8%),similarly,a large proportion of employees are based in the US (90.7%). 
This suggests that the dataset is strongly representative of the US job market and may not fully capture global trends.

RESULTS-----------
Remote Percentages:
[
	{
		"remote_ratio" : 0,
		"remote_ratio_percentage" : 76.89877
	},
	{
		"remote_ratio" : 50,
		"remote_ratio_percentage" : 0.60198
	},
	{
		"remote_ratio" : 100,
		"remote_ratio_percentage" : 22.49925
	}
]

Company Locations Percentages:
[
	{
		"company_location" : US,
		"country_percentage" : 90.79733
	},
	{
		"company_location" : GB,
		"country_percentage" : 3.00298
	},
	{
		"company_location" : NL,
		"country_percentage" : 0.16837
	},
	{
		"company_location" : FR,
		"country_percentage" : 0.23756
	},
	{
		"company_location" : CA,
		"country_percentage" : 2.99375
	},
	{
		"company_location" : AU,
		"country_percentage" : 0.25371
	},
	{
		"company_location" : ES,
		"country_percentage" : 0.34827
	},
	{
		"company_location" : IN,
		"country_percentage" : 0.20527
	},
	{
		"company_location" : IT,
		"country_percentage" : 0.05997
	},
	{
		"company_location" : EG,
		"country_percentage" : 0.07611
	},
	{
		"company_location" : DE,
		"country_percentage" : 0.37595
	},
	{
		"company_location" : LT,
		"country_percentage" : 0.10610
	},
	{
		"company_location" : IE,
		"country_percentage" : 0.07611
	},
	{
		"company_location" : CZ,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : PL,
		"country_percentage" : 0.08073
	},
	{
		"company_location" : BE,
		"country_percentage" : 0.02306
	},
	{
		"company_location" : FI,
		"country_percentage" : 0.03690
	},
	{
		"company_location" : CH,
		"country_percentage" : 0.04382
	},
	{
		"company_location" : SE,
		"country_percentage" : 0.01845
	},
	{
		"company_location" : AT,
		"country_percentage" : 0.05535
	},
	{
		"company_location" : AM,
		"country_percentage" : 0.01153
	},
	{
		"company_location" : MT,
		"country_percentage" : 0.02537
	},
	{
		"company_location" : PT,
		"country_percentage" : 0.07842
	},
	{
		"company_location" : CO,
		"country_percentage" : 0.04613
	},
	{
		"company_location" : NZ,
		"country_percentage" : 0.04152
	},
	{
		"company_location" : MX,
		"country_percentage" : 0.07150
	},
	{
		"company_location" : BR,
		"country_percentage" : 0.08995
	},
	{
		"company_location" : AR,
		"country_percentage" : 0.05766
	},
	{
		"company_location" : ZA,
		"country_percentage" : 0.07611
	},
	{
		"company_location" : CY,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : PH,
		"country_percentage" : 0.03690
	},
	{
		"company_location" : CL,
		"country_percentage" : 0.01153
	},
	{
		"company_location" : BG,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : GR,
		"country_percentage" : 0.03690
	},
	{
		"company_location" : TR,
		"country_percentage" : 0.03921
	},
	{
		"company_location" : IL,
		"country_percentage" : 0.01845
	},
	{
		"company_location" : RO,
		"country_percentage" : 0.01384
	},
	{
		"company_location" : VE,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : KR,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : SK,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : DZ,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : AS,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : LU,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : KE,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : RS,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : UA,
		"country_percentage" : 0.02768
	},
	{
		"company_location" : DK,
		"country_percentage" : 0.01384
	},
	{
		"company_location" : LV,
		"country_percentage" : 0.03690
	},
	{
		"company_location" : AE,
		"country_percentage" : 0.01153
	},
	{
		"company_location" : SA,
		"country_percentage" : 0.00692
	},
	{
		"company_location" : OM,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : BA,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : EE,
		"country_percentage" : 0.02768
	},
	{
		"company_location" : HU,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : LB,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : VN,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : NG,
		"country_percentage" : 0.02076
	},
	{
		"company_location" : GI,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : SI,
		"country_percentage" : 0.01384
	},
	{
		"company_location" : MU,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : RU,
		"country_percentage" : 0.01615
	},
	{
		"company_location" : QA,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : GH,
		"country_percentage" : 0.00692
	},
	{
		"company_location" : AD,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : EC,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : NO,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : JP,
		"country_percentage" : 0.01845
	},
	{
		"company_location" : HK,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : CF,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : SG,
		"country_percentage" : 0.01153
	},
	{
		"company_location" : TH,
		"country_percentage" : 0.00692
	},
	{
		"company_location" : HR,
		"country_percentage" : 0.00692
	},
	{
		"company_location" : PK,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : IR,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : BS,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : PR,
		"country_percentage" : 0.00923
	},
	{
		"company_location" : ID,
		"country_percentage" : 0.00461
	},
	{
		"company_location" : MY,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : HN,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : IQ,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : CN,
		"country_percentage" : 0.00231
	},
	{
		"company_location" : MD,
		"country_percentage" : 0.00231
	}
]

Employee Residence Percentages:
[
	{
		"employee_residence" : US,
		"employee_residence_percentage" : 90.67971
	},
	{
		"employee_residence" : CA,
		"employee_residence_percentage" : 2.98914
	},
	{
		"employee_residence" : GB,
		"employee_residence_percentage" : 2.98452
	},
	{
		"employee_residence" : DE,
		"employee_residence_percentage" : 0.35980
	},
	{
		"employee_residence" : ES,
		"employee_residence_percentage" : 0.35750
	},
	{
		"employee_residence" : FR,
		"employee_residence_percentage" : 0.24679
	},
	{
		"employee_residence" : AU,
		"employee_residence_percentage" : 0.24448
	},
	{
		"employee_residence" : IN,
		"employee_residence_percentage" : 0.24448
	},
	{
		"employee_residence" : NL,
		"employee_residence_percentage" : 0.16837
	},
	{
		"employee_residence" : LT,
		"employee_residence_percentage" : 0.10610
	},
	{
		"employee_residence" : BR,
		"employee_residence_percentage" : 0.09456
	},
	{
		"employee_residence" : PT,
		"employee_residence_percentage" : 0.08303
	},
	{
		"employee_residence" : PL,
		"employee_residence_percentage" : 0.08073
	},
	{
		"employee_residence" : EG,
		"employee_residence_percentage" : 0.07842
	},
	{
		"employee_residence" : IT,
		"employee_residence_percentage" : 0.07611
	},
	{
		"employee_residence" : IE,
		"employee_residence_percentage" : 0.07611
	},
	{
		"employee_residence" : ZA,
		"employee_residence_percentage" : 0.07611
	},
	{
		"employee_residence" : MX,
		"employee_residence_percentage" : 0.06919
	},
	{
		"employee_residence" : AR,
		"employee_residence_percentage" : 0.06689
	},
	{
		"employee_residence" : AT,
		"employee_residence_percentage" : 0.05535
	},
	{
		"employee_residence" : CO,
		"employee_residence_percentage" : 0.04613
	},
	{
		"employee_residence" : TR,
		"employee_residence_percentage" : 0.04382
	},
	{
		"employee_residence" : PH,
		"employee_residence_percentage" : 0.04382
	},
	{
		"employee_residence" : CH,
		"employee_residence_percentage" : 0.04152
	},
	{
		"employee_residence" : NZ,
		"employee_residence_percentage" : 0.04152
	},
	{
		"employee_residence" : GR,
		"employee_residence_percentage" : 0.04152
	},
	{
		"employee_residence" : LV,
		"employee_residence_percentage" : 0.03690
	},
	{
		"employee_residence" : FI,
		"employee_residence_percentage" : 0.03460
	},
	{
		"employee_residence" : UA,
		"employee_residence_percentage" : 0.03229
	},
	{
		"employee_residence" : NG,
		"employee_residence_percentage" : 0.02768
	},
	{
		"employee_residence" : BE,
		"employee_residence_percentage" : 0.02768
	},
	{
		"employee_residence" : EE,
		"employee_residence_percentage" : 0.02537
	},
	{
		"employee_residence" : MT,
		"employee_residence_percentage" : 0.02537
	},
	{
		"employee_residence" : JP,
		"employee_residence_percentage" : 0.01845
	},
	{
		"employee_residence" : RO,
		"employee_residence_percentage" : 0.01615
	},
	{
		"employee_residence" : VN,
		"employee_residence_percentage" : 0.01615
	},
	{
		"employee_residence" : SE,
		"employee_residence_percentage" : 0.01615
	},
	{
		"employee_residence" : CL,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : IL,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : RU,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : AM,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : SI,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : PK,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : HR,
		"employee_residence_percentage" : 0.01384
	},
	{
		"employee_residence" : SG,
		"employee_residence_percentage" : 0.01153
	},
	{
		"employee_residence" : PR,
		"employee_residence_percentage" : 0.01153
	},
	{
		"employee_residence" : AE,
		"employee_residence_percentage" : 0.01153
	},
	{
		"employee_residence" : GH,
		"employee_residence_percentage" : 0.00923
	},
	{
		"employee_residence" : KR,
		"employee_residence_percentage" : 0.00923
	},
	{
		"employee_residence" : TH,
		"employee_residence_percentage" : 0.00923
	},
	{
		"employee_residence" : KE,
		"employee_residence_percentage" : 0.00923
	},
	{
		"employee_residence" : DK,
		"employee_residence_percentage" : 0.00923
	},
	{
		"employee_residence" : HU,
		"employee_residence_percentage" : 0.00923
	},
	{
		"employee_residence" : RS,
		"employee_residence_percentage" : 0.00692
	},
	{
		"employee_residence" : UZ,
		"employee_residence_percentage" : 0.00692
	},
	{
		"employee_residence" : SA,
		"employee_residence_percentage" : 0.00692
	},
	{
		"employee_residence" : CZ,
		"employee_residence_percentage" : 0.00692
	},
	{
		"employee_residence" : CY,
		"employee_residence_percentage" : 0.00692
	},
	{
		"employee_residence" : LB,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : GE,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : BA,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : BO,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : LU,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : CF,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : SK,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : TN,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : VE,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : HK,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : BG,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : NO,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : MD,
		"employee_residence_percentage" : 0.00461
	},
	{
		"employee_residence" : PE,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : OM,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : EC,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : AD,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : QA,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : BM,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : KW,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : IR,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : AS,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : CN,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : CR,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : MU,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : UG,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : DO,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : ID,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : MY,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : HN,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : DZ,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : IQ,
		"employee_residence_percentage" : 0.00231
	},
	{
		"employee_residence" : JE,
		"employee_residence_percentage" : 0.00231
	}
]

