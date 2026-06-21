# Vegetable Wholesale Market Sales Analysis
SQL project: revenue, loss, and discount-efficiency analysis 
based on a vegetable wholesale market sales dataset.

## Dataset
Sales data from a vegetable wholesale market, covering the period 2020.07.01 - 2023.06.30
- products (251 items) — product and category reference table
- sales (878,503 records) — sales transactions
- prices (55,982 records) — daily wholesale prices
- loss_rates (251 records) — spoilage/loss percentage per product

## Database Schema
![Database schema](Schema.png)

## Tools
PostgreSQL, SQLTools (VS Code), Fedora Linux

## Questions and Results

### 1. Financial metrics by category
[1_category_financials.sql](sql_project_files/1_category_financials.sql)

The most profitable category is Flower/Leaf Vegetables (margin 39.87%), 
the lowest margin belongs to Aquatic Tuberous Vegetables (30.81%).

### 2. Losses from spoilage/write-offs
[2_product_loss_cost.sql](sql_project_files/2_product_loss_cost.sql)

The category with the highest losses from write-offs is:
    - Flower/Leaf Vegetables

Reducing the amount of unsold flowers and leafy vegetables would help 
optimize costs.

### 3. Revenue with and without discounts
[3_discount_efficiency.sql](sql_project_files/3_discount_efficiency.sql)

In total, non-discounted products generate twice as much net revenue. 
Revenue per unit sold is higher, but the quantity purchased is lower.

### 4. Peak hours and days
[4_peak_hours_and_days.sql](sql_project_files/4_peak_hours_and_days.sql)

The main waves of customers arrive in the morning at 10-11 AM and in 
the evening at 17-18 (5-6 PM). On average, the volume sold during 
these hours is 1.5x higher.
Among weekdays, most purchases happen on weekends (Saturday/Sunday), 
with purchase volume 35% higher on those days.

### 5. Top 3 products by revenue in each category
[5_top_products_per_category.sql](sql_project_files/5_top_products_per_category.sql)

In each of the 6 categories, the #1 product clearly outpaces #2 and #3 
in revenue. Many of the #2 and #3 products are essentially variations 
of the same product — meaning customer demand is concentrated around 
specific product families rather than spread across the assortment.

## How to Run
1. Install PostgreSQL (if not already installed)
2. [Create database](sql_load/1_create_database.sql)
3. [Create tables](sql_load/2_create_tables.sql)
4. [Import data](sql_load/3_modify_tables.sql)