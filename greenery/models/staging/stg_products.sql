{{ config(
    indexes=[
      {'columns': ['product_guid'], 'unique': True},
    ]
)}}

select 
    product_id as product_guid,
    name,
    price,
    inventory
from {{ source('source', 'products') }}