
select distinct
	v.isbn,
	e.livro_id,
	e.formato_id,
	e.pub_id,
	p.nome as publicadora,
	v.data as data_venda,
	e.data_publicacao,
	e.preco,
	e.qtd_paginas,
	l.titulo,
	f.descricao as formato,
	a.nome,
	a.sobrenome,
	c.nome_premio
from {{ ref('FactVenda') }}           v
left join {{ ref('FactEdicao') }}     e using(isbn)
left join {{ ref('DimLivro') }}       l using(livro_id)
left join {{ ref('DimAutor') }}       a using(autor_id)
left join {{ ref('DimPublicadora') }} p using(pub_id) 
left join {{ ref('DimFormato') }}     f using(formato_id)
left join {{ ref('DimConquista') }}   c using(livro_id) 
order by v.data