# COVID-19-Clinical-Trials-Exploratory-Data-Analysis
This project focuses on performing Exploratory Data Analysis (EDA) on COVID-19 clinical trials data to uncover meaningful insights and trends. The analysis aims to understand various aspects such as trial phases, locations, sponsors, and status distribution, helping to interpret the global response to the pandemic through data.

To achieve this, a combination of tools and technologies was used, including Excel for initial data cleaning and preprocessing, SQL and PL/SQL for efficient data querying and manipulation, Oracle Database for structured data storage, and Power BI for creating interactive dashboards and visualizations. The project demonstrates strong data handling, querying, and visualization skills while providing valuable insights into clinical research patterns during COVID-19.

#Tech Stack
Database: Oracle SQL
ETL: Excel (data cleaning), CSV import to Oracle
Queries: 10 SQL queries for insights
PL/SQL: 3 scripts 
Visualization: Power BI dashboard

## Project Workflow
-Excel--
- Cleaned and preprocessed the raw dataset using Excel  
- Removed null and missing values to ensure data accuracy  
- Replaced inconsistent and incorrect entries with standardized values  
- Handled duplicate records to maintain data integrity  
- Formatted columns (dates, text, and numerical values) for consistency  
- Renamed columns for better readability and understanding  
- Filtered and organized the dataset to prepare it for further analysis  

### Data Analysis (SQL - Oracle)
- Imported the cleaned CSV file into Oracle Database  
- Wrote and executed 10 SQL queries to extract insights
### SQL Query Descriptions
1. Calculated the total number of clinical studies in the dataset.  
2. Analyzed the distribution of studies based on their current status.  
3. Identified the top 10 most frequently studied medical conditions.  
4. Examined how studies are distributed across different clinical phases.  
5. Computed the average enrollment while handling non-numeric data safely.  
6. Determined the top sponsors contributing to clinical trials.  
7. Analyzed study distribution based on gender participation.  
8. Explored the distribution of different study types.  
9. Identified year-wise trends in study initiation.  
10. Retrieved completed studies with high enrollment for deeper insights.
    
## PL/SQL Scripts
Developed 3 PL/SQL scripts for procedural data analysis
### PL/SQL Script Descriptions
1. Used a cursor to iterate through study statuses and display their counts.  
2. Extracted and displayed studies with high enrollment using a loop.  
3. Created a stored procedure to count studies for a given clinical phase.

### Dashboard (Power BI)

- Designed an interactive dashboard in Power BI to visualize key insights from the clinical trials dataset  

#### Key KPIs
- Total number of clinical trials  
- Total enrollment (sum of participants)  
- Trials with available results  
- Completed clinical trials  
- Average enrollment  
- Median enrollment  
#### Visualizations
- Line chart showing year-wise distribution of clinical trials  
- Bar chart representing distribution of clinical trials by phase  
- Bar chart displaying total enrollment across different study phases  
- Pie chart illustrating the number of clinical trials by study status  
- Map visualization showing geographical distribution of clinical trials

## Project Overview

This project presents an end-to-end Exploratory Data Analysis (EDA) of COVID-19 clinical trials data using a combination of Excel, Oracle SQL, PL/SQL, and Power BI. It involves data cleaning, database querying, and interactive dashboard creation to uncover key insights such as study distribution, enrollment trends, sponsor activity, and geographical patterns. The project highlights strong skills in data preprocessing, analytical querying, and data visualization to better understand global clinical research during the pandemic.
