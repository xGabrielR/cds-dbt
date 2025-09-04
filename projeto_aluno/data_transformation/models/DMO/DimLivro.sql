
select 
	livro_id,
	autor_id,
	upper(titulo) as titulo
from {{ source('StgO', 'livro') }}