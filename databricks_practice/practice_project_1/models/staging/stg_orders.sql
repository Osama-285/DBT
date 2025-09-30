with source as (

    select *
    from {{ source('source', 'Superstore') }}

),

renamed as (

    select
        -- identifiers
        cast(`Row ID` as int)                  as row_id,
        cast(`Order ID` as string)             as order_id,
        cast(`Customer ID` as string)          as customer_id,
        cast(`Product ID` as string)           as product_id,

        -- dates
        cast(`Order Date` as date)             as order_date,
        cast(`Ship Date` as date)              as ship_date,

        -- text attributes
        trim(`Ship Mode`)                      as ship_mode,
        trim(`Customer Name`)                  as customer_name,
        trim(`Segment`)                        as segment,
        trim(`Country`)                        as country,
        trim(`City`)                           as city,
        trim(`State`)                          as state,
        cast(`Postal Code` as int)             as postal_code,

        trim(`Category`)                       as category,
        trim(`Sub-Category`)                   as sub_category,
        trim(`Product Name`)                   as product_name,

        -- measures
        cast(`Sales` as double)                as sales,
        cast(`Quantity` as int)                as quantity,
        cast(`Discount` as double)             as discount,
        cast(`Profit` as double)               as profit

    from source
)

select * from renamed;
