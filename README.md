# Project Overview
This project explores the global data job market using a comprehensive dataset from AIJobs.net, focusing on key factors that influence salary, demand, and career growth. The goal is to answer:

“What job characteristics should I prioritize when entering or advancing in the data industry?”
<br/>

This project is divided into two main parts:
1. Job Stability: Analyse career growth potential.
2. Job Characteristics: Explore how various job-related factors, such as company size, location, and contract type, affect salary.

- Power BI dashboard: [here](https://github.com/MarquesMariana/Data-Jobs-Analysis/blob/main/Data%20Job%20Market.pbix).
- Targeted SQL queries regarding the questions: [here](https://github.com/MarquesMariana/Data-Jobs-Analysis/tree/main/SQL_Scripts).

# Data Structure and Overview
The Job_database consists of four tables: salaries, ISO_Code, Cost and continents. With a total raw count of 43357.



Prior to the analysis I conducted a series of queries for famialization and a general view of the dataset: [here](https://github.com/MarquesMariana/Data-Jobs-Analysis/blob/main/SQL_Scripts/0-Dataset_Overview.sql). In this overview I has able to verify that the majority of data was from the US (90.7%), therefore the dataset is strongly representative of the US job market, but may not fully capture global trends.

# Executive Summary
## 1. Job Stability
1. **Career Growth Opportunities**: A correlation of 0.2984 between experience and salary indicates a positive relationship, with executives earning nearly double compared to entry-level professionals. 
2. **Salary Growth (EL to EX)**: Data & Software Engineering roles lead the way with a staggering salary growth of 3652.77%, highlighting the immense demand for advanced technical skills. Additionally, AI & Machine Learning Engineering roles have seen substantial growth of 2886.67%, emphasizing the need of cutting-edge technological skills.
3. **Salary Evolution 2021-2024**: Specialized AI and engineering roles have had the largest salary increases from 2021 to 2024, while more general roles such as Data Scientists and Data Analysts have seen more moderate growth.
4. **Demand Growth 2021-2024**: The significant growth in consulting, robotics, automation, and software engineering roles is probably driven by increasing investments in efficiency, digital transformation, and technological innovation. In contrast, AI roles have seen more moderate growth, likely due to the early stage of maturity of AI technologies.

<img width="1065" alt="Screenshot 2024-09-22 at 18 09 35" src="https://github.com/user-attachments/assets/492bb90a-a726-4331-873c-2f8dd783494d">



## 2. Job Characteristics
| Factor            | Key Insight                                                              |
| ----------------- | ------------------------------------------------------------------------ |
| **Company Size**  | Medium-sized firms pay the most on average                               |
| **Contract Type** | Full-time roles have highest average salary                              |
| **Remote Work**   | On-site > Remote > Hybrid (Average Salaries)                              |
| **Geography**     | North America leads in salary; employee residence affects pay            |
| **Living Costs**  | Strong alignment with salary, but outliers exist (e.g., Qatar, Slovakia) |
<img width="1065" alt="Screenshot 2024-09-22 at 18 09 48" src="https://github.com/user-attachments/assets/65fc3cf3-9d21-4522-9b57-186e30235a04">

## Data Challenges & Outliers
- US-Dominant Dataset: ~90% of records are US-based, limiting global generalizability.
### Outliers:
- Max salaries reach $800M, inflating average values. Median is a more reliable measure.
- Some lower-experience professionals report abnormally high salaries (potential misclassification or startup equity).
### Living Cost Mismatches:
- Countries like Qatar and Slovakia report unusually high salaries relative to their cost-of-living index — likely due to niche industries or limited data points.
- Experience vs Salary: While correlation is positive, it’s not strong — other factors like role specialization, location, and industry weigh heavily.


# Recommendations
1. Specialize in High-Demand Roles: Invest in developing skills in high-growth areas such as AI, machine learning, and data engineering. These roles not only offer substantial salary increases but also have robust career prospects. Additionally, enhancing your management, strategy, and leadership skills can further boost your career trajectory.
2. Consider Full-Time or Contract Employment
3. Medium Companies: aim to work at medium companies as they are more likely to value your work the most.
4. Leverage Geographic Flexibility: If possible, target roles in high-salary regions or remote positions with competitive pay. Geographic flexibility can enhance earning potential, especially if you are open to relocating or working remotely.





