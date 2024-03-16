select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales;

select sum(total_price)/count(distinct order_id) as Average_Order_value from pizza_sales;

select sum(quantity) as Toatl_pizzas_sold from pizza_sales;

select count(distinct order_id) as Total_orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizzas_per_order from pizza_sales;


select datename(dw,order_date) as Order_day, count(distinct order_id) as Total_orders 
from pizza_sales
group by datename(dw,order_date);

select datename(hour,order_time) as Order_day, count(distinct order_id) as Total_orders 
from pizza_sales
group by datename(hour,order_time)
order by datename(hour,order_time);


select month(order_date) as Month_name,count(distinct(order_id)) as Total_orders from pizza_sales
group by month(order_date)
order by month(order_date) asc; 

select datename(month,order_date) as Month_name, count(distinct(order_id)) as Total_orders from pizza_sales
group by datename(month,order_date) 



select pizza_category,sum(total_price) as Total_price, sum(total_price)*100/(select sum(total_price) from pizza_sales) as percentage_of_sales 
from pizza_sales
group by pizza_category;

select pizza_size,sum(total_price) as Total_price,cast( sum(total_price)*100/(select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal(10,2))as percentage_of_sales 
from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_size
order by percentage_of_sales desc;


select top 5 pizza_name,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name 
order by Total_Revenue desc;

select top 5 pizza_name,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name 
order by Total_Revenue asc;

select top 5 pizza_name,sum(quantity) as Total_quantity from pizza_sales
group by pizza_name 
order by Total_quantity desc;

select top 5 pizza_name,sum(quantity) as Total_quantity from pizza_sales
group by pizza_name 
order by Total_quantity asc;


select top 5 pizza_name,count(distinct(order_id)) as Total_Orders from pizza_sales
group by pizza_name 
order by Total_Orders desc;

select top 5 pizza_name,count(distinct(order_id)) as Total_Orders from pizza_sales
group by pizza_name 
order by Total_Orders asc;