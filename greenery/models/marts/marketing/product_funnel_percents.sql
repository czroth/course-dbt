select
  {{ ratio_to_percent('checkouts', 'sessions') }} as session_conversion_percent,
  100 - {{ ratio_to_percent('cart_adds', 'sessions') }} as session_cart_dropoff_percent,
  100 - {{ ratio_to_percent('checkouts', 'cart_adds') }} as cart_checkout_dropoff_percent
from {{ ref('product_funnel') }}