{{ config(materialized='table') }}

with page_viewed as (
  select
    product_guid,
    session_guid
  from {{ ref('stg_events') }}
  where event_type='page_view'
),
cart_added as (
  select
    product_guid,
    session_guid
  from {{ ref('stg_events') }}
  where event_type='add_to_cart'
),
checked_out as (
  select
    session_guid
  from {{ ref('stg_events') }}
  where event_type='checkout'
),
product_stages as (
  select
    pv.product_guid,
    ca.session_guid as added_to_cart,
    co.session_guid as checked_out,
    ca.session_guid is not null and co.session_guid is not null as was_purchased
  from page_viewed as pv
  left join cart_added as ca using (product_guid, session_guid)
  left join checked_out as co using (session_guid)
)
select
  product_guid,
  count(*) as sessions_viewed,
  count(*) filter (where was_purchased) as sessions_purchased,
  count(*) filter (where was_purchased) / count(*)::float as conversion_rate
from product_stages
group by product_guid
