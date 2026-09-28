SELECT
    customer_id,
    customer_name,
    email,
    country
FROM {{ source('ecommerce', 'customers') }}