select
    order_id,
    order_date,
    customer_id,
    customer_name,
    email,
    country,
    product_id,
    product_name,
    category,
    quantity,
    price,
    order_value

from {{ ref('int_order_details') }}