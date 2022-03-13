with sessions as (
    select * from {{ ref('stg_events') }}
),
session_begin as (
    select 
    session_guid,
    date_trunc('hour', min(created_at_utc)) from sessions
    group by session_guid
)
select * from session_begin
