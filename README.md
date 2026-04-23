# 🚀 Olist 360: E-Commerce End-to-End Business Intelligence (EDA)

## 📋 Overview
This project analyzes a real-world multi-seller marketplace dataset from Olist, a Brazilian e-commerce platform. The analysis covers approximately 100,000 orders from 2016 to 2018 across 9 relational tables. This ecosystem provides a 360-degree view of the interactions between independent sellers, customers, and logistics providers.
The goal was to simulate a professional data environment by transforming raw data into a structured data warehouse, an interactive dashboard, and a strategic executive summary.

Technical Workflow:
* **Data Integration:** Imported raw CSV files into BigQuery via Excel, establishing the initial data stage
* **Medallion Architecture:** Structured the project into Bronze (Raw), Silver (Cleaned), and Gold (Analytical) layers to ensure a high-quality data pipeline
* **Data Engineering:** Used DDL for schema design and DML to engineer new columns (feature engineering) specifically for deep-dive analysis
* **Analysis & Visualization:** Performed advanced data analysis across SQL and Power BI, joining tables into a Star Schema to power an interactive dashboard and develop data-driven executive insights

## 🎯 Objectives
The primary goal is to provide a 360-degree view of the Olist marketplace ecosystem to measure performance, increase operational efficiency, improve customer satisfaction, and optimize seller recruitment strategy. 

To identify core business needs, I developed SMART (Specific, Measurable, Achievable, Relevant, Time-bound) questions focused on four key pillars:

* **Sales:** Identify the top 5 product categories by total revenue and analyze monthly revenue trends from 2016 to 2018 to understand how category performance changes over time
* **Logistics:** Determine the average lead time in days for each Brazilian state and identify regions where the average exceeds the estimated delivery date
* **Satisfaction:** What is the satisfaction 'penalty' for shipping delays, what is the root cause of dissatisfied customers, at what threshold does customer sentiment collapse, and average review scores (1-5)
* **Strategy:** Identify sellers in the top 10% by sales volume and compare seller concentration with customer distribution by state to highlight regions where demand is high but seller presence is relatively low

## 🛠️ Tools Used
* Excel: Used for initial data inspection and as a bridge to import raw CSV files into the SQL environment
* SQL (BigQuery): The backbone of the project. Used for anlysis, DDL, DQL, DML, data cleaning, data warehousing, performing complex multi-table joins, and developing ETL pipelines to create a structured Star Schema
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
* Sales: Identify the top 5 product categories by total revenue and analyze monthly revenue trends from 2016 to 2018 to understand how category performance changes over time
* Logistics: Determine the average lead time in days for each Brazilian state and identify regions where the average exceeds the estimated delivery date
* Satisfaction: What is the satisfaction 'penalty' for shipping delays, what is the root cause of dissatisfied customers, at what threshold does customer sentiment collapse, and average review scores (1-5)
* Strategy: Identify sellers in the top 10% by sales volume and compare seller concentration with customer distribution by state to highlight regions where demand is high but seller presence is relatively low

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
* Bronze/Raw Data Layout:
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
* Silver/Staging Data Layout:
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
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/8641a15f83b5192e12b1f00bed2ff07083f72f1e/data/gold_layer_layout_picture.png)

### Analyze Phase
---
The Analyze phase focused on exploring Olist Store’s performance by combining SQL-based transformations with Power BI visual analysis. The goal was to evaluate logistics efficiency, seller distribution, and customer satisfaction to understand key drivers of business performance

Sales & Seller Strategy
---
The Approach:
* **Identified High-Performing Sellers:**
* A SQL query using window functions was used to classify sellers into the top 10% by sales volume. This segment highlights high-capacity sellers that could be prioritized for promotional opportunities to increase platform sales
* **Top Product Revenue Contribution Analysis:**
* SQL was used to identify the top 5 product categories by revenue, along with a Top 10 breakdown for comparison. This helped quantify revenue concentration and communicate how a small number of categories contribute significantly to total revenue
* **Time Intelligence Implementation:**
* A dedicated date table was created in Power BI and connected to transactional data to enable time-based analysis. This allowed monthly revenue trends (2016–2018) to be tracked and product category performance to be evaluated over time
* **Seller vs Customer Distribution Analysis:**
* A geographic comparison was conducted in Power BI to evaluate seller concentration against customer distribution by state. This highlighted regions with high demand but relatively low seller presence, indicating potential market expansion opportunities
* **KPI and Measure Development (Power BI / DAX):** Created calculated measures to support key metrics such as total revenue, average order value (AOV), order count, and top 5% produt categories revenue share

Evidence:
* High-Performing Sellers (Top 10%):
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/f1554a3611e1cb3846d51c578ec1c101e385c40b/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/seller_performance_top_10%25.png)

* Top Product Categories (Top 5 Revenue Analysis):
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/bdfb749c96e8c223c14a61452bcb5adea9cb3014/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_prodcut_categories_picture.png)

* Top Product KPI (DAX):
*  [image alt](put dax pic in here)


Logistics & Customer Experience
---
The Approach:
* **Data Preparation Using DML transformations:**
* Additional calculated columns were created to support logistics analysis, including Seller Processing Days, Estimated Delivery Days, Days Delayed, and Lead Time Days. A Shipping Status field was also created using a CASE statement to classify orders into On-Time and Delayed categories
* **State-Level Logistics Performance Analysis (Power BI):**
* Average lead time and estimated delivery time were analyzed across Brazilian states to assess regional logistics efficiency. Visual comparisons were used to identify whether any states exceeded estimated delivery thresholds (none exceeded on average), highlighting consistent delivery performance across regions
* **Customer Satisfaction vs Shipping Performance:**
* Shipping delays were analyzed against customer review scores (1–5) to evaluate the impact of logistics performance on satisfaction. This helped assess whether delays correlate with reduced customer sentiment and identify thresholds where satisfaction begins to decline
* **Root Cause Exploration of Customer Dissatisfaction:**
* Review scores were segmented against delivery performance metrics to explore potential drivers of dissatisfaction. This analysis focused on identifying whether shipping delays were a primary factor affecting customer sentiment or if other variables contributed
* **KPI and Measure Development (Power BI / DAX):**
* Developed calculated measures for average customer rating, delivery promise accuracy, average lead days, average seller processing days, and delayed shipping penalty (rating impact)

* Data Preperation (CASE Statements & Calculated Columns):
* ![image alt]()

Evidence:
* State-Level Logistics Performance
* ![image alt]()
* Delivery Delay vs Customer Satisfaction
* ![image alt]()
* Customer Rating Distribution by Shipping Status
* ![image alt]()
* Seller vs Customer Distribution by State
* ![image alt]()




Adding Calculated and Grouping Columns:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/db8ff1754a4beac412fe53424a691d0259e167e0/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/new_logistics_columns_picture.png)

Logistics Performance:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/77f175fd5b94e5d920cb37b8570ebe94cf407d9d/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/logistics_performance_picture.png)

Shipping Customer Statisfaction:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/77f175fd5b94e5d920cb37b8570ebe94cf407d9d/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/shipping_satisfaction_impact_picture.png)

Top 5 Product Categories:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/bdfb749c96e8c223c14a61452bcb5adea9cb3014/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_prodcut_categories_picture.png)
* Extra Insights/Context: [Shows Percentage of Product Category Revenue Share](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/main/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_product_categories_percentage_for_context.sql)

Top 10% Sellers by Order Amount:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/f1554a3611e1cb3846d51c578ec1c101e385c40b/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/seller_performance_top_10%25.png)

* Market Density:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/b161567bb9ab160c59be7e52d58e27813f53aa74/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/market_density_picture.png)

### Share Phase
---
This phase summarizes key findings from the analysis to highlight business performance across sales, logistics, and customer experience, focusing on key patterns and relationships in the data

🛒 Sales & Seller Strategy:
--- 
Key Findings:
* **Core Categories:** The Top 5 product categories (Bed Bath Table, Health Beauty, Computers Accessories, Furniture Decor, and Watches Gifts) dominate the market, accounting for 38.9% of total revenue share
* **Growth Trends:** Most categories showed consistent growth until a general decline began in April 2018. Health Beauty is the notable exception, maintaining a positive projected growth trajectory
* **Geographic Opportunity:** Demand is heavily concentrated in five Brazilian states (SP, MG, PR, RJ, SC). However, these high-demand regions are among the lowest in seller distribution (ranking in the top 11/27), indicating a significant opportunity for seller recruitment
* **Financial KPIs:**
* Total Revenue: 20.58M
* Average Order Value: 206.95
* Total Orders: 114k

Sales & Seller Strategy Dashboard Preview:
* [image alt]()

🚚 Logistics & Customer Experience:
---
Key Findings:
* **The "Late Delivery" Penalty:** There is a direct correlation between shipping delays and customer dissatisfaction. While the average rating is 4.0 stars, a delay of just 1 day drops the average to 3.68. Sentiment collapses at the 3-day mark (2.58 stars) and hits a floor of 1.5 stars for delays of 6+ days
* **Operational Efficiency:** The average lead time is 12.5 days, with average seller processing taking 2.4 days. Currently, no state averages exceed their estimated delivery dates, resulting in a 92.1% delivery promise accuracy
* **Seasonal Bottlenecks:** Late order percentages consistently spike during Q1 and Q4 across all years, identifying these periods as high-risk for customer satisfaction due to logistics strain

Logistics & Customer Experience Dashbaord Preview:
* [image alt]()

### ACT Phase
---
This phase translates insights from the analysis into actionable business recommendations. It outlines what the business should do next to improve performance in areas such as sales, logistics, and customer experience, based on the patterns and issues identified in the data.

🛒 Sales & Seller Strategy — Actions
* **Regional Seller Acquisition:** Launch a targeted recruitment campaign for sellers in SP, MG, PR, RJ, and SC. By increasing seller density in these high-demand zones, Olist can reduce cross-country shipping distances and improve regional competitiveness
* **Category-Specific Incentives:** Since Health & Beauty is the primary growth driver, Olist should offer lower commission rates or "featured placement" for new sellers in this category to capitalize on the upward trend
* **High-Volume Seller Support:** Provide dedicated account management or premium tools for the Top 10% of sellers to ensure the core 62.4% of revenue (from top 10 categories) remains stable

🚚 Logistics & Customer Experience — Actions
* **Automated Delay Interventions:** Implement an automated "Early Warning System" that triggers at 48 hours of seller processing time. This gives Olist a 24-hour window to nudge sellers before hitting the 3-day sentiment collapse threshold
* **Predictive Delivery Windows:** Adjust the "Estimated Delivery Date" algorithm to be more conservative during Q1 and Q4. By proactively extending the promised date during peak seasons, Olist protects the 92.1% accuracy rate and prevents the 1.5-star "late penalty"
* **Seller Performance Tiering:** Incorporate the 1.5-star "late penalty" data into seller KPIs. Sellers who consistently exceed the 12.5-day average lead time should receive lower search rankings to protect the overall marketplace reputation

📊 Data Storytelling Presentation
* A summary of key insights and recommendations from the analysis
* [image alt]()

## 💡 Key Insights & Recommnedataions 
- Bullet points on what key insights and what actions are best to take for the company

## 📦 Deliverables

### SOW (Scope of Work):
* project_scope_of_work: Used to outline the project main goals and considerations

### Access to SQL and DAX Scipts:
* sql scripts folder: Includes silver, gold, and analysis sql scripts. Silver and Gold show my process of cleaning and transfering data from bronze to silver, and create a star schema by developing final analytical tables and views. Analysis scripts show my process of major queries I wrote to gain deep insights to help understand the data

### Dashboard Preview
* Olist_360_Dashboard: The source file for the interactive Power BI report
* Executive_Insights_Presentation: A Summarized PowerPoint presentation highlighting key preformance trends, data-driven insights from the 2016–2018 period, and strategic recommendations for the business

### Executive Summary:
* Executive_Summary: A concise report summarizing the key insights and data backed recommendations for the Olist Stakeholders

## 📂 Project Structure
-  List of folders and files in the project and what they are

## ⚠️ Data Limitations & Future Work
- List data constriants and future improvements to improve or how i handeled data constriants
