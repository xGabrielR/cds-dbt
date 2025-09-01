from jinja2 import Template

template_text = """
    {% set regex_pattern = '\s+' %}
    {% set query = "REGEXP_REPLACE(" ~ column_name ~ ", '" ~ regex_pattern ~ "', ' ')" %}

    TRIM({{ query }})

"""

template = Template(template_text)

saida = template.render(column_name="coluna")
print(saida)