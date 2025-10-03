{{
  config(
    materialized = 'view',
    )
}}

select distinct {{ month_name("month") }}
from {{ ref("dim_date") }}