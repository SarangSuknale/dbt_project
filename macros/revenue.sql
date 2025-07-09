{% macro revenu_calculations(quant, amt) -%}

round(({{quant}} * {{amt}}),2)

{%- endmacro %}