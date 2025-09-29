WITH sales AS (
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('unit_price','quantity') }} as calculated_gross_amount,
        gross_amount,
        payment_method
    FROM
        {{ ref('bronze_sales') }}
),

products AS (
    SELECT
        product_sk,
        category
    FROM
        {{ ref('bronze_product') }}
),

customer AS (
    SELECT
        customer_sk,
        gender
    FROM
        {{ ref('bronze_customer') }}
),

joined_query AS (
    SELECT
        sales.sales_id,
        sales.customer_sk,
        sales.gross_amount,
        sales.payment_method,
        products.category,
        customer.gender
    FROM
        sales
    JOIN
        products ON sales.product_sk = products.product_sk
    JOIN
        customer ON sales.customer_sk = customer.customer_sk
)

SELECT
    category,
    gender,
    SUM(gross_amount) AS total_sales
FROM
    joined_query
GROUP BY
    category,
    gender
ORDER BY
    total_sales DESC
