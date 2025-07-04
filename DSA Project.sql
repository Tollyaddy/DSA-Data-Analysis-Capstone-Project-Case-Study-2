select * from [KMS Sql Case Study]

Alter table [KMS Sql Case Study]
drop column Product_Container

-------Case Scenario 1
------1. Product Category with the highest sales
select Top 1
Product_category, sum(sales) as [Total Sales] 
 from [KMS Sql Case Study]
 group by Product_category
order by [Total Sales] desc
-----The product category with the highest total sales is Technology.

------2a. Top 3 regions in terms of sales
select top 3
Region, sum(sales) as [Total Sales]
from [KMS Sql Case Study]
group by Region
order by [Total Sales] desc


------2b. Bottom 3 regions in terms of sales
select top 3
Region, sum(sales) as [Total Sales]
from [KMS Sql Case Study]
group by Region
order by [Total Sales] asc

-----3. Total Sales of Appliances in Ontario
 select 
Region, sum(sales) as Total_Sales_of_Appliances
from [KMS Sql Case Study]
where Region = 'Ontario' and product_sub_category ='Appliances'
group by Region
order by Total_Sales_of_Appliances

-------4.Revenue of Bottom 10 customers
select top 10 
Customer_Name, sum(sales) as Revenue
from [KMS Sql Case Study]
group by Customer_Name
order by Revenue asc

-----5.Most Shipping Cost incurred and the Shipping method used
select Top 1
Ship_Mode, sum(Shipping_Cost) as [Total Shipping Cost] 
from [KMS Sql Case Study]
group by Ship_Mode
order by [Total Shipping Cost] desc


select * from [KMS Sql Case Study]

-----------Case Scenario II
-----6. Most valuable customers and producs they typically purchase
select top 10 
Customer_Name, sum(Profit) as [Highest Profit], sum(Sales) as [Total Sales]
from [KMS Sql Case Study]
group by Customer_Name
order by [Highest Profit] desc

-------7.  The small business customer with the Highest Sales
select top 1
Customer_Name, Customer_Segment, sum(sales) as [Total Sales]
from [KMS Sql Case Study]
where Customer_Segment = 'Small Business'
group by Customer_Name, Customer_Segment
order by [Total Sales] desc

------8. The Corporate Customer who placed the most number of orders in 2009-2012
select top 1
Customer_Name, Customer_Segment, count(Order_id) as [Total Number of Order]
from [KMS Sql Case Study]
where Customer_Segment = 'Corporate' 
and Order_Date between '2009-01-01' and '2012-12-31'
group by Customer_Name, Customer_Segment
order by [Total Number of Order] desc


------9. The most profitable consumer customer
select Top 1
Customer_Name, Customer_Segment, sum(Profit) as Highest_Profit
from [KMS Sql Case Study]
where Customer_Segment = 'Consumer'
group by Customer_Name, Customer_Segment
order by Highest_Profit desc

-------10. Customers who returned items and the segment they belong to
select * from Order_Status

select top 10 * from (
       select Customer_Name, Order_id,Customer_Segment from [KMS Sql Case Study]) as Cust
	   join (
	   select order_id, [status] from Order_Status) as Ret
	   on Cust.Order_Id = Ret.Order_id

-----11. Shipping cost based on Order Priority
select 
Order_Priority,Ship_Mode, count (Order_Id),
Round(Sum(Sales-Profit),2) as EstimatedShipping_Cost,
Avg(Datediff(day,[Order_Date],[Ship_date])) as AvgShipDays
from [KMS Sql Case Study]
group by Order_Priority, Ship_Mode
order by Order_Priority, Ship_Mode desc
 

