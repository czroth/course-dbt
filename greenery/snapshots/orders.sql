{% snapshot orders_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='order_guid',
      strategy='check',
      check_cols=['status'],
    )
  }}

  select * from {{ ref('stg_orders') }}

{% endsnapshot %}