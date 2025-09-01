{% macro clear_blank_v2(column_name) -%}

{% set patterns = {
    "(\\\\n)+":             " ",
    "\s*\\(\\s*":          " (",
    "\s*\\)\\s*":          ") ",
    "\s*(:)\\s*":          "\\1 ",
    "\s*(\\.|,)":          "\\1",
    "(\\.|,)(?=[A-Za-z])":  "\\1 ",
    "\s+":                 " "
} %}

{% for p, t in patterns.items() %}

    REGEXP_REPLACE(

{% endfor %}

    {{ column_name }}

{% for p, t in patterns.items() %}
    
    , '{{ p }}', '{{ t }}' )

{% endfor %}

{%- endmacro %}