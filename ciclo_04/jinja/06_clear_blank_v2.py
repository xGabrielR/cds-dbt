from jinja2 import Template

template_text = """

{% set patterns = {
    "(\\\\n)+":             " ",
    "\\s*\\(\\s*":          " (",
    "\\s*\\)\\s*":          ") ",
    "\\s*(:)\\s*":          "\\1 ",
    "\\s*(\\.|,)":          "\\1",
    "(\\.|,)(?=[A-Za-z])":  "\\1 ",
    "\\s+":                 " "
} %}

{% for p, t in patterns.items() %}

    regexp_replace(

{% endfor %}

    {{ column_name }}

{% for p, t in patterns.items() %}
    
    , '{{ p }}', '{{ t }}')

{% endfor %}

"""

print(Template(template_text).render(column_name="coluna"))
