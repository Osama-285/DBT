with dates as (

    select distinct order_date as date_day
    from {{ ref('stg_orders') }}
    where order_date is not null

),

expanded as (

    select
        date_day,
        year(date_day)        as year,
        month(date_day)       as month,
        day(date_day)         as day,
        weekofyear(date_day)  as week_num,
        dayofweek(date_day)   as day_of_week
    from dates
)

select * from expanded;
