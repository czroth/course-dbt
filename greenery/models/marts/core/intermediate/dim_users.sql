select
    user_guid,
    count(*) as order_count,
    sum(order_cost) as total_revenue,
    max(o.created_at_utc) as last_order,
    bool_or(promo_type is not null) as has_used_promo,
    bool_and(promo_type is not null) as always_used_promo

from {{ ref('stg_orders') }} o
join {{ ref('stg_users') }} u using (user_guid)
group by user_guid