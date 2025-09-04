
select
	autor_id,
	upper(nome) as nome,
	upper(sobrenome) as sobrenome,
	upper(pais_de_residencia) as pais_de_residencia,
	to_date(data_nascimento, 'DD/MM/YYYY') as data_nascimento,
	horas_escritas_por_dia
from {{ source('StgO', 'autor') }}