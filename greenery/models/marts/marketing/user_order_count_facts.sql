select
    order_count,
    num_users,
    100. * running_total_desc / sum(num_users) over () as percent_with_n_or_more_orders
from {{ ref('int_user_order_count') }}
