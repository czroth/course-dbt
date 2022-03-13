select
    user_guid,
    count(*) as purchase_count
from {{ ref('stg_orders') }}
group by user_guid