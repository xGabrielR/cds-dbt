with exame as (
	select 
		regexp_replace(replace(exame, '''', '"'), '0+', '') as exame
	from  {{ source('StgLaudo', 'laudos') }}--"ciclo_03_StgReviews".laudos
)
select distinct
	exame::json->>'codigoExame' as id_exame,
	exame::json->>'nome' as nome
from exame