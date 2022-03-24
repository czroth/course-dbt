select
    session_guid,
    {{ dbt_utils.pivot('event_type', dbt_utils.get_column_values(ref( 'stg_events' ), 'event_type')) }}
from {{ ref('stg_events') }}
group by session_guid