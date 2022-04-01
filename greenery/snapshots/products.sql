{% snapshot products_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='product_guid',
      strategy='check',
      check_cols=['price', 'inventory'],
    )
  }}

  select * from {{ ref('stg_products') }}

{% endsnapshot %}