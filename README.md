# 🚀 Olist 360: E-Commerce End-to-End Business Intelligence

## 📋 Overview
The project analyzes a real-world Brazilian ecommerce public dataset of orders made at the Olist Store, containing approximately 100,000 orders between 2016 and 2018. The dataset is structured across 9 relational tables covering customers, orders, locations, products, categories, sellers, and reviews, enabling a full view of the end-to-end e-commerce process from purchase to delivery and customer feedback.

The goal of the project is to simulate a real business scenario by developing an interactive dashboard for stakeholders to monitor and analyze key business performance metrics. To support this, raw CSV data was imported and integrated into SQL using Excel, then cleaned and transformed using SQL processes. SQL pipelines were developed to structure and automate data preparation, and multiple table joins were used to create a star schema for analysis. The cleaned dataset was then connected to Power BI, where an interactive dashboard was built to help stakeholders track key performance indicators and derive actionable insights.

## 🎯 Objectives
The primary goal is to provide a 360-degree view of the Olist Store to measure preformance, increase operational efficiency, improve customer satisfaction, and develop a selling strategy Stakeholders requested to know:
* Sales Performance: Which product categories drive the most revenue and how is sales volumne trending over time?
* Logistics & Delivery: What is the average delivery time across different Brazilian states and where are the most significant shipping delays?
* Customer Experience: How does shipping performance (late vs on-time) directly impact customer review scores?
* Seller Strategy: Which sellers are the top performers and which regions have the highest concentration of active customers?

## 🛠️ Tools Used
* Excel: Used for initial data inspection, metadata documentation, and as a bridge to import raw CSV files into the SQL environment.
* SQL (BigQuery): The backbone of the project. Used for DDL, DML, DQL, data cleaning, performing complex multi-table joins, and developing ETL pipelines to create a structured Star Schema.
* Power BI: Used to build an interactive, multi-page dashboard. Leveraged DAX (Data Analysis Expressions) to create custom measures for KPIs, time intelligence, and visualizations.
* GitHub: Utilized for project documentation, version control of SQL scripts, and hosting the portfolio.

## 🔄 Project Workflow
- Explain what i did and the process including the sections below: (include process Ask, Prepare, Process, Analyze, Share, Act)

### (Break down sections using 3 hashtags for each step)
-

## 💡 Key Insights & Recommnedataions 
- Bullet points on what key insights and what actions are best to take for the company

## 📦 Deliverables

### SOW (Scope of Work):
* project_scope_of_work: Used to outline the project main goals and considerations.

### SQL Pipeline (BigQuery Scripts):
* DML_Schema_Setup: Scripts used to define thable structures and data types.
* SQL_Cleanning_Setup: Scripts used to clean and transform data.
* DDL_Automation_Setup: Scripts used to insert, update, delete, and merge data across tables

### Dataset Metadata and Structure:
* dataset_metadata: Files stored for company and analysts to understand the data.

### 📊  Dashboard Preview
* Olist_360_Dashboard: The source file for the interactive Power BI report.
* Dashboard_Static_Report: A non-interactive version for quick viewing with no interactive slicers, buttons, or parameters applied.

## 📂 Project Structure
-  List of folders and files in the project and what they are

## ⚠️ Data Limitations & Future Work
- List data constriants and future improvements to improve or how i handeled data constriants
