# Chris's co:rise dbt project

## Assignments

### Week 1

* How many users do we have:
  ```sql
  select count(distinct user_guid) from dbt_chris_r.stg_users
  ```
  * 130
* On average, how many orders do we receive per hour?
  ```sql
  select avg(order_count) from dbt_chris_r.hourly_orders
  ```
  * 7.5208333333333333
* On average, how long does an order take from being placed to being delivered?
  ```sql
  select avg(delivered_at_utc - created_at_utc) as avg_delivery_interval from dbt_chris_r.stg_orders
  ```
  * 3 days 21:24:11.803279
* How many users have only made one purchase? Two purchases? Three+ purchases?
  ```sql
  select count(*) from dbt_chris_r.user_purchase_count
  group by purchase_count having purchase_count=1
  ```
  * 25
  ```sql
  select count(*) from dbt_chris_r.user_purchase_count
  group by purchase_count having purchase_count=2
  ```
  * 28
  ```sql
  with cte as (
  select purchase_count, count(*) as user_count from dbt_chris_r.user_purchase_count
  group by purchase_count
  ) select sum(user_count) from cte where purchase_count >= 3
  ```
  * 71
* On average, how many unique sessions do we have per hour?
  ```sql
  with cte as (
    select date_trunc, count(*) as session_count from dbt_chris_r.hourly_sessions
    group by date_trunc
  )
  select avg(session_count) from cte
  ```
  * 11.7959183673469388