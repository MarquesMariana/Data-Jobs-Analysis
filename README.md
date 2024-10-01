# Project Overview
 📈 This project provides a comprehensive analysis of the job market, focusing on data-related roles, to help individuals make informed, data-driven career decisions 💡. Ultimatly, I want to answer the question  "What are the best job characteristics I should look for when entering the data job market?"💰.
<br />

Dataset used: https://aijobs.net/salaries/download/

This project is divided into two main parts:
1. Job Stability: Analyse career growth potential.
2. Job Characteristics: Explore how various job-related factors, such as company size, location, and contract type, affect salary.

- Power BI dashboard: [here](https://github.com/MarquesMariana/Data-Jobs-Analysis/blob/main/Data%20Job%20Market.pbix).
- Targeted SQL queries regarding the questions: [here](https://github.com/MarquesMariana/Data-Jobs-Analysis/tree/main/SQL_Scripts).

# Data Structure and Overview
The Job_database consists of four tables shown below: salaries, ISO_Code, Cost and continents. With a total raw count of 43357.



Prior to the analysis I conducted a series of queries for famialization and a general view of the dataset: [here](https://github.com/MarquesMariana/Data-Jobs-Analysis/blob/main/SQL_Scripts/0-Dataset_Overview.sql). In this overview I has able to verify that the majority of data was from the US (90.7%), therefore the dataset is strongly representative of the US job market, but may not fully capture global trends.

# Executive Summary
## Job Stability
1. **Career Growth Opportunities**: A correlation of 0.2984 between experience and salary indicates a positive relationship, with executives earning nearly double compared to entry-level professionals. This trend highlights significant career growth potential in data-related fields.
2. **Salary Growth**: Data & Software Engineering roles lead the way with a staggering salary growth of 3652.77%, highlighting the immense demand for advanced technical skills. Additionally, AI & Machine Learning Engineering roles have seen substantial growth of 2886.67%, emphasizing the need of cutting-edge technological skills.
3. **Salary Evolution 2021-2024**: Specialized AI and engineering roles have had the largest salary increases from 2021 to 2024, while more general roles such as Data Scientists and Data Analysts have seen more moderate growth.
4. **Demand Growth 2021-2024**: The significant growth in consulting, robotics, automation, and software engineering roles is driven by increasing investments in efficiency, digital transformation, and technological innovation. In contrast, AI roles have seen more moderate growth, likely due to the maturity of AI technologies and their integration into broader business strategies.

<img width="1065" alt="Screenshot 2024-09-22 at 18 09 35" src="https://github.com/user-attachments/assets/492bb90a-a726-4331-873c-2f8dd783494d">


## Job Characteristics
1. **Best-Paid Jobs**: 
- **Company Size**: Medium-sized companies provide the highest salaries, followed by large and small companies.
- **Contract Types**: Full-time workers with fixed hours earn the most, followed by contract workers and part-timers, with freelancers earning the least.
- **Remote Work**: While remote jobs offer slightly lower average salaries than on-site roles, the maximum potential salary for remote workers can be competitive. Hybrid roles offer the lowest average salaries.
- **Geographic Differences**: North America leads in salary levels, followed by Oceania and Europe. Geographic location, both in terms of company and employee residence, significantly influences salary outcomes, particularly due to local living costs.

<img width="1065" alt="Screenshot 2024-09-22 at 18 09 48" src="https://github.com/user-attachments/assets/65fc3cf3-9d21-4522-9b57-186e30235a04">




# Insights Deep Dive
## Job Stability
1. Experience Level and Salary Correlation:
- **Moderate Positive Correlation**: The correlation coefficient of 0.2984 indicates a moderate positive relationship between experience and salary. While experience contributes to salary growth, other factors such as industry specialization also play a role.
- **Executive vs Entry-Level Salary Gap**: Executives earn almost twice the salary of entry-level professionals, highlighting the increased responsibilities, leadership, and strategic decision-making expected at higher levels.
- **Consistent Salary Range**: The minimum salary across all experience levels is about 15,000, while the maximum ranges between 609 million and 800 million. This suggests that even lower-experience professionals can achieve high earnings, and not all senior professionals earn the highest salaries.
- **Skewed Salary Averages**: The median salary is consistently lower than the average across experience levels, indicating that high-salary outliers significantly skew the overall average. This is particularly evident in entry- and mid-level roles, where a few high-paying jobs inflate overall salary expectations.

2. Best Jobs for Career Growth
- **Data & Software Engineering**: Leading the growth charts, this category has witnessed an extraordinary salary increase of 3652.77%. This surge underscores the explosive demand for advanced technical skills and the increasing complexity of data systems and software engineering.
- **General Data Roles**: Although broader in scope, general data roles have also experienced a significant salary growth of 3409.33%. This category reflects the rising importance of data-centric roles across various industries, driving substantial financial rewards for expertise in data analysis and management.
- **AI & Machine Learning Engineering**: With a salary growth of 2886.67%, AI and machine learning roles highlight the premium placed on cutting-edge technologies and the need for professionals who can develop and implement sophisticated AI solutions.
- **AI Research & Science**: This field shows a robust salary growth of 2500%, reflecting the crucial role of AI research in advancing technology and its application across diverse sectors.

3. Best Jobs in Terms of Demand Growth

- **Consulting and Management Roles**: These roles, particularly those related to data and AI, are witnessing the highest demand growth. This trend underscores the increasing importance of strategic oversight and innovation in an evolving market. The demand for consulting and management positions highlights the need for expertise in steering businesses through complex data landscapes and technological advancements.
AI, Machine Learning, and Robotics: The highest growth in demand is observed in AI and machine learning roles, followed by robotics and automation engineering. The substantial increase in demand reflects the integration of cutting-edge technologies into various industries, driving the need for specialized skills and expertise in these areas.
- **Decline in Traditional Roles**: General data roles like Data Analysts and BI Analysts are experiencing a decline in demand. This shift indicates a move towards more specialized and technical positions, as companies prioritize advanced analytical capabilities and automation over traditional data analysis functions.
4. Salary Evolution 2021-2024

-**Robotics and Automation Engineering**: This field has seen the most significant salary growth at 264.13% from 2021 to 2024. The rapid increase in compensation reflects the high demand for expertise in innovative technologies that drive industrial automation and technological advancement.
- **AI and Machine Learning Roles**: Salaries for roles in AI and machine learning have also risen substantially, driven by the growing importance of these fields in technological development. The surge in salaries highlights the premium placed on advanced skills in AI and machine learning.
- **Moderate Growth in General Data Roles**: Data Scientists and Data Analysts have experienced more modest salary increases, with growth rates of 72.46% and 40.47%, respectively. While these roles continue to be important, their slower salary growth indicates a shift towards specialized technical roles as the market evolves.


## Job Characteristics
1. Best Jobs in Terms of Salary
- Engineering and Management Roles: Engineering and management roles, particularly Engineer Managers, lead the salary landscape with an average of $209,566, followed by Software Engineers at $175,767. These roles demand a combination of technical expertise and leadership, making them highly valuable across industries.
- AI and Machine Learning Roles: Positions in AI and machine learning offer impressive average salaries ranging from $162,911 to $169,094. This reflects the specialized skills required in this rapidly growing field.
- General Data Roles: More general roles, such as Data Analysts and Business Analysts, see lower salary ranges between $94,054 and $154,079. These positions, while essential, offer broader skill sets, leading to lower compensation compared to highly specialized roles.
2. Salary Variations by Company Size
- Negligible Correlation: The correlation between company size and salary is insignificant, with a coefficient of -0.00487. This means that company size does not substantially affect salary outcomes.
- Medium-Sized Companies: These offer the highest average salary at $161,277. This may be due to a balance between growth potential and the flexibility to reward individual contributions.
- Large Companies: Large organizations pay slightly less, with an average salary of $149,287. The structured salary scales in these firms could explain this slight difference.
- Small Companies: Small companies offer the lowest salaries at an average of $87,896, likely due to financial constraints and limited resources compared to larger firms.
3. Salary by Contract Type
- Full-Time Workers: Full-time employees with fixed hours earn the highest average salary at $160,733, reflecting the stability and benefits associated with these positions.
- Contract Workers: Earning about 33% less than full-time employees, contract workers average $107,675. This reflects the trade-off between flexibility and compensation.
- Part-Time Workers: Part-time workers earn about half the compensation of full-time workers, highlighting the financial impact of reduced working hours.
- Freelancers: Freelancers receive the lowest average salary, $60,651, likely due to the project-based nature of their work and income variability.
4. Remote Work and Salary
- Negligible Correlation: The correlation between remote work and salary is minimal (-0.088), indicating a slight negative relationship where salaries decrease marginally with the rise of remote work.
- On-Site Jobs: These positions offer the highest average salary at $164,283.23, suggesting a higher value placed on in-person collaboration.
- Remote Jobs: Remote workers earn slightly less on average, with a salary of $149,680.95. However, remote jobs offer competitive top-end salaries, showing that the flexibility of working remotely does not necessarily limit high pay.
- Hybrid Jobs: Hybrid roles have the lowest average salary at $81,816.83, roughly half of on-site roles, possibly due to the blended nature of work settings.
5. Geographic Salary Differences
- North America: With an average salary of $165,039.51, North America leads in compensation, driven by its strong tech sector and high demand for skilled professionals.
- Oceania: Oceania follows with an average salary of $123,808.25, reflecting its growing presence in the tech industry.
- Europe: Europe’s average salary sits at $92,001.55, behind North America and Oceania but still competitive within the global market.
- Africa: Africa stands out with a higher-than-expected average salary of $91,351.45, suggesting wealth disparities within the region or the influence of the tech sector.
- South America and Asia: Both regions report significantly lower average salaries at $69,848.68 and $64,878.30, respectively, aligning with lower living costs and economic conditions in these regions.
6. Employee Residence Impact on Salary
- Country-Specific Disparities: Salaries for US-based companies vary greatly based on employee residence. For instance, employees in Malaysia earn an average of $200,000, compared to $165,963.37 for employees in the US. Meanwhile, employees in Costa Rica and Nigeria earn around $20,000, highlighting the wide disparities influenced by local economic conditions and living costs.
7. Living Costs and Salary Correlation
- Higher Salary Regions: Regions with higher living costs generally offer higher salaries, such as North America and Europe. This is consistent with the cost of living differences in these areas.
- Outliers: Outliers like Qatar and Slovakia report significantly higher salaries ($300,000 and $225,000, respectively) compared to their cost of living. These deviations could be due to specific industries or small sample sizes.


# Recommendations
1. Specialize in High-Demand Roles: Invest in developing skills in high-growth areas such as AI, machine learning, and data engineering. These roles not only offer substantial salary increases but also have robust career prospects. Additionally, enhancing your management, strategy, and leadership skills can further boost your career trajectory.
2. Consider Full-Time or Contract Employment: Pursue full-time positions or Contracts when possible, as they generally offer more stability and higher compensation compared to freelance roles.
3. Medium Companies: aim to work at medium companies as they are more likely to value your work the most.
4. Leverage Geographic Flexibility: If possible, target roles in high-salary regions or remote positions with competitive pay. Geographic flexibility can enhance earning potential, especially if you are open to relocating or working remotely.





