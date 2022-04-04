select
  count(page_view) filter (where page_view > 0) as sessions,
  count(add_to_cart) filter (where add_to_cart > 0) as cart_adds,
  count(checkout) filter (where checkout > 0) as checkouts
from
    {{ ref('dim_sessions') }}