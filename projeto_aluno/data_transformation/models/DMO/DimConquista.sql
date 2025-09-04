

select 
	livro_id,
	upper(titulo) as titulo,
	upper(premio_name) as nome_premio,
	ano_ganhado 
from {{ source('StgO', 'conquista') }}