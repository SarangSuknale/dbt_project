{%- macro cent_to_doller(col_name, decimal=2) -%}

round({{col_name}} / 100, {{decimal}})

{%- endmacro -%}

