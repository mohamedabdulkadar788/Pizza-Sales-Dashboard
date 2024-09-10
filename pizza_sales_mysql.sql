use pizza;

select * from pizza.pizza_sales;

select sum(total_price) as Total_Revenue from pizza.pizza_sales;  /* Total Revenue  */

select sum(total_price)/count(distinct order_id) as average_price_per_order from pizza.pizza_sales;    /* average price per order */

select sum(quantity) as Total_Pizza_Sold from pizza.pizza_sales;    /* Total Pizza Sold */

select count(distinct order_id) from pizza.pizza_sales;  /* Total Orders */

select * from pizza.pizza_sales where pizza.pizza_sales.order_id = 21350;

select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) as Average_pizzas_per_Order from pizza.pizza_sales;  /* Average pizzas per Order*/

select dayname(order_date) as order_day, count(distinct order_id) as Total_Orders from pizza.pizza_sales group by order_day;

SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza.pizza_sales  GROUP BY order_day order by order_day;

select COUNT(DISTINCT order_id) from pizza.pizza_sales;

select monthname(str_to_date(order_date, '%d-%m-%Y')) as order_months, count(distinct order_id) as Total_Orders from pizza.pizza_sales 
group by order_months order by total_orders desc;

select pizza_category, sum(total_price) as total_sales,sum(total_price) * 100 / (select sum(total_price) from pizza.pizza_sales) as perc_of_sales from pizza.pizza_sales 
group by pizza_category order by perc_of_sales desc;      /* total sales based on pizza category */

select pizza_category, sum(total_price) as total_sales,sum(total_price) * 100 / (select sum(total_price) from pizza.pizza_sales where monthname(str_to_date(order_date, '%d-%m-%Y')) = 'January') as perc_of_sales from pizza.pizza_sales 
where monthname(str_to_date(order_date, '%d-%m-%Y')) = 'January'
group by pizza_category order by perc_of_sales desc;  /* total sales based on pizza category in the month of January */

select pizza_size, sum(total_price) as total_sales,sum(total_price) * 100 / (select sum(total_price) from pizza.pizza_sales where monthname(str_to_date(order_date, '%d-%m-%Y')) = 'January') as perc_of_sales from pizza.pizza_sales 
where monthname(str_to_date(order_date, '%d-%m-%Y')) = 'January'
group by pizza_size order by perc_of_sales desc;  /* total sales based on pizza size in the month of January */ 

select pizza_size, sum(total_price) as total_sales, CAST(sum(total_price) * 100 / (select sum(total_price) from pizza.pizza_sales) as decimal(10,2)) as perc_of_sales from pizza.pizza_sales 
group by pizza_size order by perc_of_sales desc;      /* total sales based on pizza size */

select pizza_size, sum(quantity) as total_sales, CAST(sum(quantity) * 100 / (select sum(quantity) from pizza.pizza_sales) as decimal(10,2)) as perc_of_sales from pizza.pizza_sales 
group by pizza_size order by perc_of_sales desc;      /* total number of pizzas sold based on pizza size */

select count(*) from pizza_sales;

select pizza_name from pizza_sales;

select pizza_name, cast(sum(total_price) as decimal(10,2)) as pizza_sales_revenue from pizza_sales
group by pizza_name 
order by pizza_sales_revenue DESC LIMIT 5;   /* top 5 most pizzas sold */

select pizza_name, cast(sum(total_price) as decimal(10,2)) as pizza_sales_revenue from pizza_sales
group by pizza_name 
order by pizza_sales_revenue LIMIT 5;   /* top 5 least pizzas sold */

select pizza_name, sum(quantity) as pizza_sales_quantity from pizza_sales
group by pizza_name 
order by pizza_sales_quantity LIMIT 5;   /* top 5 least pizzas sold based on quantities ordered*/

select pizza_name, count(distinct order_id) as pizza_sales_orders from pizza_sales
group by pizza_name 
order by pizza_sales_orders DESC LIMIT 5;   /* top 5 most pizzas sold based on number of orders*/

select pizza_name, count(distinct order_id) as pizza_sales_orders from pizza_sales
group by pizza_name 
order by pizza_sales_orders DESC LIMIT 5;   /* top 5 most pizzas sold based on number of orders*/






