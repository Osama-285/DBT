with orders as (

    select
        order_id,
        row_id,
        customer_id,
        product_id,
        order_date,
        ship_date,
        ship_mode,
        sales,
        quantity,
        discount,
        profit
    from {{ ref('stg_orders') }}

),

final as (

    select
        o.order_id,
        o.row_id,

        -- foreign keys
        o.customer_id,
        o.product_id,

        -- dates
        o.order_date,
        o.ship_date,

        -- attributes
        o.ship_mode,

        -- measures
        o.sales,
        o.quantity,
        o.discount,
        o.profit

    from orders o
)

select * from final;
