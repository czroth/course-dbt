{{ config(
    indexes=[
      {'columns': ['event_guid'], 'unique': True},
      {'columns': ['event_type', 'session_guid', 'product_guid']},
    ]
)}}

select 
    event_id as event_guid,
    session_id as session_guid,
    user_id as user_guid,
    page_url as page_url,
    created_at as created_at_utc,
    event_type as event_type,
    order_id as order_guid,
    product_id as product_guid
from {{ source('source', 'events') }}