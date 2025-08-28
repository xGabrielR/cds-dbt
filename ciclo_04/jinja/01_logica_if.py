import jinja2

texto = """
Olá, bem vindo(a)!

{% if name %}
    Quer um café, {{ name }}
{% else %}
    Por favor, informe um nome
{% endif %}
"""

template = jinja2.Template(texto)

output = template.render(name="")
output2 = template.render(name="Gabriel")

print(output)
print("\n")
print(output2)
