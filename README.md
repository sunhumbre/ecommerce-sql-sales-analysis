# ecommerce-sql-sales-analysis
End-to-end SQL analysis of 1M+ ecommerce records to identify revenue drivers, return risks, and operational optimization opportunities.

E-Commerce Sales & Operations Analysis Using SQL

Business Intelligence Case Study | 1M+ Records | MySQL

📌 1. Project Overview

This project analyzes a large-scale e-commerce dataset (1M+ records) to identify:

Revenue-driving categories

High-return risk products

Profitability levers

Customer segment behavior

Operational inefficiencies in shipping and fulfillment

The goal is to translate raw transactional data into actionable business insights across marketing, pricing, inventory, and logistics functions.

🧩 2. Business Problem

The business lacked visibility into:

Which categories drive the majority of revenue and profit

Which products contribute disproportionately to returns

Whether discounts are eroding margins

Which customer segments generate sustainable revenue

How shipping methods impact profitability and returns

Without this visibility, decision-making across growth, pricing, and operations remained reactive rather than data-driven.

❓ 3. Key Business Questions

Which categories generate the highest revenue and profit?

What percentage of total revenue does each category contribute?

Which products carry the highest return risk?

Which customer segments drive the majority of sales?

Where are operational inefficiencies (shipping cost vs return rate)?

Is revenue dependent on discounting?

🗂 4. Dataset Description

The dataset contains 1M+ simulated e-commerce transaction records with the following attributes:

Product_ID

Product_Name

Category

Price

Discount (%)

Tax_Rate (%)

Shipping_Cost

Shipping_Method

Return_Rate

Customer_Age_Group

Customer_Location

Stock_Level

Supplier_ID

Seasonality

Popularity_Index

🛠 5. Tools & Technologies

SQL (MySQL 8.0)

CTEs (Common Table Expressions)

Window Functions (RANK, ROW_NUMBER, SUM OVER)

Aggregations & Business Metrics Modeling

Profitability Calculations

📈 6. Key Analyses Performed
6.1 Revenue & Contribution Analysis

Calculated category-level revenue

Computed revenue contribution percentage using window functions

Identified Books as the dominant revenue driver (₹353M+)

Key Insight:
Books contributes a significant portion of total revenue and also leads in profitability.

6.2 Profitability Modeling

Built a net profit formula:

Net Profit =
(Price × (1 – Discount))
– Shipping Cost
– (Price × Tax Rate)

Findings:
Books generates ₹302.9M+ net profit, indicating strong margin quality and manageable operational cost.

6.3 High Return Risk Identification

Ranked products by average return rate using window functions

Identified subcategories with disproportionate revenue leakage

Notable Insight:
Graphic Novels generate ₹44M+ revenue but show a 10.49% return rate — suggesting listing or fulfillment issues.

6.4 Customer Segment Analysis

Aggregated revenue by age group

Identified 18–24 as the dominant purchasing segment

Business Interpretation:
Strong student / early professional demand — opportunity for targeted academic campaigns and bundling strategies.

6.5 Discount Sensitivity Analysis

Segmented discount levels using CASE logic

Assessed revenue dependence on high-discount buckets

Insight:
Average discount of 12.53% indicates pricing power — revenue is not overly dependent on aggressive discounting.

6.6 Geographic Intelligence

Identified high-value markets

Houston generates ₹118M+ revenue with moderate return risk

Opportunity:
Localized fulfillment optimization and targeted marketing investment.

6.7 Shipping & Operations Intelligence

Compared shipping methods by revenue, cost, and return rate

Express shipping drives ₹587M+ revenue

Strategic Implication:
Customer preference for speed suggests opportunity for:

Express-focused inventory allocation

Membership-style fast delivery programs

Carrier contract optimization

💡 7. Strategic Business Recommendations
Growth Strategy

Expand inventory depth in Books

Increase academic & bestseller catalog

Secure publisher partnerships

Returns Reduction

Audit Graphic Novel listings and packaging

Improve edition clarity and preview pages

Reduce expectation mismatch

Pricing Optimization

Test reduced discount bands (10–11%)

Protect margins without sacrificing volume

Marketing Strategy

Target 18–24 demographic

Launch exam-prep campaigns

Bundle study materials

📊 8. Project Outcome

This analysis identified:

Core revenue drivers

Profitability leverage points

High-risk return categories

High-value customer segments

Shipping performance opportunities

The insights enable data-driven improvements across:

Pricing

Fulfillment

Inventory allocation

Marketing strategy

Operational cost management

🚀 9. SQL Highlights

This project demonstrates:

Advanced SQL aggregations

CTE-based contribution modeling

Window functions for ranking and segmentation

Profitability modeling logic

Business-focused data storytelling
