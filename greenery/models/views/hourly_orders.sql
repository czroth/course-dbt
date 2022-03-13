select
    date_trunc('hour', created_at_utc) as hour, 
    count(*) as order_count
from {{ ref('stg_orders') }} 
group by date_trunc('hour', created_at_utc)