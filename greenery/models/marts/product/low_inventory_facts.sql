select
    name,
    inventory
from {{ ref('stg_products') }}
where inventory < 50
