
select 
	isbn,
	item_id,
	ordem_id,
	desconto,
	to_date(data, 'DD/MM/YYYY') as data
from {{ source('StgO', 'venda') }}