select
    date_trunc('hour', created_at_utc) as hour, 
    count(*) as order_count,
    sum(order_cost) as order_revenue,
    count(delivered_at_utc)::decimal / count(*) as delivery_complete_ratio
from {{ ref('stg_orders') }} 
group by 1
order by 1