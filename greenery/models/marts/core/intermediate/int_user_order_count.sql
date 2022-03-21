select
    order_count,
    count(*) as num_users,
    sum(count(*)) over (order by order_count) as running_total_asc,
    sum(count(*)) over (order by order_count desc) as running_total_desc
from {{ ref('dim_users') }}
group by 1
order by 1