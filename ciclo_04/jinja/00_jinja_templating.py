import jinja2

template = jinja2.Template("""
    Olá, {{ name }}, bem vindo(a)!
""")

output = template.render(
    name="Gabriel"
)

print(output)