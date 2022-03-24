{{ config(
    indexes=[
      {'columns': ['address_guid'], 'unique': True},
    ]
)}}

select 
    address_id as address_guid,
    address,
    zipcode,
    state,
    country
from {{ source('source', 'addresses') }}