{% macro clear_blank_v1(column_name) -%}

    {% set regex_pattern = '\s+' %}
    
    TRIM(REGEXP_REPLACE({{ column_name }}, '{{ regex_pattern }}', ' '))

{%- endmacro %}
