with products as (

    select
        product_id,
        product_name,
        category,
        sub_category
    from {{ ref('stg_orders') }}
    where product_id is not null

),

deduped as (

    select distinct *
    from products
)

select * from deduped;
