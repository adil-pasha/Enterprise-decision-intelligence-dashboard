-- =====================================================
-- Enterprise Decision Intelligence Dashboard
-- Dashboard & Executive Analytics Queries
-- =====================================================

---------------------------------------------------------
-- KPI 1: Total Revenue
---------------------------------------------------------
SELECT
    ROUND(SUM("Sales")::numeric,2) AS total_revenue
FROM sample;

---------------------------------------------------------
-- KPI 2: Total Profit
---------------------------------------------------------
SELECT
    ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM sample;

---------------------------------------------------------
-- KPI 3: Total Orders
---------------------------------------------------------
SELECT
    COUNT(DISTINCT "Order ID") AS total_orders
FROM sample;

---------------------------------------------------------
-- KPI 4: Total Customers
---------------------------------------------------------
SELECT
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM sample;

---------------------------------------------------------
-- KPI 5: Average Order Value
---------------------------------------------------------
SELECT
    ROUND(
        (
            SUM("Sales") /
            COUNT(DISTINCT "Order ID")
        )::numeric,
        2
    ) AS avg_order_value
FROM sample;

---------------------------------------------------------
-- Monthly Sales Trend
---------------------------------------------------------
SELECT
    DATE_TRUNC('month', "Order Date"::date) AS month,
    ROUND(SUM("Sales")::numeric,2) AS revenue
FROM sample
GROUP BY month
ORDER BY month;

---------------------------------------------------------
-- Revenue by Region
---------------------------------------------------------
SELECT
    "Region",
    ROUND(SUM("Sales")::numeric,2) AS revenue
FROM sample
GROUP BY "Region"
ORDER BY revenue DESC;

---------------------------------------------------------
-- Profit by Region
---------------------------------------------------------
SELECT
    "Region",
    ROUND(SUM("Profit")::numeric,2) AS profit
FROM sample
GROUP BY "Region"
ORDER BY profit DESC;

---------------------------------------------------------
-- Revenue & Profit by Category
---------------------------------------------------------
SELECT
    "Category",
    ROUND(SUM("Sales")::numeric,2) AS revenue,
    ROUND(SUM("Profit")::numeric,2) AS profit
FROM sample
GROUP BY "Category"
ORDER BY revenue DESC;

---------------------------------------------------------
-- Sales by Segment
---------------------------------------------------------
SELECT
    "Segment",
    ROUND(SUM("Sales")::numeric,2) AS revenue
FROM sample
GROUP BY "Segment"
ORDER BY revenue DESC;

---------------------------------------------------------
-- Top 10 Customers by Revenue
---------------------------------------------------------
SELECT
    "Customer Name",
    ROUND(SUM("Sales")::numeric,2) AS revenue
FROM sample
GROUP BY "Customer Name"
ORDER BY revenue DESC
LIMIT 10;

---------------------------------------------------------
-- Top 10 Products by Revenue
---------------------------------------------------------
SELECT
    "Product Name",
    ROUND(SUM("Sales")::numeric,2) AS revenue
FROM sample
GROUP BY "Product Name"
ORDER BY revenue DESC
LIMIT 10;

---------------------------------------------------------
-- Top 10 Products by Profit
---------------------------------------------------------
SELECT
    "Product Name",
    ROUND(SUM("Profit")::numeric,2) AS profit
FROM sample
GROUP BY "Product Name"
ORDER BY profit DESC
LIMIT 10;

---------------------------------------------------------
-- Bottom 10 Products by Profit
---------------------------------------------------------
SELECT
    "Product Name",
    ROUND(SUM("Profit")::numeric,2) AS profit
FROM sample
GROUP BY "Product Name"
ORDER BY profit ASC
LIMIT 10;

---------------------------------------------------------
-- Category Profit Margin
---------------------------------------------------------
SELECT
    "Category",
    ROUND(SUM("Sales")::numeric,2) AS revenue,
    ROUND(SUM("Profit")::numeric,2) AS profit,
    ROUND(
        (
            SUM("Profit") /
            NULLIF(SUM("Sales"),0) * 100
        )::numeric,
        2
    ) AS profit_margin_percentage
FROM sample
GROUP BY "Category"
ORDER BY profit_margin_percentage DESC;
