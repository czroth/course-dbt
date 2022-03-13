select 
    promo_id as promo_type,
    discount,
    status
from {{ source('source', 'promos') }}