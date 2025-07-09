{%- set classes = ['Standard Class','First Class','Second Class','Same Day']  -%}

select customer_id,
       {% for class in classes -%}
       sum(case when ship_mode='{{class}}' then 1 else 0 end) as "{{class}}",
       {% endfor -%}
from {{ ref('stg_super_store__orders') }}
group by customer_id