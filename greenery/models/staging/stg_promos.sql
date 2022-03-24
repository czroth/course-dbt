{{ config(
    indexes=[
      {'columns': ['promo_type'], 'unique': True},
    ]
)}}

select 
    promo_id as promo_type,
    discount,
    status
from {{ source('source', 'promos') }}