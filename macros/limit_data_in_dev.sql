{% macro limit_data_in_dev(col_name, num_days) %}
where {{col_name}} = dateadd('day',-{{num_days}}, current_timestamp())
{% endmacro %}