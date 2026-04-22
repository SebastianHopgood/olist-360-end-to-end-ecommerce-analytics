# 🚀 Olist 360: E-Commerce End-to-End Business Intelligence (EDA)

## 📋 Overview
The project analyzes a real-world Brazilian ecommerce public dataset of orders made at the Olist Store, containing approximately 100,000 orders between 2016 and 2018. The dataset is structured across 9 relational tables covering customers, orders, locations, products, categories, sellers, and reviews, enabling a full view of the end-to-end e-commerce process from purchase to delivery and customer feedback

The goal of the project is to simulate a real business scenario by developing an interactive dashboard for stakeholders to visualize business answers along with an executive summary on how to improve the business. To support this, raw CSV data was imported and integrated into SQL using Excel, BigQuery datasets were created and changed within SQL using DML and DDL, then cleaned and transformed using SQL processes, and multiple tables were joined together to create a star schema for analysis. The cleaned datasets were connected to Power BI, where an interactive dashboard was built and used to help develop the perfect executive insight presentation

## 🎯 Objectives
The primary goal is to provide a 360-degree view of the Olist Store to measure preformance, increase operational efficiency, improve customer satisfaction, and develop a selling strategy. Stakeholders requested to know:
* Sales: Identify the top 5 product categories by total revenue and analyze monthly revenue trends from 2016 to 2018 to understand how category performance changes over time?
* Logistics: Determine the average lead time in days for each Brazilian state and identify regions where the average exceeds the estimated delivery date?
* Satisfaction: What is the satisfaction 'penalty' for shipping delays, what is the root cause of dissatisfied customers, at what threshold does customer sentiment collapse, and average review scores (1-5)?
* Strategy: Identify sellers in the top 10% by sales volume and compare seller concentration with customer distribution by state to highlight regions where demand is high but seller presence is relatively low?

## 🛠️ Tools Used
* Excel: Used for initial data inspection, metadata documentation, and as a bridge to import raw CSV files into the SQL environment
* SQL (BigQuery): The backbone of the project. Used for DDL, DQL, data cleaning, performing complex multi-table joins, and developing ETL pipelines to create a structured Star Schema
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
* SQL and DAX were used to identify the top 5 product categories by revenue, along with a Top 10 breakdown for comparison. This helped quantify revenue concentration and communicate how a small number of categories contribute significantly to total revenue
* **Time Intelligence Implementation:**
* A dedicated date table was created in Power BI and connected to transactional data to enable time-based analysis. This allowed monthly revenue trends (2016–2018) to be tracked and product category performance to be evaluated over time
* **Seller vs Customer Distribution Analysis:**
* A geographic comparison was conducted in Power BI to evaluate seller concentration against customer distribution by state. This highlighted regions with high demand but relatively low seller presence, indicating potential market expansion opportunities

High-Performing Sellers SQL View:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/f1554a3611e1cb3846d51c578ec1c101e385c40b/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/seller_performance_top_10%25.png)

* Top Products SQL Analsysis:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/bdfb749c96e8c223c14a61452bcb5adea9cb3014/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_prodcut_categories_picture.png)

* Top Product KPI Power BI:
*  [image alt](put dax pic in here)


Logistics & Customer Experience
---
* **Data Preparation using DML transformations:**
* Additional calculated columns were created to support logistics analysis, including Seller Processing Days, Estimated Delivery Days, Days Delayed, and Lead Time Days. A Shipping Status field was also created using a CASE statement to classify orders into On-Time and Delayed categories
* **State-Level Logistics Performance Analysis (Power BI):**
* Average lead time and estimated delivery time were analyzed across Brazilian states to assess regional logistics efficiency. Visual comparisons were used to identify whether any states exceeded estimated delivery thresholds (none exceeded on average), highlighting consistent delivery performance across regions
* **Customer Satisfaction vs Shipping Performance:**
* Shipping delays were analyzed against customer review scores (1–5) to evaluate the impact of logistics performance on satisfaction. This helped assess whether delays correlate with reduced customer sentiment and identify thresholds where satisfaction begins to decline
* **Root Cause Exploration of Customer Dissatisfaction:**
* Review scores were segmented against delivery performance metrics to explore potential drivers of dissatisfaction. This analysis focused on identifying whether shipping delays were a primary factor affecting customer sentiment or if other variables contributed



Logistics & Customer Experience
--- 
Adding Calculated and Grouping Columns:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/db8ff1754a4beac412fe53424a691d0259e167e0/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/new_logistics_columns_picture.png)

Logistics Performance:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/77f175fd5b94e5d920cb37b8570ebe94cf407d9d/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/logistics_performance_picture.png)

Insights: Logistics Performace
* **Regional Performance Gap:** The South and Southeast regions (e.g., São Paulo and Minas Gerais) show the highest efficiency, with average lead times under 8–10 days, while the North/Northeast regions (e.g., Acre and Alagoas) often exceed 20+ days
* **Delivery Promise Accuracy:** High-delay states show a significant disconnect between "Estimated" and "Actual" delivery dates. This suggests that the platform’s current estimation algorithm is underestimating the logistical challenges of the North, leading to lower customer trust
* **Infrastructure Impact:** Regions with the highest pct_late_orders directly correlate with areas of lower infrastructure density, indicating that logistics bottlenecks are geographic rather than seller-dependent
* **The "Satisfaction Penalty":** Logistics is the #1 driver of negative sentiment; states with a higher percentage of Delayed statuses show a direct, measurable drop in average regional review scores compared to the national average

Shipping Customer Statisfaction:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/77f175fd5b94e5d920cb37b8570ebe94cf407d9d/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/shipping_satisfaction_impact_picture.png)

Insights: Shipping Customer Statisfaction
*⭐ **The Satisfaction Penalty:** Orders delivered late have a massive impact on sentiment, typically causing a ~2.1 to 2.4-star drop in average ratings compared to on-time deliveries
* 📉 **The 1-Star Threshold:** While overall Olist ratings are high (mostly 4-5 stars), delayed orders are heavily skewed toward 1-star reviews, proving that delivery failure is the single largest driver of negative feedback
* 🛑 **Retention Risk:** Customers who experience shipping delays are significantly less likely to become repeat buyers, contributing to the platform's high one-time purchaser rate of ~98.8%
* 📦 **Quality vs. Speed:** Analysis reveals that customers are often willing to wait for products, but missing the "Estimated Delivery Date" is what triggers the bad review, regardless of how fast the shipping was

Sales & Seller Strategy
---
The Approach:
* **Top 5 Category Identification:** I wrote an analysis query to identify the top 5 product categories by total revenue. Therefore, i wil be aware on what product categories to display in the Power BI dashboard for calculating Month-over-Month (MoM) growth
* **Seller Tiering & Density:** I created dedicated BigQuery views to isolate the top 10% of sellers by volume and cross-reference their locations with customer density. This structured approach ensured data consistency and optimized the map performance in Power BI
* **Visual Strategy:** I plan to layer both queries into a single map in Power BI by using customer density to show "hot spots" (demand) and markers for elite sellers (supply), I was able to visually pinpoint unserved high-demand regions

Top 5 Product Categories:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/bdfb749c96e8c223c14a61452bcb5adea9cb3014/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_prodcut_categories_picture.png)
* Extra Insights/Context: [Shows Percentage of Product Category Revenue Share](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/main/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_product_categories_percentage_for_context.sql)

Insights: Top 5 Categories
* **Revenue Concentration:** While there are 74 total categories, the Top 5 drive 39.8% of total revenue, and the Top 10 drive 62.4%
* **Business Impact:** This high concentration means any supply chain disruption in these core categories (like Health/Beauty or Watches/Gifts) would significantly impact the store's total bottom line
* **Strategy:** I focused the MoM growth analysis on these specific categories to ensure the business's primary revenue engines are performing consistently month-over-month

Top 10% Sellers by Order Amount:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/f1554a3611e1cb3846d51c578ec1c101e385c40b/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/seller_performance_top_10%25.png)

Insights: Top 10% Sellers
* **Operational Backbone:** A tiny fraction of the seller base (10%) manages the vast majority of order volume, representing the store's primary engine for fulfillment
* **Performance Benchmarking:** By isolating these elite sellers, we can establish gold-standard KPIs for delivery speed and reliability to compare against lower-tier sellers
* **Strategic Mapping:** This list allows us to plot our "Elite Supply" on a map to see if they are actually located near our "High-Demand" customer clusters

* Market Density:
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/b161567bb9ab160c59be7e52d58e27813f53aa74/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/market_density_picture.png)

Insights: Market Density
* **Supply-Demand Mismatch:** Pinpoints regions where the number of customers far outweighs the local seller presence, creating "Supply Deserts"
* **Logistics Friction:** States with high customer counts but low seller counts represent areas where shipping is likely slower and more expensive due to cross-state transit
* **Growth Opportunity:** Provides a roadmap for seller recruitment; by targeting new sellers in these high-demand "Hot Spots," the business can decentralize its supply chain and improve delivery speeds

### Share Phase
---

* test

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
