from jinja2 import Template

template_text = """
{% if usuarios %}
Lista de usuários:
{% for usuario in usuarios %}
- {{ usuario }}
{% endfor %}
{% else %}
Nenhum usuário encontrado.
{% endif %}
"""

template = Template(template_text)

saida = template.render(usuarios=["Ana", "Carlos", "João"])
print(saida)