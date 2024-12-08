
--------------KPIs-----------------
--1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

--2. Average Order Value
SELECT SUM(total_price)/COUNT(distinct order_id) AS avg_order_val FROM pizza_sales

--3. Total Pizza sold
SELECT SUM(quantity) AS Total_Pizza FROM pizza_sales

--4. Total Orders Placed
SELECT COUNT(DISTINCT order_id) as TOTAL_ORDERS FROM pizza_sales

--5.Average Pizzas per order.
SELECT CAST(CAST(SUM(Quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS avg_pizza_per_order FROM pizza_sales


-------------Trends------------
--1.Daily trends
SELECT DATENAME(DW,order_date) AS day, COUNT(DISTINCT order_id) as Total_orders FROM pizza_sales group by DATENAME(DW,order_date) 
ORDER BY Total_orders DESC

--2. Monthly Trends
SELECT DATENAME(MONTH, order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales group by DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

--3.Percentage of Sales by Pizza Category
SELECT pizza_category,SUM(total_price) AS Total_Sales, SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales) AS Percentage_Sales FROM pizza_sales GROUP BY pizza_category 
ORDER BY Percentage_Sales

--4.Percentage Sales by Pizza size
SELECT pizza_size,SUM(total_price) AS Total_Sales, SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales) AS Percentage_Sales FROM pizza_sales GROUP BY pizza_size 
ORDER BY Percentage_Sales

-----------------Rankings---------------
--1. Bestseller Pizza
SELECT top 5 pizza_name, SUM(total_price) as Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue DESC

--2. Bottom 5 Pizza
SELECT top 5 pizza_name, SUM(total_price) as Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue

--3. Bestseller by Quantity
SELECT top 5 pizza_name, SUM(quantity) as Total_quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Total_quantity DESC

--4. Top 5 Pizza by Quantity
SELECT top 5 pizza_name, SUM(quantity) as Total_quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Total_quantity

--5. Bestseller by Order count
SELECT top 5 pizza_name, COUNT(DISTINCT order_id) as Total_orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_orders DESC

--4. Bottom 5 Pizza by Order count
SELECT top 5 pizza_name, COUNT(DISTINCT order_id) as Total_orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_orders