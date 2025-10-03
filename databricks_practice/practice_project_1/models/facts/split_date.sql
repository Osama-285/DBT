{{
  config(
    materialized = 'view',
    )
}}

select distinct {{ split_datetime("order_date") }}
from {{ ref("stg_orders") }}