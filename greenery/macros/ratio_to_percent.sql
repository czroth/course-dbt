{% macro ratio_to_percent(numerator, denominator, precision=2) %}
    (100. * {{ numerator }} / {{ denominator }})::numeric(16, {{ precision }})
{% endmacro %}