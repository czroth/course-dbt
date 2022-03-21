select
    name,
    price,
    page_url,
    count(*) as view_count,
    max(created_at_utc) as last_view
from {{ ref('stg_events') }} as e
join {{ ref('stg_products') }} as p using(product_guid)
where event_type='page_view'
group by 1, 2, 3
order by 4 desc