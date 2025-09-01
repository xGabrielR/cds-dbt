{% macro deduplicate(table_name) -%}

    SELECT DISTINCT * FROM {{ table_name }}

{%- endmacro %}