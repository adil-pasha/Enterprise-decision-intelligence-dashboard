-- =====================================================
-- KPI Queries
-- Enterprise Decision Intelligence Dashboard
-- =====================================================

---------------------------------------------------------
-- Total Revenue
---------------------------------------------------------
SELECT
    ROUND(SUM("Sales")::numeric,2) AS total_revenue
FROM sample;

---------------------------------------------------------
-- Total Profit
---------------------------------------------------------
SELECT
    ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM sample;

---------------------------------------------------------
-- Total Orders
---------------------------------------------------------
SELECT
    COUNT(DISTINCT "Order ID") AS total_orders
FROM sample;

---------------------------------------------------------
-- Total Customers
---------------------------------------------------------
SELECT
    COUNT(DISTINCT "Customer ID") AS total_customers
FROM sample;

---------------------------------------------------------
-- Average Order Value
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
-- Average Profit Per Order
---------------------------------------------------------
SELECT
    ROUND(
        (
            SUM("Profit") /
            COUNT(DISTINCT "Order ID")
        )::numeric,
        2
    ) AS avg_profit_per_order
FROM sample;

---------------------------------------------------------
-- Total Quantity Sold
---------------------------------------------------------
SELECT
    SUM("Quantity") AS total_quantity_sold
FROM sample;

---------------------------------------------------------
-- Overall Profit Margin %
---------------------------------------------------------
SELECT
    ROUND(
        (
            SUM("Profit") /
            NULLIF(SUM("Sales"),0) * 100
        )::numeric,
        2
    ) AS overall_profit_margin
FROM sample;
