with order_items_agg as (
    select
        order_guid,
        sum(quantity) as quantity
    from {{ ref('stg_order_items') }}
    group by order_guid
)
select
    o.created_at_utc,
    email,
    order_cost,
    shipping_cost,
    order_total,
    promo_type,
    estimated_delivery_at_utc,
    delivered_at_utc,
    status,
    quantity as item_quantity
from {{ ref('stg_orders') }} as o
join {{ ref('stg_users') }} as u using (user_guid)
join order_items_agg as i using (order_guid)