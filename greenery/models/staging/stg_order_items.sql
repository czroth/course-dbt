select 
    order_id as order_guid,
    product_id as product_guid,
    quantity
from {{ source('source', 'order_items') }}