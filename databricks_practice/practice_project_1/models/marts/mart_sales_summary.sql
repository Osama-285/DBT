with sales as (

    select
        f.order_id,
        f.customer_id,
        c.customer_name,
        c.segment,
        c.country,
        c.state,
        c.city,

        f.product_id,
        p.product_name,
        p.category,
        p.sub_category,

        f.order_date,
        year(f.order_date) as order_year,

        f.sales,
        f.quantity,
        f.discount,
        f.profit

    from {{ ref('fact_sales') }} f
    left join {{ ref('dim_customer') }} c
        on f.customer_id = c.customer_id
    left join {{ ref('dim_product') }} p
        on f.product_id = p.product_id
),

aggregated as (

    select
        customer_id,
        customer_name,
        segment,
        country,
        state,
        city,
        product_id,
        product_name,
        category,
        sub_category,
        order_year,

        sum(sales)   as total_sales,
        sum(quantity) as total_quantity,
        avg(discount) as avg_discount,
        sum(profit)   as total_profit

    from sales
    group by
        customer_id, customer_name, segment,
        country, state, city,
        product_id, product_name, category, sub_category,
        order_year
)

select * from aggregated
order by order_year ASC;
