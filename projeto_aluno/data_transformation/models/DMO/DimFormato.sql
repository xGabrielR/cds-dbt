
select distinct
	formato_id,
	upper(formato_desc) as descricao
from {{ source('StgO', 'edicao') }}