select
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.email,
    c.country,
    o.product_id,
    p.product_name,
    p.category,
    o.quantity,
    p.price,
    o.quantity * p.price as order_value

from {{ ref('stg_orders') }} o

left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id

left join {{ ref('stg_products') }} p
    on o.product_id = p.product_id