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
* **Excel:** Used for initial data inspection and as a bridge to import raw CSV files into the SQL environment
* **SQL (BigQuery):** The backbone of the project. Used for anlysis, DDL, DQL, DML, data cleaning, data warehousing, performing complex multi-table joins, and developing ETL pipelines to create a structured Star Schema
* **Power BI:** Used to build an interactive, multi-page dashboard. Leveraged DAX (Data Analysis Expressions) to create custom measures for KPIs, time intelligence, and visualizations
* **GitHub/Git:** Utilized for project documentation, version control of code scripts, and hosting the portfolio
* **VS Code:** Joined with Git to control project codes files

## 🔄 Project Workflow

### ASK Phase
---
The Ask Phase establishes the business context by defining core objectives, identifying key stakeholders, and framing technical questions into actionable SMART goals

**Define the Project Goal:** 
* The primary goal is to provide a 360-degree view of the Olist Marketplace to measure performance, increase operational efficiency, improve customer satisfaction, and optimize seller recruitment strategies

**Define the Stakeholders:** 
* Olist CEO and Logistics Department

**Ask SMART (Specific, Measurable, Achievable, Relevant, Time-bound) Questions to Identify Business Problems/Needs:**
* **Sales:** Identify the top 5 product categories by total revenue and analyze monthly revenue trends from 2016 to 2018 to understand how category performance changes over time
* **Logistics:** Determine the average lead time in days for each Brazilian state and identify regions where the average exceeds the estimated delivery date
* **Satisfaction:** What is the satisfaction 'penalty' for shipping delays, what is the root cause of dissatisfied customers, at what threshold does customer sentiment collapse, and average review scores (1-5)
* **Strategy:** Identify sellers in the top 10% by sales volume and compare seller concentration with customer distribution by state to highlight regions where demand is high but seller presence is relatively low

**Develop A Scope of Work (SOW):**
* A SOW was created to provide stakeholders with a clear project roadmap, outlining the project's boundaries, key milestones, and deliverables
* [View SOW](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/fd4d6646d8c9e48c85b625cb5472204c1d4656db/documentation/olist_360_project_scope_of_work.pdf)

### PREPARE Phase
---
The Prepare Phase focuses on data discovery, source validation, and bias assessment to ensure the dataset is fit-for-purpose and technically sound for high-level business analysis

**Data Source:**
* The analysis utilizes the Olist Brazilian E-Commerce Public Dataset, containing approximately 100,000 orders made between 2016 and 2018

**Data Storage & Privacy:**
* **Storage:** Raw CSV files were extracted and loaded into Google BigQuery for centralized storage and high-performance SQL processing
* **Privacy:** All customer and seller data has been anonymized by the source to protect PII (Personally Identifiable Information)

**Checking for Data Bias:**

Before ingestion, I performed data profiling on the raw metadata and used Excel to audit geographic and temporal distributions. This revealed:

* **Georaphic Bias:** 40% of orders originate from São Paulo. National averages are heavily skewed by this high-infrastructure region, potentially masking slower delivery times in Northern regions
* **Temporal Bias:** The dataset concludes in September 2018; performance trends in all years had some months with little to no data
* **Resonse Bias:**  Review scores (1-5) tend toward "extremes." Customers typically provide feedback for exceptionally good or very poor experiences, leaving a gap in "neutral" sentiment
* **Retention Bias:** 98.8% of customers are one-time buyers, making it difficult to calculate long-term loyalty trends

**Data Organization:**
* View all 9 raw relational datasets: [Raw Data](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/data/raw_datasets)

**Determining What Tools to Use:**
* Excel, SQL, Power BI, PowerPoint, GitHub/Git, VS_Code

**Data ROCCC (Reliable, Original, Comprehensive, Current, Cited):**
* Reliable: High - Real-world public dataset provided by Olist, a major Brazilian e-commerce platform
* Origional: High - First-party data directly from the source
* Comprehensive: High - Includes 100k+ orders, locations, payments, and reviews across 9 relational tables
* Current: Data spans 2016–2018. While not real-time, it is excellent for historical analysis.
* Cited: High - Fully documented and hosted on Kaggle with clear ownership

### PROCESS Phase (Medallion Architecture)
---

🥉 **Bronze (Raw Layer):**
---
The Bronze Layer serves as the landing zone for raw data, ensuring a permanent record of the original source files and preserving data lineage for auditing
* **Data Profiling:** Conducted an initial audit in Excel to standardize headers (snake_case) and remove broken formatting
* **Dimensional Reduction:** Removed high-cardinality/low-utility columns (review_comment_title, review_comment_message) to optimize storage and processing
* **Ingestion:** Loaded 9 raw datasets into BigQuery without modification to maintain an immutable record of the source data
* **Bronze/Raw Data Layout:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/7202dc2ddd170f9ed65a5f78989c84466ffaacd2/data/raw_data_intergration_preview.png)

🥈 **Silver (Staging/Cleaned Layer):**
---
The Silver Layer focuses on data quality and standardization, transforming raw files into clean, validated staging tables ready for modeling

* **Schema Enforcement:** Defined DDL schemas to ensure strict data types (Dates, Floats, Strings) across all tables.
* **Standardization:** Used SQL to handle null values, filter missing primary keys, normalize strings, and remove duplicates.
* **Validation:** Verified data consistency and referential integrity pre- and post-ingestion to ensure reliability for downstream reporting.
* **Scripts:**
* View SQL Cleaning Scripts: [View All SQL Cleaning Scripts](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/sql%20scripts/02_silver)
* View Data Previews: [View All Cleanned Data Previews](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/data/cleaned_data_previews)
* **Example of Code:** ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/c1b512c2cc032e9508f922e1ff9b18edf6bd15e6/data/SQL_query_staged_orders_picture.png)
* **Silver/Staging Data Layout:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/707e180cd0e5e59e27f7d6d5dd2df22e8d6f9cda/data/BigQuery_staging_dataset_layout.png)

🥇 **Gold (Curated/Analytical Layer):**
---
The Gold Layer represents the final modeled state. I transformed the normalized staging data into a Star Schema to optimize analytical performance and business reporting

**The Star Schema:**
* Fact Table: orders_fact (Integrated from: orders, order_items, order_payments, order_reviews)
* Dimension Tables: dim_customers, dim_sellers, dim_date, dim_geolocation, dim_products (Joined with category translations)

**Transformation Logic & Best Practices**:
* **Revenue Accuracy:** Pre-aggregated payment data to prevent "row-doubling" (fan-out) during joins, ensuring 100% financial accuracy.
* **Language Translation:** Joined category lookups to provide English labels for global stakeholder readability.
* **Time Intelligence:** Engineered a custom dim_date table with Monday-start logic and weekend flags for seasonal trend analysis.
* **Spatial Optimization:** Aggregated geolocation coordinates to the Zip Prefix level to protect PII and significantly improve map rendering speeds.

**SQL Documentation:**
* SQL Scripts Preview: [All Table SQL Scripts](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/main/sql%20scripts/03_gold)
* **Example of Code:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/b7f97f79a975b9fc0cc67228064e96175f8691ec/data/order_fact_query_preview.png)
* **Gold/Analytical Layer Layout:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/8641a15f83b5192e12b1f00bed2ff07083f72f1e/data/gold_layer_layout_picture.png)

### Analyze Phase
---
The Analyze phase focused on exploring the Olist Marketplace’s performance by combining SQL-based transformations with Power BI visual analysis. The goal was to evaluate logistics efficiency, seller distribution, and customer satisfaction to identify the key drivers of business performance

**Sales & Seller Strategy**
---
**Methodology:**
* **Segmented High-Performing Sellers:** Utilized SQL Window Functions to classify the top 10% of sellers by volume. This identifies high-capacity partners for potential promotional prioritization
* **Revenue Concentration Analysis:** Quantified the contribution of the top 5 vs top 10 product categories by revenue, highlighting how niche segments drive the majority of platform revenue
* **Time Intelligence Implementation:** Integrated a custom date table in Power BI to track monthly revenue cycles (2016–2018) and identify growth outliers like Health & Beauty
* **Geographic Density Mapping:** Conducted a spatial comparison of seller concentration vs. customer demand by state to pinpoint market expansion opportunities
* **DAX Measure Development** Created custom measures for Total Revenue, AOV, Order Count, and Category Revenue Share

**Evidence:**
* **High-Performing Sellers (Top 10%):**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/f1554a3611e1cb3846d51c578ec1c101e385c40b/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/seller_performance_top_10%25.png)

* **Top Product Categories (Top 5 Revenue Analysis):**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/bdfb749c96e8c223c14a61452bcb5adea9cb3014/sql%20scripts/anlaysis_scripts/sales_and_seller_strategy/top_5_prodcut_categories_picture.png)

Logistics & Customer Experience
---
**Methodology:**
* **Data Preparation Using DML transformations:** Created calculated columns for Seller Processing Time, Lead Time, and Days Delayed. Used CASE statements to categorize orders as "On-Time" vs. "Delayed"
* **Regional Efficiency Audit:** Analyzed average lead times across Brazilian states. Confirmed that while no state exceeds the "estimated delivery date" on average
* **Sentiment Correlation Analysis:** Mapped shipping delays against customer review scores (1–5) to identify the specific "Sentiment Collapse" threshold
* **Logistics KPI Suite:** Developed DAX measures for Delivery Promise Accuracy, Avg. Lead Days, and the Delayed Shipping Penalty (the star-rating drop per day of delay)

**Evidence:**
* **Data Preperation** (CASE Statements & Calculated Columns):
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/1a596a2fd4c54dd0dfb1bf8cdac39b3e519a9da9/sql%20scripts/anlaysis_scripts/logistics_and_customer_experience/column_data_preperation_preview.png)
* **State-Level Logistics Performance:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/5b7ea85e8a3c60d0d015d540c4132267bc70bd7f/insights/dashboard_pictures/state_level_logistics_visualization_preview.png)
* **Delivery Delay vs Customer Satisfaction:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/5b7ea85e8a3c60d0d015d540c4132267bc70bd7f/insights/dashboard_pictures/delivery_delay_vs_customer_satisfaction_visualization_preview.png)
* **Seller vs Customer Distribution by State:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/5b7ea85e8a3c60d0d015d540c4132267bc70bd7f/insights/dashboard_pictures/seller_vs_customer_distribution_by_state_visualization_preview.png)

### Share Phase
---
This phase summarizes key findings from the analysis to highlight business performance across sales, logistics, and customer experience, focusing on key patterns and relationships in the data

🛒 Sales & Seller Strategy:
--- 
**Key Findings:**
* **Core Categories:** The Top 5 product categories (Bed Bath Table, Health Beauty, Computers Accessories, Furniture Decor, and Watches Gifts) dominate the market, accounting for 38.9% of total revenue share
* **Growth Trends:** Most categories showed consistent growth until a general decline began in April 2018. Health Beauty is the notable exception, maintaining a positive projected growth trajectory
* **Geographic Opportunity:** Demand is heavily concentrated in five Brazilian states (SP, MG, PR, RJ, SC). However, these high-demand regions are among the lowest in seller distribution (ranking in the top 11/27), indicating a significant opportunity for seller recruitment
* **Financial KPIs:**
* Total Revenue: 20.58M
* Average Order Value: 206.95
* Total Orders: 114k

**Sales & Seller Strategy Dashboard Preview:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/263636c54cd337a6e7f6ba09b8d177a080867477/dashboard/dashboard_pictures/sales_and_seller_strategy_dashboard_preview.png)

🚚 Logistics & Customer Experience:
---
**Key Findings:**
* **Shipping vs Customer Satisfaction:** There is a direct correlation between shipping delays and customer dissatisfaction. While the average rating is 4.0 stars, a delay of just 1 day drops the average to 3.68. Sentiment collapses at the 3-day mark (2.58 stars) and hits a floor of 1.5 stars for delays of 6+ days
* **Lead Time vs Customer Satisfaction:** There is no direct correlation between lead time and customer satisfaction
* **Operational Efficiency:** The average lead time is 12.5 days, with average seller processing taking 2.4 days. Currently, no state averages exceed their estimated delivery dates, resulting in a 92.1% delivery promise accuracy
* **Seasonal Bottlenecks:** Late order percentages consistently spike during Q1 and Q4 across all years, identifying these periods as high-risk for customer satisfaction due to logistics strain

**Logistics & Customer Experience Dashbaord Preview:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/1a596a2fd4c54dd0dfb1bf8cdac39b3e519a9da9/insights/dashboard_pictures/logistics_and_customer_experience_dashboard_preview.png)

🧠 Information Guidance
---
I developed 2 overlays in the interacive dashboard to provide stakholders with knowledge to properly navigate the dashboard

**Sales & Seller Strategy Overlay:**
* ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/8186ec99c22e7be29bdfdad9ea6144fc220e3ebe/dashboard/dashboard_pictures/sales_and_seller_strategy_overlay.png)

**Logistics & Customer Experience:**
*  ![image alt](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/633094a9bcbbbad2e8b28c7171c45930a3aef257/dashboard/dashboard_pictures/logistics_and_customer_experience_overlay.png)

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
* [Locate Presentation File](<iframe title="Olist 360 E-Commerce Dashboard" width="600" height="373.5" src="https://app.powerbi.com/view?r=eyJrIjoiZTE0ZmRkMjAtMmZjMC00NDlmLThjNjctODE3OThhMTYyYmM0IiwidCI6ImRjZWE2OTZmLTk2YjYtNGJkYS05MmFlLTFjZGE1MWY2NjY2ZiJ9&pageName=809a7c16e2189792b439" frameborder="0" allowFullScreen="true"></iframe>)

## 💡 Key Insights & Recommnedataions 
- Bullet points on what key insights and what actions are best to take for the company

## 📦 Deliverables

*   **Project Strategy:** [Scope of Work](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/main/documentation/olist_360_project_scope_of_work.pdf)
*   **Technical Codebase:** [SQL Script Repository](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/tree/726fd764070c33632fa165f6461e3dab6ae9b4ce/sql%20scripts)
*   **Business Intelligence:** [Interactive Power BI Dashboard]()
*   **Executive Insights Presentation:** [Executive Insights Presentation](https://github.com/SebastianHopgood/Revenue-Sales-temp-name-/blob/cb896365c2ac65aa0594fa6927d09d65e4bdef7b/presentation/executive_insights_presentation.pptx)

## 📂 Project Structure
```text
├── data/
│   ├── cleanned_data_previews     # Bronze Layer: Original Olist datasets
│   └── raw_datasets               # Silver/Gold Layers: Cleaned table screenshots
├── sql_scripts/
│   ├── 02_silver/           # Data cleaning & standardization
│   ├── 03_gold/             # Star Schema modeling (Fact/Dim/Date tables)
│   └── analysis/            # Strategic queries (.sql) and visual previews (.png)
├── dashboard/
│   ├── dashboard_pictures            # README dashboard visuals
│   └── interactive_dashboard_link    # Link to the live Power BI report
├── documentation/
│   └── olist_360_project_scope_of_work.pdf    # Professional Scope of Work (SOW)
├── presentation/
│   └── executive_insights_powerpoint.pptx     # Final Stakeholder Presentation
└── README.md    # Main project documentation
```

## ⚠️ Data Limitations & Future Work
* **Date Gaps :** Data from months January 2016-August 2016 and September 2018-December 2018 is missing. *Future Work: Acquire the remaining 2018 datasets to complete a full 3-year growth study*
* **Marketplace Profitability:** Without specific commission rates or operating costs, analysis is limited to Total Sales rather than Olist’s actual Net Profit. *Future Work: Integrate Olist’s fee structure to calculate actual platform net profit*
* **Retention Limits:** 98.8% of users are one-time buyers. *Future Work: Conduct a Cohort Analysis to identify what drives the small percentage of returning "power users"
