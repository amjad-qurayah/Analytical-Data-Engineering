-- not null. unique. relationship. accepted_value

-- Customer Dimension 

--- customer_id is not null 
select count(*) = 0 from TPCDS.ANALYTICS.CUSTOMER_DIM 
where c_customer_sk is null;

-- Weekly Sales Inventory

-- warehouse_sk. item_sk and sold_wk_sk is unique 
select count(*)  = 0 from 
     (select 
         warehouse_sk, item_sk, sold_wk_sk
    from TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY 
    group by 1,2,3 
    having count (*) > 1);

-- Relationship Test 
select count(*) = 0 from
   (select 
       dim.I_ITEM_SK 
from TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY fact 
Left join TPCDS.ANALYTICS.ITEM_DIM dim 
on dim.i_item_sk=fact.item_sk
WHERE dim.i_item_sk is null);

 -- Accepted Value Testing 
   select count (*)=0 from tpcds.analytics.weekly_sales_inventory 
   where warehouse_sk NOT IN (1,2,3,4,5,6);