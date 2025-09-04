
select 
	isbn,
	livro_id,
	pub_id,
	formato_id,
	to_date(data_publicacao, 'DD/MM/YYYY') as data_publicacao,
	amostra_tamanho_k,
	qtd_paginas,
	preco
from {{ source('StgO', 'edicao') }}