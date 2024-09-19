select *
from menu_items

select*
from order_details

--View the menu_items table and write a query to find the number of items on the menu
select count(item_name)
from menu_items

--What are the least and most expensive items on the menu?
select max(price) as max_price, min(price) as min_price
from menu_items

--How many Italian dishes are on the menu? 
select count(*)
from menu_items
where category ='Italian'

--What are the least and most expensive Italian dishes on the menu?
select * 
from menu_items
where category ='Italian'
order by price ASC


select * 
from menu_items
where category ='Italian'
order by price DESC

-- How many dishes are in each category?
select category, count(menu_item_id)
from menu_items
group by category

--What is the avg dish price within each category?
select category , avg(price)
from menu_items
group by category

--View the order_details table. What is the date range of the table?
select *
from order_details

--date range
select min(order_date), max(order_date)
from order_details

--How many orders were made within this date range? 
select count(distinct order_id), min(order_date), max(order_date)
from order_details

 --How many items were ordered within this date range?
 Select count(item_id),min(order_date), max(order_date)
 from order_details

 --which orders had the most number of itmes?
 select order_id, count(item_id) as most_items
 from order_details
group by order_id
order by most_items DESC

--How many orders had more than 12 items?
Select Count(* )
From
(select order_id, count(item_id) as most_items
 from order_details
 group by order_id
having count(item_id)  >12
) as num_orders

--Combine the menu_items and order_details tables into a single table
select *
from menu_items
join order_details
on menu_item_id = item_id

--What were the least and most ordered items?What categories were they in?
select category,item_name, count(order_details_id) as most_order 
from menu_items
join order_details
on menu_item_id = item_id
Group by item_name,category
order by most_order desc

select category,item_name,count(order_details_id) as least_order 
from menu_items
join order_details
on menu_item_id = item_id
Group by item_name,category
order by least_order asc

--What were the top 5 orders that spent the most money?

select top(5)order_id, sum(price) as total_spend
from menu_items
left join order_details
on menu_item_id = item_id
group by order_id
order by total_spend desc

--View the details  of the highest spend order.What insights can you gather from the query
select category, count(item_id) as num_items
from menu_items
left join order_details
on menu_item_id = item_id
Where order_id = '440'
group by category

--View the details of the top 5 highest spend orders
select order_id,category, count(item_id) as num_items
from menu_items m
left join order_details o
on m.menu_item_id = o.item_id
Where order_id in(440,2075,1975, 330, 2675)
group by order_id,category


--How much was the most expensive order in the dataset?
select top(5)order_id, sum(price) as total_spend
from menu_items
left join order_details
on menu_item_id = item_id
group by order_id
order by total_spend desc