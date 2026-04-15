# 🚀 Olist 360: E-Commerce End-to-End Business Intelligence (EDA)

## 📋 Overview
The project analyzes a real-world Brazilian ecommerce public dataset of orders made at the Olist Store, containing approximately 100,000 orders between 2016 and 2018. The dataset is structured across 9 relational tables covering customers, orders, locations, products, categories, sellers, and reviews, enabling a full view of the end-to-end e-commerce process from purchase to delivery and customer feedback

The goal of the project is to simulate a real business scenario by developing an interactive dashboard for stakeholders to visualize business answers along with an executive summary on how to improve the business. To support this, raw CSV data was imported and integrated into SQL using Excel, BigQuery datasets were created and changed within SQL using DML and DDL, then cleaned and transformed using SQL processes, and multiple tables were joined together to create a star schema for analysis. The cleaned datasets were connected to Power BI, where an interactive dashboard was built and used to help develop the perfect executive insight presentation

## 🎯 Objectives
The primary goal is to provide a 360-degree view of the Olist Store to measure preformance, increase operational efficiency, improve customer satisfaction, and develop a selling strategy. Stakeholders requested to know:
* Sales Performance: Which product categories drive the most revenue and how is sales volumne trending over time?
* Logistics & Delivery: What is the average delivery time across different Brazilian states and where are the most significant shipping delays?
* Customer Experience: How does shipping performance (late vs on-time) directly impact customer review scores?
* Seller Strategy: Which sellers are the top performers and which regions have the highest concentration of active customers?

## 🛠️ Tools Used
* Excel: Used for initial data inspection, metadata documentation, and as a bridge to import raw CSV files into the SQL environment
* SQL (BigQuery): The backbone of the project. Used for DDL, DML, DQL, data cleaning, performing complex multi-table joins, and developing ETL pipelines to create a structured Star Schema
* Power BI: Used to build an interactive, multi-page dashboard. Leveraged DAX (Data Analysis Expressions) to create custom measures for KPIs, time intelligence, and visualizations
* GitHub/Git: Utilized for project documentation, version control of code scripts, and hosting the portfolio
* Vs Code: Joined with Git to control project codes files

## 🔄 Project Workflow

### ASK Phase

* **Define the Project Goal:** The primary goal is to provide a 360-degree view of the Olist Store to measure performance, increase operational efficiency, improve customer satisfaction, and develop a selling strategy

* **Define the Stakeholders:** Olist CEO and Logistics Department

* **Ask SMART (Specific, Measurable, Achievable, Relevant, Time-bound) Questions to Identify Business Problems/Needs:**

* Sales: Identify the top 5 product categories by total revenue and calculate their Month-over-Month (MoM) growth between 2016 and 2018
* Logistics: Determine the average lead time in days for each Brazilian state and identify regions where the average exceeds the estimated delivery date
* Satisfaction: Quantify the correlation coefficient between shipping delays (Actual vs. Estimated) and average review scores (1-5)
* Strategy: Identify sellers in the top 10% by sales volume and map the geographic density of customers to find unserved high-demand regions

* **Develop A SOW (Scope of Work)**:
* SOW is created in order to give stakeholders a clear outline of the project which includes: project overview, scope, out-of-scope, project deliverables and files, key project milestones, and an estimated timeline for each milestone and project completion. Link to SOW PDF: "add link"

### PERPARE Phase

* **Data Source:**
* The analysis utilizes the Olist Brazilian E-Commerce Public Dataset. This dataset contains approximately 100,000 orders made between 2016 and 2018.

* **Data Storage & Privacy:**
* Storage: Raw CSV files were extracted and loaded into Google BigQuery for centralized storage and high-performance SQL processing
* Privacy: All customer and seller data has been anonymized by the source to protect PII (Personally Identifiable Information)

* **Checking for Data Bias That May Effect Results:** Before ingestion, I performed initial data profiling on the raw CSV metadata and utilized Excel to audit geographic and temporal distributions. This revealed:
* Georaphic Bias: 40% of orders are from Sao Paulo. National averages are skewed by this high volume, high-infastrucutre region, masking slower delivery times in the North
* Temporal Bias: Data cuts off in September 2018
* Resonse Bias: Review scores (1-5) tend to represent "extremes". Customers typically only leave reviews for exceptionally good or very poor experiences
* Retention Bias: 98.8% of customers are one time buyers which make it difficult to calcualte loyalty trends

* **Data Organization:** The dataset consists of 9 relational tables:
* olist_customers_dataset.csv
* olist_geolocation_dataset.csv
* olist_order_items_dataset.csv
* olist_order_payments_dataset.csv
* olist_order_reviews_dataset.csv
* olist_orders_dataset.csv
* olist_products_dataset.csv
* olist_sellers_dataset.csv
* product_category_name_translation.csv

* **Determining What Tools to Use:** Excel, SQL, Power BI, PowerPoint, GitHub/Git, VS_Code

* **Data ROCCC (Reliable, Original, Comprehensive, Current, Cited):**
* Reliable: High - The dataset is a real-world public dataset provided by Olist, a major Brazillian e-commerce platform
* Origional: High - This is first-party data directily from the souce (Olist Store)
* Comprehensive: High - Includes 100k+ orders, customer locations, payment details, and review scores across 9 tables
* Current: Medium - Data spans 2016-2018. While its nor real-time, it is exellent for historical analysis and relevant to the stakeholders needs. (check if it acc has all dates needed)
* Cited: High - Fully documented and hosted on Kaggle with clear ownership

### PROCESS Phase


## 💡 Key Insights & Recommnedataions 
- Bullet points on what key insights and what actions are best to take for the company

## 📦 Deliverables

### SOW (Scope of Work):
* project_scope_of_work: Used to outline the project main goals and considerations

### Access to SQL and DAX Scipts:
* DDL_Schema_Setup: Scripts used to define the table structures and data types
* SQL_Cleaning_Setup: Scripts used to clean and transform data
* DML_Data_Updating: Scripts used to insert, update, delete, and merge data across tables

### Dataset Metadata and Structure:
* dataset_metadata: Files stored for company and analysts to understand the data

### Dashboard Preview
* Olist_360_Dashboard: The source file for the interactive Power BI report
* Executive_Insights_Presentation: A Summarized PowerPoint presentation highlighting key preformance trends, data-driven insights from the 2016–2018 period, and strategic recommendations for the business

### Executive Summary:
* Executive_Summary: A concise report summarizing the key insights and data backed recommendations for the Olist Stakeholders

## 📂 Project Structure
-  List of folders and files in the project and what they are

## ⚠️ Data Limitations & Future Work
- List data constriants and future improvements to improve or how i handeled data constriants
