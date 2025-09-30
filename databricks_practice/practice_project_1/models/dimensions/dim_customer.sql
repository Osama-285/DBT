with customers as (

    select
        customer_id,
        customer_name,
        segment,
        country,
        state,
        city,
        postal_code
    from {{ ref('stg_orders') }}
    where customer_id is not null

),

deduped as (

    select distinct *
    from customers
)

select * from deduped;
