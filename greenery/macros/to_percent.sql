{% macro to_percent(column_name, precision=2) %}
    ({{ column_name }} * 100)::numeric(16, {{ precision }})
{% endmacro %}