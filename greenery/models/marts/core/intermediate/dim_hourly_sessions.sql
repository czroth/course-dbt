select 
    date_trunc('hour', min(created_at_utc)) as hour,
    count(session_guid)
from {{ ref('stg_events') }}
group by session_guid
order by 1