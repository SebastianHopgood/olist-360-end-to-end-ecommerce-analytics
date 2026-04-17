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
---
The Ask Phase establishes the business context for the project by defining the core objectives, identifying key stakeholders, and framing technical questions into actionable SMART goals

**Define the Project Goal:** 
* The primary goal is to provide a 360-degree view of the Olist Store to measure performance, increase operational efficiency, improve customer satisfaction, and develop a selling strategy

**Define the Stakeholders:** 
* Olist CEO and Logistics Department

**Ask SMART (Specific, Measurable, Achievable, Relevant, Time-bound) Questions to Identify Business Problems/Needs:**
* Sales: Identify the top 5 product categories by total revenue and calculate their Month-over-Month (MoM) growth between 2016 and 2018
* Logistics: Determine the average lead time in days for each Brazilian state and identify regions where the average exceeds the estimated delivery date
* Satisfaction: Quantify the correlation coefficient between shipping delays (Actual vs. Estimated) and average review scores (1-5)
* Strategy: Identify sellers in the top 10% by sales volume and map the geographic density of customers to find unserved high-demand regions

**Develop A SOW (Scope of Work)**:
* SOW is created in order to give stakeholders a clear outline of the project which includes: project overview, scope, out-of-scope, project deliverables and files, key project milestones, and an estimated timeline for each milestone and project completion. Link to SOW PDF: "add link"

### PERPARE Phase
---
The Prepare Phase focuses on data discovery, source validation, and bias assessment to ensure the dataset is fit-for-purpose and technically sound for high-level business analysis

**Data Source:**
* The analysis utilizes the Olist Brazilian E-Commerce Public Dataset. This dataset contains approximately 100,000 orders made between 2016 and 2018

**Data Storage & Privacy:**
* Storage: Raw CSV files were extracted and loaded into Google BigQuery for centralized storage and high-performance SQL processing
* Privacy: All customer and seller data has been anonymized by the source to protect PII (Personally Identifiable Information)

**Checking for Data Bias That May Effect Results:**
* Context: Before ingestion, I performed initial data profiling on the raw CSV metadata and utilized Excel to audit geographic and temporal distributions. This revealed:
* Georaphic Bias: 40% of orders are from Sao Paulo. National averages are skewed by this high volume, high-infastrucutre region, masking slower delivery times in the North
* Temporal Bias: Data cuts off in September 2018
* Resonse Bias: Review scores (1-5) tend to represent "extremes". Customers typically only leave reviews for exceptionally good or very poor experiences
* Retention Bias: 98.8% of customers are one time buyers which make it difficult to calcualte loyalty trends

**Data Organization:**
* View all 9 raw relational datasets: [Raw Data](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/data/raw_datasets)

**Determining What Tools to Use:**
* Excel, SQL, Power BI, PowerPoint, GitHub/Git, VS_Code

**Data ROCCC (Reliable, Original, Comprehensive, Current, Cited):**
* Reliable: High - The dataset is a real-world public dataset provided by Olist, a major Brazillian e-commerce platform
* Origional: High - This is first-party data directily from the souce (Olist Store)
* Comprehensive: High - Includes 100k+ orders, customer locations, payment details, and review scores across 9 tables
* Current: Medium - Data spans 2016-2018. While its nor real-time, it is exellent for historical analysis and relevant to the stakeholders needs. (check if it acc has all dates needed)
* Cited: High - Fully documented and hosted on Kaggle with clear ownership

### PROCESS Phase (Medallion Architecture)
---

**Bronze (Raw):**
---
The Bronze Layer serves as the landing zone for raw data, ensuring a permanent record of the original source files and preserving data lineage for auditing
* Initial data profiling and quality audit using Microsoft Excel to remove unnecessary columns, fix headers with proper names and snake casing, and removing broken fromatting to ensure a successful data load. Columns that were removed were: review_comment_title and review comment message
* Ingested 9 raw Olist datasets from CSVs into BigQuery without modifications to preserve data lineage
* Validated data post data integration to confirm proper data load, correct column names, and correct data types
* Bronze Data Layout:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/7202dc2ddd170f9ed65a5f78989c84466ffaacd2/data/raw_data_intergration_preview.png)

**Silver (Staging/Cleaned):**
---
The Silver Layer focus is on data quality and standardization, transforming raw files into clean, validated, and gatting staging tables ready for modeling
* Schema Enforcement: Defined DDL schemas to ensure data types (Dates, Floats, Strings, etc.)
* Cleaning & Standardization: Used SQL to handle nulls, filtered out missing primary keys, prepared data for proper joins, implemented headder correction, remove duplicates, string normalization, and standardize formats across the 9 datasets to prep data for readability and data digestion for Power BI visualizations
* Data Validation: Ensured data is accurate, complete, and consistent across all datasets pre and post data integration
* View clean data previews: [View All Cleanned Data Previews](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/data/cleaned_data_previews)
* View indepth SQL scripts and details via sql script files:
[View All SQL Cleaning Scripts](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/sql%20scripts/02_silver)
* Example of Code:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/c1b512c2cc032e9508f922e1ff9b18edf6bd15e6/data/SQL_query_staged_orders_picture.png)
* Staging Data Layout:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/707e180cd0e5e59e27f7d6d5dd2df22e8d6f9cda/data/BigQuery_staging_dataset_layout.png)

**Gold (Curated):**
---
The Gold Layer represents the final, cleaned, and modeled state of the data. I transformed the normalized staged data into a Star Schema to optimize for analytical performance and business reporting
**The Star Schema:**
* Fact Table (main table): orders_fact (joined datasets: orders, order_items, order_payments, order_reviews)
* Dimension Tables: dim_customers, dim_sellers, dim_date, dim_geolocation, dim_products (joined datasets: dim_products and category_name_translation)

**Relationships:**
* orders_fact serves as the central hub 
* dim_customers, dim_sellers, and dim_products connect to orders_fact via their respective IDs (customer_id, seller_id, product_id).
* dim_date connects to the fact table's order_purchase_timestamp via date_key.
* dim_geolocation acts as a supporting dimension, joining to dim_customers and dim_sellers via zip_code_prefix to facilitate geographic density mapping.

**Transformation Logic**:
I implemented the following engineering best practices in this layer:
* Deduplication: Pre-aggregated payments to prevent row-doubling and ensure revenue accuracy
* Language Translation: Joined category lookups to provide English labels for English-speaking stakeholders
* Time Intelligence: Built a custom dim_date table with Monday-start logic and weekend flags for seasonal analysis
* Spatial Optimization: Aggregated geolocation coordinates to the Zip Prefix level to protect PII and improve map rendering speeds

**SQL Documentation:**
Click to view Gold Layer SQL Scripts: [All Table SQL Scripts](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/sql%20scripts/03_gold)
* Example of Code:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/b7f97f79a975b9fc0cc67228064e96175f8691ec/data/order_fact_query_preview.png)
* Gold/Analytical Layer Layout:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/95460da69e90f424b67ac96f1375d50083036543/data/gold_layer_layout.png)

### Analyze Phase
---
The Analyze phase I transitioned from data cleaning to exploratory and advanced analysis using SQL. My goal was to move beyond simple numbers and uncover the "why" behind the Olist Store’s performance

To ensure a high-performance and insightful dashboard, I focused on three technical pillars:
* Pre-Aggregation & View Creation: I developed SQL views to aggregate millions of raw transaction records into streamlined summaries by state, category, and seller. This optimized data loading times for the final visualization
* Feature Engineering (Calculated Columns): I created custom logic to calculate critical business KPIs, such as Lead Time Days (the delta between purchase and delivery) and On-Time Delivery Status (comparing actual delivery vs. estimated dates)
* Intertwined Insights: I performed multi-table joins to correlate disparate data points—specifically linking Logistics Performance directly to Customer Review Scores—to prove the business impact of shipping delays

1. Logistics & Customer Experience
* The Approach:
* The Code: (1-2 code queries max)
* The Insight:

Sales & Seller Strategy
---
The Approach:
* **Top 5 Category Identification:** I wrote an analysis query to identify the top 5 product categories by total revenue. Therefore, i wil be aware on what product categories to display in the Power BI dashboard for calculating Month-over-Month (MoM) growth
* **Seller Tiering & Density:** I created dedicated BigQuery views to isolate the top 10% of sellers by volume and cross-reference their locations with customer density. This structured approach ensured data consistency and optimized the map performance in Power BI
* **Visual Strategy:** I plan to layer both queries into a single map in Power BI by using customer density to show "hot spots" (demand) and markers for elite sellers (supply), I was able to visually pinpoint unserved high-demand regions
* Top 5 Product Categories:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/bdfb749c96e8c223c14a61452bcb5adea9cb3014/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_prodcut_categories_picture.png)
* Extra Insights/Context: [Shows Percentage of Product Category Revenue Share](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/main/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_product_categories_percentage_for_context.sql)
* Insights:
* Top 10% Sellers by Order Amount:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/f1554a3611e1cb3846d51c578ec1c101e385c40b/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/seller_performance_top_10%25.png)
* Insights:
* Market Density:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/c36955022def744561a89dfe8a32695b117f531a/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/market_density_pic.png)

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
