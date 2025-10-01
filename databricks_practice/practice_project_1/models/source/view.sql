{{
  config(
    materialized = 'ephemeral',
    )
}}

{# SELECT 
    order_year, 
    ROUND(SUM(total_sales),2) AS year_sales, 
    SUM(total_quantity) AS total_quantity,
    {{ classify_year('SUM(total_quantity)' )}} as year_category
FROM {{ ref('mart_sales_summary') }} 
GROUP BY order_year
ORDER BY order_year ASC #}

SELECT product_id, product_name ,COUNT(product_id) as total
FROM {{ ref('mart_sales_summary') }}
GROUP BY product_id, product_name
ORDER BY total ASC