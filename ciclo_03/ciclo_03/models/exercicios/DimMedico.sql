with medico as (
	select 
		replace("medicoSolicitante", '''', '"') as medico_solicitante
	from {{ source('StgLaudo', 'laudos') }} --"ciclo_03_StgReviews".laudos
)
select distinct
	medico_solicitante::json->>'codigo' as id_medico,
	upper(medico_solicitante::json->>'nome') as nome,
	medico_solicitante::json->>'tipoDocumento' as tipo_documento,
	medico_solicitante::json->>'ufDocumento' as uf_documento
from medico 