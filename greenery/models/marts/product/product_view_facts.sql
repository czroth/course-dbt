with product_event_facts as (
  select
    product_guid,
    count(*) as view_count,
    max(created_at_utc) as last_view_utc
  from {{ ref('stg_events') }}
  where event_type='page_view'
  group by product_guid
)
select
    name,
    price,
    view_count,
    last_view_utc,
    100. * c.conversion_rate as conversion_percent
from product_event_facts
join {{ ref('stg_products') }} as p using(product_guid)
left join {{ ref('int_product_conversion') }} as c using(product_guid)