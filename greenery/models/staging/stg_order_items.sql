{{ config(
    indexes=[
      {'columns': ['order_guid', 'product_guid'], 'unique': True},
    ]
)}}

select 
    order_id as order_guid,
    product_id as product_guid,
    quantity
from {{ source('source', 'order_items') }}