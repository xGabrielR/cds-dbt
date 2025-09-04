
select distinct
	pub_id,
	upper(pub_id) as nome
from {{ source('StgO', 'edicao') }}