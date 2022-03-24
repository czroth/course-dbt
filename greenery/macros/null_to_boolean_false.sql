{% macro null_to_boolean_false(column_name) %}
    {{ column_name }} is not null
{% endmacro %}