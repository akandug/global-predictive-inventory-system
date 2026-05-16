select * from inventory_products;
select * from inventory_sales;
select * from inventory_stocks;

SELECT 
    s.date,
    s.warehouse_location,
    p.category,
    p.base_price,
    s.is_promotion,
    s.local_temp_c,
    -- Target Variable
    s.units_sold,
    -- Feature Engineering: 7-day rolling average (The Momentum)
   round(AVG(s.units_sold) OVER(PARTITION BY s.product_id, s.warehouse_location
    ORDER BY s.date ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING),2) AS rolling_avg_7d,
    -- Feature Engineering: 30-day rolling average (The Baseline)
   round(AVG(s.units_sold) OVER(PARTITION BY s.product_id, s.warehouse_location 
    ORDER BY s.date ROWS BETWEEN 30 PRECEDING AND 1 PRECEDING),2) AS rolling_avg_30d
FROM inventory_sales s
JOIN inventory_products p ON s.product_id = p.product_id;

#Why I use 1 PRECEDING: By setting the range to end at 1 PRECEDING, we ensure the model isn't "cheating." I want the average of the past 7 or 30 days,
# excluding today's sales, because when am are actually making a forecast , i don't know today's total yet!

#joining stock table with inventory final
SELECT 
    s.date, 
    s.warehouse_location, 
    p.category, 
    p.product_name,
    p.base_price, 
    s.is_promotion,
    s.local_temp_c,
    st.reorder_point,
    st.storage_cost_per_unit,
    st.current_stock_on_hand, -- ADDING THIS
    p.supplier_lead_time_days, -- ADDING THIS
   
    ROUND(AVG(s.units_sold) OVER(PARTITION BY s.product_id, s.warehouse_location 
          ORDER BY s.date ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING), 2) AS rolling_avg_7d, 
    ROUND(AVG(s.units_sold) OVER(PARTITION BY s.product_id, s.warehouse_location 
          ORDER BY s.date ROWS BETWEEN 30 PRECEDING AND 1 PRECEDING), 2) AS rolling_avg_30d,
  s.units_sold         
FROM inventory_sales s 
JOIN inventory_products p ON s.product_id = p.product_id
JOIN inventory_stocks st ON s.product_id = st.product_id 
     AND s.warehouse_location = st.warehouse_location; -- JOINING STOCKS
     
     
    
