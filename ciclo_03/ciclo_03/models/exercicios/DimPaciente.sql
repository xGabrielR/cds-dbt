with paciente as (
	select 
		replace(
			replace(
				replace(
					replace("Paciente", 'array(', ')'),
				')', ''),
			', dtype=object', ''
		), '''', '"') as Paciente
	from {{ source('StgLaudo', 'laudos') }} --"ciclo_03_StgReviews".laudos
)
select 
	row_number() over() as id_paciente,
	paciente::json->>'idade' as idade,
	paciente::json->>'peso' as peso,
	paciente::json->>'raca' as raca,
	paciente::json->>'sexo' as sexo
from paciente