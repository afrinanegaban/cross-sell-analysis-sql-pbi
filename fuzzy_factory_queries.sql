use fuzzy_factory;


-- Q1) Primary vs Secondary items distribution

select product_id,
sum(case when is_primary_item = 1 
then 1 
else 0 end) as pri_sales,

sum(case when is_primary_item = 0 
then 1 
else 0 end) as sec_sales,
count(*) as total_sales

from vw_order_items
group by product_id
order by total_sales desc;


-- Q2) Which primary product is the best 'drive' for prd 4?
select p.product_id as drive_prd_id,
count(s.product_id) as drive_sales
from vw_order_items as p 
join vw_order_items as s
on p.order_id = s.order_id
where p.is_primary_item =1 and s.is_primary_item = 0
and s.product_id = 4
group by drive_prd_id
order by drive_sales desc;


-- Q3) What is the "Attachment Rate" for prd 4 when sold alongside prd 1?
with x as
 (select count(product_id) as total_pri_orders
from vw_order_items
where is_primary_item = 1 and product_id = 1),

y as 
(select p.product_id as drive_prd_id,
count(s.product_id) as drive_sales
from vw_order_items as p 
join vw_order_items as s
on p.order_id = s.order_id
where p.is_primary_item =1 and s.is_primary_item = 0
and p.product_id = 1 and  s.product_id = 4)

select drive_prd_id, drive_sales, total_pri_orders, 
concat(round(((drive_sales/total_pri_orders) * 100),2),'%') as attachment_rate
from x, y;


-- Q4) Which "drive" product has the highest Attachment Rate for prd 4?
with x as
 (select product_id, count(product_id) as total_pri_orders
from vw_order_items
where is_primary_item = 1
group by product_id),

y as 
(select p.product_id as drive_prd_id,
count(s.product_id) as drive_sales
from vw_order_items as p 
join vw_order_items as s
on p.order_id = s.order_id
where p.is_primary_item =1 and s.is_primary_item = 0
and s.product_id = 4
group by p.product_id)

select y.drive_prd_id ,y.drive_sales, x.total_pri_orders, 
concat(round((y.drive_sales * 100 / x.total_pri_orders), 2),'%') as attachment_rate_prd4
from y join x on y.drive_prd_id = x.product_id
group by y.drive_prd_id 
order by drive_sales desc;


-- Q5) Calculate AOV. Which product combination with prd 4 results in the highest net revenue per order?

select primary_product_id, count(order_id) as total_orders,
round(sum(price_usd),2) as total_revenue,
round(avg(price_usd),2) as aov
from vw_orders
group by primary_product_id
order by aov desc; 

select o.primary_product_id, 
count(o.order_id) as total_combo,
round(avg(o.price_usd),2) as combo_aov
from vw_order_items i join vw_orders o on 
o.order_id = i.order_id
where i.product_id = 4 and i.is_primary_item= 0
group by o.primary_product_id
order by combo_aov; 


/* Q6) Do orders containing the Product 3 + Product 4 combo have 
a higher refund rate than orders containing only Product 3?*/

select case when i.order_id is not null then 'prd3 + prd4'
else 'prd 3' 
end as order_type,
count(r.order_item_refund_id) as total_refund,
count(distinct o.order_id) as total_orders,
concat(round(count(r.order_item_refund_id)*100/count(distinct o.order_id),2),'%') as refund_rate
from vw_orders o left join vw_order_items i
on o.order_id = i.order_id
and i.product_id = 4 and i.is_primary_item = 0
left join vw_refunds r on o.order_id = r.order_id
where o.primary_product_id = 3
group by 1; 


/* Q7) Does the prd 3 + prd 4 combo lead to
 more profit than just selling the products individually?*/

select
case when o.primary_product_id = 3 and i.order_id is not null then 'prd3 + prd4'
when o.primary_product_id = 3 then 'prd 3'
when o.primary_product_id = 4 then 'prd 4' end as order_type,
count(distinct o.order_id) as total_orders,
round(avg(o.price_usd),2) as avg_rev,
round(sum(o.price_usd),2) as total_rev
from vw_orders o
left join vw_order_items i on o.order_id = i.order_id
and i.product_id = 4 and i.is_primary_item = 0
where o.primary_product_id in (3,4)
group by 1;


/* Q8) Based on the attachment rate, the combo AOV, and the refund analysis which product bundle
 should we prioritize for global marketing to maximize net profit without increasing returns? */

 select o.primary_product_id,
 count(distinct(o.order_id)) as total_orders,
 round(count(distinct i.order_id) * 100.0 / count(distinct o.order_id),2) as attachment_rate,
 round(avg(o.price_usd),2) as aov,
 concat(round(count(r.order_item_refund_id)*100/count(distinct o.order_id),2),'%') as refund_rate
from vw_orders o left join vw_order_items i
on o.order_id = i.order_id
and i.product_id = 4 and i.is_primary_item = 0
left join vw_refunds r on o.order_id = r.order_id
group by 1;



-- Unified fact table 
create view prd_performance_fact as
select o.order_id, o.created_at, o.primary_product_id, o.price_usd,
case when i.order_id is not null then 1
else 0 end as is_cross_sell,
case when r.order_id is not null then 1 
else 0 end as is_refunded
from orders o
left join order_items i on o.order_id = i.order_id 
and i.is_primary_item = 0 
left join refunds r on o.order_id = r.order_id;
     
  
  
