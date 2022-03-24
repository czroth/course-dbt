{{ config(
    indexes=[
      {'columns': ['user_guid'], 'unique': True},
    ]
)}}

select 
    user_id as user_guid,
    address_id as address_guid,
    first_name,
    last_name,
    email,
    phone_number,
    created_at as created_at_utc,
    updated_at as updated_at_utc
from {{ source('source', 'users') }}