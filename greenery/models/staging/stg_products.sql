select 
    product_id as product_guid,
    name,
    price,
    inventory
from {{ source('source', 'products') }}